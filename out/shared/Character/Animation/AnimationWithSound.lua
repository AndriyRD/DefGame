-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter")
local CHARACTER_LOAD_EVENT_NAMES = _ReloadableCharacter.CHARACTER_LOAD_EVENT_NAMES
local ReloadableCharacter = _ReloadableCharacter.ReloadableCharacter
local AnimationWithSound
do
	AnimationWithSound = setmetatable({}, {
		__tostring = function()
			return "AnimationWithSound"
		end,
	})
	AnimationWithSound.__index = AnimationWithSound
	function AnimationWithSound.new(...)
		local self = setmetatable({}, AnimationWithSound)
		return self:constructor(...) or self
	end
	function AnimationWithSound:constructor(owner, aniamtion, soundSet)
		self.owner = owner
		self.aniamtion = aniamtion
		self.soundSet = soundSet
		self.onLoad = Instance.new("BindableEvent")
		self.inited = false
		self.char = ReloadableCharacter.new(self.owner)
		self:Laod()
	end
	function AnimationWithSound:Laod()
		self.track = self.char:GetAnimator():LoadAnimation(self.aniamtion)
		self.track.KeyframeReached:Connect(function(name)
			local _soundSet = self.soundSet
			local _name = name
			local _result = _soundSet[_name]
			if _result ~= nil then
				_result:Play()
			end
		end)
		self.onLoad:Fire()
	end
	function AnimationWithSound:Init()
		local _events = self.char.Events
		local _aNIMATOR = CHARACTER_LOAD_EVENT_NAMES.ANIMATOR
		_events[_aNIMATOR].Event:Connect(function()
			local _result = self.track
			if _result ~= nil then
				_result:Destroy()
			end
			self:Laod()
		end)
		self.inited = true
	end
	function AnimationWithSound:InitIfNotInited()
		if not self.inited then
			self:Init()
		end
	end
	function AnimationWithSound:Destroy()
		local _result = self.track
		if _result ~= nil then
			_result:Destroy()
		end
		self.aniamtion:Destroy()
		local _soundSet = self.soundSet
		local _arg0 = function(sound)
			return sound:Destroy()
		end
		for _k, _v in _soundSet do
			_arg0(_v, _k, _soundSet)
		end
		self.onLoad:Destroy()
	end
	function AnimationWithSound:GetTrack()
		self:InitIfNotInited()
		return self.track
	end
	function AnimationWithSound:Play()
		self:InitIfNotInited()
		local _result = self.track
		if _result ~= nil then
			_result:Play()
		end
	end
end
return {
	AnimationWithSound = AnimationWithSound,
}
