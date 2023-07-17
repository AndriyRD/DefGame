-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local Debris = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Debris
local BaseWeaponRelaodAnimation
do
	BaseWeaponRelaodAnimation = setmetatable({}, {
		__tostring = function()
			return "BaseWeaponRelaodAnimation"
		end,
	})
	BaseWeaponRelaodAnimation.__index = BaseWeaponRelaodAnimation
	function BaseWeaponRelaodAnimation.new(...)
		local self = setmetatable({}, BaseWeaponRelaodAnimation)
		return self:constructor(...) or self
	end
	function BaseWeaponRelaodAnimation:constructor(soundAnimation, weaponModel)
		self.soundAnimation = soundAnimation
		self.weaponModel = weaponModel
		self.DROP_MAG_FRAME_NAME = "DropMag"
		self.PUT_MAG_FRAME_NAME = "PutMag"
		self.soundAnimation.onLoad.Event:Connect(function()
			return self:Laod()
		end)
		self:Laod()
	end
	function BaseWeaponRelaodAnimation:DropMag(mag, lifeTime)
		mag.Transparency = 1
		local dropped = mag:Clone()
		dropped.CanCollide = true
		dropped.Anchored = false
		dropped.Transparency = 0
		dropped.CFrame = mag.CFrame
		dropped.Parent = GlobalConfig.DEBRIS
		Debris:AddItem(dropped, if lifeTime ~= 0 and (lifeTime == lifeTime and lifeTime) then lifeTime else 3)
	end
	function BaseWeaponRelaodAnimation:PutMag(mag)
		mag.Transparency = 0
	end
	function BaseWeaponRelaodAnimation:Laod()
		local track = self.soundAnimation:GetTrack()
		if track then
			local mag = self.weaponModel.Magazine
			track:GetMarkerReachedSignal(self.PUT_MAG_FRAME_NAME):Connect(function()
				self:PutMag(mag)
			end)
			track:GetMarkerReachedSignal(self.DROP_MAG_FRAME_NAME):Connect(function()
				self:DropMag(mag, nil)
			end)
		end
	end
	function BaseWeaponRelaodAnimation:Play()
		self.soundAnimation:Play()
	end
end
return {
	BaseWeaponRelaodAnimation = BaseWeaponRelaodAnimation,
}
