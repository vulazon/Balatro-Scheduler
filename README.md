# Balatro-Scheduler
A basic "task" scheduler for Balatro.

Scheduler will require tick inorder to function properly

Every task handled by tick will be called with a deltaTime argument everytime Update is called.

## tick:addTask

```lua
local loopFunction = function(deltaTime)
  print("Hi! The delta is "..deltaTime)
end

tick:addTask(loopFunction) -- Adds the function to tick's task handling
```

## tick:removeTask

```lua
  tick:removeTask(loopFunction) -- Removes the function from tick's task handling
```

## scheduler:delay Example Code
```lua
  scheduler:delay(time, func) -- Delays the function until a period of time (15s or any) has passed
```

As of now, scheduler:wait is non functional
