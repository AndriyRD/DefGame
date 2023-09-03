-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local RotateModule = TS.import(script, script.Parent, "RotateModule").RotateModule
local TopDownCamera = TS.import(script, script.Parent, "TopDownCamera").TopDownCamera
local RotatedUpperTorso = TS.import(script, script.Parent, "RotatedUpperTorso").RotatedUpperTorso
local CHARACTER_MODULES
do
	local _inverse = {}
	CHARACTER_MODULES = setmetatable({}, {
		__index = _inverse,
	})
	CHARACTER_MODULES.TOP_DOWN_CAMERA = 0
	_inverse[0] = "TOP_DOWN_CAMERA"
	CHARACTER_MODULES.CHARACTER_ROTATE = 1
	_inverse[1] = "CHARACTER_ROTATE"
	CHARACTER_MODULES.TORSO_ANDLE = 2
	_inverse[2] = "TORSO_ANDLE"
end
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
	end
	function CharacterController:Startup()
		if self.inited then
			return warn("CharatcerController inited!")
		end
		local _characterModules = CharacterController.characterModules
		local _topDownCamera = TopDownCamera.new(CharacterController.owner, CharacterController.character)
		_characterModules.TOP_DOWN_CAMERA = _topDownCamera
		local _characterModules_1 = CharacterController.characterModules
		local _rotateModule = RotateModule.new(CharacterController.owner, CharacterController.character)
		_characterModules_1.CHARACTER_ROTATE = _rotateModule
		local _characterModules_2 = CharacterController.characterModules
		local _rotatedUpperTorso = RotatedUpperTorso.new(self.character:GetCharacter(), self.owner:GetMouse())
		_characterModules_2.TORSO_ANDLE = _rotatedUpperTorso
		self.inited = true
	end
	function CharacterController:SwithModuleState(moduleName, enabled)
		local _characterModules = CharacterController.characterModules
		local _moduleName = moduleName
		local charcterModule = _characterModules[_moduleName]
		if not charcterModule then
			error("Not found character-controller module: " .. moduleName)
		end
		if enabled then
			charcterModule:Enable()
		else
			charcterModule:Disable()
		end
	end
	CharacterController.owner = Players.LocalPlayer
	CharacterController.character = ReloadableCharacter.new(CharacterController.owner)
	CharacterController.characterModules = {}
	CharacterController.inited = false
end
return {
	CharacterController = CharacterController,
}
