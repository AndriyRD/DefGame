-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "WeaponManager").WeaponManager
local ServerWeaponManager
do
	local super = WeaponManager
	ServerWeaponManager = setmetatable({}, {
		__tostring = function()
			return "ServerWeaponManager"
		end,
		__index = super,
	})
	ServerWeaponManager.__index = ServerWeaponManager
	function ServerWeaponManager.new(...)
		local self = setmetatable({}, ServerWeaponManager)
		return self:constructor(...) or self
	end
	function ServerWeaponManager:constructor()
		super.constructor(self)
	end
end
return {
	ServerWeaponManager = ServerWeaponManager,
}
