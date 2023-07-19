-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local MaterialShards = TS.import(script, script.Parent, "MaterialShards").MaterialShards
local InstancePull = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "InstancePull").InstancePull
local MaterialShardPull
do
	local super = MaterialShards
	MaterialShardPull = setmetatable({}, {
		__tostring = function()
			return "MaterialShardPull"
		end,
		__index = super,
	})
	MaterialShardPull.__index = MaterialShardPull
	function MaterialShardPull.new(...)
		local self = setmetatable({}, MaterialShardPull)
		return self:constructor(...) or self
	end
	function MaterialShardPull:constructor(...)
		super.constructor(self, ...)
		self.shardPool = InstancePull.new(self.lifeTime.Max, nil)
		self.MAX_SHARDS = 10
	end
	function MaterialShardPull:ReUseShard(shard, pos)
		self:PlaceShard(shard, pos)
		shard.Size = self:GenerateShardSize()
	end
	function MaterialShardPull:Spawn(pos, count, material)
		if self.shardPool:GetSize() >= self.MAX_SHARDS then
			local freeItems = self.shardPool:GetFreeChunk(count)
			print("MAX_SIZE")
			print(freeItems)
			if freeItems and #freeItems >= count then
				print("PULL IS FULL")
				local res = {}
				for _, item in freeItems do
					local shard = item:GetItem()
					item:Update(function()
						return 0
					end)
					self:ReUseShard(shard, pos)
					table.insert(res, shard)
				end
				return res
			end
		end
		local shards = super.Spawn(self, pos, count, material)
		local _arg0 = function(v)
			return self.shardPool:Push(v)
		end
		for _k, _v in shards do
			_arg0(_v, _k - 1, shards)
		end
		print("Generate shards!")
		return shards
	end
end
return {
	MaterialShardPull = MaterialShardPull,
}
