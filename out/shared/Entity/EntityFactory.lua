-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GetPlayerByCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetPlayerByCharacter")
local PlayerEntity = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "PlayerEntity").PlayerEntity
local Entity = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "Entity").Entity
local NpcEntity = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "NpcEntity").NpcEntity
local EntityFactory
do
	EntityFactory = setmetatable({}, {
		__tostring = function()
			return "EntityFactory"
		end,
	})
	EntityFactory.__index = EntityFactory
	function EntityFactory.new(...)
		local self = setmetatable({}, EntityFactory)
		return self:constructor(...) or self
	end
	function EntityFactory:constructor()
	end
	function EntityFactory:Create(model)
		local hum = model:FindFirstChildOfClass("Humanoid")
		local plr = GetPlayerByCharacter(model)
		if hum then
			if plr then
				return PlayerEntity.new(plr)
			else
				return NpcEntity.new(model)
			end
		else
			return Entity.new(model)
		end
	end
end
return {
	EntityFactory = EntityFactory,
}
