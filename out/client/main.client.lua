-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players = _services.Players
local ReplicatedStorage = _services.ReplicatedStorage
local ClientEquipmentManager = TS.import(script, script.Parent, "Equipment", "ClientEquipmentManager").ClientEquipmentManager
local WeaponProvider = TS.import(script, script.Parent, "Weapon", "WeaponProvider").WeaponProvider
local WeaponReplicator = TS.import(script, script.Parent, "Weapon", "ReplicateWeapon", "WeaponFireReplicator").WeaponReplicator
local App = TS.import(script, script.Parent, "UI", "App")
local Runner = TS.import(script, script.Parent, "Runner", "ClientRunner").Runner
local remote = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote")
local craeteEquipmentEvent = remote:WaitForChild("CreateEquipment")
WeaponProvider.new()
WeaponReplicator.new():Run()
ClientEquipmentManager.new():Startup()
Runner.new(Players.LocalPlayer, "845386501"):Bind()
craeteEquipmentEvent:FireServer("AK47")
-- craeteEquipmentEvent.FireServer('RocketLauncher')
App()
