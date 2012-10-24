-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

require("obvious.clock")

-- Load Debian menu entries
require("debian.menu")

require("./lib/run-once")

run_once("pidgin")

-- {{{ Variable definitions
--
-- Load theme
beautiful.init("/home/rgh/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
floating_terminal = "x-terminal-emulator -class FloatingUXterm"
todo = 'sh -c "pid=\\$(ps -ef | grep \\$(xdotool getactivewindow getwindowpid) | grep -v grep | awk \\"/\\$(basename \\$(getent passwd \\\$LOGNAME | awk -F: \\"{print \\\\$NF}\\"))/{print \\\\$2}\\") x-terminal-emulator -class FloatingUXterm -e \\"\$HOME/bin/todo TODO\\""'

sratch = "x-terminal-emulator -class FloatingUXterm -e '$HOME/bin/todo SCRATCH'"

editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

audio = 'alsa_output.pci-0000_00_1b.0.analog-stereo'

audio_volume_up = "zsh -c \"pacmd set-sink-volume '" .. audio .. "' $(printf '0x%x' $(( $(pacmd dump|awk '/set-sink-volume.*" .. audio .. "/{ print $3}') + 0x1000)))\""
audio_volume_down = "zsh -c \"pacmd set-sink-volume '" .. audio .. "' $(printf '0x%x' $(( $(pacmd dump|awk '/set-sink-volume.*" .. audio .. "/{ print $3}') - 0x1000)))\""

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.

modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
}

-- {{{ Tags
-- Define tags table.
tags = {
  layout = {layouts[4], layouts[7], layouts[7], layouts[7], layouts[7], layouts[7], layouts[7], layouts[7], layouts[8]}
}

for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, tags.layout)
end

-- }}}

-- {{{ Wibox
obvious.clock.set_editor("xterm -e vim")
obvious.clock.set_shortformat("%d/%m/%Y %H:%M:%S")
obvious.clock.set_longformat("%d/%m/%Y %H:%M:%S")
obvious.clock.set_shorttimer(1)


-- Create a laucher widget and a main menu
myawesomemenu = {
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal },
                                    { "Debian", debian.menu.Debian_menu.Debian }
                                  }
                        })
-- }}}


-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
  awful.button({        }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({        }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag))
mytasklist = {}


mybattmon = widget({ type = "textbox", name = "mybattmon", align = "right" })
function battery_status ()
    local output={} --output buffer
    local fd=io.popen("acpitool -b", "r") --list present batteries
    local line=fd:read()
    while line do --there might be several batteries.
        local battery_num = string.match(line, "Battery \#(%d+)")
        local battery_load = string.match(line, " (%d*\.%d+)%%")
        local time_rem = string.match(line, "(%d+\:%d+)\:%d+")
        local discharging
        if string.match(line, "discharging")=="discharging" then --discharging: always red
            discharging="<span color=\"#CC7777\">"
            elseif tonumber(battery_load)>85 then --almost charged
            discharging="<span color=\"#77CC77\">"
        else --charging
            discharging="<span color=\"#CCCC77\">"
        end
        table.insert(output, discharging..battery_load.."%".."</span>")
        line=fd:read() --read next line
    end
    return table.concat(output," ") --FIXME: better separation for several batteries. maybe a pipe?
end
mybattmon.text = " " .. battery_status() .. " "
my_battmon_timer=timer({timeout=30})
my_battmon_timer:add_signal("timeout", function()
    --mytextbox.text = " " .. os.date() .. " "
    mybattmon.text = " " .. battery_status() .. " "
end)
my_battmon_timer:start()


mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
    if not c:isvisible() then
      awful.tag.viewonly(c:tags()[1])
    end
    client.focus = c
    if client.focus then client.focus:raise() end
  end),
  awful.button({ }, 3, function ()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients({ width=250 })
    end
  end),
  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    -- if client.focus then client.focus:raise() end
  end),
  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    -- if client.focus then client.focus:raise() end
  end))

  for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
      return awful.widget.tasklist.label.currenttags(c, s)
    end, mytasklist.buttons)

    -- Create the wibox
    -- mywibox[s] = wibox({ position = "top", fg = beautiful.fg_normal, bg = beautiful.bg_normal })

    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Add widgets to the wibox - order matters

    mywibox[s].widgets = {
      {
        mytaglist[s],
        mypromptbox[s],
        layout = awful.widget.layout.horizontal.leftright
      },
      mylayoutbox[s],
      s == 1 and mysystray or nil ,
      mybattmon,
      obvious.clock(),
      mytasklist[s],
      layout = awful.widget.layout.horizontal.rightleft
    }
  end
  -- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
  awful.key({ modkey,           }, "v", awful.tag.viewnext),
  awful.key({ modkey,           }, "c", awful.tag.viewprev),
  awful.key({ modkey,           }, ".", awful.tag.history.restore),
  awful.key({ modkey,           }, ",", function () awful.tag.viewonly(tags[mouse.screen][1]) end),

  awful.key({ modkey,           }, "n",
  function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey,           }, "e",
  function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx( 1) end),
  awful.key({ modkey, "Shift"   }, "e", function () awful.client.swap.byidx(-1) end),
  awful.key({ modkey, "Control" }, "n", function () awful.screen.focus(1)       end),
  awful.key({ modkey, "Control" }, "e", function () awful.screen.focus(-1)       end),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey,           }, "Tab",
  function ()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end),

  awful.key({modkey            }, "x",
  function ()
    awful.prompt.run({ prompt = "Run Lua code: " },
    mypromptbox[mouse.screen].widget,
    awful.util.eval, nil,
    awful.util.getdir("cache") .. "/history_eval")
  end),

  -- Standard program
  awful.key({modkey,           }, "Return",       function () awful.util.spawn(terminal) end),
  awful.key({modkey,           }, "/",            function () awful.util.spawn(todo) end),
  awful.key({modkey, "Shift"   }, "/",            function () awful.util.spawn(sratch) end),
  awful.key({modkey, "Shift"   }, "Return",       function () awful.util.spawn(floating_terminal) end),
  awful.key({modkey, "Control" }, "r",            awesome.restart),
  awful.key({modkey, "Shift"   }, "q",            awesome.quit),

  awful.key({"Control", "Shift"}, "t",            function () awful.tag.incmwfact(0.05)    end),
  awful.key({"Control", "Shift"}, "s",            function () awful.tag.incmwfact(-0.05)    end),
  awful.key({modkey, "Shift"   }, "t",            function () awful.tag.incnmaster(1)      end),
  awful.key({modkey, "Shift"   }, "s",            function () awful.tag.incnmaster(-1)      end),
  awful.key({modkey,           }, "space",        function () awful.layout.inc(layouts, 1) end),
  awful.key({modkey, "Shift"   }, "space",        function () awful.layout.inc(layouts, -1) end),

  awful.key({modkey, "Control"          }, "c",   function () awful.tag.incncol(1)    end),
  awful.key({modkey, "Control", "Shift" }, "c",   function () awful.tag.incncol(-1)    end),
  awful.key({modkey, "Shift"   }, "m",            function (c) c.minimized = not c.minimized    end),

  -- Local

  -- paste the clipboad
  awful.key({modkey            }, "b",            function () awful.util.spawn("/home/rgh/bin/paste-into-window") end),

  awful.key({modkey }, "\\",                      function () awful.util.spawn("iceweasel") end),

  -- mpc bindings
  awful.key({modkey, "Shift"   }, "p",            function () awful.util.spawn("mpc toggle") end),
  awful.key({modkey, "Shift"   }, ",",            function () awful.util.spawn("mpc prev") end),
  awful.key({modkey, "Shift"   }, ".",            function () awful.util.spawn("mpc next") end),

  -- Set the volume.
  awful.key({modkey, "Shift"   }, "u",            function () awful.util.spawn(audio_volume_up) end),
  awful.key({modkey, "Shift"   }, "d",            function () awful.util.spawn(audio_volume_down) end),

  -- bookmarker (I don't think this works anymore)
  awful.key({modkey, "Shift"   }, "b",            function () awful.util.spawn("bm add") end),

  awful.key({modkey,           }, "i",            function () client.focus:raise(); end),

  -- Prompt
  awful.key({modkey            }, "r",            function () mypromptbox[mouse.screen]:run() end),
  awful.key({modkey            }, "o",            function () awful.layout.set(awful.layout.suit.floating) end)
  )

-- Client awful tagging: this is useful to tag some clients and then do stuff like move to tag on them
clientkeys = awful.util.table.join(
  awful.key({modkey,           }, "f",            function (c) c.fullscreen = not c.fullscreen  end),
  awful.key({modkey, "Shift"   }, "x",            function (c) c:kill() end),
  awful.key({modkey, "Control" }, "space",        awful.client.floating.toggle ),
  awful.key({modkey, "Control" }, "Return",       function (c) awful.client.next(1, c):swap(awful.client.getmaster()) end),
  awful.key({modkey,           }, "y",            awful.client.movetoscreen ),
  awful.key({modkey, "Shift"   }, "r",            function (c) c:redraw() end),
  awful.key({modkey            }, "t",            awful.client.togglemarked),

  awful.key({modkey,}, "h",
  function (c)
    c.maximized_horizontal = not c.maximized_horizontal
    c:raise()
  end),

  awful.key({modkey,}, "m",
  function (c)
    c.maximized_horizontal = not c.maximized_horizontal
    c.maximized_vertical   = not c.maximized_vertical
    c:raise()
  end)
  )

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey }, "#" .. i + 9,
  function ()
    local screen = mouse.screen
    if tags[screen][i] then
      awful.tag.viewonly(tags[screen][i])
    end
  end),
  awful.key({ modkey, "Control" }, "#" .. i + 9,
  function ()
    local screen = mouse.screen
    if tags[screen][i] then
      awful.tag.viewtoggle(tags[screen][i])
    end
  end),
  awful.key({ modkey, "Shift" }, "#" .. i + 9,
  function ()
    if client.focus and tags[client.focus.screen][i] then
      awful.client.movetotag(tags[client.focus.screen][i])
    end
  end),
  awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
  function ()
    if client.focus and tags[client.focus.screen][i] then
      awful.client.toggletag(tags[client.focus.screen][i])
    end
  end))
end

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 2, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { }, properties = { border_width = beautiful.border_width,
                               border_color = beautiful.border_normal,
                               focus = true,
                               keys = clientkeys,
                               maximized_vertical   = false,
                               maximized_horizontal = false,
                               buttons = clientbuttons } },
  { rule = { class = "FloatingUXterm" }, properties = { floating = true, ontop = true, skip_taskbar = true}, callback = function(c) awful.placement.under_mouse(c); end },
  { rule = { class = "MPlayer" }, properties = { floating = true } },
  { rule = { class = "Ario" }, properties = { floating = true, skip_taskbar = true } },
  { rule = { name = "Iceweasel Preferences" }, properties = { floating = true, skip_taskbar = true } },
  { rule = { class = "Pinentry" }, properties = { floating = true, ontop = true, skip_taskbar = true } },
  { rule = { class = "Glurp" }, properties = { floating = true, ontop = true, skip_taskbar = true } },
  { rule = { class = "Pidgin", role = "conversation" }, properties = { floating = true, tag = tags[1][1] } },
  { rule = { class = "Pidgin", role = "file transfer" }, properties = { floating = true, tag = tags[1][1] } },
  { rule = { class = "Pidgin", role = "buddy_list" }, properties = { floating = true, tag = tags[1][1] },
    callback = function( c )
      local w_area = screen[ c.screen ].workarea
      local strutwidth = 400
      c:struts( { right = strutwidth } )
      c:geometry( { x = w_area.width - strutwidth, width = strutwidth, y = w_area.y, height = w_area.height } )
    end
  },
  { rule = { class = "Gimp" }, properties = { floating = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
  -- Enable sloppy focus
  c:add_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
      and awful.client.focus.filter(c) then
      client.focus = c
    end
  end)

  if not startup then
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.

    -- Put windows in a smart way, only if they do not set an initial position.
    if not c.size_hints.user_position and not c.size_hints.program_position then
      awful.placement.no_overlap(c)
      awful.placement.no_offscreen(c)

      if awful.layout.get(c.screen) == awful.layout.suit.floating then
        awful.placement.under_mouse(c)
      end
    end
  end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

