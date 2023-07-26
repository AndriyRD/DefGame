-- Compiled with roblox-ts v2.1.0
local BaseGameLoop
do
	BaseGameLoop = setmetatable({}, {
		__tostring = function()
			return "BaseGameLoop"
		end,
	})
	BaseGameLoop.__index = BaseGameLoop
	function BaseGameLoop.new(...)
		local self = setmetatable({}, BaseGameLoop)
		return self:constructor(...) or self
	end
	function BaseGameLoop:constructor()
		self.enabled = false
		self.tickRate = 1
		self.taskList = {}
		self.dataObject = {}
	end
	function BaseGameLoop:StartAsync()
		self.enabled = true
		coroutine.wrap(function()
			while self.enabled do
				local start = time()
				for _k, _v in self.taskList do
					local _task = { _k, _v }
					_task[2](self.dataObject)
				end
				local theta = time() - start
				if theta < self.tickRate then
					task.wait(self.tickRate - theta)
				end
			end
		end)()
		return self
	end
	function BaseGameLoop:AddTask(name, _task)
		local _taskList = self.taskList
		local _name = name
		local __task = _task
		_taskList[_name] = __task
		return self
	end
	function BaseGameLoop:Stop()
		self.enabled = false
		return self
	end
	function BaseGameLoop:SetTickRate(tickRate)
		self.tickRate = tickRate
		return self
	end
	function BaseGameLoop:ClearTaskList()
		table.clear(self.taskList)
	end
end
return {
	BaseGameLoop = BaseGameLoop,
}
