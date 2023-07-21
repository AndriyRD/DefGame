-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local CoverMoveModule
do
	CoverMoveModule = setmetatable({}, {
		__tostring = function()
			return "CoverMoveModule"
		end,
	})
	CoverMoveModule.__index = CoverMoveModule
	function CoverMoveModule.new(...)
		local self = setmetatable({}, CoverMoveModule)
		return self:constructor(...) or self
	end
	function CoverMoveModule:constructor(character)
		self.character = character
		self.actionNames = {
			Move = "MoveCoverAction",
			Exit = "ExitCoverAction",
		}
		self.moveInput = { Enum.KeyCode.A, Enum.KeyCode.D }
		self.exitCoverInput = { Enum.KeyCode.S, Enum.KeyCode.LeftShift }
		self.hideHumSpeed = 12
		self.OnExit = Instance.new("BindableEvent")
	end
	function CoverMoveModule:MoveToPoint(point)
		local hum = self.character:GetHumanoid()
		hum:MoveTo(point)
	end
	function CoverMoveModule:GetMovePointFromInput(input)
		if input.KeyCode == self.moveInput[1] then
			return self.currentCove:GetEndLeftPoint().Position
		end
		return self.currentCove:GetEndRightPoint().Position
	end
	function CoverMoveModule:SetHidedSpeed()
		local hum = self.character:GetHumanoid()
		self.defHumSpeed = hum.WalkSpeed
		hum.WalkSpeed = self.hideHumSpeed
	end
	function CoverMoveModule:ResumeSeed()
		local _value = self.defHumSpeed
		self.character:GetHumanoid().WalkSpeed = if _value ~= 0 and (_value == _value and _value) then self.defHumSpeed else 16
	end
	function CoverMoveModule:Bind()
		ContextActionService:BindAction(self.actionNames.Move, function(name, state, inputObj)
			if name == self.actionNames.Move then
				if state == Enum.UserInputState.Begin then
					if self.currentCove then
						self:MoveToPoint(self:GetMovePointFromInput(inputObj))
					end
				elseif state == Enum.UserInputState.End then
					self:MoveToPoint(self.character:GetRoot().Position)
				end
			end
		end, false, unpack(self.moveInput))
		self:SetHidedSpeed()
		ContextActionService:BindAction(self.actionNames.Exit, function(name, state)
			if name == self.actionNames.Exit and state == Enum.UserInputState.Begin then
				self:Unbind()
				self.currentCove = nil
				self:ResumeSeed()
				self.OnExit:Fire()
			end
		end, false, unpack(self.exitCoverInput))
	end
	function CoverMoveModule:Unbind()
		ContextActionService:UnbindAction(self.actionNames.Move)
		ContextActionService:UnbindAction(self.actionNames.Exit)
	end
	function CoverMoveModule:Enable()
		self:Bind()
	end
	function CoverMoveModule:SetCover(cover)
		self.currentCove = cover
		return self
	end
end
return {
	CoverMoveModule = CoverMoveModule,
}
