-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ReplicatedStorage = _services.ReplicatedStorage
local RunService = _services.RunService
local IdentifiedInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "IdentifiedInstance").IdentifiedInstance
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
	end
	function WeaponModelParser:Parse(model)
		local muzzle = model:WaitForChild("Muzzle")
		if not muzzle then
			error("Not found muzzle-part in weapon: " .. tostring(model))
		end
		local casingSpawn = model:WaitForChild("CasingSpawn")
		if not casingSpawn then
			error("Not found casing-spawn in weapon-model: " .. tostring(model))
		end
		local root = model.PrimaryPart
		if not root then
			error("Not found PrimaryPart in weapon-model: " .. tostring(model))
		end
		local identifiedModel
		if RunService:IsClient() then
			identifiedModel = IdentifiedInstance:ParseFrom(model)
		else
			identifiedModel = IdentifiedInstance.new(model)
		end
		return {
			CasingSpawn = casingSpawn,
			Muzzle = muzzle,
			Model = identifiedModel,
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
