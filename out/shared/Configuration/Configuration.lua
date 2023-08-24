-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local Configuration
do
	Configuration = setmetatable({}, {
		__tostring = function()
			return "Configuration"
		end,
	})
	Configuration.__index = Configuration
	function Configuration.new(...)
		local self = setmetatable({}, Configuration)
		return self:constructor(...) or self
	end
	function Configuration:constructor(items)
		self.items = Reflection:ConvertObjectToMap(items)
	end
	function Configuration:Get(key)
		local _items = self.items
		local _key = key
		return _items[_key]
	end
end
return {
	Configuration = Configuration,
}
