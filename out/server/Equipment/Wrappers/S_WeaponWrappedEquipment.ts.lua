-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWrappedEquipment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Wrappers", "BaseWrappedEquipment").BaseWrappedEquipment
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local WeaponServiceAPI = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "FrontLayer", "WeaponServiceAPI").WeaponServiceAPI
local S_WeaponWrappedEquipment
do
	local super = BaseWrappedEquipment
	S_WeaponWrappedEquipment = setmetatable({}, {
		__tostring = function()
			return "S_WeaponWrappedEquipment"
		end,
		__index = super,
	})
	S_WeaponWrappedEquipment.__index = S_WeaponWrappedEquipment
	function S_WeaponWrappedEquipment.new(...)
		local self = setmetatable({}, S_WeaponWrappedEquipment)
		return self:constructor(...) or self
	end
	function S_WeaponWrappedEquipment:constructor(equipment)
		super.constructor(self, equipment)
		self.equipment = equipment
		WeaponServiceAPI:Create(equipment:GetOwner(), equipment:GetModel())
	end
	function S_WeaponWrappedEquipment:GetEquipmentType()
		return EQUIPMENT_TYPES.WEAPON
	end
	function S_WeaponWrappedEquipment:Equip()
		return super.Equip(self)
	end
end
return {
	S_WeaponWrappedEquipment = S_WeaponWrappedEquipment,
}
