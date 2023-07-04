-- Compiled with roblox-ts v2.1.0
return function(plr)
	return if plr.Character then plr.Character else (plr.CharacterAdded:Wait())
end
