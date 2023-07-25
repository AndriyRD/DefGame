-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimatedCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimatedCharacter").AnimatedCharacter
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local BaseWrappedEquipment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Wrappers", "BaseWrappedEquipment").BaseWrappedEquipment
local EquipmentAnimation = TS.import(script, script.Parent, "EquipmentAnimation").EquipmentAnimation
local ClientBaseWrapperEquipment
do
	local super = BaseWrappedEquipment
	ClientBaseWrapperEquipment = setmetatable({}, {
		__tostring = function()
			return "ClientBaseWrapperEquipment"
		end,
		__index = super,
	})
	ClientBaseWrapperEquipment.__index = ClientBaseWrapperEquipment
	function ClientBaseWrapperEquipment.new(...)
		local self = setmetatable({}, ClientBaseWrapperEquipment)
		return self:constructor(...) or self
	end
	function ClientBaseWrapperEquipment:constructor(equipment)
		super.constructor(self, equipment)
		local char = self:GetCharacter()
		local config = self:GetConfig()
		self.equipmentAnimation = EquipmentAnimation.new(char, config.ActionAnimations)
		self.animatedCharacter = AnimatedCharacter.new(char, config.AnimationSet, AnimationConfig.DEFAULT_ANIMATION_SET_LIST.R16)
	end
	function ClientBaseWrapperEquipment:Equip()
		local _result = self.equipmentAnimation:PlayEquip()
		if _result ~= nil then
			_result = _result.Stopped:Connect(function()
				return self.animatedCharacter:Load()
			end)
		end
		return super.Equip(self)
	end
	function ClientBaseWrapperEquipment:Unequip()
		local _result = self.equipmentAnimation:PlayeUnequip()
		if _result ~= nil then
			_result = _result.Stopped:Connect(function()
				return self.animatedCharacter:Reset()
			end)
		end
		super.Unequip(self)
		return self
	end
end
return {
	ClientBaseWrapperEquipment = ClientBaseWrapperEquipment,
}
