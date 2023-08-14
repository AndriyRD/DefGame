-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local VectorUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "VectorUtility").VectorUtility
local CameraShaker
do
	CameraShaker = setmetatable({}, {
		__tostring = function()
			return "CameraShaker"
		end,
	})
	CameraShaker.__index = CameraShaker
	function CameraShaker.new(...)
		local self = setmetatable({}, CameraShaker)
		return self:constructor(...) or self
	end
	function CameraShaker:constructor(character)
		self.character = character
		self.camera = Workspace.CurrentCamera
		self.enabled = false
		self.changeStateEvent = Instance.new("BindableEvent")
		self.values = {}
		self.valueSetSize = 5
		self.currentIndex = 0
		self.alpha = .1
		self.changeStateEvent.Event:Connect(function(v)
			return self:ChangeState(v, nil)
		end)
	end
	function CameraShaker:GetRandomOffset()
		return CFrame.new(VectorUtility:CreateRandomVector(-1, 1))
	end
	function CameraShaker:LerpOffset(cf, alpha, waitTime)
		if alpha == nil then
			alpha = .1
		end
		if waitTime == nil then
			waitTime = .03
		end
		do
			local i = 0
			local _shouldIncrement = false
			while true do
				if _shouldIncrement then
					i += alpha
				else
					_shouldIncrement = true
				end
				if not (i < 1) then
					break
				end
				task.wait(waitTime)
				self.camera.CFrame:Lerp(cf, i)
			end
		end
	end
	function CameraShaker:ShakeCamera()
		if self.enabled then
			return nil
		end
		while self.enabled do
			self:LerpOffset(self.camera.CFrame:ToWorldSpace(self:GetRandomOffset()))
		end
	end
	function CameraShaker:ChangeState(enableValue, cameraCF)
		self.enabled = enableValue
		if self.enabled then
			self:ShakeCamera()
		else
			self:LerpOffset(cameraCF)
		end
	end
	function CameraShaker:GenerateNewValueSet(cf)
		print(cf.Position)
		local vals = {}
		local alpha = self.alpha
		local step = 1 / self.valueSetSize
		do
			local i = 0
			local _shouldIncrement = false
			while true do
				if _shouldIncrement then
					i += step
				else
					_shouldIncrement = true
				end
				if not (i <= 1) then
					break
				end
				local _arg0 = self.camera.CFrame:Lerp(cf, alpha)
				table.insert(vals, _arg0)
				print("Generate element: " .. tostring(i))
			end
		end
		print("Vals size: " .. tostring(#vals))
		return vals
	end
	function CameraShaker:EnableShake()
		self.changeStateEvent:Fire(true)
	end
	function CameraShaker:DisableShake(cameraCF)
		self.changeStateEvent:Fire(false, cameraCF)
	end
	function CameraShaker:Next(cameraCF)
		if self.currentIndex > self.valueSetSize - 1 or #self.values == 0 then
			self.currentIndex = 0
			table.clear(self.values)
			self.values = self:GenerateNewValueSet(cameraCF:ToWorldSpace(self:GetRandomOffset()))
		end
		local val = self.values[self.currentIndex + 1]
		print(self.currentIndex)
		self.currentIndex += 1
		print(val)
		return val
	end
end
return {
	CameraShaker = CameraShaker,
}
