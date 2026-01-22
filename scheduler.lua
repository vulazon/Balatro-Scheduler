-- Basic coroutine scheduler

local scheduler = {}

function scheduler:wait(num)
	local thread = coroutine.running()

	local current = os.clock()

	local func
	func = function()
		if os.clock() - num >= current then
			tick:removeTask(func)

			print("finished wait " .. num)

			if coroutine.status(thread) == "suspended" then
				coroutine.resume(thread)
			end
		end
	end

	tick:addTask(func)

	coroutine.yield()
end

function scheduler:close(t)
	if coroutine.status(t) ~= "dead" then
		coroutine.close(t)
	end
end

function scheduler:spawn(f)
	local thread = coroutine.create(f)

	coroutine.resume(f)

	return thread
end

function scheduler:delay(num, f)
	local current = os.clock()

	local newThread = coroutine.create(f)

	local func
	func = function(dt)
		if os.clock() - num >= current then
			tick:removeTask(func)
			if coroutine.status(newThread) == "suspended" then
				coroutine.resume(newThread)
			end
		end
	end

	tick:addTask(func)
end

return scheduler
