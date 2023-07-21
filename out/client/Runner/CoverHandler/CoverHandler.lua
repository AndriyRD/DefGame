-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CoverDatector = TS.import(script, script.Parent, "CoverDetector").CoverDatector
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local ReloadableAnimation = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "ReloadableAnimation").ReloadableAnimation
local AnimationUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnmationUtility").AnimationUtility
local CoverMoveModule = TS.import(script, script.Parent, "CoverMoveModule").CoverMoveModule
local Cover = TS.import(script, script.Parent, "Cover").Cover
local CoverHandler
do
	CoverHandler = setmetatable({}, {
		__tostring = function()
			return "CoverHandler"
		end,
	})
	CoverHandler.__index = CoverHandler
	function CoverHandler.new(...)
		local self = setmetatable({}, CoverHandler)
		return self:constructor(...) or self
	end
	function CoverHandler:constructor(character)
		self.character = character
		self.hided = false
		self.detector = CoverDatector.new(character)
		self.detector.OnDetect.Event:Connect(function(res)
			return self:OnDetectCover(res)
		end)
		self.hideAnimation = ReloadableAnimation.new(character, AnimationUtility:CreateByID(GlobalConfig.SHELTER.HIDE_ANIMATION_ID))
		self.idleAnimation = ReloadableAnimation.new(character, AnimationUtility:CreateByID(GlobalConfig.SHELTER.IDLE_ANIMATION_ID))
		self.moveModule = CoverMoveModule.new(character)
	end
	function CoverHandler:OnDetectCover(res)
		self.hideAnimation:Play()
		local _result = self.hideAnimation:GetTrack()
		if _result ~= nil then
			_result = _result.Stopped:Connect(function()
				self.character:GetRoot().Anchored = false
				self.moveModule:SetCover(Cover.new(res.Instance, res.Normal)):Enable()
			end)
		end
		self.character:GetRoot().Anchored = true
		self.hided = true
		self.moveModule.OnExit.Event:Connect(function()
			self.hided = false
			return self.hided
		end)
	end
	function CoverHandler:Start()
		if not self.hided then
			self.detector:StartDetectMode()
		end
	end
end
return {
	CoverHandler = CoverHandler,
}
