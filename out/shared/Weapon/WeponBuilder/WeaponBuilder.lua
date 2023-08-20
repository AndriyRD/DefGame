-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local BaseWeapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapons", "BaseWeapon").BaseWeapon
local WeaponModelParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "ModelParsers", "WeaponModelParser").WeaponModelParser
local WeaponBuilder
do
	WeaponBuilder = setmetatable({}, {
		__tostring = function()
			return "WeaponBuilder"
		end,
	})
	WeaponBuilder.__index = WeaponBuilder
	function WeaponBuilder.new(...)
		local self = setmetatable({}, WeaponBuilder)
		return self:constructor(...) or self
	end
	function WeaponBuilder:constructor()
		self.buildData = {}
		self.modelParser = WeaponModelParser.new()
		self.classInstanceProps = Reflection:ConvertObjectToMap(self)
	end
	function WeaponBuilder:ExistProp(propName)
		local _classInstanceProps = self.classInstanceProps
		local _propName = propName
		return _classInstanceProps[_propName] ~= nil
	end
	function WeaponBuilder:CanCreateBaseWeapon()
		for _k, _v in self.classInstanceProps do
			local item = { _k, _v }
			if not self:ExistProp(item[1]) then
				return false
			end
		end
		return true
	end
	function WeaponBuilder:ParseModel(model)
		self.buildData.WeaponModel = self.modelParser:Parse(model)
		return self
	end
	function WeaponBuilder:SetConfig(config)
		self.buildData.Config = config
		return self
	end
	function WeaponBuilder:GetConfig()
		return self.buildData.Config
	end
	function WeaponBuilder:SetFireModuleFactory(factory)
		self.fireModuleFactory = factory
		return self
	end
	function WeaponBuilder:SetWeaponParser(parser)
		self.assetsParser = parser
		return self
	end
	function WeaponBuilder:Build()
		local weaponModel = self.buildData.WeaponModel
		local config = self.buildData.Config
		if not weaponModel or (not config or (not self.fireModuleFactory or not self.assetsParser)) then
			error("Not inited parameters for " .. (script.Name .. ".Build()"))
		end
		local weapon = BaseWeapon.new(weaponModel, config, self.fireModuleFactory(weaponModel), self.assetsParser)
		table.clear(self.buildData)
		return weapon
	end
end
return {
	WeaponBuilder = WeaponBuilder,
}
