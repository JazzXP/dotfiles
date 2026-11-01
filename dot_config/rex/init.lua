local data = os.getenv("XDG_DATA_HOME") or (os.getenv("HOME") .. "/.local/share")
local plugin = data .. "/nvim/lazy/rex-navigator.nvim"
local ok, err = pcall(function()
	dofile(plugin .. "/rex/navigator.lua").setup()
end)
if not ok then
	rex.log("warn", "rex-navigator not loaded: " .. tostring(err))
end

local terminal = "com.superlogical.terminal"

local function in_lxc()
	local t = rex.block.call(terminal, "title", {})
	if t and type(t.title) == "string" and t.title:find("lxc-attach", 1, true) then
		return true
	end
	local p = rex.block.call(terminal, "process", {})
	if p then
		local s = rex.json.encode(p)
		if s and s:find("lxc-attach", 1, true) then
			return true
		end
	end
	return false
end

local dirs = { h = "left", j = "down", k = "up", l = "right" }

for key, dir in pairs(dirs) do
	rex.action({
		name = "nav_" .. dir,
		title = "Navigate " .. dir .. " (lxc-aware)",
		run = function(ctx, args)
			local lxc = in_lxc()
			if lxc then
				rex.client.queue("pane.send_key", { key = "ctrl+" .. key })
				return
			end
			local _, e = rex.invoke("rex_navigate_" .. dir)
			if e ~= nil then
				error(e, 0)
			end
		end,
	})
	rex.bind("ctrl+" .. key, "nav_" .. dir)
end
