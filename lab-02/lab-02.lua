lgi = require 'lgi';

gtk = lgi.Gtk;
gtk.init();

bld = gtk.Builder();
bld:add_from_file('lab-02.glade');

ui = bld.objects;

ui.wind.title = 'lab-02_Алексеев_Игорь';
ui.wind.on_destroy = gtk.main_quit;
ui.wind:show_all();

function ui.btn_add:on_clicked()
	a = tonumber(ui.num1.text)
	b = tonumber(ui.num2.text)
	
	if type(tonumber(a)) == 'number' and type(tonumber(b)) == 'number' then
	  ui.res.label = a + b
	else
		ui.res.label = 'Заполните первое и второе поле'
	end
end

function ui.btn_sub:on_clicked()
	a = tonumber(ui.num1.text)
	b = tonumber(ui.num2.text)
	
	if type(tonumber(a)) == 'number' and type(tonumber(b)) == 'number' then
		ui.res.label = a - b
	else
		ui.res.label = 'Заполните первое и второе поле'
	end
end

function ui.btn_mul:on_clicked()
	a = tonumber(ui.num1.text)
	b = tonumber(ui.num2.text)
	
	if type(tonumber(a)) == 'number' and type(tonumber(b)) == 'number' then
		ui.res.label = a * b
	else
		ui.res.label = 'Заполните первое и второе поле'
	end
end

function ui.btn_div:on_clicked()
	a = tonumber(ui.num1.text)
	b = tonumber(ui.num2.text)
	
	if type(tonumber(a)) == 'number' and type(tonumber(b)) == 'number' then
	  	if b == 0 then
			ui.res.label = 'Нельзя делить на ноль'
		else
			ui.res.label = a / b
		end
	else
		ui.res.label = 'Заполните первое и второе поле'
	end
end

function ui.btn_pow:on_clicked()
	a = tonumber(ui.num1.text)
	b = tonumber(ui.num2.text)
	
	if type(tonumber(a)) == 'number' and type(tonumber(b)) == 'number' then
		ui.res.label = a ^ b
	else
		ui.res.label = 'Заполните первое и второе поле'
	end
end

function ui.btn_cos:on_clicked()
	a = tonumber(ui.num1.text)
	
	if type(tonumber(a)) == 'number' then
		ui.res.label = math.cos(math.rad(a))
	else
		ui.res.label = 'Заполните первое поле'
	end
end

function ui.btn_sin:on_clicked()
	a = tonumber(ui.num1.text)
	
	if type(tonumber(a)) == 'number' then
		ui.res.label = math.sin(math.rad(a))
	else
		ui.res.label = 'Заполните первое поле'
	end
end

function ui.btn_tg:on_clicked()
	a = tonumber(ui.num1.text)
	
	if type(tonumber(a)) == 'number' then
		ui.res.label = math.tan(math.rad(a))
	else
		ui.res.label = 'Заполните первое поле'
	end
end

function ui.btn_sqrt:on_clicked()
	a = tonumber(ui.num1.text)	
	
	if type(tonumber(a)) == 'number' then
		if a < 0 then
			ui.res.label = 'Число не должно быть отрицательным'
		else
			ui.res.label = math.sqrt(a)
		end
	else
		ui.res.label = 'Заполните первое поле'
	end
end


gtk.main();
