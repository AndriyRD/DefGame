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
	function WeaponManager:GetOwnerWeapons(owner)
		local _weaponList = self.weaponList
		local _arg0 = function(weapon)
			return weapon.OwnerState:GetCurrent() == owner
		end
		-- ▼ ReadonlyArray.filter ▼
		local _newValue = {}
		local _length = 0
		for _k, _v in _weaponList do
			if _arg0(_v, _k - 1, _weaponList) == true then
				_length += 1
				_newValue[_length] = _v
			end
		end
		-- ▲ ReadonlyArray.filter ▲
		return _newValue
	end
	function WeaponManager:GetByModel(model)
		local _weaponList = self.weaponList
		local _arg0 = function(weapon)
			return weapon.WeaponModel.Model == model
		end
		-- ▼ ReadonlyArray.find ▼
		local _result
		for _i, _v in _weaponList do
			if _arg0(_v, _i - 1, _weaponList) == true then
				_result = _v
				break
			end
		end
		-- ▲ ReadonlyArray.find ▲
		return _result
	end
	function WeaponManager:GetById(owner, id)
		local _exp = self:GetOwnerWeapons(owner)
		local _arg0 = function(weapon)
			return weapon.WeaponModel.Model.Name == id
		end
		-- ▼ ReadonlyArray.find ▼
		local _result
		for _i, _v in _exp do
			if _arg0(_v, _i - 1, _exp) == true then
				_result = _v
				break
			end
		end
		-- ▲ ReadonlyArray.find ▲
		return _result
	end
	function WeaponManager:RegisterWeapon(model)
		local name = model.Name
		local config = ConfigurationSrorage.WeaponConfiguration:Get(name)
		if not config then
			error("Not found config for weapon: " .. name)
		end
		local builder = self.builders[config.WeaponClass]
		local newWeapon = builder:SetConfig(config):ParseModel(model):SetFireModuleFactory(self:FindHandlerFactory(config.HandlerType)):Build()
		table.insert(self.weaponList, newWeapon)
		return newWeapon
	end
	function WeaponManager:UnregisterWeapon()
	end
end
return {
	WeaponManager = WeaponManager,
}
