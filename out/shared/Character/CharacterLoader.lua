-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local CharacterLaoder
do
	CharacterLaoder = setmetatable({}, {
		__tostring = function()
			return "CharacterLaoder"
		end,
	})
	CharacterLaoder.__index = CharacterLaoder
	function CharacterLaoder.new(...)
		local self = setmetatable({}, CharacterLaoder)
		return self:constructor(...) or self
	end
	function CharacterLaoder:constructor()
	end
	function CharacterLaoder:Create(player)
		return ReloadableCharacter.new(player)
	end
end
return {
	CharacterLaoder = CharacterLaoder,
}
