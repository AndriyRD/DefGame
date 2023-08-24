-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWeaponBuilder = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeponBuilder", "BaseWeaponBuilder").BaseWeaponBuilder
local PersonWeaponBuilder = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeponBuilder", "PersonWeaponBuilder").PersonWeaponBuilder
local WEAPON_CLASSES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WEAPON_CLASSES").WEAPON_CLASSES
local ConfigurationSrorage = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Configuration", "ConfigurationSrorage").ConfigurationSrorage
local WeaponManager
do
	WeaponManager = {}
	function WeaponManager:constructor()
		self.builders = {
			[WEAPON_CLASSES.DEFAULT] = BaseWeaponBuilder.new(),
			[WEAPON_CLASSES.PERSON_WEAPOM] = PersonWeaponBuilder.new(),
		}
		self.weaponList = {}
		self.factories = {}
	end
	function WeaponManager:FindHandlerFactory(handlerType)
		local _factories = self.factories
		local _handlerType = handlerType
		local factory = _factories[_handlerType]
		if not factory then
			error("Not found weapon-handler type: " .. handlerType)
		end
		return factory
	end
	function WeaponManager:RegisterWeapon(plaeyr, model)
		local _weaponList = self.weaponList
		local _plaeyr = plaeyr
		local playerWeaponList = _weaponList[_plaeyr]
		local name = model.Name
		local config = ConfigurationSrorage.WeaponConfiguration:Get(name)
		if not config then
			error("Not found config for weapon: " .. name)
		end
		local builder = self.builders[config.WeaponClass]
		local newWeapon = builder:SetConfig(config):ParseModel(model):SetFireModuleFactory(self:FindHandlerFactory(config.HandlerType)):Build()
		if not playerWeaponList then
			playerWeaponList = {}
		end
		table.insert(playerWeaponList, newWeapon)
		local _weaponList_1 = self.weaponList
		local _plaeyr_1 = plaeyr
		local _playerWeaponList = playerWeaponList
		_weaponList_1[_plaeyr_1] = _playerWeaponList
		return newWeapon
	end
	function WeaponManager:UnregisterWeapon()
	end
end
return {
	WeaponManager = WeaponManager,
}
