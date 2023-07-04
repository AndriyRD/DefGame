-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local StopTracks = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "StopTracks")
local BaseTempAniamtino
do
	BaseTempAniamtino = {}
	function BaseTempAniamtino:constructor(animator, hum, anim)
		self.animator = animator
		self.hum = hum
		self.anim = anim
		self.runnedTrack = false
		self.track = self.animator:LoadAnimation(anim)
	end
	function BaseTempAniamtino:Break()
		self.track:Stop(0)
		self.track:Destroy()
		self.runnedTrack = false
	end
	function BaseTempAniamtino:ContinueTrack()
		if self.runnedTrack then
			return self
		end
		StopTracks(self.animator)
		self.track:Play()
		self.runnedTrack = true
		return self
	end
end
return {
	BaseTempAniamtino = BaseTempAniamtino,
}
