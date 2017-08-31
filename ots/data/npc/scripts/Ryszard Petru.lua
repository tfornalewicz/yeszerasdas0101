local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
  {text = 'U mnie twoje pieniadze sa bezpieczne.'},
  {text = 'Darmowe wplaty i wyplaty, a za prowadzenie konta nic nie pobieramy.'},
  {text = 'Bo na swiecie jest o ile nie pamietam 130 pare krajow... a do kazdego przelewy za darmo !'},
  {text = 'Przypominam ze po swietach jest szesciu kroli... Tak? '},
  {text = 'Sa takie momenty kiedy imperia padaja. Imperia  padaja zwykle w szczycie swojej chwaly, na przyklad Reborn. '},
  {text = 'Balans Twojego konta? Mam to w komorce...'},
  {text = 'Darmowe przelewy blyskawiczne.'} }

npcHandler:addModule(VoiceModule:new(voices))

local function greetCallback(cid)
  count[cid], transfer[cid] = nil, nil
  return true
end

local function creatureSayCallback(cid, type, msg)
  if not npcHandler:isFocused(cid) then
    return false
  end
  local player = Player(cid)
  ---------------------------- help ------------------------
  if msgcontains(msg, 'bank') or msgcontains(msg, 'bank') or msgcontains(msg, 'help') or msgcontains(msg, 'pomoc') then
    npcHandler:say({
      'Mozesz u mnie wyplacic lub wplacic swoje pieniadze, a takze zlecic przelew.'
    }, cid)
    npcHandler.topic[cid] = 0
    return true
    ---------------------------- balance ---------------------
  elseif msgcontains(msg, 'balance') or  msgcontains(msg, 'stan konta') then
    npcHandler.topic[cid] = 0
    if player:getBankBalance() == 15000 then
      npcHandler:say('Pokaz mi swoje kieszenie, a powiem ci kim jestes. Po 15k na koncie, stawiam ze twoj zawod to programista.', cid)
      return true
    elseif player:getBankBalance() >= 100000 then
      npcHandler:say('Do biednych nie nalezysz... Masz na koncie az ' .. player:getBankBalance() .. ' sztuk zlota.', cid)
      return true
    else
      npcHandler:say('Stan twojego konta wynosi ' .. getPlayerBalance(cid) .. ' sztuk zlota.', cid)
      return true
    end
    ---------------------------- deposit ---------------------
  elseif msgcontains(msg, 'deposit') or msgcontains(msg, 'wplac') or msgcontains(msg, 'wplata') then
    count[cid] = player:getMoney()
    if count[cid] < 1 then
      npcHandler:say('Czyzbys zgubil portfel? Nie masz przy sobie ani grosza.', cid)
      npcHandler.topic[cid] = 0
      return false
    end
    if msgcontains(msg, 'all') or msgcontains(msg, 'wszystko') or msgcontains(msg, 'calosc') then
      count[cid] = player:getMoney()
      npcHandler:say('Chcesz wplacic wszystko? Hm, przeliczmy... Wychodzi ' .. count[cid] .. ' zlota, zgadza sie?', cid)
      npcHandler.topic[cid] = 2
      return true
    else
      if string.match(msg,'%d+') then
        count[cid] = getMoneyCount(msg)
        if count[cid] < 1 then
          npcHandler:say('Nie masz tyle zlota przy sobie.', cid)
          npcHandler.topic[cid] = 0
          return false
        end
        npcHandler:say('Czy na pewno chcesz wplacic ' .. count[cid] .. ' sztuk zlota?', cid)
        npcHandler.topic[cid] = 2
        return true
      else
        npcHandler:say('Powiedz mi, ile zlota chcialbys wplacic.', cid)
        npcHandler.topic[cid] = 1
        return true
      end
    end
    if not isValidMoney(count[cid]) then
      npcHandler:say('Nie masz tyle zlota przy sobie.', cid)
      npcHandler.topic[cid] = 0
      return false
    end
  elseif npcHandler.topic[cid] == 1 then
    count[cid] = getMoneyCount(msg)
    if isValidMoney(count[cid]) then
      npcHandler:say('Na pewno chcesz wplacic ' .. count[cid] .. ' sztuk zlota?', cid)
      npcHandler.topic[cid] = 2
      return true
    else
      npcHandler:say('Nie masz tyle zlota przy sobie.', cid)
      npcHandler.topic[cid] = 0
      return true
    end
  elseif npcHandler.topic[cid] == 2 then
    if msgcontains(msg, 'yes') or msgcontains(msg, 'tak') or msgcontains(msg, 'zgadza sie') then
      if player:getMoney() >= tonumber(count[cid]) then
        player:depositMoney(count[cid])
		npcHandler:say('Dobrze, wplacilem ' .. count[cid] .. ' sztuk zlota na twoje konto. Mozesz je wyplacic w kazdym momencie.', cid)
		file = io.open("data/logs/bank.txt", "a+")
		file:write(os.date("%H", os.time())..":"..os.date("%M", os.time())..":"..os.date("%S", os.time()).."- Gracz "..player:getName().." wplacil "..count[cid].."gp na swoje konta.\n")
		file:close()
      else
        npcHandler:say('Nie masz tylu sztuk zlota.', cid)
      end
    elseif msgcontains(msg, 'no') then
      npcHandler:say('Prosze bardzo. Jest jeszcze cos, co moge dla ciebie zrobic?', cid)
    end
    npcHandler.topic[cid] = 0
    return true
    ---------------------------- withdraw --------------------
  elseif msgcontains(msg, 'withdraw') or msgcontains(msg, 'wyplac') or msgcontains(msg, 'wyplata') then
    if string.match(msg,'%d+') then
      count[cid] = getMoneyCount(msg)
      if isValidMoney(count[cid]) then
        npcHandler:say('Jestes pewny ze chcesz wyplacic ' .. count[cid] .. ' sztuk zlota z twojego konta?', cid)
        npcHandler.topic[cid] = 7
      else
        npcHandler:say('Nie ma tylu sztuk zlota na twoim koncie.', cid)
        npcHandler.topic[cid] = 0
      end
      return true
    else
      npcHandler:say('Ile zlota chcialbys wyplacic?', cid)
      npcHandler.topic[cid] = 6
      return true
    end
  elseif npcHandler.topic[cid] == 6 then
    count[cid] = getMoneyCount(msg)
    if isValidMoney(count[cid]) then
      npcHandler:say('Na pewno chcesz wyplacic ' .. count[cid] .. ' sztuk zlota z twojego konta bankowego?', cid)
      npcHandler.topic[cid] = 7
    else
      npcHandler:say('Na twoim koncie bankowym nie ma odpowiedniej ilosci sztuk zlota.', cid)
      npcHandler.topic[cid] = 0
    end
    return true
  elseif npcHandler.topic[cid] == 7 then
    if msgcontains(msg, 'yes') or msgcontains(msg, 'tak') then
      if player:getFreeCapacity() >= getMoneyWeight(count[cid]) then
        if not player:withdrawMoney(count[cid]) then
          npcHandler:say('Nie posiadasz odpowiedniej ilosci sztuk zlota na swoim koncie.', cid)
        else
          npcHandler:say('Prosze bardzo, to twoje ' .. count[cid] .. ' sztuk zlota. Poinformuj mnie gdy bede mogl dla ciebie zrobic cos jeszcze.', cid)
        end
      else
        npcHandler:say('Wroc do mnie jeszcze raz, kiedy zwolnisz troche miejsca.', cid)
      end
      npcHandler.topic[cid] = 0
    elseif msgcontains(msg, 'no') or msgcontains(msg, 'nie') then
      npcHandler:say('Klient nasz pan! Wroc gdy bedziesz potrzebowal jeszcze czegos!', cid)
      npcHandler.topic[cid] = 0
    end
    return true
    ---------------------------- transfer --------------------
  elseif msgcontains(msg, 'transfer') or msgcontains(msg, 'przelew') then
    npcHandler:say('O jakiej to kwocie rozmawiamy?', cid)
    npcHandler.topic[cid] = 11
  elseif npcHandler.topic[cid] == 11 then
    count[cid] = getMoneyCount(msg)
    if player:getBankBalance() < count[cid] then
      npcHandler:say('Nie posiadasz odpowiedniej ilosci sztuk zlota na swoim koncie.', cid)
      npcHandler.topic[cid] = 0
      return true
    end
    if isValidMoney(count[cid]) then
      npcHandler:say('Do kogo chcialbys wyslac ' .. count[cid] .. ' sztuk zlota?', cid)
      npcHandler.topic[cid] = 12
    else
      npcHandler:say('Nie posiadasz odpowiedniej ilosci sztuk zlota na swoim koncie.', cid)
      npcHandler.topic[cid] = 0
    end
  elseif npcHandler.topic[cid] == 12 then
    transfer[cid] = msg
    if player:getName() == transfer[cid] then
      npcHandler:say('Co ty glupi jestes? Do siebie bedziesz wysylac?', cid)
      npcHandler.topic[cid] = 0
      return true
    end
    if playerExists(transfer[cid]) then
      npcHandler:say('Na pewno chcesz wyslac ' .. count[cid] .. ' sztuk zlota do ' .. transfer[cid] .. '?', cid)
      npcHandler.topic[cid] = 13
    else
      npcHandler:say('Taki mirek nie istnieje.', cid)
      npcHandler.topic[cid] = 0
    end
  elseif npcHandler.topic[cid] == 13 then
    if msgcontains(msg, 'yes') or msgcontains(msg, 'tak') then
      if not player:transferMoneyTo(transfer[cid], count[cid]) then
        npcHandler:say('Nie mozesz tego zrobic, bo konto adresata jest zamrozone.', cid)
      else
        npcHandler:say('Dobrze, przelalismy' .. count[cid] .. ' sztuk zlota do ' .. transfer[cid] ..'.', cid)
		file = io.open("data/logs/bank.txt", "a+")
		file:write(os.date("%H", os.time())..":"..os.date("%M", os.time())..":"..os.date("%S", os.time()).."-Gracz "..player:getName().." wyslal "..count[cid].."gp do gracza: "..transfer[cid]..".\n")
		file:close()
        transfer[cid] = nil
		
      end
    elseif msgcontains(msg, 'no') or msgcontains(msg, 'nie') then
      npcHandler:say('Czy moglbym jeszcze cos dla ciebie zrobic?', cid)
    end
    npcHandler.topic[cid] = 0
  end
  return true
end


npcHandler:setMessage(MESSAGE_GREET, 'No witam cie |PLAYERNAME|, co potrzebujesz? Przelewu? Wyplaty? Wplaty? Decyduj sie, bo czas to pieniadz.')
npcHandler:setMessage(MESSAGE_FAREWELL, "Milego dnia.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Milego dnia.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

