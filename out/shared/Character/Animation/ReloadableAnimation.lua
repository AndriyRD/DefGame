-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter")
local CHARACTER_LOAD_EVENT_NAMES = _ReloadableCharacter.CHARACTER_LOAD_EVENT_NAMES
local ReloadableCharacter = _ReloadableCharacter.ReloadableCharacter
local ReloadableAnimation
do
	ReloadableAnimation = setmetatable({}, {
		__tostring = function()
			return "ReloadableAnimation"
		end,
	})
	ReloadableAnimation.__index = ReloadableAnimation
	function ReloadableAnimation.new(...)
		local self = setmetatable({}, ReloadableAnimation)
		return self:constructor(...) or self
	end
	function ReloadableAnimation:constructor(owner, aniamtion)
		self.aniamtion = aniamtion
		self.onLoad = Instance.new("BindableEvent")
		self.inited = false
		local _value = owner.UserId
		self.char = if _value ~= 0 and (_value == _value and (_value ~= "" and _value)) then ReloadableCharacter.new(owner) else owner
		self:Laod()
	end
	function ReloadableAnimation:Laod()
		self.track = self.char:GetAnimator():LoadAnimation(self.aniamtion)
		self.onLoad:Fire()
	end
	function ReloadableAnimation:Init()
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
	function ReloadableAnimation:InitIfNotInited()
		if not self.inited then
			self:Init()
		end
	end
	function ReloadableAnimation:Destroy()
		local _result = self.track
		if _result ~= nil then
			_result:Destroy()
		end
		self.aniamtion:Destroy()
		self.onLoad:Destroy()
	end
	function ReloadableAnimation:GetTrack()
		self:InitIfNotInited()
		return self.track
	end
	function ReloadableAnimation:Play()
		self:InitIfNotInited()
		local _result = self.track
		if _result ~= nil then
			_result:Play()
		end
	end
end
return {
	ReloadableAnimation = ReloadableAnimation,
}
