-- Compiled with roblox-ts v2.1.0
local BlueBird
do
	BlueBird = setmetatable({}, {
		__tostring = function()
			return "BlueBird"
		end,
	})
	BlueBird.__index = BlueBird
	function BlueBird.new(...)
		local self = setmetatable({}, BlueBird)
		return self:constructor(...) or self
	end
	function BlueBird:constructor()
	end
end
return {
	BlueBird = BlueBird,
}
