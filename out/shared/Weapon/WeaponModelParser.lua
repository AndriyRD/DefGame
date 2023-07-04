-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local weaponDir = ReplicatedStorage:WaitForChild("Weapon")
local models = weaponDir:WaitForChild("Models")
local WeaponModelParser
do
	WeaponModelParser = setmetatable({}, {
		__tostring = function()
			return "WeaponModelParser"
		end,
	})
	WeaponModelParser.__index = WeaponModelParser
	function WeaponModelParser.new(...)
		local self = setmetatable({}, WeaponModelParser)
		return self:constructor(...) or self
	end
	function WeaponModelParser:constructor()
		self.PART_NAMES = {
			MUZZLE = "Muzzle",
			CASING_SPAWN = "CasingSpawn",
		}
	end
	function WeaponModelParser:Parse(model)
		local muzzle = model:WaitForChild(self.PART_NAMES.MUZZLE)
		if not muzzle then
			error("Not found muzzle-part in weapon: " .. tostring(model))
		end
		local casingSpawn = model:WaitForChild(self.PART_NAMES.CASING_SPAWN)
		local root = model.PrimaryPart
		if not root then
			error("Not found PrimaryPart in weapon-model: " .. tostring(model))
		end
		-- const grip = root.WaitForChild(this.GRIP_POSTFIX) as Motor6D
		-- if (!grip) error(`Not found grip in weapon-model: ${model}`)
		return {
			CasingSpawn = casingSpawn,
			Muzzle = muzzle,
			Model = model,
		}
	end
	function WeaponModelParser:ByOriginal(name)
		local origin = models:WaitForChild(name)
		if origin then
			return self:Parse(origin:Clone())
		else
			error("Not found model for weapon: " .. name)
		end
	end
end
return {
	WeaponModelParser = WeaponModelParser,
}
