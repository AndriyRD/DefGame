-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ObjectPull = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "ObjectPull").ObjectPull
local InstancePull
do
	local super = ObjectPull
	InstancePull = setmetatable({}, {
		__tostring = function()
			return "InstancePull"
		end,
		__index = super,
	})
	InstancePull.__index = InstancePull
	function InstancePull.new(...)
		local self = setmetatable({}, InstancePull)
		return self:constructor(...) or self
	end
	function InstancePull:constructor(objectLifeTime)
		super.constructor(self, objectLifeTime)
		math.randomseed(tick())
	end
	function InstancePull:OnMaxLifeTime(item)
		item:GetItem():Destroy()
	end
	function InstancePull:Push(item)
		super.Push(self, item)
		local conn
		conn = item.Destroying:Connect(function()
			local _items = self.items
			local _arg0 = function(v, i)
				if v:GetItem() == item then
					local _items_1 = self.items
					local _i = i
					table.remove(_items_1, _i + 1)
					print("Remove from pool item: " .. tostring(item))
				end
			end
			for _k, _v in _items do
				_arg0(_v, _k - 1, _items)
			end
			local obj = nil
			conn:Disconnect()
			conn = nil
		end)
	end
end
return {
	InstancePull = InstancePull,
}
