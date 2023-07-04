-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CHARACTER_ANIMATIONS_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "CHARACTER_ANIMATIONS_NAMES").CHARACTER_ANIMATIONS_NAMES
local addIfExist = function(list, id, name)
	if id ~= "" and id then
		local _list = list
		local _name = name
		local _id = id
		_list[_name] = _id
	end
end
return function(set)
	local list = {}
	addIfExist(list, set.Run, CHARACTER_ANIMATIONS_NAMES.RUN)
	addIfExist(list, set.Idle, CHARACTER_ANIMATIONS_NAMES.IDLE)
	addIfExist(list, set.Walk, CHARACTER_ANIMATIONS_NAMES.WALK)
	addIfExist(list, set.Jump, CHARACTER_ANIMATIONS_NAMES.JUMP)
	return list
end
