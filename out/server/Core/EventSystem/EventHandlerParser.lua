-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflection = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Reflection").Reflection
local EventHandlerParser
do
	EventHandlerParser = setmetatable({}, {
		__tostring = function()
			return "EventHandlerParser"
		end,
	})
	EventHandlerParser.__index = EventHandlerParser
	function EventHandlerParser.new(...)
		local self = setmetatable({}, EventHandlerParser)
		return self:constructor(...) or self
	end
	function EventHandlerParser:constructor()
		self.HANDLER_PREFIX = "On"
	end
	function EventHandlerParser:IsHandlerName(name)
		return (select(3, string.find(name, self.HANDLER_PREFIX .. "([A-z]*)")))
	end
	function EventHandlerParser:Parse(eventListener)
		local res = {}
		for _k, _v in Reflection:ConvertObjectToMap(eventListener) do
			local propItem = { _k, _v }
			local _arg0 = propItem[2]
			if typeof(_arg0) == "function" then
				local handlerName = self:IsHandlerName(propItem[1])
				if handlerName ~= "" and handlerName then
					local _arg0_1 = {
						Name = handlerName,
						Handle = propItem[2],
					}
					table.insert(res, _arg0_1)
				end
			end
		end
		return res
	end
end
return {
	EventHandlerParser = EventHandlerParser,
}
