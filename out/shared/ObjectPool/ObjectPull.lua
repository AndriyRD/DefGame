-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TempItem = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "TempItem").TempItem
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local ObjectPull
do
	ObjectPull = setmetatable({}, {
		__tostring = function()
			return "ObjectPull"
		end,
	})
	ObjectPull.__index = ObjectPull
	function ObjectPull.new(...)
		local self = setmetatable({}, ObjectPull)
		return self:constructor(...) or self
	end
	function ObjectPull:constructor(objectLifeTime)
		self.objectLifeTime = objectLifeTime
		self.items = {}
		self.connectino = RunService.Heartbeat:Connect(function(deltaTime)
			self:UpdateItemsLifeTime(deltaTime)
		end)
	end
	function ObjectPull:CanTake(item)
		return true
	end
	function ObjectPull:ResetLifeTime(oldLifeTime)
		return 0
	end
	function ObjectPull:UpdateItemsLifeTime(delata)
		for _, item in self.items do
			item:Update(function(old)
				return old + delata
			end)
			if item:GetLifeTime() >= self.objectLifeTime then
				self:OnMaxLifeTime(item)
			end
		end
	end
	function ObjectPull:OnMaxLifeTime(item)
		item:Dispose()
	end
	function ObjectPull:FindOldItem()
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
		return res
	end
	function ObjectPull:Push(item)
		local _items = self.items
		local _tempItem = TempItem.new(item, self.objectLifeTime)
		table.insert(_items, _tempItem)
	end
	function ObjectPull:Take()
		local res = self:FindOldItem()
		res:Update(function(v)
			return self:ResetLifeTime(v)
		end)
		return res
	end
	function ObjectPull:GetFreeItems()
		local _items = self.items
		local _arg0 = function(v)
			return self:CanTake(v)
		end
		-- ▼ ReadonlyArray.filter ▼
		local _newValue = {}
		local _length = 0
		for _k, _v in _items do
			if _arg0(_v, _k - 1, _items) == true then
				_length += 1
				_newValue[_length] = _v
			end
		end
		-- ▲ ReadonlyArray.filter ▲
		return _newValue
	end
	function ObjectPull:GetSize()
		return #self.items
	end
end
return {
	ObjectPull = ObjectPull,
}
