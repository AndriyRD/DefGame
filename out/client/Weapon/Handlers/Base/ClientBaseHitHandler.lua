-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local createPart = function(pos, color)
	local part = Instance.new("Part")
	part.Parent = GlobalConfig.DEBRIS
	part.Size = Vector3.new(.3, .3, .3)
	part.Anchored = true
	part.Position = pos
	part.Material = Enum.Material.Neon
	part.BrickColor = color
	part.CanCollide = false
	return part
end
local BaseHitHandler
do
	BaseHitHandler = setmetatable({}, {
		__tostring = function()
			return "BaseHitHandler"
		end,
	})
	BaseHitHandler.__index = BaseHitHandler
	function BaseHitHandler.new(...)
		local self = setmetatable({}, BaseHitHandler)
		return self:constructor(...) or self
	end
	function BaseHitHandler:constructor(weapon)
		self.weapon = weapon
	end
	function BaseHitHandler:OnHit(res)
	end
	function BaseHitHandler:OnHitPart(res)
		createPart(res.Position, BrickColor.Black())
	end
	function BaseHitHandler:OnHitEnity(entity, res)
		createPart(res.Position, BrickColor.Red())
	end
end
return {
	BaseHitHandler = BaseHitHandler,
}
