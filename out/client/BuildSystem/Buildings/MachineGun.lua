-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BUILDINGS_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "BUILDINGS_IDS").BUILDINGS_IDS
local Building = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BuildSystem", "Building", "Building").Building
local CreateActivateButton = TS.import(script, script.Parent, "Common", "CreateActivateButton")
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local WeaponProvider = TS.import(script, script.Parent.Parent.Parent, "Weapon", "WeaponProvider").WeaponProvider
local AutoFiredBindedWeapon = TS.import(script, script.Parent.Parent.Parent, "Weapon", "BindedWeapon", "AutoFiredBindedWeapon").AutoFiredBindedWeapon
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
		self.charatcer = ReloadableCharacter.new(Players.LocalPlayer)
		self.activateBtn = CreateActivateButton()
		self.seat = self.buildingModelInstance:FindFirstChild("Seat", true)
		self.seat.Disabled = true
		self.activateBtn.Parent = self.buildingModelInstance.PrimaryPart
		self.buildingModelInstance:AddTag(GlobalConfig.TAGS.DAMAGEBLE_ENTITY)
		self.activateBtn.TriggerEnded:Connect(function(plr)
			return if plr == Players.LocalPlayer then self:OnSeat(plr) else nil
		end)
		self.weapon = WeaponProvider:RegisterWeapon(self.buildingModelInstance)
		self.bindedWeapon = AutoFiredBindedWeapon.new(self.weapon)
	end
	function MachineGun:OnActivate(plr)
		self.seat:Sit(self.charatcer:GetHumanoid())
	end
	function MachineGun:OnUp()
		self.bindedWeapon:Unbind()
	end
	function MachineGun:OnSeat(plr)
		self.seat:Sit(self.charatcer:GetHumanoid())
		local connection
		connection = self.seat:GetPropertyChangedSignal("Occupant"):Connect(function()
			if self.seat.Occupant then
				return nil
			end
			self:OnUp()
			connection:Disconnect()
		end)
		self.weapon.OwnerState:ChagneOwner(plr)
		self.bindedWeapon:Bind()
	end
	function MachineGun:GetID()
		return BUILDINGS_IDS.MACHINE_GUN
	end
	function MachineGun:OnBuild()
		self.activateBtn.Triggered:Connect(function(plr)
			return self:OnActivate(plr)
		end)
	end
end
return {
	MachineGun = MachineGun,
}
