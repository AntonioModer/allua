--[[
Allua demo game - Naturoids
Player control a bumblebee, classic asteroids style.
Leafs whirl around, threatening to destabilise your flight.
]]--

leaf_max_speed = 20

allegro5.init()
display = allegro5.Display.new(640, 480, allegro5.Display.WINDOWED)
event_queue = allegro5.Event_queue.new()

event_queue:register_event_source(display)
keyboard = allegro5.Keyboard.get()
event_queue:register_event_source(keyboard)
mouse = allegro5.Mouse.get()
event_queue:register_event_source(mouse)

leaf = allegro5.Bitmap.load("data/green_leaf.png")
bumblebee = allegro5.Bitmap.load("data/bumblebee.png")

font = allegro5.Font.load_ttf("data/times.ttf", 16, 0)

mouse_x = 0
mouse_y = 0
mouse_z = 0
mouse_b = {}

player = {}
player.x = 320
player.y = 240
player.vx = 0
player.vy = 0
player.angle = 0

leafs = {}

Screenwrap = function(self)
	if self.x<0 then self.x = self.x + 640 end
	if self.x>640 then self.x = self.x - 640 end
	if self.y<0 then self.y = self.y + 480 end
	if self.y>480 then self.y = self.y - 480 end
end

Update_leaf = function(self, dt)
	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt

	Screenwrap(self)

	self.vangle = self.vangle + (math.random() - .5) * dt
	self.angle = self.angle + self.vangle * dt
end

Draw_leaf = function(self)
	cx = leaf:width()/2
	cy = leaf:height()/2
	leaf:draw_rotated(cx, cy, self.x, self.y, self.angle, 0)
end

Create_leaf = function()
	new = {}

	new.x = math.random(0, 640)
	new.y = 0
	new.vx = math.random(-leaf_max_speed, leaf_max_speed)
	new.vy = math.random(-leaf_max_speed, leaf_max_speed)
	new.angle = math.random() * math.pi * 2
	new.vangle = math.random() - .5

	new.update = Update_leaf
	new.draw = Draw_leaf
	return new
end

time_previous = allegro5.current_time()
leaf_spawn_time = 0

while not quit do
	event = event_queue:get_next_event()
	if event.type == allegro5.Display.EVENT_CLOSE or event.type == allegro5.Keyboard.EVENT_DOWN and event.keycode == allegro5.Keyboard.KEY_ESCAPE then
		quit = true
	end

	if event.type == allegro5.Mouse.EVENT_AXES then
		mouse_x = event.x
		mouse_y = event.y
		mouse_z = event.z
	end

	if event.type == allegro5.Mouse.EVENT_DOWN then
		mouse_b[event.button] = true
	end
	if event.type == allegro5.Mouse.EVENT_UP then
		mouse_b[event.button] = false
	end

	if event.type == allegro5.Keyboard.EVENT_DOWN then
		if event.keycode == allegro5.Keyboard.KEY_LEFT then
			player.turn_left = true
		end
		if event.keycode == allegro5.Keyboard.KEY_RIGHT then
			player.turn_right = true
		end
		if event.keycode == allegro5.Keyboard.KEY_UP then
			player.move_forward = true
		end
		if event.keycode == allegro5.Keyboard.KEY_DOWN then
			player.move_reverse = true
		end
	end

	if event.type == allegro5.Keyboard.EVENT_UP then
		if event.keycode == allegro5.Keyboard.KEY_LEFT then
			player.turn_left = false
		end
		if event.keycode == allegro5.Keyboard.KEY_RIGHT then
			player.turn_right = false
		end
		if event.keycode == allegro5.Keyboard.KEY_UP then
			player.move_forward = false
		end
		if event.keycode == allegro5.Keyboard.KEY_DOWN then
			player.move_reverse = false
		end
	end

	time_now = allegro5.current_time()
	dt = time_now - time_previous
	time_previous = time_now

	leaf_spawn_time = leaf_spawn_time - dt
	if leaf_spawn_time <= 0 then
		table.insert(leafs, Create_leaf())
		leaf_spawn_time = leaf_spawn_time +1
	end

	for i,v in ipairs(leafs) do 
		v:update(dt)
	end
	
	if player.turn_left then
		player.angle = player.angle + 5 * dt
	end
	if player.turn_right then
		player.angle = player.angle - 5 * dt
	end
	if player.move_forward then
		player.vx = player.vx + math.cos(-player.angle) * 1 * dt
		player.vy = player.vy + math.sin(-player.angle) * 1 * dt
		player.vx = player.vx * .999
		player.vy = player.vy * .999
	end
	if player.move_reverse then
		player.vx = player.vx - math.cos(-player.angle) * 1 * dt
		player.vy = player.vy - math.sin(-player.angle) * 1 * dt
		player.vx = player.vx * .995
		player.vy = player.vy * .995
	end

	player.x = player.x + player.vx
	player.y = player.y + player.vy
	Screenwrap (player)
	
	for i,v in ipairs(leafs) do 
		v:draw()
	end

	cx = bumblebee:width()/2
	cy = bumblebee:height()/2
	bumblebee:draw_rotated(cx, cy, player.x, player.y, player.angle, 0)

	allegro5.Display.flip()
	allegro5.Display.clear(allegro5.Color.map_rgba(0, 0, 0, 0))
	allegro5.rest(0.001)
end