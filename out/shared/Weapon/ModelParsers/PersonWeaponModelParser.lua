-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponModelParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "ModelParsers", "WeaponModelParser").WeaponModelParser
local PersonWeaponModelParser
do
	local super = WeaponModelParser
	PersonWeaponModelParser = setmetatable({}, {
		__tostring = function()
			return "PersonWeaponModelParser"
		end,
		__index = super,
	})
	PersonWeaponModelParser.__index = PersonWeaponModelParser
	function PersonWeaponModelParser.new(...)
		local self = setmetatable({}, PersonWeaponModelParser)
		return self:constructor(...) or self
	end
	function PersonWeaponModelParser:constructor(...)
		super.constructor(self, ...)
		self.magPartName = "Mag"
	end
	function PersonWeaponModelParser:Parse(model)
		local mag = model:FindFirstChild(self.magPartName)
		if not mag then
			error("Not found " .. (self.magPartName .. (" in model: " .. tostring(model))))
		end
		local res = super.Parse(self, model)
		return {
			CasingSpawn = res.CasingSpawn,
			Model = res.Model,
			Muzzle = res.Muzzle,
			Magazine = mag,
		}
	end
end
return {
	PersonWeaponModelParser = PersonWeaponModelParser,
}
