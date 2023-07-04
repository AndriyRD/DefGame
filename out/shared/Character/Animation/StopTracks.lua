-- Compiled with roblox-ts v2.1.0
return function(animator)
	for _, track in animator:GetPlayingAnimationTracks() do
		track:Stop(0)
		track:Destroy()
	end
end
