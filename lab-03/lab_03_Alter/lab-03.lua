lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03.glade')

prov = gtk.CssProvider()
prov:load_from_path('styles.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

arr_cb = { ui.cbtn_A, ui.cbtn_B, ui.cbtn_C, ui.cbtn_D }

function ui.tb_value:on_grab_focus()
if ui.tb_value.text == 'error' then
ui.tb_value.text = '' end
end

function ui.btn_Ok:on_clicked()
	for i = 0, 3, 1 do
	arr_cb[i + 1].active = false
	end

	value = tonumber(ui.tb_value.text)
	j = 8

	for i, el in ipairs(arr_cb) do
		if (value >= 0 and value <= 15) and value ~= nil then
		if value / j >= 1 then el.active = true
		value = value % j 
		end
		j = j / 2
		else value = nil ui.tb_value.text = 'error' 
		end
	end
end

ui.wind.title = 'lab-03_Alekseev'
ui.wind.on_destroy = gtk.main_quit
ui.wind:show_all()

gtk.main()
