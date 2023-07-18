-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ObjectPool = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "ObjectPool").ObjectPool
local GeneratedObjectPool
do
	local super = ObjectPool
	GeneratedObjectPool = setmetatable({}, {
		__tostring = function()
			return "GeneratedObjectPool"
		end,
		__index = super,
	})
	GeneratedObjectPool.__index = GeneratedObjectPool
	function GeneratedObjectPool:constructor(...)
		super.constructor(self, ...)
	end
	function GeneratedObjectPool:Take()
		local res = super.Take(self)
		if not res then
			res = self:CreateItem()
			local _items = self.items
			local _res = res
			table.insert(_items, _res)
		end
		return res
	end
end
return {
	GeneratedObjectPool = GeneratedObjectPool,
}
