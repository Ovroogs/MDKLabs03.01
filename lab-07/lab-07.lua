lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
cairo = lgi.cairo

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-07_Alekseev.glade')

prov = gtk.CssProvider()
prov:load_from_path('styles.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

a = false
b = false

function ui.btn_a:on_clicked()
	a = true
	b = false
end
function ui.btn_b:on_clicked()
	b = true
	a = false
end
function ui.btn_Default:on_clicked()
	a = false
	b = false
end

function ui.canvas:on_draw(cr)	
	if a ~= true and b ~= true then
		cr:set_source_rgb(1, 1, 1)
		cr:paint()
		btn_d(cr)
	elseif a then
		cr:set_source_rgb(0.5, 0.5, 0.5)
		cr:paint()
		btn_a(cr)
	elseif b then
		btn_b(cr)
	end
	
	return true
end

function paint(x, y, r, g, b, cr)
	cr:set_source_rgb(r, g, b)
	cr:rectangle(x, y, 10, 10)
	cr:fill()
end

function btn_a(cr)
	for x = 2, 6 do
			paint(x * 10 + 15, 15, 0.9, 0.5, 0.3, cr)
			paint((x + 6) * 10 + 15, 15, 0.9, 0.5, 0.3, cr)
		end
		
		for x = 3, 5 do
			paint(x * 10 + 15, 5, 0.9, 0.5, 0.3, cr)
			paint((x + 6) * 10 + 15, 5, 0.9, 0.5, 0.3, cr)
		end
		
		paint(4 * 10 + 15, 0, 0.9, 0.5, 0.3, cr)
		paint(10 * 10 + 15, 0, 0.9, 0.5, 0.3, cr)
		
		for x = 1, 13 do
			for y = 1, 9 do
				if ((x == 5 or x == 4 or x == 9 or x == 10) and (y == 4 or y == 5)) then
					paint(x * 10 + 15, y * 10 + 15, 0.25, 0.1, 1, cr)
				else
					if ((x == 5 or x == 6 or x == 8 or x == 9) and (y == 7 or y == 9)) then
						paint(x * 10 + 15, y * 10 + 15, 0.9, 0.9, 0.9, cr)
					elseif (x == 7 and y == 8) then
						paint(x * 10 + 15, y * 10 + 15, 0.9, 0.9, 0.9, cr)
					else
						paint(x * 10 + 15, y * 10 + 15, 0.9, 0.5, 0.3, cr)
					end
				end
			end
		end
		
		for x = 2, 12 do
			for y = 10, 11 do
				if (y == 11 and (x == 2 or x == 12)) then
					
				else
					paint(x * 10 + 15, y * 10 + 15, 0.9, 0.5, 0.3, cr)
				end
			end
		end
	ui.canvas:queue_draw()
end

function btn_b(cr)
	for x = 2, 6 do
			paint(x * 10 + 15, 15, 1, 1, 1, cr)
			paint((x + 6) * 10 + 15, 15, 1, 1, 1, cr)
		end
		
		for x = 3, 5 do
			paint(x * 10 + 15, 5, 1, 1, 1, cr)
			paint((x + 6) * 10 + 15, 5, 1, 1, 1, cr)
		end
		
		paint(4 * 10 + 15, 0, 1, 1, 1, cr)
		paint(10 * 10 + 15, 0, 1, 1, 1, cr)
		
		for x = 1, 13 do
			for y = 1, 9 do
				if ((x == 5 or x == 4 or x == 9 or x == 10) and (y == 4 or y == 5)) then
					paint(x * 10 + 15, y * 10 + 15, 0.1, 1, 0.25, cr)
				else
					if ((x == 5 or x == 6 or x == 8 or x == 9) and (y == 7 or y == 9)) then
						paint(x * 10 + 15, y * 10 + 15, 0.15, 0.15, 0.15, cr)
					elseif (x == 7 and y == 8) then
						paint(x * 10 + 15, y * 10 + 15, 0.15, 0.15, 0.15, cr)
					else
						paint(x * 10 + 15, y * 10 + 15, 1, 1, 1, cr)
					end
				end
			end
		end
		
		for x = 2, 12 do
			for y = 10, 11 do
				if (y == 11 and (x == 2 or x == 12)) then
					
				else
					paint(x * 10 + 15, y * 10 + 15, 1, 1, 1, cr)
				end
			end
		end
ui.canvas:queue_draw()
end

function btn_d(cr)
	for x = 2, 6 do
			paint(x * 10 + 15, 15, 0, 0, 0, cr)
			paint((x + 6) * 10 + 15, 15, 0, 0, 0, cr)
		end
		
		for x = 3, 5 do
			paint(x * 10 + 15, 5, 0, 0, 0, cr)
			paint((x + 6) * 10 + 15, 5, 0, 0, 0, cr)
		end
		
		paint(4 * 10 + 15, 0, 0, 0, 0, cr)
		paint(10 * 10 + 15, 0, 0, 0, 0, cr)
		
		for x = 1, 13 do
			for y = 1, 9 do
				if ((x == 5 or x == 4 or x == 9 or x == 10) and (y == 4 or y == 5)) then
					paint(x * 10 + 15, y * 10 + 15, 1, 0.1, 0.25, cr)
				else
					if ((x == 5 or x == 6 or x == 8 or x == 9) and (y == 7 or y == 9)) then
						paint(x * 10 + 15, y * 10 + 15, 0.5, 0.5, 0.5, cr)
					elseif (x == 7 and y == 8) then
						paint(x * 10 + 15, y * 10 + 15, 0.5, 0.5, 0.5, cr)
					else
						paint(x * 10 + 15, y * 10 + 15, 0, 0, 0, cr)
					end
				end
			end
		end
		
		for x = 2, 12 do
			for y = 10, 11 do
				if (y == 11 and (x == 2 or x == 12)) then
					
				else
					paint(x * 10 + 15, y * 10 + 15, 0, 0, 0, cr)
				end
			end
		end
ui.canvas:queue_draw()
end

ui.wind.title = 'lab-07_Alekseev_Igor'
ui.wind.on_destroy = gtk.main_quit
ui.wind:show_all()

gtk.main()