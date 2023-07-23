-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local RotateModule = TS.import(script, script.Parent, "RotateModule").RotateModule
local CameraModule = TS.import(script, script.Parent, "CameraModule").CameraModule
local EventProvider = TS.import(script, script.Parent.Parent, "EventProvider").EventProvider
local CharacterController
do
	CharacterController = setmetatable({}, {
		__tostring = function()
			return "CharacterController"
		end,
	})
	CharacterController.__index = CharacterController
	function CharacterController.new(...)
		local self = setmetatable({}, CharacterController)
		return self:constructor(...) or self
	end
	function CharacterController:constructor()
		self.owner = Players.LocalPlayer
		self.character = ReloadableCharacter.new(self.owner)
		self.events = EventProvider.CharatcerController
		self.rotateModule = RotateModule.new(self.owner, self.character)
		self.cameraModule = CameraModule.new(self.owner, self.character)
		self.events.Camera.Enable.Event:Connect(function()
			return self.cameraModule:Enable()
		end)
		self.events.Camera.Disable.Event:Connect(function()
			return self.cameraModule:Disable()
		end)
		self.events.Rotation.Enable.Event:Connect(function()
			return self.rotateModule:Enable()
		end)
		self.events.Rotation.Disable.Event:Connect(function()
			return self.rotateModule:Disable()
		end)
	end
	function CharacterController:Start()
		self.rotateModule:Enable()
		self.cameraModule:Enable()
	end
end
return {
	CharacterController = CharacterController,
}
