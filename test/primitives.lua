allegro5.init()
display = allegro5.Display.new(640, 480, allegro5.Display.WINDOWED)
keyboard = allegro5.Keyboard.get()
event_queue = allegro5.Event_queue.new()
event_queue:register_event_source(display)
event_queue:register_event_source(keyboard)

red = allegro5.Color.map_rgba(255, 0, 0, 255)
green = allegro5.Color.map_rgba(0, 255, 0, 255)
blue = allegro5.Color.map_rgba(0, 0, 255, 255)
black = allegro5.Color.map_rgba(0, 0, 0, 255)

last_time = 0
a1 = 0
a2 = 0

pixels = 0
while not quit do
	event = event_queue:get_next_event()
	if event.type == allegro5.Display.EVENT_CLOSE or event.type == allegro5.Keyboard.EVENT_DOWN and event.keycode == allegro5.Keyboard.KEY_ESCAPE then
		quit = true
	end
	
	current_time = allegro5.current_time()
	dt = current_time - last_time
	last_time = current_time

	x1 = 10
	y1 = 10 + math.sin(current_time) * 10
	x2 = 100
	y2 = 10 + math.cos(current_time) * 10
	thickness = 0
	while thickness < 10 do
		allegro5.Primitives.draw_line_ex(x1, y1, x2, y2, red, thickness)
		thickness = thickness + 2
		y1 = y1 + 10
		y2 = y2 + 10
	end


	thickness = 5 + math.cos(current_time) * 5
	x3 = 50 + math.cos(current_time) * 10
	y3 = 100 + math.sin(current_time) * 10
	allegro5.Primitives.draw_triangle(x1, y1, x2, y2, x3, y3, green, thickness)
	y1 = y1 + 50
	y2 = y2 + 50
	y3 = y3 + 50
	allegro5.Primitives.draw_filled_triangle(x1, y1, x2, y2, x3, y3, green)

	y1 = y1 + 50
	y2 = y2 + 100
	allegro5.Primitives.draw_rectangle_ex(x1, y1, x2, y2, green, thickness)

	y1 = y1 + 50
	y2 = y2 + 50
	allegro5.Primitives.draw_filled_rectangle(x1, y1, x2, y2, green)

	x1 = x1 + 50
	y1 = y1 + 100
	allegro5.Primitives.draw_ellipse(x1, y1, 50, 25, green, thickness)

	y1 = y1 + 50
	allegro5.Primitives.draw_filled_ellipse(x1, y1, 50, 25, green)

	x1 = 160
	y1 = 50
	allegro5.Primitives.draw_circle(x1, y1, 50, blue, thickness)
	y1 = y1 + 110
	allegro5.Primitives.draw_filled_circle(x1, y1, 50, blue)

	y1 = y1 + 110

	a1 = a1 + dt
	a2 = a2 + dt
	if a1 > math.pi * 2 then
		a1 = 0
	end
	if a2 > math.pi * 2 then
		a2 = 0
	end
	allegro5.Primitives.draw_arc(x1, y1, 50, a1, a2, blue, thickness)

	pixels = pixels + 1

	allegro5.Display.flip()
	allegro5.Display.clear(black)
end

print("Frames per second ", pixels / allegro5.current_time())
