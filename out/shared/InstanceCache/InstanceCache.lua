-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local LIFE_CICLE_MODS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "LIFE_CICLE_MODS").LIFE_CICLE_MODS
local LifeCicle = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "LifeCicle").LifeCicle
local TempInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "InstanceCache", "TempInstance").TempInstance
local InstanceCache
do
	InstanceCache = setmetatable({}, {
		__tostring = function()
			return "InstanceCache"
		end,
	})
	InstanceCache.__index = InstanceCache
	function InstanceCache.new(...)
		local self = setmetatable({}, InstanceCache)
		return self:constructor(...) or self
	end
	function InstanceCache:constructor()
		self.maxLifeTime = 20
		self.lifeCicle = LifeCicle.new(LIFE_CICLE_MODS.HEARTBEAT)
		self.items = {}
		self.lifeCicle:AddTask("main", function(dt)
			return self:UpdateItems(dt)
		end):Run()
	end
	function InstanceCache:GetKeyByInstance(inst)
		for _k, _v in self.items do
			local e = { _k, _v }
			if e[2]:GetInstance() == inst then
				return e[1]
			end
		end
	end
	function InstanceCache:UpdateItems(dt)
		for _k, _v in self.items do
			local e = { _k, _v }
			local item = e[2]
			item:Update(function(v)
				return v + dt
			end)
			if item:IsOld() then
				local _items = self.items
				local _arg0 = e[1]
				_items[_arg0] = nil
			end
		end
	end
	function InstanceCache:RemoveWhenDestroying(inst)
		local connection
		connection = inst.Destroying:Connect(function()
			local key = self:GetKeyByInstance(inst)
			if key ~= "" and key then
				self.items[key] = nil
			end
			connection:Disconnect()
		end)
	end
	function InstanceCache:SetMaxLifeTime(lifeTime)
		self.maxLifeTime = lifeTime
		return self
	end
	function InstanceCache:AddItem(key, item)
		local _items = self.items
		local _key = key
		local _tempInstance = TempInstance.new(item, self.maxLifeTime)
		_items[_key] = _tempInstance
		self:RemoveWhenDestroying(item)
		return self
	end
	function InstanceCache:Exist(k)
		local _items = self.items
		local _k = k
		return _items[_k] ~= nil
	end
	function InstanceCache:Take()
		local res = nil
		local resLifeTime = 0
		for _k, _v in self.items do
			local e = { _k, _v }
			local item = e[2]
			if not res or res:GetLifeTime() >= resLifeTime then
				res = item
				resLifeTime = item:GetLifeTime()
			end
		end
		local _result = res
		if _result ~= nil then
			_result = _result:GetInstance()
		end
		return _result
	end
end
return {
	InstanceCache = InstanceCache,
}
