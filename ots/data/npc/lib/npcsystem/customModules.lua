-- VoiceModule
VoiceModule = {
	voices = nil,
	voiceCount = 0,
	lastVoice = 0,
	timeout = nil,
	chance = nil,
	npcHandler = nil
}

-- Creates a new instance of VoiceModule
function VoiceModule:new(voices, timeout, chance)
	local obj = {}
	setmetatable(obj, self)
	self.__index = self

	obj.voices = voices
	for i = 1, #obj.voices do
		local voice = obj.voices[i]
		if voice.yell then
			voice.yell = nil
			voice.talktype = TALKTYPE_YELL
		else
			voice.talktype = TALKTYPE_MONSTER_SAY
		end
	end

	obj.voiceCount = #voices
	obj.timeout = timeout or 10
	obj.chance = chance or 30
	return obj
end

function VoiceModule:init(handler)
	return true
end

function VoiceModule:callbackOnThink()
	if self.lastVoice < os.time() then
		self.lastVoice = os.time() + self.timeout
		if math.random(100) < self.chance  then
			local voice = self.voices[math.random(self.voiceCount)]
			Npc():say(voice.text, voice.talktype)
		end
	end
	return true
end

function Player.removeMoneyNpc(self, amount)
	local moneyCount = self:getMoney()
	local bankCount = self:getBankBalance()
	if amount > moneyCount + bankCount then
		return false
	end

	self:removeMoney(math.min(amount, moneyCount))
	if amount > moneyCount then
		self:setBankBalance(bankCount - math.max(amount - moneyCount, 0))
		if moneyCount == 0 then
			self:sendTextMessage(MESSAGE_INFO_DESCR, ("Paid %d gold from bank account. Your account balance is now %d gold."):format(amount, self:getBankBalance()))
		else
			self:sendTextMessage(MESSAGE_INFO_DESCR, ("Paid %d from inventory and %d gold from bank account. Your account balance is now %d gold."):format(moneyCount, amount - moneyCount, self:getBankBalance()))
		end
	end
	return true
end

local function getPlayerMoney(cid)
	local player = Player(cid)
	if player then
		return player:getMoney() + player:getBankBalance()
	end
	return 0
end

local function doPlayerRemoveMoney(cid, amount)
	local player = Player(cid)
	if player then
		return player:removeMoneyNpc(amount)
	end
	return false
end