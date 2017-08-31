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
	{text = 'Haha tak na prawde nie jestem gruby!'},
	{text = 'I tak na prawde nie mam na imie Mirek!'},
	{text = 'Sprzedam info za opla pisac pw'},
	{text = 'Jak mnie denerwuja te limity na wpisy ehh'},
	{text = 'W moim sercu tylko guwnowpis!'} }
	
npcHandler:addModule(VoiceModule:new(voices))

function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- =============  ================= 


   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then


      if player:getStorageValue(11037) == 1 and player:getItemCount(2362) > 0 then
         player:setStorageValue(11037,2) -- wykonana misja
        player:addItem(8846,1) -- Masa czekoladowego ciasta -- kiedys do klesta
         player:removeItem(2362,1) -- zabieramy marchewke
         -- Q5.1
         player:addExperience(30000,true) -- 30k expa
         -- Q5.1
         selfSay('Fuuu, niedobre. Wole jednak hamburgery, trzymaj to ciasto. Probowalem zrobic tort czekoladowy, ale cos mi nie wyszlo.',cid)
      elseif player:getStorageValue(11037) < 1 and player:getStorageValue(11030) == 6 then
         player:setStorageValue(11037,1) -- wykonana misja
         selfSay('Tak misja. Musza wkoncu schudnac. Podobno gdzies tam za brama jest dziura z wielkimi marchewskami na odchudzanie.',cid)
         selfSay('Niby mozna tam tez dojsc z poludniowej bramy, po prostu przynies mi kawalek.',cid)
         npcHandler.topic[cid] = 1
      end
  -- ============= MISJA TRUDNE POCZATKI ================= 
      
   elseif msgcontains(msg,"Informacja") or msgcontains(msg,"Informacje") then
      selfSay('Tam? Tam jest w sumie knurow, ostatnio jakiegos sebixa tam zabili. Poza tym jakis swir z bialym jeleniem. Wedrujac do Knurowa musisz uwazac na wscibskie trolle oraz bandytow.',cid)
   end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
