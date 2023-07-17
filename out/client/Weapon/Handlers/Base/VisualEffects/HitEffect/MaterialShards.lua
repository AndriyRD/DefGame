-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Debris = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Debris
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local VectorUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "VectorUtility").VectorUtility
local MaterialShards
do
	MaterialShards = setmetatable({}, {
		__tostring = function()
			return "MaterialShards"
		end,
	})
	MaterialShards.__index = MaterialShards
	function MaterialShards.new(...)
		local self = setmetatable({}, MaterialShards)
		return self:constructor(...) or self
	end
	function MaterialShards:constructor()
		self.size = NumberRange.new(.2, .5)
		self.velocity = NumberRange.new(-20, 20)
		self.lifeTime = NumberRange.new(1, 3)
		self.container = GlobalConfig.DEBRIS
	end
	function MaterialShards:CreateShard(pos, material)
		local shard = Instance.new("Part", self.container)
		shard.Material = material
		shard.Anchored = false
		shard.CanCollide = true
		shard.AssemblyLinearVelocity = VectorUtility:CreateRandomVector(self.velocity.Min, self.velocity.Max)
		shard.Position = pos
		shard.Size = VectorUtility:CreateRandomVector(self.size.Min, self.size.Max)
		return shard
	end
	function MaterialShards:Spawn(pos, count, material)
		for i = 0, count - 1 do
			local lifeTime = math.random(self.lifeTime.Min, self.lifeTime.Max)
			Debris:AddItem(self:CreateShard(pos, material), lifeTime)
		end
	end
end
return {
	MaterialShards = MaterialShards,
}
