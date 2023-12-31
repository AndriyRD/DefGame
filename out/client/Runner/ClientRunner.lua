-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local CollectionService = _services.CollectionService
local ContextActionService = _services.ContextActionService
local EventProvider = TS.import(script, script.Parent.Parent, "EventProvider").EventProvider
local CreateStaminaUI = TS.import(script, script.Parent.Parent, "UI", "RunnerStamina", "CreateStaminaUI")
local AnimationWithSound = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationWithSound").AnimationWithSound
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BaseRunner = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Runner", "BaseRunner").BaseRunner
local CoverHandler = TS.import(script, script.Parent, "CoverHandler", "CoverHandler").CoverHandler
local AssetInstance = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "AssetInstance", "AssetInstance").AssetInstance
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
		self.coverHandler = CoverHandler.new(self.character)
		self.animation = AnimationWithSound.new(owner, AssetInstance:CreateByID(runAnimationID, "Animation"), {})
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
		CollectionService:AddTag(self.owner, GlobalConfig.TAGS.RUN_STATE)
		-- this.coverHandler.Start()
		return self
	end
	function Runner:Stop()
		self.remote.Stop:FireServer()
		self.stamina:SetConsuptionMode(false)
		local _result = self.animation:GetTrack()
		if _result ~= nil then
			_result:Stop()
		end
		CollectionService:RemoveTag(self.owner, GlobalConfig.TAGS.RUN_STATE)
		EventProvider.Runner.Stop:Fire()
		return self
	end
end
return {
	Runner = Runner,
}
