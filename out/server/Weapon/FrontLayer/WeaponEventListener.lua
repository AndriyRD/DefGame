-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local WeaponServiceAPI = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "FrontLayer", "WeaponServiceAPI").WeaponServiceAPI
local WeaponEventListener
do
	WeaponEventListener = setmetatable({}, {
		__tostring = function()
			return "WeaponEventListener"
		end,
	})
	WeaponEventListener.__index = WeaponEventListener
	function WeaponEventListener.new(...)
		local self = setmetatable({}, WeaponEventListener)
		return self:constructor(...) or self
	end
	function WeaponEventListener:constructor()
		self.EventHandler = {}
		self.dir = ReplicatedStorage:FindFirstChild("Weapon"):FindFirstChild("Remote")
		local _eventHandler = self.EventHandler
		local _arg1 = function(p, n)
			return self:OnStartFire(p, n)
		end
		_eventHandler.StartFire = _arg1
		local _eventHandler_1 = self.EventHandler
		local _arg1_1 = function(p, n)
			return self:OnStopFire(p, n)
		end
		_eventHandler_1.StopFire = _arg1_1
	end
	function WeaponEventListener:GetId()
		return "weapon"
	end
	function WeaponEventListener:GetEventDirecotry()
		return self.dir
	end
	function WeaponEventListener:OnStartFire(plr, name)
		WeaponServiceAPI:StartFire(plr, name)
	end
	function WeaponEventListener:OnStopFire(plr, name)
		WeaponServiceAPI:StopFire(plr, name)
	end
end
return {
	WeaponEventListener = WeaponEventListener,
}
