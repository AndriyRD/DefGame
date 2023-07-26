-- Compiled with roblox-ts v2.1.0
local BUILDINGS_IDS
do
	local _inverse = {}
	BUILDINGS_IDS = setmetatable({}, {
		__index = _inverse,
	})
	BUILDINGS_IDS.BASE_WALL = "BaseWall"
	_inverse.BaseWall = "BASE_WALL"
	BUILDINGS_IDS.MACHINE_GUN = "MachineGun"
	_inverse.MachineGun = "MACHINE_GUN"
end
return {
	BUILDINGS_IDS = BUILDINGS_IDS,
}
