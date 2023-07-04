-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Magazine = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Ammo", "Magazine").Magazine
local AmmoContainer
do
	AmmoContainer = setmetatable({}, {
		__tostring = function()
			return "AmmoContainer"
		end,
	})
	AmmoContainer.__index = AmmoContainer
	function AmmoContainer.new(...)
		local self = setmetatable({}, AmmoContainer)
		return self:constructor(...) or self
	end
	function AmmoContainer:constructor(config)
		self.config = config
		self.currentAmmo = 0
		self.Events = {
			ChangeAmmo = Instance.new("BindableEvent"),
			ChangeMagazine = Instance.new("BindableEvent"),
		}
		self.magazine = Magazine.new(config.MagazineSize)
		self.currentAmmo = config.MaxAmmo
	end
	function AmmoContainer:Reload()
		if self.currentAmmo <= 0 then
			return nil
		end
		local ammoCount = self.magazine:GetSize() - self.magazine:GetCurrentAmmo()
		if ammoCount <= self.currentAmmo then
			self.currentAmmo -= ammoCount
			self.magazine:Reload()
		else
			self.magazine:AddAmmo(ammoCount)
		end
		self.Events.ChangeAmmo:Fire(self)
		self.Events.ChangeMagazine:Fire(self.magazine)
	end
	function AmmoContainer:GetConfig()
		return self.config
	end
	function AmmoContainer:GetMagazine()
		return self.magazine
	end
end
return {
	AmmoContainer = AmmoContainer,
}
