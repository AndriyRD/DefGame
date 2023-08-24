-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local PersonWeaponModelParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "ModelParsers", "PersonWeaponModelParser").PersonWeaponModelParser
local PersonWeapon = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Weapons", "PersonWeapon").PersonWeapon
local WeaponBuilder = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeponBuilder", "WeaponBuilder").WeaponBuilder
local PersonWeaponBuilder
do
	local super = WeaponBuilder
	PersonWeaponBuilder = setmetatable({}, {
		__tostring = function()
			return "PersonWeaponBuilder"
		end,
		__index = super,
	})
	PersonWeaponBuilder.__index = PersonWeaponBuilder
	function PersonWeaponBuilder.new(...)
		local self = setmetatable({}, PersonWeaponBuilder)
		return self:constructor(...) or self
	end
	function PersonWeaponBuilder:constructor(...)
		super.constructor(self, ...)
		self.modelParser = PersonWeaponModelParser.new()
	end
	function PersonWeaponBuilder:CreateWeapon(model, config)
		return PersonWeapon.new(model, config, self.createFireModule)
	end
end
return {
	PersonWeaponBuilder = PersonWeaponBuilder,
}
