local M = {}

function M:peek(job)
	local start, cache = os.clock(), ya.file_cache(job)
	if not cache then
		return
	end

	local ok, err = self:preload(job)
	if not ok or err then
		return ya.preview_widget(job, err)
	end

	ya.sleep(math.max(0, rt.preview.image_delay / 1000 + start - os.clock()))

	local _, show_err = ya.image_show(cache, job.area)
	ya.preview_widget(job, show_err)
end

function M:seek() end

local function renderers(path, png)
	local size = math.max(rt.preview.max_width, rt.preview.max_height)
	return {
		{
			name = "aseprite-thumbnailer",
			build = function()
				return Command("aseprite-thumbnailer"):arg({ path, png, tostring(size) })
			end,
		},
		{
			name = "aseprite",
			build = function()
				return Command("aseprite"):arg({
					"--batch",
					path,
					"--frame-range",
					"0,0",
					"--save-as",
					png,
				})
			end,
		},
		{
			name = "libresprite",
			build = function()
				return Command("libresprite"):arg({
					"--batch",
					path,
					"--frame-range",
					"0,0",
					"--save-as",
					png,
				})
			end,
		},
	}
end

function M:preload(job)
	local cache = ya.file_cache(job)
	if not cache then
		return true
	end

	local cha = fs.cha(cache)
	if cha and cha.len > 0 then
		return true
	end

	local path = tostring(job.file.url)
	local png = Url(tostring(cache) .. ".png")
	local last_err

	for _, renderer in ipairs(renderers(path, tostring(png))) do
		local output, err = renderer.build():output()
		if not output then
			last_err = Err("Failed to start `%s`, error: %s", renderer.name, err)
		elseif not output.status.success then
			last_err = Err(
				"`%s` exited with error code %s: %s",
				renderer.name,
				output.status.code,
				output.stderr ~= "" and output.stderr or output.stdout
			)
		elseif not fs.cha(png) then
			last_err = Err("`%s` produced no image", renderer.name)
		else
			local ok = fs.rename(png, cache)
			if not ok then
				return false, Err("Failed to rename cache file")
			end
			return true
		end
	end

	return false, last_err or Err("No sprite renderer found (aseprite-thumbnailer / aseprite / libresprite)")
end

function M:spot(job)
	require("file"):spot(job)
end

return M
