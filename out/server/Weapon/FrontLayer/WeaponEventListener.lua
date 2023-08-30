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
		self.OnStartFire = function(plr, name)
			WeaponServiceAPI:StartFire(plr, name)
		end
		self.OnStopFire = function(plr, name)
			WeaponServiceAPI:StopFire(plr, name)
		end
		self.OnCreateWeapon = function(plr, model)
			WeaponServiceAPI:Create(plr, model)
		end
		self.OnHitPackage = function(plr, results)
			print("Hited results: " .. tostring(#results))
			for _, res in results do
				print(res.Instance)
			end
		end
		self.NewWeaponOwner = function(plr, model)
			WeaponServiceAPI:SetNewOwner(plr, model)
		end
		self.DropWeapon = function(plr, id)
			WeaponServiceAPI:DropWeapon(plr, id)
		end
	end
	function WeaponEventListener:GetId()
		return "Weapon"
	end
end
return {
	WeaponEventListener = WeaponEventListener,
}
