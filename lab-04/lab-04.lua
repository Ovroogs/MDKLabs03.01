lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-04_Alekseev.glade')

prov = gtk.CssProvider()
prov:load_from_path('styles.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

list = ""

function ui.btn_add:on_clicked()
	file = ui.ent_name_file.text
	name = ui.ent_name.text
	value = tonumber(ui.ent_value.text)

	pb = pixbuf.new_from_file('img/'..file)

	i = ui.mdl_items:append()
	ui.mdl_items[i] = {[1] = name, [2] = value, [3] = pb}
	list = list..name..';'..value..';'..file..';\n'
end

function ui.btn_save:on_clicked()
	fwrite = io.open('lab-04_Alekseev.txt' , 'w' )
	fwrite:write(list)
	fwrite:close()
end

rdr_txt = gtk.CellRendererText{}
rdr_pb = gtk.CellRendererPixbuf{}

col1 = gtk.TreeViewColumn{ title = 'File\'s Name', {rdr_txt, {text = 1}} }
col2 = gtk.TreeViewColumn{ title = 'Value', {rdr_txt, {text = 2}} }
col3 = gtk.TreeViewColumn{ title = 'Image', {rdr_pb, {pixbuf = 3}} }

ui.tree_items:append_column(col1)
ui.tree_items:append_column(col2)
ui.tree_items:append_column(col3)

ui.wind.title = 'lab-04_Alekseev_Igor'
ui.wind.on_destroy = gtk.main_quit
ui.wind:show_all()

gtk.main()