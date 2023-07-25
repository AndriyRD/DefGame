-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AssetInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "AssetInstance", "AssetInstance").AssetInstance
local AnimationFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationFactory").AnimationFactory
local EquipmentAnimation
do
	EquipmentAnimation = setmetatable({}, {
		__tostring = function()
			return "EquipmentAnimation"
		end,
	})
	EquipmentAnimation.__index = EquipmentAnimation
	function EquipmentAnimation.new(...)
		local self = setmetatable({}, EquipmentAnimation)
		return self:constructor(...) or self
	end
	function EquipmentAnimation:constructor(character, actionAnimations)
		self.character = character
		self.actionAnimations = actionAnimations
		self.soundContainer = Instance.new("Folder")
		self.equipAnimation = self:CreateActionAnimation(actionAnimations.Equip)
		self.unequipAnimation = self:CreateActionAnimation(actionAnimations.Uneqip)
		self.soundContainer.Parent = character:GetRoot()
		self.soundContainer.Name = "SoundContainer"
	end
	function EquipmentAnimation:ConvertSoundSet(sounds)
		local soundSet = {}
		for _, item in sounds do
			local sound = AssetInstance:CreateByID(item.ID, "Sound")
			sound.Parent = self.character:GetRoot()
			sound.Name = item.Name
			sound.Parent = self.soundContainer
			local _name = item.Name
			soundSet[_name] = sound
		end
		return soundSet
	end
	function EquipmentAnimation:CreateActionAnimation(data)
		return AnimationFactory:CraeteWithSoundByID(self.character, data.AnimationID, self:ConvertSoundSet(data.Sounds))
	end
	function EquipmentAnimation:PlayEquip()
		self.equipAnimation:Play()
		return self.equipAnimation:GetTrack()
	end
	function EquipmentAnimation:PlayeUnequip()
		self.unequipAnimation:Play()
		return self.unequipAnimation:GetTrack()
	end
end
return {
	EquipmentAnimation = EquipmentAnimation,
}
