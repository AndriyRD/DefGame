-- Compiled with roblox-ts v2.1.0
local Shelter
do
	Shelter = setmetatable({}, {
		__tostring = function()
			return "Shelter"
		end,
	})
	Shelter.__index = Shelter
	function Shelter.new(...)
		local self = setmetatable({}, Shelter)
		return self:constructor(...) or self
	end
	function Shelter:constructor(character)
		self.character = character
	end
	function Shelter:NewByRaycast(part, res)
	end
end
return {
	Shelter = Shelter,
}
