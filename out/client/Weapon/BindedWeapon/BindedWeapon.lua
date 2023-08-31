-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EventProvider = TS.import(script, script.Parent.Parent.Parent, "EventProvider").EventProvider
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BindedWeapon
do
	BindedWeapon = {}
	function BindedWeapon:constructor(weapon)
		self.weapon = weapon
		self.bindData = GlobalConfig.BIND_DATA.Weapon
		self.remote = RemoteProvider:GetForWeapon()
		self.cameraEvents = EventProvider.CharatcerController.Camera
		self.name = weapon:GetId()
	end
end
return {
	BindedWeapon = BindedWeapon,
}
