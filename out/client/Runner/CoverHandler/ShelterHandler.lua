-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local ShelterDetector = TS.import(script, script.Parent, "ShelterDetector").ShelterDetector
local VectorUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "VectorUtility").VectorUtility
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local PartUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "PartUtility").PartUtility
local createPart = function(pos, color)
	local part = Instance.new("Part", GlobalConfig.DEBRIS)
	part.BrickColor = color
	part.Anchored = true
	part.CanCollide = false
	part.Material = Enum.Material.Neon
	part.Size = Vector3.new(.5, .5, .5)
	part.Position = pos
	return part
end
local ShelterHandler
do
	ShelterHandler = setmetatable({}, {
		__tostring = function()
			return "ShelterHandler"
		end,
	})
	ShelterHandler.__index = ShelterHandler
	function ShelterHandler.new(...)
		local self = setmetatable({}, ShelterHandler)
		return self:constructor(...) or self
	end
	function ShelterHandler:constructor(character)
		self.character = character
		self.detector = ShelterDetector.new(character)
	end
	function ShelterHandler:Start()
		self.connection = RunService.Heartbeat:Connect(function()
			local res = self.detector:Cast()
			if res then
				local normalID = VectorUtility:NormalToFaceID(res.Normal)
				createPart(VectorUtility:NoramlToSurfaceWorldNormal(res.Instance, res.Normal), BrickColor.Blue())
				print(PartUtility:GetFaceSize(res.Instance, normalID))
			end
		end)
	end
end
return {
	ShelterHandler = ShelterHandler,
}
