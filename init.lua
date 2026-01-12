local M = {}

-- Example Config Table
-- local cfg = {
--     seconds_visible = 10, --seconds
-- }

-- Floating Windows
local waywall = require("waywall")
local create_floating = require("floating")

local floating = create_floating({
    show_floating = waywall.show_floating,
    sleep = waywall.sleep,
})

M.setup = function(config, cfg)
    config.actions["*-C"] = function()
        if waywall.get_key("F3") then
            waywall.press_key("C")
            floating.show()
            if (cfg.timer_length ~= 0) then
                floating.hide_after_timeout(100 * cfg.timer_length)
            end
        else
            return false
        end
    end
end

return M
