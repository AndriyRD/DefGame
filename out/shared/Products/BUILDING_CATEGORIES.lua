-- Compiled with roblox-ts v2.1.0
local BUILDING_CATEGORIES
do
	local _inverse = {}
	BUILDING_CATEGORIES = setmetatable({}, {
		__index = _inverse,
	})
	BUILDING_CATEGORIES.BASE = "BASE"
	_inverse.BASE = "BASE"
	BUILDING_CATEGORIES.WEAPON = "WEAPON"
	_inverse.WEAPON = "WEAPON"
end
return {
	BUILDING_CATEGORIES = BUILDING_CATEGORIES,
}
