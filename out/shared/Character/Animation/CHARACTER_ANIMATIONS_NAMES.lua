-- Compiled with roblox-ts v2.1.0
local CHARACTER_ANIMATIONS_NAMES
do
	local _inverse = {}
	CHARACTER_ANIMATIONS_NAMES = setmetatable({}, {
		__index = _inverse,
	})
	CHARACTER_ANIMATIONS_NAMES.RUN = "Run"
	_inverse.Run = "RUN"
	CHARACTER_ANIMATIONS_NAMES.WALK = "Walk"
	_inverse.Walk = "WALK"
	CHARACTER_ANIMATIONS_NAMES.IDLE = "Idle"
	_inverse.Idle = "IDLE"
	CHARACTER_ANIMATIONS_NAMES.JUMP = "Jump"
	_inverse.Jump = "JUMP"
end
return {
	CHARACTER_ANIMATIONS_NAMES = CHARACTER_ANIMATIONS_NAMES,
}
