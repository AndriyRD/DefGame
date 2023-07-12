-- Compiled with roblox-ts v2.1.0
local BUILDING_TYPES
do
	local _inverse = {}
	BUILDING_TYPES = setmetatable({}, {
		__index = _inverse,
	})
	BUILDING_TYPES.BASE = "BASE"
	_inverse.BASE = "BASE"
	BUILDING_TYPES.ACTIVE = "ACTIVE"
	_inverse.ACTIVE = "ACTIVE"
	BUILDING_TYPES.INTERACT = "INTERACT"
	_inverse.INTERACT = "INTERACT"
end
return {
	BUILDING_TYPES = BUILDING_TYPES,
}
