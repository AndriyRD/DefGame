-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local ClientBaseWrapperEquipment = TS.import(script, script.Parent.Parent, "BaseWrapper", "ClientBaseWrapperEquipment").ClientBaseWrapperEquipment
local EventProvider = TS.import(script, script.Parent.Parent.Parent.Parent, "EventProvider").EventProvider
local WeaponProvider = TS.import(script, script.Parent.Parent.Parent.Parent, "Weapon", "WeaponProvider").WeaponProvider
local AutoFire = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "AutoFire").AutoFire
local BindedWeapon = TS.import(script, script.Parent.Parent.Parent.Parent, "Weapon", "BindedWeapon").BindedWeapon
local WeaponWrappedEquipment
do
	local super = ClientBaseWrapperEquipment
	WeaponWrappedEquipment = setmetatable({}, {
		__tostring = function()
			return "WeaponWrappedEquipment"
		end,
		__index = super,
	})
	WeaponWrappedEquipment.__index = WeaponWrappedEquipment
	function WeaponWrappedEquipment.new(...)
		local self = setmetatable({}, WeaponWrappedEquipment)
		return self:constructor(...) or self
	end
	function WeaponWrappedEquipment:constructor(equipment)
		super.constructor(self, equipment)
		self.events = EventProvider.Weapon
		self.weapon = WeaponProvider:RegisterWeapon(self:GetModel())
		self.bindWeaponModule = BindedWeapon.new(self.weapon, AutoFire.new(self.weapon.fireModule))
		self.weapon.OwnerState:ChagneOwner(equipment:GetOwner())
	end
	function WeaponWrappedEquipment:GetEquipmentType()
		return EQUIPMENT_TYPES.WEAPON
	end
	function WeaponWrappedEquipment:Equip()
		self.bindWeaponModule:Bind()
		local ammoContainer = self.weapon.DataObject.Ammo
		self.events.Equip:Fire(ammoContainer, ammoContainer:GetState())
		return super.Equip(self)
	end
	function WeaponWrappedEquipment:Unequip()
		self.bindWeaponModule:Unbind()
		self.events.Unequip:Fire()
		return super.Unequip(self)
	end
end
return {
	WeaponWrappedEquipment = WeaponWrappedEquipment,
}
