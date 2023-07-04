-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local BaseWrappedEquipment
do
	BaseWrappedEquipment = setmetatable({}, {
		__tostring = function()
			return "BaseWrappedEquipment"
		end,
	})
	BaseWrappedEquipment.__index = BaseWrappedEquipment
	function BaseWrappedEquipment.new(...)
		local self = setmetatable({}, BaseWrappedEquipment)
		return self:constructor(...) or self
	end
	function BaseWrappedEquipment:constructor(equipment)
		self.equipment = equipment
	end
	function BaseWrappedEquipment:GetEquipmentType()
		return EQUIPMENT_TYPES.DEFAULT
	end
	function BaseWrappedEquipment:Equip()
		self.equipment:Equip()
		return self
	end
	function BaseWrappedEquipment:Unequip()
		self.equipment:Unequip()
		return self
	end
	function BaseWrappedEquipment:GetModel()
		return self.equipment:GetModel()
	end
	function BaseWrappedEquipment:GetConfig()
		return self.equipment:GetConfig()
	end
	function BaseWrappedEquipment:GetGrip()
		return self.equipment:GetGrip()
	end
	function BaseWrappedEquipment:GetOwner()
		return self.equipment:GetOwner()
	end
	function BaseWrappedEquipment:GetID()
		return self.equipment:GetID()
	end
	function BaseWrappedEquipment:IsEquiped()
		return self.equipment:IsEquiped()
	end
end
return {
	BaseWrappedEquipment = BaseWrappedEquipment,
}
