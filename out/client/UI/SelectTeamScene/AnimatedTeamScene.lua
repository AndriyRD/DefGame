-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Roact = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local TweenService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local TeamFrame = TS.import(script, script.Parent, "TeamFrame").TeamFrame
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local AnimatedViewRig = TS.import(script, script.Parent, "AnimatedViewRig").AnimatedViewRig
local AnimatedTeamScene
do
	AnimatedTeamScene = Roact.Component:extend("AnimatedTeamScene")
	function AnimatedTeamScene:init()
		self.animationTime = .8
		self.animatedRigs = {}
		self.moveRigVector = Vector3.new(-2, 0, 0)
		self.animationTransparencyValue = .6
		self.tweenInfo = TweenInfo.new(self.animationTime)
		self.animatedChracterFixPosition = false
	end
	function AnimatedTeamScene:GetColorByKey(key)
		local _exp = Reflection:ConvertObjectToMap(BrickColor)
		local _key = key
		return _exp[_key]()
	end
	function AnimatedTeamScene:CreateTransparencyTween(frame, v)
		return TweenService:Create(frame, self.tweenInfo, {
			Transparency = v,
		})
	end
	function AnimatedTeamScene:FixRigPosition()
		if not self.animatedChracterFixPosition then
			for _k, _v in self.animatedRigs do
				local item = { _k, _v }
				item[2]:ParsePositions()
			end
			self.animatedChracterFixPosition = true
		end
	end
	function AnimatedTeamScene:hoverAnimate(frame, rig)
		self:FixRigPosition()
		self:CreateTransparencyTween(frame, self.animationTransparencyValue):Play()
		local _animatedRigs = self.animatedRigs
		local _rig = rig
		_animatedRigs[_rig]:TweenToOffset(self.moveRigVector)
	end
	function AnimatedTeamScene:resetAnimate(frame, rig)
		self:CreateTransparencyTween(frame, 1):Play()
		local _animatedRigs = self.animatedRigs
		local _rig = rig
		_animatedRigs[_rig]:ResetPosition()
	end
	function AnimatedTeamScene:selectAnimate(frame)
		self.props.OnSelectTeam(frame.Name)
	end
	function AnimatedTeamScene:didMount()
		for _, rig in self.props.Rigs do
			for _1, part in rig:GetChildren() do
				local _animatedRigs = self.animatedRigs
				local _animatedViewRig = AnimatedViewRig.new(rig, self.tweenInfo)
				_animatedRigs[rig] = _animatedViewRig
			end
		end
	end
	function AnimatedTeamScene:render()
		local _rigs = self.props.Rigs
		local _arg0 = function(v, i)
			return Roact.createFragment({
				[v.Name] = Roact.createElement(TeamFrame, {
					TeamColor = self:GetColorByKey(v.Name).Color,
					CountOfTeams = #self.props.Rigs,
					Index = i,
					Rig = v,
					OnHover = function(f, r)
						return self:hoverAnimate(f, r)
					end,
					OnEndHover = function(f, r)
						return self:resetAnimate(f, r)
					end,
					OnSelect = function(f)
						return self:selectAnimate(f)
					end,
				}),
			})
		end
		-- ▼ ReadonlyArray.map ▼
		local _newValue = table.create(#_rigs)
		for _k, _v in _rigs do
			_newValue[_k] = _arg0(_v, _k - 1, _rigs)
		end
		-- ▲ ReadonlyArray.map ▲
		local _children = {}
		local _length = #_children
		for _k, _v in _newValue do
			_children[_length + _k] = _v
		end
		return Roact.createFragment(_children)
	end
end
return {
	AnimatedTeamScene = AnimatedTeamScene,
}
