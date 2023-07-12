-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimationWithSound = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationWithSound").AnimationWithSound
local AnimationUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnmationUtility").AnimationUtility
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
	function BaseWeaponRelaodAnimation:constructor(weapon)
		self.weapon = weapon
		self.DROP_MAG_FRAME_NAME = "DropMag"
		self.PUT_MAG_FRAME_NAME = "PutMag"
		self.soundAnimation = AnimationWithSound.new(weapon:GetOwner(), AnimationUtility:CreateByID(weapon:GetConfig().AnimationSet.Relaod), weapon:GetAssets().Sounds.Relaod)
		self.soundAnimation.onLoad.Event:Connect(function()
			return self:Laod()
		end)
	end
	function BaseWeaponRelaodAnimation:DropMag(mag, lifeTime)
		mag.Transparency = 1
		local dropped = mag:Clone()
		dropped.CFrame = mag.CFrame
		dropped.Parent = GlobalConfig.DEBRIS
		Debris:AddItem(dropped, if lifeTime ~= 0 and (lifeTime == lifeTime and lifeTime) then lifeTime else 3)
	end
	function BaseWeaponRelaodAnimation:PutMag(mag)
		mag.Transparency = 1
	end
	function BaseWeaponRelaodAnimation:Laod()
		local track = self.soundAnimation:GetTrack()
		if track then
			track.KeyframeReached:Connect(function(name)
				local mag = self.weapon:GetWeaponModel().Magazine
				if name == self.DROP_MAG_FRAME_NAME then
					self:DropMag(mag, nil)
				elseif name == self.PUT_MAG_FRAME_NAME then
					self:PutMag(mag)
				end
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
