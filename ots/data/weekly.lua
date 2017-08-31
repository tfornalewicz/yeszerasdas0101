qconfig = {
    [1] = {questid = 1, name = "Compound Eye",desc = "Zlecenie na Robale!\n\nPrzynies do Pani Burmistrz 70 Compound Eye.", required = 70, item = 15486, startdate=(os.time{year=2017,month=5,day=24,hour=2}), enddate=os.time{year=2017,month=5,day=25,hour=1}, exp = 50400, money = 10500, tc = 2 },
    [2] = {questid = 2, name = "Red Dragon Leather",desc = "Zlecenie na Czerwone Smoki!\n\nPrzynies do Pani Burmistrz 20 Red Dragon Leather.", required = 20, item = 5948, startdate=(os.time{year=2017,month=5,day=25,hour=2}), enddate=os.time{year=2017,month=5,day=26,hour=1}, exp = 31164, money = 4000, tc = 2 },
    [3] = {questid = 3, name = "Waspoid Wing",desc = "Zlecenie na Muchy!\n\nPrzynies do Pani Burmistrz 35 Waspoid Wing.", required = 35, item = 24844, startdate=(os.time{year=2017,month=5,day=26,hour=2}), enddate=os.time{year=2017,month=5,day=27,hour=1}, exp = 14641, money = 6650, tc = 2 },
    [4] = {questid = 4, name = "Ogre Ear Stud",desc = "Zlecenie na Ogry!\n\nPrzynies do Pani Burmistrz 60 Ogre Ear Stud.", required = 60, item = 24707, startdate=(os.time{year=2017,month=5,day=29,hour=2}), enddate=os.time{year=2017,month=5,day=30,hour=1}, exp = 59875, money = 10800, tc = 2 },
    [5] = {questid = 5, name = "Werebadger Claws",desc = "Zlecenie na Likantropie!\n\nPrzynies do Pani Burmistrz 60 Werebadger Claws.", required = 60, item = 15484, startdate=(os.time{year=2017,month=5,day=30,hour=2}), enddate=os.time{year=2017,month=5,day=31,hour=1}, exp = 100500, money = 9600, tc = 2 },
    -- [2] = {name = "Minotaury", killsRequired  = 500, creatures = {"minotaur", "minotaur mage", "minotaur archer", "minotaur guard"}, exp = 10200, money = 7500, tibiaCoins = 2},
    -- [3] = {name = "Krokodyle", killsRequired  = 200, creatures = {"crocodile"}, exp = 12000, money = 2000, tibiaCoins = 1}, --"The Snapper"
    -- [4] = {name = "Tarantule", killsRequired  = 300, creatures = {"tarantula"}, exp = 27000, money = 2000, tibiaCoins = 1}, --"Hide"
    -- [5] = {name = "Carniphile", killsRequired  = 300, creatures = {"carniphila"}, exp = 45000, money = 8000, tibiaCoins = 2}, --"Deathbine"
    -- [6] = {name = "Mamuty", killsRequired  = 200, creatures = {"mammoth"}, exp = 24000, money = 5000, tibiaCoins = 2}, --"The Bloodtusk"
    -- [7] = {name = "Lodowe Golemy", killsRequired  = 300, creatures = {"ice golem"}, exp = 88500, money = 4000, tibiaCoins = 2}, --"Shardhead"
    -- [8] = {name = "Zmutowane Szczury", killsRequired  = 400, creatures = {"mutated rat"}, exp = 135000, money = 5000, tibiaCoins = 2}, --"Esmeralda"
    -- [9] = {name = "Lodowe Pajeczaki", killsRequired  = 300, creatures = {"crystal spider"}, exp = 202500, money = 7000, tibiaCoins = 2}, --"Bloodweb"
    -- [10] = {name = "Antyczne Skarabeusze", killsRequired  = 300, creatures = {"ancient scarab"}, exp = 162000, money = 7000, tibiaCoins = 2}, --"Fleshcrawler"
    -- [11] = {name = "Kosciane Bestie", killsRequired  = 300, creatures = {"bonebeast"}, exp = 130500, money = 7000, tibiaCoins = 2}, --"Ribstride"
    -- [12] = {name = "Olbrzymie Pajeczaki", killsRequired  = 500, creatures = {"giant spider"}, exp = 337500, money = 10000, tibiaCoins = 3}, --"The Old Widow"
    -- [13] = {name = "Quary", killsRequired  = 500, creatures = {"quara constrictor", "quara constrictor scourt", "quara hydromancer", "quara hydromancer scout", "quara mantassin", "quara mantassin scout", "quara pincher", "quara pincher scout", "quara predator", "quara predator scout"}, exp = 337500, money = 10000, tibiaCoins = 3}, --"Thul"
    -- [14] = {name = "Wilkolaki", killsRequired  = 300, creatures = {"werewolf"}, exp = 498750, money = 10000, tibiaCoins = 3}, --"Hemming"
    -- [15] = {name = "Koszmary", killsRequired  = 400, creatures = {"nightmare", "nightmare scion"}, exp = 645000, money = 10000, tibiaCoins = 3}, --"Tormentor"
    -- [16] = {name = "Hellspawny", killsRequired  = 400, creatures = {"hellspawn"}, exp = 956250, money = 10000, tibiaCoins = 3}, --"Flameborn"
    -- [17] = {name = "Jaszczuroludzie - Elita", killsRequired  = 400, creatures = {"lizard legionnaire", "lizard dragon priest", "lizard high guard", "lizard zaogun", "eternal guardian", "lizard chosen"}, exp = 700000, money = 10000, tibiaCoins = 3}, --"Fazzrah"
    -- [18] = {name = "Stampory", killsRequired  = 200, creatures = {"stampor"}, exp = 117000, money = 10000, tibiaCoins = 2}, --"Tromphonyte"
    -- [19] = {name = "Robaczki Brimstone", killsRequired  = 300, creatures = {"brimstone bug"}, exp = 236250, money = 10000, tibiaCoins = 2}, --"Sulphur Scuttler"
    -- [20] = {name = "Zmutowane Netoperki", killsRequired  = 350, creatures = {"mutated bat"}, exp = 184500, money = 10000, tibiaCoins = 3}, --"Bruise Payne"
    -- [21] = {name = "Hydry", killsRequired  = 400, creatures = {"hydra"}, exp = 630000, money = 15000, tibiaCoins = 4}, --"The Many"
    -- [22] = {name = "Morskie Weze", killsRequired  = 500, creatures = {"sea serpent", "young sea serpent"}, exp = 810000, money = 15000, tibiaCoins = 4}, --"Leviathan"
    -- [23] = {name = "Behemoty", killsRequired  = 300, creatures = {"behemoth"}, exp = 787500, money = 15000, tibiaCoins = 4}, --"Stonecracker"
    -- [24] = {name = "Serpent Spawn", killsRequired  = 400, creatures = {"serpent spawn"}, exp = 1006500, money = 15000, tibiaCoins = 4}, --"The Noxious Spawn"
    -- [25] = {name = "Meduzy", killsRequired  = 300, creatures = {"medusa"}, exp = 1063125, money = 15000, tibiaCoins = 4}, --"Gorgo"
    -- [26] = {name = "Piekielne Ogary", killsRequired  = 250, creatures = {"hellhound"}, exp = 1530000, money = 15000, tibiaCoins = 4}, --"Kerberos"
    -- [27] = {name = "Upiorne Smoki", killsRequired  = 300, creatures = {"ghastly dragon"}, exp = 1207500, money = 15000, tibiaCoins = 4}, --"Ethershreck"
    -- [28] = {name = "Drakeni", killsRequired  = 500, creatures = {"draken abomination", "draken elite", "draken spellweaver", "draken warmaster"}, exp = 1078125, money = 5000, tibiaCoins = 3}, --"Paiz the Pauperizer"
    -- [29] = {name = "Niszczyciele", killsRequired  = 400, creatures = {"destroyer"}, exp = 1125000, money = 20000, tibiaCoins = 3}, --"Bretzecutioner"
    -- [30] = {name = "Nieumarle Smoki", killsRequired  = 300, creatures = {"undead dragon"}, exp = 2008800, money = 5000, tibiaCoins = 3}, --"Zanakeph"
    -- [31] = {name = "Demoniczny Task", killsRequired  = 2000, creatures = {"demon"}, exp = 11400000, money = 30000, tibiaCoins = 30}, --QUEST QUEST QUEST QUEST QUEST QUEST QUEST QUEST QUEST QUEST QUEST QUEST QUEST
    -- [32] = {name = "Orki", killsRequired  = 300, creatures = {"orc", "orc berserker", "orc leader", "orc rider", "orc shaman", "orc spearman", "orc warlord", "orc warrior"}, exp = 42000, money = 5000, tibiaCoins = 2},
    -- [33] = {name = "Slabsze nieumarlaki", killsRequired  = 300, creatures = {"ghoul", "mummy", "skeleton", "skeleton warrior", "crypt shambler", "zombie"}, exp = 39000, money = 5000, tibiaCoins = 2},
    -- [34] = {name = "Minosy", killsRequired  = 300, creatures = {"minotaur", "minotaur mage", "minotaur archer", "minotaur guard"}, exp = 165000, money = 5000, tibiaCoins = 2},
    -- [35] = {name = "Cyklopy", killsRequired  = 400, creatures = {"cyclops", "cyclops drone", "cyclops smith"}, exp = 80000, money = 4000, tibiaCoins = 2},
    -- [36] = {name = "Termity", killsRequired  = 300, creatures = {"terramite"}, exp = 72000, money = 5000, tibiaCoins = 2},
    -- [37] = {name = "Zolwie", killsRequired  = 300, creatures = {"tortoise", "thornback tortoise"}, exp = 54000, money = 4000, tibiaCoins = 1},
    -- [38] = {name = "Nekromanci", killsRequired  = 1500, creatures = {"necromancer", "blood pirest", "blood hand", "priestess"}, exp = 300000, money = 10000, tibiaCoins = 4}, --"Necropharus"
}