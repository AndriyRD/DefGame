-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ObjectPull = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "ObjectPull").ObjectPull
local GeneratedObjectPull
do
	local super = ObjectPull
	GeneratedObjectPull = setmetatable({}, {
		__tostring = function()
			return "GeneratedObjectPull"
		end,
		__index = super,
	})
	GeneratedObjectPull.__index = GeneratedObjectPull
	function GeneratedObjectPull:constructor(...)
		super.constructor(self, ...)
	end
	function GeneratedObjectPull:Take()
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
	GeneratedObjectPull = GeneratedObjectPull,
}
