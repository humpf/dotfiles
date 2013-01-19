-- Volume widget

volumecfg = {}
volumecfg.cardid  = 0
volumecfg.channel = "Master"
volumecfg.widget = widget({ type = "textbox", name = "volumecfg.widget", align = "right" })

volumecfg_t = awful.tooltip({ objects = { volumecfg.widget },})
volumecfg_t:set_text("Volume")

-- command must start with a space!
volumecfg.mixercommand = function (command)
    local fd = io.popen("amixer -c " .. volumecfg.cardid .. command)
    local status = fd:read("*all")
    fd:close()

    local volume = string.match(status, "(%d?%d?%d)%%")
    volume = string.format("% 3d", volume)
    status = string.match(status, "%[(o[^%]]*)%]")
    if string.find(status, "on", 1, true) then
        volume = volume .. "%"
    else
        volume = volume .. "M"
    end
    volumecfg.widget.text = volume
end
volumecfg.update = function ()
    volumecfg.mixercommand(" sget " .. volumecfg.channel)
end
volumecfg.up = function ()
    volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%+")
end
volumecfg.down = function ()
    volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%-")
end
volumecfg.toggle = function ()
    volumecfg.mixercommand(" sset " .. volumecfg.channel .. " toggle")
end
volumecfg.widget:buttons({
    button({ }, 4, function () volumecfg.up() end),
    button({ }, 5, function () volumecfg.down() end),
    button({ }, 1, function () volumecfg.toggle() end)
})
volumecfg.update()


local widgetobj = widget({ type = 'textbox', name = 'volume_widget' })
local channel = "vmix0-outvol"

local function increase()
      awful.util.spawn("ossvol -i 3")
      update()
end

local function decrease()
    awful.util.spawn("ossvol -d 3")
    update()
end

local function update()
    local fd = io.popen("ossmix " .. channel)
    widgetobj.text = 'VOL' .. fd:read("*all"):match("(%d+%.%d+)")
    fd:close()
end

local function mute()
    awful.util.spawn("ossvol -t")
end

widgetobj:buttons(awful.util.table.join(
    awful.button({ }, '4', increase),
    awful.button({ }, '5', decrease),
    awful.button({ }, '1', mute)
    ))

--[[
--globalkeys = awful.util.table.join(globalkeys,
--awful.key({ }, "XF86AudioRaiseVolume", increase,
--awful.key({ }, "XF86AudioLowerVolume", decrease,
--awful.key({ }, "XF86AudioMute", mute)
--)
--]]--

local utimer = timer({ timeout=1 })
utimer:add_signal("timeout", update)
utimer:start()

update()

volume = {
    channel = channel,
    widget = widgetobj,
    increase = increase,
    decrease = decrease,
    mute = mute
}
return volume

