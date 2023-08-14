-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BODY_PART_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "BODY_PART_NAMES")
local PROP_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "PROP_NAMES").PROP_NAMES
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local AnimationConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "Animation", "AnimationConfig").AnimationConfig
local CHARACTER_LOAD_EVENT_NAMES
do
	local _inverse = {}
	CHARACTER_LOAD_EVENT_NAMES = setmetatable({}, {
		__index = _inverse,
	})
	CHARACTER_LOAD_EVENT_NAMES.ANIMATE_SCRIPT = "OnAnimateScriptLoad"
	_inverse.OnAnimateScriptLoad = "ANIMATE_SCRIPT"
	CHARACTER_LOAD_EVENT_NAMES.CHARACTER = "OnCharatcerLoad"
	_inverse.OnCharatcerLoad = "CHARACTER"
	CHARACTER_LOAD_EVENT_NAMES.HUMANOID = "OnHumanoidLoad"
	_inverse.OnHumanoidLoad = "HUMANOID"
	CHARACTER_LOAD_EVENT_NAMES.ANIMATOR = "OnAnimatorLoad"
	_inverse.OnAnimatorLoad = "ANIMATOR"
	CHARACTER_LOAD_EVENT_NAMES.ROOT = "OnRootLoad"
	_inverse.OnRootLoad = "ROOT"
end
local ReloadableCharacter
do
	ReloadableCharacter = setmetatable({}, {
		__tostring = function()
			return "ReloadableCharacter"
		end,
	})
	ReloadableCharacter.__index = ReloadableCharacter
	function ReloadableCharacter.new(...)
		local self = setmetatable({}, ReloadableCharacter)
		return self:constructor(...) or self
	end
	function ReloadableCharacter:constructor(owner)
		self.owner = owner
		self.Events = {}
		self:InitEvents()
	end
	function ReloadableCharacter:OnOwnerLeave()
		for _k, _v in self.Events do
			local e = { _k, _v }
			e[2]:Destroy()
			table.clear(self.Events)
		end
	end
	function ReloadableCharacter:SetEventInstance(name)
		local _events = self.Events
		local _name = name
		local _instance = Instance.new("BindableEvent")
		_events[_name] = _instance
	end
	function ReloadableCharacter:OnRealod()
		self.char = GetCharacter(self.owner)
		local _events = self.Events
		local _cHARACTER = CHARACTER_LOAD_EVENT_NAMES.CHARACTER
		_events[_cHARACTER]:Fire(self.char)
		self.hum = self.char:WaitForChild(PROP_NAMES.HUMANOID)
		local _events_1 = self.Events
		local _hUMANOID = CHARACTER_LOAD_EVENT_NAMES.HUMANOID
		_events_1[_hUMANOID]:Fire(self.hum)
		self.root = self.char:WaitForChild(BODY_PART_NAMES.MAIN.ROOT)
		local _events_2 = self.Events
		local _rOOT = CHARACTER_LOAD_EVENT_NAMES.ROOT
		_events_2[_rOOT]:Fire(self.root)
		self.animator = self.hum:WaitForChild("Animator")
		print("Reloaded animator")
		local _events_3 = self.Events
		local _aNIMATOR = CHARACTER_LOAD_EVENT_NAMES.ANIMATOR
		_events_3[_aNIMATOR]:Fire(self.animator)
		self.animateScript = self.char:WaitForChild(AnimationConfig.ANIMATE_SCRIPT_NAME)
		local _events_4 = self.Events
		local _aNIMATE_SCRIPT = CHARACTER_LOAD_EVENT_NAMES.ANIMATE_SCRIPT
		_events_4[_aNIMATE_SCRIPT]:Fire(self.animateScript)
	end
	function ReloadableCharacter:InitEvents()
		self:SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.ANIMATE_SCRIPT)
		self:SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.CHARACTER)
		self:SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.HUMANOID)
		self:SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.ANIMATOR)
		self:SetEventInstance(CHARACTER_LOAD_EVENT_NAMES.ROOT)
		self.owner:GetPropertyChangedSignal(PROP_NAMES.CHARACTER):Connect(function()
			self:OnRealod()
		end)
		self:OnRealod()
	end
	function ReloadableCharacter:GetCharacter()
		return self.char
	end
	function ReloadableCharacter:GetHumanoid()
		return self.hum
	end
	function ReloadableCharacter:GetRoot()
		return self.root
	end
	function ReloadableCharacter:GetAnimator()
		return self.animator
	end
	function ReloadableCharacter:GetAnimateScript()
		return self.animateScript
	end
	function ReloadableCharacter:Destory()
		for _k, _v in self.Events do
			local item = { _k, _v }
			item[2]:Destroy()
		end
		table.clear(self.Events)
		self.char = nil
		self.root = nil
		self.hum = nil
		self.animateScript = nil
	end
end
return {
	CHARACTER_LOAD_EVENT_NAMES = CHARACTER_LOAD_EVENT_NAMES,
	ReloadableCharacter = ReloadableCharacter,
}
