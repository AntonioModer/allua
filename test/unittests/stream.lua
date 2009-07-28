Test_stream = {}

function Test_stream:test01_prepare()
	allegro5.init()
	allegro5.audio.install(allegro5.audio.AUDIO_DRIVER_AUTODETECT)
	allegro5.audio.reserve_samples(2)
end

function Test_stream:test02_create()
	stream = allegro5.stream.from_file (2, 2, "data/powerup.ogg");
	assertEquals("stream", tostring(stream):sub(1, 6))
end

function Test_stream:test03_rewind()
	b = stream:rewind()
	assertEquals("boolean", type(b))
end

function Test_stream:test03_frequency()
	f = stream:get_frequency ()
	assertEquals("number", type(f))
end

function Test_stream:test03_channels()
	c = stream:get_channels ()
	assertEquals("number", type(c))
end

function Test_stream:test03_depth()
	d = stream:get_depth ()
	assertEquals("number", type(d))
end

function Test_stream:test03_length()
	l = stream:get_length ()
	assertEquals("number", type(l))
end

function Test_stream:test03_speed()
	g = stream:get_speed ()
	b = stream:set_speed (1)
	assertEquals("number", type(g))
	assertEquals("boolean", type(b))
end

function Test_stream:test03_gain()
	g = stream:get_gain ()
	b = stream:set_gain (1)
	assertEquals("number", type(g))
	assertEquals("boolean", type(b))
end

function Test_stream:test03_pan()
	g = stream:get_pan ()
	b = stream:set_pan (1)
	assertEquals("number", type(g))
	assertEquals("boolean", type(b))
end

function Test_stream:test03_playing()
	g = stream:get_playing ()
	b = stream:set_playing (true)
	assertEquals("boolean", type(g))
	assertEquals("boolean", type(b))
end

function Test_stream:test03_playmode()
	g = stream:get_playmode ()
	b = stream:set_playmode (allegro5.audio.PLAYMODE_ONCE)
	assertEquals("number", type(g))
	assertEquals("boolean", type(b))
end

function Test_stream:test10_cleanup()
	stream = nil
	collectgarbage()
end
