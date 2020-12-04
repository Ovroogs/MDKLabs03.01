lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-05_Alekseev.glade')

prov = gtk.CssProvider()
prov:load_from_path('styles.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

count = 0

function ui.btnOpen:on_clicked()
	count = count +  1
	ui.wind2:show_all()
	if count > 9 and count < 21 then
		ui.lbClick.label = "Вы открыли это окно "..count.." раз"
	elseif count % 10 == 2 or count % 10 == 3 or count % 10 == 4 then
		ui.lbClick.label = "Вы открыли это окно "..count.." раза"
	else
		ui.lbClick.label = "Вы открыли это окно "..count.." раз"
	end
end
function ui.btnClose:on_clicked()
	ui.wind2:hide()
end

ui.wind.title = 'lab-05_Alekseev_Igor'
ui.wind.on_destroy = gtk.main_quit
ui.wind:show_all()

gtk.main()