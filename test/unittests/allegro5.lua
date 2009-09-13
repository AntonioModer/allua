Test_allegro5 = {}

function Test_allegro5:test1_init()
--	allegro5.init()
end

function Test_allegro5:test2_current_time()
	current_time = allegro5.current_time()
	assert_equals("number", type(current_time))
end

function Test_allegro5:test3_rest()
	rest_time = .001
	start_time = allegro5.current_time()
	allegro5.rest(rest_time)
	current_time = allegro5.current_time()
	diff_time = current_time - start_time
	print("Before: " .. start_time .. " After: " .. current_time .. " Diff: " .. diff_time)
	assert(rest_time <= diff_time)
end
