-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local WeaponProvider = TS.import(script, script.Parent.Parent.Parent.Parent, "Weapon", "WeaponProvider").WeaponProvider
local WeaponBindModule = TS.import(script, script.Parent, "WeaponBindModule").WeaponBindModule
local AutoFireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "AutoFireModule").AutoFireModule
local ClientBaseWrapperEquipment = TS.import(script, script.Parent.Parent, "BaseWrapper", "ClientBaseWrapperEquipment").ClientBaseWrapperEquipment
local EventProvider = TS.import(script, script.Parent.Parent.Parent.Parent, "EventProvider").EventProvider
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
	function WeaponWrappedEquipment:constructor(...)
		super.constructor(self, ...)
		self.events = EventProvider.Weapon
		self.weaponContainer = WeaponProvider.weaponManager:RegisterWeapon(self:GetOwner(), self:GetModel())
		self.bindWeaponModule = WeaponBindModule.new(self.weaponContainer:GetWeapon(), AutoFireModule.new(self.weaponContainer))
	end
	function WeaponWrappedEquipment:GetEquipmentType()
		return EQUIPMENT_TYPES.WEAPON
	end
	function WeaponWrappedEquipment:Equip()
		self.bindWeaponModule:Bind()
		local ammoContainer = self.weaponContainer:GetWeapon():GetAmmoContainer()
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