-- === REV: 01        DATE: 26 Jan 2017     By: W     Tag: Q1*

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end

local voices = {
  {text = 'NIE WIEM CO O TYM MYSLEC...'},
  {text = 'Jak chcesz to dam ci pewne informacje..'},
  {text = 'Kaaaasiu mam dla Ciebie kwiaaatyyy'},
  {text = 'Moim idolem jest Arnold Schwarzenegger'},
  {text = 'KTO POMALOWAL RURY?'} }
  
npcHandler:addModule(VoiceModule:new(voices))
function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- *Q1* Begin
  -- ============= Fan Arnolda ================= 


   if (msgcontains(msg,"yes") or msgcontains(msg,"tak")) then
      if player:getStorageValue(11033) < 1 and npcHandler.topic[cid] == 1 and player:getStorageValue(11030) == 6 then
         if player:getStorageValue(11034) < 1 then
            player:setStorageValue(11034,1) -- ustawienie glownego questa
         end
         player:setStorageValue(11033,1)
         selfSay('Super.',cid)
      end      
   elseif (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then

      if player:getStorageValue(11033) == 3 and player:getItemCount(26384) > 0 then
        player:removeItem(26384,1) -- zabieramy naszyjnik
        player:setStorageValue(11033,4) -- konczymy klesta
        player:addItem(2476,1) -- knight armor
        -- Q5.1
        player:addExperience(50000,true) -- 50k expa
        -- Q5.1
        selfSay('Dziekuje ci! Oooo i nawet ladnie pachnie, Madame Malkin wykonala kawal swietnej roboty.',cid)
      elseif player:getStorageValue(11033) == 1 and player:getItemCount(11113) > 19 and player:getItemCount(5875) > 0 then
         player:setStorageValue(11033,2) -- wykonana misja
         -- player:removeItem(11113,20) -- zabieramy zeby -- trzeba isc do madame
         player:removeItem(5875,1) -- zabieramy rekawice
         selfSay('Wooow, swietne. Chciaz jak ja teraz to zszyje w naszyjnik. Znajdz prosze dla mnie osobe, ktora te zeby zamieni w naszyjnik. Bede bardzo wdzieczny.',cid)
      elseif player:getStorageValue(11033) < 1 and player:getStorageValue(11030) == 6 then
         selfSay('Misja? sam bym pojechal na jakas misje, jak Schwarzenegger. On to byl gosc, wygladam tez tak samo pakersko jak on?.',cid)
         selfSay('Jesli chcesz mi pomoc, to mozesz wyswiadczyc dla mnie przysluge, nie moge sie stad ruszyc, a brakuje mi paru rzeczy, by byc jeszcze bardziej niezwyciezonym.',cid)
         selfSay('Potrzebuje 20 zebow orkow, zeby zrobic z nich naszyjnik oraz rekawice prawdziwego snipera. Zdobedziesz je dla mnie?.',cid)
         npcHandler.topic[cid] = 1
      end
  -- ============= MISJA TRUDNE POCZATKI ================= 
      
   elseif msgcontains(msg,"Informacja") or msgcontains(msg,"Informacje") then
      selfSay('Opuszczajac podmiejska wioske Mirkowo musisz uwazac na gory osiedlone przez cyklopy na zachodzie. Daleko na poludniu znajduja sie fortece orkow oraz elfow ktore tocza se soba walki. Trzymajac sie drogowskazow dojdziesz do obozu mysliwych.',cid)
   end
  -- *Q1* End
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
