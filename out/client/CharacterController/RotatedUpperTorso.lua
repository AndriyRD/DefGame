-- Compiled with roblox-ts v2.1.0
local RotatedUpperTorso
do
	RotatedUpperTorso = setmetatable({}, {
		__tostring = function()
			return "RotatedUpperTorso"
		end,
	})
	RotatedUpperTorso.__index = RotatedUpperTorso
	function RotatedUpperTorso.new(...)
		local self = setmetatable({}, RotatedUpperTorso)
		return self:constructor(...) or self
	end
	function RotatedUpperTorso:constructor()
	end
end
return {
	RotatedUpperTorso = RotatedUpperTorso,
}
