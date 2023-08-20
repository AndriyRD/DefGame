-- Compiled with roblox-ts v2.1.0
local WEAPON_CLASSES
do
	local _inverse = {}
	WEAPON_CLASSES = setmetatable({}, {
		__index = _inverse,
	})
	WEAPON_CLASSES.DEFAULT = 0
	_inverse[0] = "DEFAULT"
	WEAPON_CLASSES.PERSON_WEAPOM = 1
	_inverse[1] = "PERSON_WEAPOM"
end
return {
	WEAPON_CLASSES = WEAPON_CLASSES,
}
