-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local FireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "FireModule").FireModule
local BaseHitHandler = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "ServerWeaponHandlers", "Base", "ServerBaseHitHandler").BaseHitHandler
local ServerBaseFireModule
do
	local super = FireModule
	ServerBaseFireModule = setmetatable({}, {
		__tostring = function()
			return "ServerBaseFireModule"
		end,
		__index = super,
	})
	ServerBaseFireModule.__index = ServerBaseFireModule
	function ServerBaseFireModule.new(...)
		local self = setmetatable({}, ServerBaseFireModule)
		return self:constructor(...) or self
	end
	function ServerBaseFireModule:constructor(...)
		super.constructor(self, ...)
		self.hitHandler = BaseHitHandler.new()
	end
	function ServerBaseFireModule:Fire()
	end
	function ServerBaseFireModule:Dispose()
	end
end
return {
	ServerBaseFireModule = ServerBaseFireModule,
}
