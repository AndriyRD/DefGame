-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
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
	function MaterialShards:CreateShard(material)
		local shard = Instance.new("Part", self.container)
		shard.Material = material
		shard.Anchored = false
		shard.CanCollide = true
		return shard
	end
	function MaterialShards:PlaceShard(shard, pos)
		shard.AssemblyLinearVelocity = VectorUtility:CreateRandomVector(self.velocity.Min, self.velocity.Max)
		shard.Position = pos
		return shard
	end
	function MaterialShards:GenerateShardSize()
		return VectorUtility:CreateRandomVector(self.size.Min, self.size.Max)
	end
	function MaterialShards:SpawnShard(pos, material)
		local shard = self:CreateShard(material)
		shard.Size = self:GenerateShardSize()
		return self:PlaceShard(shard, pos)
	end
	function MaterialShards:GetLifeTime()
		return self.lifeTime
	end
	function MaterialShards:Spawn(pos, count, material)
		local shards = {}
		for i = 0, count - 1 do
			local lifeTime = math.random(self.lifeTime.Min, self.lifeTime.Max)
			local shard = self:SpawnShard(pos, material)
			table.insert(shards, shard)
		end
		return shards
	end
end
return {
	MaterialShards = MaterialShards,
}
