-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWeapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapons", "BaseWeapon").BaseWeapon
local WeaponModelParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "ModelParsers", "WeaponModelParser").WeaponModelParser
local WeaponBuilder = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeponBuilder", "WeaponBuilder").WeaponBuilder
local BaseWeaponBuilder
do
	local super = WeaponBuilder
	BaseWeaponBuilder = setmetatable({}, {
		__tostring = function()
			return "BaseWeaponBuilder"
		end,
		__index = super,
	})
	BaseWeaponBuilder.__index = BaseWeaponBuilder
	function BaseWeaponBuilder.new(...)
		local self = setmetatable({}, BaseWeaponBuilder)
		return self:constructor(...) or self
	end
	function BaseWeaponBuilder:constructor(...)
		super.constructor(self, ...)
		self.modelParser = WeaponModelParser.new()
	end
	function BaseWeaponBuilder:CreateWeapon(model, config)
		return BaseWeapon.new(model, config, self.createFireModule)
	end
end
return {
	BaseWeaponBuilder = BaseWeaponBuilder,
}
