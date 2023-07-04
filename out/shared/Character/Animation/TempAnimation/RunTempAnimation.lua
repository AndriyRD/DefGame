-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local CHARACTER_ANIMATIONS_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "CHARACTER_ANIMATIONS_NAMES").CHARACTER_ANIMATIONS_NAMES
local StopTracks = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "StopTracks")
local RunTempAnimation
do
	RunTempAnimation = setmetatable({}, {
		__tostring = function()
			return "RunTempAnimation"
		end,
	})
	RunTempAnimation.__index = RunTempAnimation
	function RunTempAnimation.new(...)
		local self = setmetatable({}, RunTempAnimation)
		return self:constructor(...) or self
	end
	function RunTempAnimation:constructor(animator, hum, animSet)
		self.animator = animator
		self.hum = hum
		self.trackSet = {
			Run = animator:LoadAnimation(animSet.Run),
			Walk = animator:LoadAnimation(animSet.Walk),
		}
	end
	function RunTempAnimation:CanBreak()
		if (self.hum.MoveDirection.Magnitude) < AnimationConfig.MIN_SPEED_FOR_RUN_ANIMATION then
			return true
		else
			return false
		end
	end
	function RunTempAnimation:TrackSetToList()
		local list = {}
		local _rUN = CHARACTER_ANIMATIONS_NAMES.RUN
		local _run = self.trackSet.Run
		list[_rUN] = _run
		local _wALK = CHARACTER_ANIMATIONS_NAMES.WALK
		local _walk = self.trackSet.Walk
		list[_wALK] = _walk
		return list
	end
	function RunTempAnimation:Break()
		for _k, _v in self:TrackSetToList() do
			local e = { _k, _v }
			e[2]:Stop(0)
			e[2]:Destroy()
		end
	end
	function RunTempAnimation:ContinueTrack()
		StopTracks(self.animator)
		for _k, _v in self:TrackSetToList() do
			local e = { _k, _v }
			e[2]:Play()
		end
		local moveConn
		moveConn = self.hum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
			if self:CanBreak() then
				self:Break()
				moveConn:Disconnect()
			end
		end)
		local animChangeConn
		animChangeConn = self.animator.AnimationPlayed:Connect(function()
			self:Break()
			animChangeConn:Disconnect()
		end)
		return self
	end
end
return {
	RunTempAnimation = RunTempAnimation,
}
