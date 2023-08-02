-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local EntityStorage = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityStorage", "EntityStorage").EntityStorage
local EntityStorageFactory
do
	EntityStorageFactory = setmetatable({}, {
		__tostring = function()
			return "EntityStorageFactory"
		end,
	})
	EntityStorageFactory.__index = EntityStorageFactory
	function EntityStorageFactory.new(...)
		local self = setmetatable({}, EntityStorageFactory)
		return self:constructor(...) or self
	end
	function EntityStorageFactory:constructor()
	end
	function EntityStorageFactory:CreateByOtherTeams(ignoreTeam, entityTag)
		local playerEntities = {}
		local _exp = Players:GetPlayers()
		local _arg0 = function(v)
			if v.Team ~= ignoreTeam then
				local _arg0_1 = GetCharacter(v)
				table.insert(playerEntities, _arg0_1)
			end
		end
		for _k, _v in _exp do
			_arg0(_v, _k - 1, _exp)
		end
		return EntityStorage.new(entityTag):AddIfIsEntity(playerEntities)
	end
end
return {
	EntityStorageFactory = EntityStorageFactory,
}
