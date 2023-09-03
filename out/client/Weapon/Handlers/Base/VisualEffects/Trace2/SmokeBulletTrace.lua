-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local BufferedAttachment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BufferedAttachment").BufferedAttachment
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local BeamAnimation = TS.import(script, script.Parent, "BeamAnimation").BeamAnimation
local SmokeBulletTrace
do
	SmokeBulletTrace = setmetatable({}, {
		__tostring = function()
			return "SmokeBulletTrace"
		end,
	})
	SmokeBulletTrace.__index = SmokeBulletTrace
	function SmokeBulletTrace.new(...)
		local self = setmetatable({}, SmokeBulletTrace)
		return self:constructor(...) or self
	end
	function SmokeBulletTrace:constructor(muzzlePart)
		self.muzzlePart = muzzlePart
		self.beamAnimation = BeamAnimation.new()
		self.originBeam = ReplicatedStorage:WaitForChild("Weapon"):WaitForChild("Instances"):WaitForChild("BulletTrace")
		self.attachmnetContainer = Instance.new("Part")
		self.attachmnetContainer.Name = "BulletTraceAttachmentContainer"
		self.attachmnetContainer.Parent = GlobalConfig.DEBRIS
	end
	function SmokeBulletTrace:CreateTargetAttachment(worldPos, parent)
		local attach = Instance.new("Attachment")
		attach.Parent = parent
		attach.WorldPosition = worldPos
		return attach
	end
	function SmokeBulletTrace:Spawn(pos)
		local rootAttachment = BufferedAttachment.new(self.muzzlePart.Position, GlobalConfig.DEBRIS)
		local targetAttachment = self:CreateTargetAttachment(pos, self.attachmnetContainer)
		local newBeam = self.originBeam:Clone()
		newBeam.Parent = targetAttachment
		newBeam.Attachment0 = rootAttachment.GetAttachment()
		newBeam.Attachment1 = targetAttachment
		local tween = self.beamAnimation:Play(newBeam)
		local conn
		conn = tween.Completed:Connect(function(state)
			rootAttachment:Destroy()
			targetAttachment:Destroy()
			newBeam:Destroy()
			conn:Disconnect()
		end)
	end
end
return {
	SmokeBulletTrace = SmokeBulletTrace,
}
