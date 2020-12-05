local lgi = require 'lgi'
local gtk = lgi.Gtk
local gdk = lgi.Gdk

gtk.init()

local bld = gtk.Builder()
bld:add_from_file('lab-09_Alekseev.glade')

local prov = gtk.CssProvider()
prov:load_from_path('styles.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

local ui = bld.objects

local x = 0
local y = 0

local btn_check = false

local r = 0
local g = 0
local b = 0
local a = 255

function btnl_check(ev, str, b)-- mouse down
	if ev.button == 1 then
		print(str)
		btn_check = b
		ui.canvas:queue_draw()
	end
end

function ui.canvas:on_button_press_event(ev)-- mouse down
	btnl_check(ev, 'press', true)
end

function ui.canvas:on_button_release_event(ev)-- mouse up
	btnl_check(ev, 'release', false)
end

function ui.canvas:on_motion_notify_event(ev)
	print(ev.x, ev.y)
	x = ev.x
	y = ev.y
	ui.canvas:queue_draw()
end

function ui.controller_red:on_value_changed()
	r = ui.controller_red:get_value()
	ui.canvas:queue_draw()
end

function ui.controller_green:on_value_changed()
	g = ui.controller_green:get_value()
	ui.canvas:queue_draw()
end

function ui.controller_blue:on_value_changed()
	b = ui.controller_blue:get_value()
	ui.canvas:queue_draw()
end

function ui.controller_alpha:on_value_changed()
	a = ui.controller_alpha:get_value()
	ui.canvas:queue_draw()
end

function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1, 1)
	cr:paint()

	cr:set_source_rgba(r / 255, g / 255, b / 255, a / 255)
	if not(btn_check) then
		cr:rectangle(x - 5, y - 5, 10, 10)
	else
		cr:rectangle(x - 10, y - 10, 20, 20)
	end
	cr:fill()
end

ui.wind.title = 'lab-09_Alekseev_Igor'
ui.wind.on_destroy = gtk.main_quit
ui.wind:show_all()

gtk.main()