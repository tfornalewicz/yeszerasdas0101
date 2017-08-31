local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end

local voices = {
  {text = 'Chlop jak domb ze mnie, nie ma co'},
  {text = 'Kazda ksiazke czytam z zaciekawieniem od deski do deski'},
  {text = 'Ehh te korniki ciagle mnie gryza i nie daja mi spokoju'},
  {text = 'Podobno kiedys bylem malym chlopcem ale potem zamienilem sie w drewno'},
  {text = 'Pinokio moj syjamski blizniaku, tesknie za Toba...'} }

  npcHandler:addModule(VoiceModule:new(voices))
  
function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= MISJA 1 DRUID ADDON QUEST ================= 



   if (msgcontains(msg,"drewno")) then
      if player:getStorageValue(11030) == 1 then
         player:setStorageValue(11030,2)
         selfSay('Jak to drewno nie dotarlo? 3 dni temu wyslalem karawane. Musialo sie cos stac po drodze, zbadaj to jesli mozesz',cid)
      end
   end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
