-- Modified by Felipe Reyes <freyes@tty.cl>
-- Original: http://awesome.naquadah.org/wiki/Acpitools-based_battery_widget
-- usage:
-- require("battery")
-- include "mybattmon" in your wibox

local naughty = require("naughty")
local time_rem = ""

mybattmon = widget({ type = "textbox", name = "mybattmon", align = "right" })

function battery_status ()
    local output={} --output buffer
    local fd = io.popen("acpitool -b", "r") --list present batteries
    local line=fd:read()

    while line do --there might be several batteries.
        local battery_num = string.match(line, "Battery \#(%d+)")
        local battery_load = string.match(line, " (%d*\.%d+)%%")
        time_rem = string.match(line, "(%d+\:%d+)\:%d+")
        local color = "#ffffff"
	local discharging = "<span color=\"%s\">"
        local num_batt_load = tonumber(battery_load)

	if string.match(line, "Discharging")=="Discharging" then --discharging: always red
           if num_batt_load > 60 then
              color = "#00D000"
           elseif num_batt_load > 30 then
              color = "#FFFD1C"
           else
              color = "#FF1C21"
           end
	elseif num_batt_load > 85 then --almost charged
		color = "#77CC77"
	else --charging
		color = "#CCCC77"
	end
        discharging = string.format(discharging, color)
        if battery_num and battery_load and time_rem then
            table.insert(output,discharging..battery_load.."% "..time_rem.."</span>")
        elseif battery_num and battery_load then --remaining time unavailable
            table.insert(output,discharging..battery_load.."%</span>")
        end --even more data unavailable: we might be getting an unexpected output format, so let's just skip this line.
        line=fd:read() --read next line
    end
    return table.concat(output," ") --FIXME: better separation for several batteries. maybe a pipe?
end
mybattmon.text = " " .. battery_status() .. " "

local popup
local capi = {
    mouse = mouse,
    screen = screen
}

mybattmon:add_signal('mouse::enter', 
                     function ()
                        if time_rem then
                           popup = naughty.notify({title="Time Remaining: "..time_rem,
                                                   timeout=5,
                                                   hover_timeout=0.5,
                                                   screen=capi.mouse.screen
                                                })
                        end
                     end)
mybattmon:add_signal('mouse::leave', function () naughty.destroy(popup) end)
mybattmon:buttons(awful.util.table.join(
                     awful.button({ }, 3, function () 
                                             awful.util.spawn_with_shell("gksudo pm-hibernate")
                                          end)
               ))
my_battmon_timer=timer({timeout=30})
my_battmon_timer:add_signal("timeout", function()
    mybattmon.text = " " .. battery_status() .. " "
end)

my_battmon_timer:start()
