-- Compiled with roblox-ts v2.1.0
local PROP_NAMES
do
	local _inverse = {}
	PROP_NAMES = setmetatable({}, {
		__index = _inverse,
	})
	PROP_NAMES.CHARACTER = "Character"
	_inverse.Character = "CHARACTER"
	PROP_NAMES.HUMANOID = "Humanoid"
	_inverse.Humanoid = "HUMANOID"
	PROP_NAMES.MOVE_DIRECTION = "MoveDirection"
	_inverse.MoveDirection = "MOVE_DIRECTION"
end
return {
	PROP_NAMES = PROP_NAMES,
}
