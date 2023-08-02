-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local HumanoidEntity = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "HumanoidEntity").HumanoidEntity
local NpcEntity
do
	local super = HumanoidEntity
	NpcEntity = setmetatable({}, {
		__tostring = function()
			return "NpcEntity"
		end,
		__index = super,
	})
	NpcEntity.__index = NpcEntity
	function NpcEntity.new(...)
		local self = setmetatable({}, NpcEntity)
		return self:constructor(...) or self
	end
	function NpcEntity:constructor(...)
		super.constructor(self, ...)
	end
	function NpcEntity:OnDied()
		super.OnDied(self)
		self:Dispose()
	end
end
return {
	NpcEntity = NpcEntity,
}
