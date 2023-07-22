-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponProvider = TS.import(script, script.Parent.Parent.Parent, "Weapon", "WeaponProvider").WeaponProvider
local WeaponReplicator = TS.import(script, script.Parent.Parent.Parent, "Weapon", "ReplicateWeapon", "WeaponFireReplicator").WeaponReplicator
local ClientEquipmentManager = TS.import(script, script.Parent.Parent.Parent, "Equipment", "ClientEquipmentManager").ClientEquipmentManager
local Runner = TS.import(script, script.Parent.Parent.Parent, "Runner", "ClientRunner").Runner
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local BaseGameMode
do
	BaseGameMode = {}
	function BaseGameMode:constructor()
	end
	function BaseGameMode:Run()
		WeaponProvider.new()
		WeaponReplicator.new():Run()
		ClientEquipmentManager.new():Startup()
		Runner.new(Players.LocalPlayer, "845386501"):Bind()
		-- BuildUI()
		return self
	end
	function BaseGameMode:Dispose()
	end
end
return {
	BaseGameMode = BaseGameMode,
}
