-- Controls game updates

local tick = {}

local oldUpdate = Game.update

local tasks = {}

tick.tasks = tasks

function Game:update(dt)
	oldUpdate(self, dt)

	for f, k in pairs(tasks) do
		local s, e = pcall(f)

		if not s then
			error("Update error: " .. e)
		end
	end
end

function tick:addTask(f)
	tasks[f] = #tasks + 1
end

function tick:removeTask(f)
	if tasks[f] then
		tasks[f] = nil
	end
end

return tick
