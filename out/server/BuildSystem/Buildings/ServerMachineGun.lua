-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponServiceAPI = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "FrontLayer", "WeaponServiceAPI").WeaponServiceAPI
local BUILDINGS_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BUILDINGS_IDS").BUILDINGS_IDS
local Building = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "Building").Building
local MachineGun
do
	local super = Building
	MachineGun = setmetatable({}, {
		__tostring = function()
			return "MachineGun"
		end,
		__index = super,
	})
	MachineGun.__index = MachineGun
	function MachineGun.new(...)
		local self = setmetatable({}, MachineGun)
		return self:constructor(...) or self
	end
	function MachineGun:constructor(model)
		super.constructor(self, model)
		WeaponServiceAPI:Create(model.GetInstance())
	end
	function MachineGun:GetActions()
		return { "Activate", "Deavtivate", "SendHitPackage", "Reload" }
	end
	function MachineGun:GetID()
		return BUILDINGS_IDS.MACHINE_GUN
	end
	function MachineGun:OnBuild()
	end
end
return {
	MachineGun = MachineGun,
}
