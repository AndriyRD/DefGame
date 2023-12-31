-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
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
		self.OnStartFire = function(plr, globalID)
			WeaponServiceAPI:StartFire(plr, globalID)
		end
		self.OnStopFire = function(plr, globalID)
			WeaponServiceAPI:StopFire(plr, globalID)
		end
		self.OnCreateWeapon = function(plr, model)
			WeaponServiceAPI:Create(model)
		end
		self.OnHitPackage = function(plr, results)
			print("Hited results: " .. tostring(#results))
			for _, res in results do
				print(res.Instance)
			end
		end
		self.OnNewWeaponOwner = function(plr, char, globalId)
			WeaponServiceAPI:SetNewOwner(plr, globalId)
		end
		self.OnDropWeapon = function(plr, globalID)
			WeaponServiceAPI:DropWeapon(globalID)
		end
	end
	function WeaponEventListener:GetId()
		return "Weapon"
	end
end
return {
	WeaponEventListener = WeaponEventListener,
}
