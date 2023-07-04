-- Compiled with roblox-ts v2.1.0
local COMMON
do
	local _inverse = {}
	COMMON = setmetatable({}, {
		__index = _inverse,
	})
	COMMON.ROOT = "HumanoidRootPart"
	_inverse.HumanoidRootPart = "ROOT"
	COMMON.HEAD = "Head"
	_inverse.Head = "HEAD"
	COMMON.RIGHT_HAND = "RightHand"
	_inverse.RightHand = "RIGHT_HAND"
	COMMON.LEFT_HAND = "LeftHand"
	_inverse.LeftHand = "LEFT_HAND"
	COMMON.RIGHT_FOOT = "RightFoot"
	_inverse.RightFoot = "RIGHT_FOOT"
	COMMON.LEFT_FOOT = "LeftFoot"
	_inverse.LeftFoot = "LEFT_FOOT"
end
local R6
do
	local _inverse = {}
	R6 = setmetatable({}, {
		__index = _inverse,
	})
	R6.TORSO = "TORSO"
	_inverse.TORSO = "TORSO"
end
local R15
do
	local _inverse = {}
	R15 = setmetatable({}, {
		__index = _inverse,
	})
	R15.UPPER_TORSO = "UpperTorso"
	_inverse.UpperTorso = "UPPER_TORSO"
	R15.LOWER_TORSO = "LowerTorso"
	_inverse.LowerTorso = "LOWER_TORSO"
	R15.RIGHT_LOWER_ARM = "RightLowerArm"
	_inverse.RightLowerArm = "RIGHT_LOWER_ARM"
	R15.LEFT_LOWER_ARM = "LeftLowerArm"
	_inverse.LeftLowerArm = "LEFT_LOWER_ARM"
end
return {
	MAIN = COMMON,
	R6 = R6,
	R15 = R15,
}
