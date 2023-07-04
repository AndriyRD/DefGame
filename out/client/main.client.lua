-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local ClientEquipmentManager = TS.import(script, script.Parent, "Equipment", "ClientEquipmentManager").ClientEquipmentManager
local WeaponProvider = TS.import(script, script.Parent, "Weapon", "WeaponProvider").WeaponProvider
local WeaponReplicator = TS.import(script, script.Parent, "Weapon", "ReplicateWeapon", "WeaponFireReplicator").WeaponReplicator
local remote = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote")
local craeteEquipmentEvent = remote:WaitForChild("CreateEquipment")
WeaponProvider.new()
WeaponReplicator.new():Run()
ClientEquipmentManager.new():Startup()
craeteEquipmentEvent:FireServer("AK47")
