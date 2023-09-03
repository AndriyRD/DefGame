-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local BufferedAttachment
do
	BufferedAttachment = setmetatable({}, {
		__tostring = function()
			return "BufferedAttachment"
		end,
	})
	BufferedAttachment.__index = BufferedAttachment
	function BufferedAttachment.new(...)
		local self = setmetatable({}, BufferedAttachment)
		return self:constructor(...) or self
	end
	function BufferedAttachment:constructor(pos, parent)
		self.containerSize = Vector3.new(.1, .1, .1)
		self.GetAttachment = function()
			return self.attachment
		end
		self.containerPart = self:CreateContainerPart(pos, parent)
		self.attachment = self:CreateAttachment(self.containerPart)
	end
	function BufferedAttachment:CreateContainerPart(pos, parent)
		local part = Instance.new("Part")
		part.Parent = if parent then parent else Workspace
		part.Anchored = true
		part.CanCollide = false
		part.Size = self.containerSize
		part.Position = pos
		part.Transparency = 1
		return part
	end
	function BufferedAttachment:CreateAttachment(parent)
		local attachment = Instance.new("Attachment")
		attachment.Parent = parent
		return attachment
	end
	function BufferedAttachment:Destroy()
		self.attachment:Destroy()
		self.containerPart:Destroy()
		table.clear(self)
	end
end
return {
	BufferedAttachment = BufferedAttachment,
}
