-- Compiled with roblox-ts v2.1.0
local Reflection
do
	Reflection = setmetatable({}, {
		__tostring = function()
			return "Reflection"
		end,
	})
	Reflection.__index = Reflection
	function Reflection.new(...)
		local self = setmetatable({}, Reflection)
		return self:constructor(...) or self
	end
	function Reflection:constructor()
	end
	function Reflection:ConvertObjectToMap(obj)
		return obj
	end
end
return {
	Reflection = Reflection,
}
