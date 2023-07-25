-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local EquipmentGlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentGlobalConfig").EquipmentGlobalConfig
local BaseWrappedEquipment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Wrappers", "BaseWrappedEquipment").BaseWrappedEquipment
local ServerBaseWrappedEquipment
do
	local super = BaseWrappedEquipment
	ServerBaseWrappedEquipment = setmetatable({}, {
		__tostring = function()
			return "ServerBaseWrappedEquipment"
		end,
		__index = super,
	})
	ServerBaseWrappedEquipment.__index = ServerBaseWrappedEquipment
	function ServerBaseWrappedEquipment.new(...)
		local self = setmetatable({}, ServerBaseWrappedEquipment)
		return self:constructor(...) or self
	end
	function ServerBaseWrappedEquipment:constructor(equipment)
		super.constructor(self, equipment)
		self:InitGrip()
		self:GetModel().Parent = GetCharacter(self:GetOwner())
	end
	function ServerBaseWrappedEquipment:Reposition(orientationData)
		local grip = self:GetGrip()
		local char = GetCharacter(self:GetOwner())
		local bodyPart = char:WaitForChild(orientationData.BodyPartName)
		grip.Part0 = bodyPart
		grip.C0 = orientationData.Offset
		grip.Parent = self.equipment:GetModel().PrimaryPart
	end
	function ServerBaseWrappedEquipment:InitGrip()
		local grip = self:GetGrip()
		grip.Name = self:GetID() .. EquipmentGlobalConfig.WEAPON_GRIP_NAME_POSTFIX
		grip.Part1 = self.equipment:GetModel().PrimaryPart
		self:Reposition(self:GetConfig().Orientation.Unequip)
	end
	function ServerBaseWrappedEquipment:Equip()
		self:Reposition(self:GetConfig().Orientation.Equip)
		return super.Equip(self)
	end
	function ServerBaseWrappedEquipment:Unequip()
		self:Reposition(self:GetConfig().Orientation.Unequip)
		return super.Unequip(self)
	end
end
return {
	ServerBaseWrappedEquipment = ServerBaseWrappedEquipment,
}
