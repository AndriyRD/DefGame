-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local EventProvider = TS.import(script, script.Parent.Parent, "EventProvider").EventProvider
local CreateStaminaUI = TS.import(script, script.Parent.Parent, "UI", "RunnerStamina", "CreateStaminaUI")
local AnimationWithSound = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationWithSound").AnimationWithSound
local AnimationUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnmationUtility").AnimationUtility
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BaseRunner = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Runner", "BaseRunner").BaseRunner
local ShelterHandler = TS.import(script, script.Parent, "CoverHandler", "ShelterHandler").ShelterHandler
local Runner
do
	local super = BaseRunner
	Runner = setmetatable({}, {
		__tostring = function()
			return "Runner"
		end,
		__index = super,
	})
	Runner.__index = Runner
	function Runner.new(...)
		local self = setmetatable({}, Runner)
		return self:constructor(...) or self
	end
	function Runner:constructor(owner, runAnimationID)
		super.constructor(self, owner)
		self.bindData = GlobalConfig.BIND_DATA.Run
		self.remote = RemoteProvider:GetForRunner()
		self.shelterHandler = ShelterHandler.new(self.character)
		self.animation = AnimationWithSound.new(owner, AnimationUtility:CreateByID(runAnimationID), {})
		CreateStaminaUI(self.stamina)
	end
	function Runner:Bind()
		ContextActionService:BindAction(self.bindData.Action, function(name, state)
			if name == self.bindData.Action then
				if state == Enum.UserInputState.Begin then
					self:Run()
				elseif state == Enum.UserInputState.End then
					self:Stop()
				end
			end
		end, false, self.bindData.Input.PC)
	end
	function Runner:Run()
		self.remote.Run:FireServer()
		self.stamina:SetConsuptionMode(true)
		self.animation:Play()
		EventProvider.Runner.Run:Fire()
		self.shelterHandler:Start()
		return self
	end
	function Runner:Stop()
		self.remote.Stop:FireServer()
		self.stamina:SetConsuptionMode(false)
		local _result = self.animation:GetTrack()
		if _result ~= nil then
			_result:Stop()
		end
		EventProvider.Runner.Stop:Fire()
		return self
	end
end
return {
	Runner = Runner,
}
