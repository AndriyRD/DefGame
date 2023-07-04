-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local C_BaseWrapperEquipment = TS.import(script, script.Parent.Parent, "BaseWrapper", "C_BaseWrapperEquipment").C_BaseWrapperEquipment
local BindedAutoFireModule = TS.import(script, script.Parent.Parent.Parent.Parent, "Weapon", "Common", "BindedAutoFireModule").BindedAutoFireModule
local WeaponProvider = TS.import(script, script.Parent.Parent.Parent.Parent, "Weapon", "WeaponProvider").WeaponProvider
local C_WeaponWrappedEquipment
do
	local super = C_BaseWrapperEquipment
	C_WeaponWrappedEquipment = setmetatable({}, {
		__tostring = function()
			return "C_WeaponWrappedEquipment"
		end,
		__index = super,
	})
	C_WeaponWrappedEquipment.__index = C_WeaponWrappedEquipment
	function C_WeaponWrappedEquipment.new(...)
		local self = setmetatable({}, C_WeaponWrappedEquipment)
		return self:constructor(...) or self
	end
	function C_WeaponWrappedEquipment:constructor(...)
		super.constructor(self, ...)
		self.autoFireModule = BindedAutoFireModule.new(WeaponProvider.weaponManager:RegisterWeapon(self:GetOwner(), self:GetModel()))
	end
	function C_WeaponWrappedEquipment:GetEquipmentType()
		return EQUIPMENT_TYPES.WEAPON
	end
	function C_WeaponWrappedEquipment:Equip()
		self.autoFireModule:Bind()
		return super.Equip(self)
	end
	function C_WeaponWrappedEquipment:Unequip()
		self.autoFireModule:Unbind()
		return super.Unequip(self)
	end
end
return {
	C_WeaponWrappedEquipment = C_WeaponWrappedEquipment,
}
