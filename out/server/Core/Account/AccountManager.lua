-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Account = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "Account", "Account").Account
local AccountManager
do
	AccountManager = setmetatable({}, {
		__tostring = function()
			return "AccountManager"
		end,
	})
	AccountManager.__index = AccountManager
	function AccountManager.new(...)
		local self = setmetatable({}, AccountManager)
		return self:constructor(...) or self
	end
	function AccountManager:constructor(option)
		self.accounts = {}
		self.commonOption = if option then option else {
			CanNegetive = false,
			MaxSize = 10_000,
			StartSum = 0,
		}
	end
	function AccountManager:TryFind(plr)
		for _, account in self.accounts do
			if account:GetOwner() == plr then
				return account
			end
		end
	end
	function AccountManager:Find(plr)
		local account = self:TryFind(plr)
		if not account then
			error("Not found account for owner: " .. tostring(plr))
		end
		return account
	end
	function AccountManager:FindOrCreate(plr)
		local account = self:TryFind(plr)
		if account then
			local newAccount = Account.new(plr, self.commonOption)
			table.insert(self.accounts, newAccount)
			account = newAccount
		end
		return account
	end
	function AccountManager:Add(plr, count)
		self:FindOrCreate(plr):Add(count)
	end
	function AccountManager:Sub(plr, count)
		self:FindOrCreate(plr):Sub(count)
	end
	function AccountManager:Send(sender, target, count)
		local senderAccount = self:TryFind(sender)
		if not sender then
			return false
		end
		local targetAccount = self:FindOrCreate(target)
		if senderAccount:CanSub(count) then
			senderAccount:Sub(count)
			targetAccount:Add(count)
			return true
		end
		return false
	end
end
return {
	AccountManager = AccountManager,
}
