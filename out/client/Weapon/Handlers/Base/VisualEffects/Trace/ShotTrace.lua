-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ReplicatedStorage = _services.ReplicatedStorage
local Workspace = _services.Workspace
local TraceBeamTransparencyAnimation = TS.import(script, script.Parent, "TraceBeamTransparencyAnimation").TraceBeamTransparencyAnimation
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local weaponDir = ReplicatedStorage:WaitForChild("Weapon")
local weaponInstances = weaponDir:WaitForChild("Instances")
local ShotTrace
do
	ShotTrace = setmetatable({}, {
		__tostring = function()
			return "ShotTrace"
		end,
	})
	ShotTrace.__index = ShotTrace
	function ShotTrace.new(...)
		local self = setmetatable({}, ShotTrace)
		return self:constructor(...) or self
	end
	function ShotTrace:constructor(weaponModel)
		self.weaponModel = weaponModel
		self.originBeam = weaponInstances:WaitForChild("TraceBeam")
		self.lifeTime = .4
		self.conatiner = GlobalConfig.DEBRIS
		self.tweenInfo = TweenInfo.new(self.lifeTime)
		self.beamAnimation = TraceBeamTransparencyAnimation.new(self.tweenInfo, .1)
		self.attachContainer = Instance.new("Part", Workspace)
		self.attachContainer.Anchored = true
		self.attachContainer.Transparency = 1
		self.attachContainer.Position = Vector3.new()
	end
	function ShotTrace:SpawnBeam(main, targetAttach)
		local newBeam = self.originBeam:Clone()
		newBeam.Parent = self.conatiner
		newBeam.Attachment0 = main
		newBeam.Attachment1 = targetAttach
		return newBeam
	end
	function ShotTrace:CreateAttachment(parent, pos)
		local attach = Instance.new("Attachment")
		attach.Parent = parent
		attach.WorldPosition = pos
		return attach
	end
	function ShotTrace:Destroy()
		self.attachContainer:Destroy()
	end
	function ShotTrace:Create(parent, pos)
		local mainAttach = self:CreateAttachment(self.attachContainer, self.weaponModel.Muzzle.Position)
		local tragetAttach = self:CreateAttachment(parent, pos)
		local beam = self:SpawnBeam(mainAttach, tragetAttach)
		self.beamAnimation:Animate(beam, function()
			return tragetAttach:Destroy()
		end)
	end
	function ShotTrace:CreateWithoutParent(pos)
		self:Create(self.attachContainer, pos)
	end
end
return {
	ShotTrace = ShotTrace,
}
