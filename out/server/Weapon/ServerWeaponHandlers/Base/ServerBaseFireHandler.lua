-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local FireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "FireModule").FireModule
local BaseHitHandler = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponHandlers", "Base", "ServerBaseHitHandler").BaseHitHandler
local BaseFireHandler
do
	local super = FireModule
	BaseFireHandler = setmetatable({}, {
		__tostring = function()
			return "BaseFireHandler"
		end,
		__index = super,
	})
	BaseFireHandler.__index = BaseFireHandler
	function BaseFireHandler.new(...)
		local self = setmetatable({}, BaseFireHandler)
		return self:constructor(...) or self
	end
	function BaseFireHandler:constructor(...)
		super.constructor(self, ...)
		self.hitHandler = BaseHitHandler.new()
	end
	function BaseFireHandler:Fire()
	end
end
return {
	BaseFireHandler = BaseFireHandler,
}
