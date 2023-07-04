-- Compiled with roblox-ts v2.1.0
local WEAPON_HANDLER_TYPES
do
	local _inverse = {}
	WEAPON_HANDLER_TYPES = setmetatable({}, {
		__index = _inverse,
	})
	WEAPON_HANDLER_TYPES.BASE = "BASE"
	_inverse.BASE = "BASE"
	WEAPON_HANDLER_TYPES.ROCKET = "ROCKET"
	_inverse.ROCKET = "ROCKET"
end
return {
	WEAPON_HANDLER_TYPES = WEAPON_HANDLER_TYPES,
}
