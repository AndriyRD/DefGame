-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local MaterialShards = TS.import(script, script.Parent, "MaterialShards").MaterialShards
local InstancePool = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "InstancePool").InstancePool
local MaterialShardPool
do
	MaterialShardPool = setmetatable({}, {
		__tostring = function()
			return "MaterialShardPool"
		end,
	})
	MaterialShardPool.__index = MaterialShardPool
	function MaterialShardPool.new(...)
		local self = setmetatable({}, MaterialShardPool)
		return self:constructor(...) or self
	end
	function MaterialShardPool:constructor()
		self.materialShards = MaterialShards.new()
		self.shardPool = InstancePool.new(self.materialShards:GetLifeTime().Max, nil)
	end
	function MaterialShardPool:MoveShard(shards, pos)
	end
	function MaterialShardPool:Spawn(pos, count, material)
		local freeItems = self.shardPool:GetFreeItems()
		-- if(freeItems >= count)
	end
end
return {
	MaterialShardPool = MaterialShardPool,
}
