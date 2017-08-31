local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end

local voices = {
  {text = 'Dzieki mnie przestepcy ogladaja swiat w kratke!'},
  {text = 'Poki tutaj jestem w Mirkotown bedzie porzadek a liczba killerow w wiezieniu bedzie sie zgadzac!'},
  {text = 'A paragrafy mam juz dawno w dupie!'},
  {text = 'Widzialem ooooorla cieeen, ktory wzbil sieee niczym wiatr, nananaaaa nanaaa naaaa'},
  {text = 'Coo powiee Ryyyybaaa.... a duzo powie jak zapytasz!'},
  {text = 'Tu Ryba, wzywam Cie, Akwarium.'},
  {text = 'Co ty myslisz, cwaniaczku?! Ze z piatego przykazania mozesz sobie zrobic spolke z ograniczona odpowiedzialnoscia?!'} }

  npcHandler:addModule(VoiceModule:new(voices))
  
function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= MISJA TRUDNE POCZATKI ================= 

   
   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
      if player:getStorageValue(11032) == 4 then
          selfSay('Na razie nic wiecej nie mam, ale popytaj ludzi w miescie, ktos napewno cos bedzie dla ciebie miec',cid)
      end
      if player:getStorageValue(11030) == 5 then
        player:setStorageValue(11030,6)
	player:addExperience(30000,true) -- 30k expa
        selfSay("No i bardzo dobrze, zglos sie do Trollskyego po nagrode, od teraz jestes certyfikowanym wojownikiem MirkoTown",cid)
      end
      if player:getStorageValue(11030) == 3 then
        player:setStorageValue(11030,4)
        selfSay('Co?! Waski, ten przydupas? Bawi sie w gangsterke? Ja mu pokaze kto jest debesciak.',cid)
        selfSay('To moze byc dla ciebie trudna misja, ale wierze ze sobie poradzisz. Jak odzyskasz to drewno to cie wynagrodze.',cid)
      end
      if player:getStorageValue(11019) == 12 and player:getStorageValue(11030) < 1 then
         player:setStorageValue(11030,1) -- nowa misja
	 player:addExperience(10000,true) -- 10k expa
         selfSay('Kula cygana? On nigdy nie byl ostrozny.',cid)
         selfSay('3 osoby skarza sie na brak drewna? Trzeba to sprawdzic. Jak najszybciej wyrusz do Knurowa i zapytaj sie w porcie o dostawe.',cid)
         selfSay('Idz droga na zachod od miasta, a na pewno trafisz.',cid)
      end
      if player:getStorageValue(11019) < 2 then
         player:setStorageValue(11019,2)
         selfSay('Nowy rekrut? Wspaniale, kolejne mieso armat... Ekhm, znaczy sie material na zolnierza.',cid)
         selfSay('Jako pierwsza misja, przejdz po wszystkich handlarzach w Mirkotown i spytaj czy nie potrzebuja pomocy, a potem przyjdz do mnie z raportem',cid)
         selfSay('Nie rob nic, bez konsultacji ze mna. A teraz ruszaj, nie trac czasu',cid)
      end
  -- ============= MISJA TRUDNE POCZATKI ================= 
      
   end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
