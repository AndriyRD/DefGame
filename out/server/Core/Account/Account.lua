-- Compiled with roblox-ts v2.1.0
local Account
do
	Account = setmetatable({}, {
		__tostring = function()
			return "Account"
		end,
	})
	Account.__index = Account
	function Account.new(...)
		local self = setmetatable({}, Account)
		return self:constructor(...) or self
	end
	function Account:constructor(owner, option)
		self.owner = owner
		self.option = option
		self.sum = option.StartSum
	end
	function Account:GetOwner()
		return self.owner
	end
	function Account:Add(count)
		local endSum = self.sum + count
		local maxSize = self.option.MaxSize
		if endSum > maxSize then
			self.sum = maxSize
		else
			self.sum += endSum
		end
		return self
	end
	function Account:CanSub(count)
		return self.sum >= count
	end
	function Account:Sub(count)
		local endSum = self.sum - count
		if endSum < 0 and not self.option.CanNegetive then
			self.sum = 0
		else
			self.sum -= endSum
		end
	end
	function Account:Save()
	end
end
return {
	Account = Account,
}
