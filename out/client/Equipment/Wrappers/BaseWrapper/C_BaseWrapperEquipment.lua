-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimatedCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimatedCharacter").AnimatedCharacter
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local BaseWrappedEquipment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Wrappers", "BaseWrappedEquipment").BaseWrappedEquipment
local C_BaseWrapperEquipment
do
	local super = BaseWrappedEquipment
	C_BaseWrapperEquipment = setmetatable({}, {
		__tostring = function()
			return "C_BaseWrapperEquipment"
		end,
		__index = super,
	})
	C_BaseWrapperEquipment.__index = C_BaseWrapperEquipment
	function C_BaseWrapperEquipment.new(...)
		local self = setmetatable({}, C_BaseWrapperEquipment)
		return self:constructor(...) or self
	end
	function C_BaseWrapperEquipment:constructor(...)
		super.constructor(self, ...)
		self.animatedCharacter = AnimatedCharacter.new(self:GetOwner(), self:GetConfig().AnimationSet, AnimationConfig.DEFAULT_ANIMATION_SET_LIST.R16)
	end
	function C_BaseWrapperEquipment:Equip()
		self.animatedCharacter:Load()
		return super.Equip(self)
	end
	function C_BaseWrapperEquipment:Unequip()
		self.animatedCharacter:Reset()
		return super.Unequip(self)
	end
end
return {
	C_BaseWrapperEquipment = C_BaseWrapperEquipment,
}
