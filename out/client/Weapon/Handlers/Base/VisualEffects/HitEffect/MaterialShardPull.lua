-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ChunkedObjectPull = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ObjectPool", "ChunkedObjectPull").ChunkedObjectPull
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
		self.pull = ChunkedObjectPull.new(InstancePull.new(self.lifeTime.Max))
		self.MAX_SHARDS = 20
	end
	function MaterialShardPull:ReUseShard(shard, pos)
		self:PlaceShard(shard, pos)
		shard.Size = self:GenerateShardSize()
	end
	function MaterialShardPull:Spawn(pos, count, material)
		if self.pull:GetSize() >= self.MAX_SHARDS then
			local freeItems = self.pull:GetChunk(count)
			if #freeItems >= count then
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
			return self.pull:Push(v)
		end
		for _k, _v in shards do
			_arg0(_v, _k - 1, shards)
		end
		return shards
	end
end
return {
	MaterialShardPull = MaterialShardPull,
}
