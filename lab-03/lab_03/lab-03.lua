lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03_Igor_Alekseev.glade')

prov = gtk.CssProvider()
prov:load_from_path('styles.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

arr_radio_btn = {
ui.rb_A, ui.rb_B, ui.rb_C, ui.rb_D, 
ui.rb_E, ui.rb_F, ui.rb_G, ui.rb_H
}

function update()
x=0
y=0
z=0

if ui.cbtn_X.active == true then x = 1 end
if ui.cbtn_Y.active == true then y = 1 end
if ui.cbtn_Z.active == true then z = 1 end

value = x + y * 2 + z * 4
arr_radio_btn[value+1].active = true

ui.lbl_res.label = value
end

function ui.cbtn_X:on_clicked()
update()
end
function ui.cbtn_Y:on_clicked()
update()
end
function ui.cbtn_Z:on_clicked()
update()
end

ui.wind.title = 'lab-03_Igor_Alekseev.glade'
ui.wind.on_destroy = gtk.main_quit
ui.wind:show_all()

gtk.main()
