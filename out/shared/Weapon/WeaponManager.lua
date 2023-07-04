-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponContainerFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponContainerFactory").WeaponContainerFactory
local WeaponManager
do
	WeaponManager = {}
	function WeaponManager:constructor()
		self.containerList = {}
		self.factories = self:InitFactories()
		self.weaponContainerFactory = WeaponContainerFactory.new(self.factories)
	end
	function WeaponManager:RegisterWeapon(plaeyr, model)
		local container = self.weaponContainerFactory:Create(plaeyr, model)
		local _containerList = self.containerList
		local _plaeyr = plaeyr
		_containerList[_plaeyr] = container
		return container
	end
	function WeaponManager:UnregisterWeapon()
	end
end
return {
	WeaponManager = WeaponManager,
}
