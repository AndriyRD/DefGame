-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AmmoContainer = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Ammo", "AmmoContainer").AmmoContainer
local WeaponDataObject
do
	WeaponDataObject = setmetatable({}, {
		__tostring = function()
			return "WeaponDataObject"
		end,
	})
	WeaponDataObject.__index = WeaponDataObject
	function WeaponDataObject.new(...)
		local self = setmetatable({}, WeaponDataObject)
		return self:constructor(...) or self
	end
	function WeaponDataObject:constructor(model, config, assetParser)
		self.Name = model.Model.GetInstance().Name
		self.FireDelay = 1 / config.FireSpeed
		self.Assets = assetParser:Parse(self.Name)
		self.Ammo = AmmoContainer.new(config.AmmoConfig)
	end
end
return {
	WeaponDataObject = WeaponDataObject,
}
