-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local LIFE_CICLE_MODS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "LIFE_CICLE_MODS").LIFE_CICLE_MODS
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local LifeCicle
do
	LifeCicle = setmetatable({}, {
		__tostring = function()
			return "LifeCicle"
		end,
	})
	LifeCicle.__index = LifeCicle
	function LifeCicle.new(...)
		local self = setmetatable({}, LifeCicle)
		return self:constructor(...) or self
	end
	function LifeCicle:constructor(mode)
		if mode == nil then
			mode = LIFE_CICLE_MODS.HEARTBEAT
		end
		self.taskList = {}
		self.connection = nil
		self.running = false
		self.mode = if mode then mode else LIFE_CICLE_MODS.HEARTBEAT
	end
	function LifeCicle:GetModeConnection(mode)
		local _exp = Reflection:ConvertObjectToMap(RunService)
		local _mode = mode
		return _exp[_mode]
	end
	function LifeCicle:OnUpdate(dt)
		for _k, _v in self.taskList do
			local item = { _k, _v }
			item[2](dt)
		end
	end
	function LifeCicle:Run()
		if self.running then
			return self
		end
		self.running = true
		self.connection = self:GetModeConnection(self.mode):Connect(function(dt)
			return self:OnUpdate(dt)
		end)
		return self
	end
	function LifeCicle:Stop()
		if not self.running then
			return self
		end
		self.running = false
		local _result = self.connection
		if _result ~= nil then
			_result:Disconnect()
		end
		return self
	end
	function LifeCicle:AddTask(key, _task)
		local _taskList = self.taskList
		local _key = key
		local __task = _task
		_taskList[_key] = __task
		return self
	end
	function LifeCicle:RemoveTask(key)
		local _taskList = self.taskList
		local _key = key
		if not _taskList[_key] then
			error("Not found task by key: " .. key)
		end
		local _taskList_1 = self.taskList
		local _key_1 = key
		_taskList_1[_key_1] = nil
		return self
	end
	function LifeCicle:ClearTaskList()
		table.clear(self.taskList)
		return self
	end
end
return {
	LifeCicle = LifeCicle,
}
