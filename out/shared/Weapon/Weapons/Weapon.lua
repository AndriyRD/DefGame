-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponDataObject = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponDataObject").WeaponDataObject
local WeaponOwnerState = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponOwnerState").WeaponOwnerState
local Weapon
do
	Weapon = {}
	function Weapon:constructor(WeaponModel, config, createFireModule, assetParser)
		self.WeaponModel = WeaponModel
		self.config = config
		self.createFireModule = createFireModule
		self.id = WeaponModel.Model.GetInstance().Name
		self.globalModelId = self.WeaponModel.Model.GetId()
		self.DataObject = WeaponDataObject.new(self.WeaponModel, config, assetParser)
		self.OwnerState = WeaponOwnerState.new(self.WeaponModel.Model.GetId())
		self.fireModule = createFireModule(WeaponModel, self.DataObject)
		self:OnCreate()
	end
	function Weapon:OnRemoveOwner(plr)
		self.fireModule:Dispose()
	end
	function Weapon:OnNewOwner(plr)
		self.fireModule:OnChagneOwner(plr)
	end
	function Weapon:OnCreate()
		self.OwnerState.ChangeOwnerEvent.Event:Connect(function(oldPlr, newPlr)
			if not newPlr and oldPlr then
				self:OnRemoveOwner(oldPlr)
			end
			if newPlr then
				self:OnNewOwner(newPlr)
			end
		end)
		return self
	end
	function Weapon:GetId()
		return self.id
	end
	function Weapon:GetModelID()
		return self.WeaponModel.Model.GetId()
	end
	function Weapon:Fire()
		if self.fireModule.CanFire() then
			self.fireModule:Fire()
			self.DataObject.Ammo:GetMagazine():Take()
		end
	end
end
return {
	Weapon = Weapon,
}
