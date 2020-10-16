lgi = require 'lgi';

gtk = lgi.Gtk;
gtk.init();

bld = gtk.Builder();
bld:add_from_file('lab-01.glade');

ui = bld.objects;

ui.wnd.title = 'lab-01';
ui.wnd.on_destroy = gtk.main_quit;
ui.wnd:show_all();

gtk.main();
