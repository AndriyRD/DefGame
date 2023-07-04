-- Compiled with roblox-ts v2.1.0
local EQUIPMENT_TYPES
do
	local _inverse = {}
	EQUIPMENT_TYPES = setmetatable({}, {
		__index = _inverse,
	})
	EQUIPMENT_TYPES.DEFAULT = "DEFAULT"
	_inverse.DEFAULT = "DEFAULT"
	EQUIPMENT_TYPES.WEAPON = "WEAPON"
	_inverse.WEAPON = "WEAPON"
end
return {
	EQUIPMENT_TYPES = EQUIPMENT_TYPES,
}
