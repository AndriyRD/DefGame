-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseGameLoop = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BaseGameLoop").BaseGameLoop
local TempItem = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "TempItem").TempItem
local ObjectPool
do
	ObjectPool = setmetatable({}, {
		__tostring = function()
			return "ObjectPool"
		end,
	})
	ObjectPool.__index = ObjectPool
	function ObjectPool.new(...)
		local self = setmetatable({}, ObjectPool)
		return self:constructor(...) or self
	end
	function ObjectPool:constructor(objectLifeTime, tickRate)
		self.objectLifeTime = objectLifeTime
		self.items = {}
		self.tickRate = if tickRate ~= 0 and (tickRate == tickRate and tickRate) then tickRate else 1 / 20
		self.lifeTimeHandler = BaseGameLoop.new():SetTickRate(self.tickRate):AddTask("main", function()
			return self:UpdateItemsLifeTime()
		end)
	end
	function ObjectPool:CanTake(item)
		return true
	end
	function ObjectPool:ResetLifeTime(oldLifeTime)
		return 0
	end
	function ObjectPool:UpdateItemsLifeTime()
		for _, item in self.items do
			item:Update(function(old)
				return old + self.tickRate
			end)
		end
	end
	function ObjectPool:Push(item)
		local _items = self.items
		local _tempItem = TempItem.new(item, self.objectLifeTime)
		table.insert(_items, _tempItem)
	end
	function ObjectPool:Take()
		local res = self.items[1]
		local resTime = res:GetLifeTime()
		for _, item in self.items do
			if self:CanTake(item) then
				if item:GetLifeTime() > resTime then
					res = item
					resTime = item:GetLifeTime()
				end
			end
		end
		res:Update(function(v)
			return self:ResetLifeTime(v)
		end)
		return res
	end
	function ObjectPool:GetFreeItems()
		local _items = self.items
		local _arg0 = function(v)
			return self:CanTake(v)
		end
		-- ▼ ReadonlyArray.map ▼
		local _newValue = table.create(#_items)
		for _k, _v in _items do
			_newValue[_k] = _arg0(_v, _k - 1, _items)
		end
		-- ▲ ReadonlyArray.map ▲
		return _newValue
	end
end
return {
	ObjectPool = ObjectPool,
}
