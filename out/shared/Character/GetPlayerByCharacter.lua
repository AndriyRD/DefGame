-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
return function(char)
	for _, plr in Players:GetPlayers() do
		local plrChar = GetCharacter(plr)
		if char == plrChar then
			return plr
		end
	end
	error("Not found player with by character: " .. tostring(char))
end
