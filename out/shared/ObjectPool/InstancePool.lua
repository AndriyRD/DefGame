-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ObjectPool = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "ObjectPool").ObjectPool
local InstancePool
do
	local super = ObjectPool
	InstancePool = setmetatable({}, {
		__tostring = function()
			return "InstancePool"
		end,
		__index = super,
	})
	InstancePool.__index = InstancePool
	function InstancePool.new(...)
		local self = setmetatable({}, InstancePool)
		return self:constructor(...) or self
	end
	function InstancePool:constructor(objectLifeTime, tickRate)
		super.constructor(self, objectLifeTime, tickRate)
	end
	function InstancePool:Push(item)
		super.Push(self, item)
		local conn = item.Destroying:Connect(function()
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
		end)
	end
end
return {
	InstancePool = InstancePool,
}
