-- Parser
dofile('data/modules/scripts/gamestore/init.lua')
-- Config
GameStore.Categories = {
	{
		name = "Nowosci",
		description = "Przygotowalismy dla Was cos nowego!",
		state = GameStore.States.STATE_NONE,
		icons = {"New_Products.png"},
		offers = {
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Grove Keeper", thingId = {male=908,female=909}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f909.png", "f908.png"}},
			{name = "Festive Outfit", thingId = {male=931,female=929}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 40, icons = {"f931.png", "f929.png"}},
			{name = "Pharaoh", thingId = {male=955,female=956}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f955.png", "f956.png"}},

			-- Mount Example : thingId = mountId
			{name = "Jackalope", thingId = 103, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Jackalope.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Dreadhare", thingId = 104, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Dreadhare.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Wolpertinger", thingId = 105, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Wolpertinger.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Stone Rhino", thingId = 106, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Stone_Rhino.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Gold Sphinx", thingId = 107, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Gold_Sphinx.gif"}, description = "Here you can purchase the Mount for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Emerald Sphinx", thingId = 108, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Emerald_Sphinx.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Shadow Sphinx", thingId = 109, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Shadow_Sphinx.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Jungle Saurian", thingId = 110, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 1, icons = {"Jungle_Saurian.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Ember Saurian", thingId = 111, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 1, icons = {"Ember_Saurian.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Lagoon Saurian", thingId = 112, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 1, icons = {"Lagoon_Saurian.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Blazing Unicorn", thingId = 113, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 1, icons = {"Blazing_Unicorn.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Arctic Unicorn", thingId = 114, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 1, icons = {"Arctic_Unicorn.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			{name = "Prismatic Unicorn", thingId = 115, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 1, icons = {"Prismatic_Unicorn.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			
		}
	},

	{
		name = "Wierzchowce",
		description = "Po co chodzic na piechote, skoro mozna sie przejechac?",
		state = GameStore.States.STATE_NONE,
		icons = {"Category_Mounts.png"},
		offers = {
			-- Mount Example : thingId = mountId
			{name = "Widow Queen", thingId = 1, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Widow_Queen.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Racing Bird", thingId = 2, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Racing_Bird.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "War Bear", thingId = 3, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"War_Bear.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Black Sheep", thingId = 4, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Black_Sheep.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Midnight Panther", thingId = 5, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Midnight_Panther.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Draptor", thingId = 6, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Draptor.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Titanica", thingId = 7, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Titanica.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Tin Lizzard", thingId = 8, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Tin_Lizzard.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Blazebringer", thingId = 9, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Blazebringer.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Rapid Boar", thingId = 10, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Rapid_Boar.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Stampor", thingId = 11, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Stampor.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Undead Cavebear", thingId = 12, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Undead_Cavebear.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Donkey", thingId = 13, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Donkey.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Tiger Slug", thingId = 14, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Tiger_Slug.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Uniwheel", thingId = 15, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Uniwheel.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Crystal Wolf", thingId = 16, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Crystal_Wolf.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "War Horse", thingId = 17, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"War_Horse.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Kingly Deer", thingId = 18, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Kingly_Deer.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Tamed Panda", thingId = 19, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Tamed_Panda.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Dromedary", thingId = 20, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Dromedary.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Scorpion King", thingId = 21, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Scorpion_King.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Armoured War Horse", thingId = 23, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Armoured_War_Horse.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Shadow Draptor", thingId = 24, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Shadow_Draptor.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Rented Horse", thingId = 22, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Rented_Horse1.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Rented Horse", thingId = 25, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Rented_Horse2.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Rented Horse", thingId = 26, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Rented_Horse3.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Ladybug", thingId = 27, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Lady_Bug.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Manta Ray", thingId = 28, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Manta_Ray.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Ironblight", thingId = 29, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Ironblight.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Magma Crawler", thingId = 30, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Magma_Crawler.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Dragonling", thingId = 31, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Dragonling.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Gnarlhound", thingId = 32, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 530, icons = {"Gnarlhound.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Crimson Ray", thingId = 33, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Crimson_Ray.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Steelbeak", thingId = 34, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Steelbeak.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Water Buffalo", thingId = 35, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 30, icons = {"Water_Buffalo.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Tombstinger", thingId = 36, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Tombstinger.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Platesaurian", thingId = 37, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Platesaurian.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Ursagrodon", thingId = 38, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 560, icons = {"Ursagrodon.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "The Hellgrip", thingId = 39, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"The_Hellgrip.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Noble Lion", thingId = 40, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Noble_Lion.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Desert King", thingId = 41, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Desert_King.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Shock Head", thingId = 42, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Shock_Head.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Walker", thingId = 43, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Walker.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Azudocus", thingId = 44, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Azudocus.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Carpacosaurus", thingId = 45, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Carpacosaurus.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Death Crawler", thingId = 46, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Death_Crawler.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Flamesteed", thingId = 47, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Flamesteed.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Jade Lion", thingId = 48, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Jade_Lion.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Jade Pincer", thingId = 49, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Jade_Pincer.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Nethersteed", thingId = 50, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Nethersteed.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Tempest", thingId = 51, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Tempest.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Winter King", thingId = 52, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Winter_King.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Doombringer", thingId = 53, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Doombringer.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Woodland Prince", thingId = 54, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Woodland_Prince.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Hailstorm Fury", thingId = 55, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Hailstorm_Fury.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Siegebreaker", thingId = 56, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Siegebreaker.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Poisonbane", thingId = 57, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Poisonbane.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Blackpelt", thingId = 58, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Blackpelt.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Golden Dragonfly", thingId = 59, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Golden_Dragonfly.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Steel Bee", thingId = 60, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Steel_Bee.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Copper Fly", thingId = 61, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Copper_Fly.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Tundra Rambler", thingId = 62, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Tundra_Rambler.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Highland Yak", thingId = 63, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Highland_Yak.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Glacier Vagabond", thingId = 64, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Glacier_Vagabond.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Flying Divan", thingId = 65, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Flying_Divan.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Magic Carpet", thingId = 66, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Magic_Carpet.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Floating Kashmir", thingId = 67, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Floating_Kashmir.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Ringtail Waccoon", thingId = 68, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Ringtail_Waccoon.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Night Waccoon", thingId = 69, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Night_Waccoon.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Emerald Waccoon", thingId = 70, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Emerald_Waccoon.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Glooth Glider", thingId = 71, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Glooth_Glider.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Shadow Hart", thingId = 72, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Shadow_Hart.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Black Stag", thingId = 73, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Black_Stag.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Emperor Deer", thingId = 74, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Emperor_Deer.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Flitterkatzen", thingId = 75, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Flitterkatzen.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Venompaw", thingId = 76, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Venompaw.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Batcat", thingId = 77, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Batcat.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Sea Devil", thingId = 78, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Sea_Devil.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Coralripper", thingId = 79, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Coralripper.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Plumfish", thingId = 80, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Plumfish.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Gorongra", thingId = 81, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Gorongra.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Noctungra", thingId = 82, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Noctungra.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Silverneck", thingId = 83, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Silverneck.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Slagsnare", thingId = 84, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Slagsnare.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Nightstinger", thingId = 85, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Nightstinger.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Razorcreep", thingId = 86, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Razorcreep.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Rift Runner", thingId = 87, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Rift_Runner.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Nightdweller", thingId = 88, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Nightdweller.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Frostflare", thingId = 89, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Frostflare.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Cinderhoof", thingId = 90, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Cinderhoof.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Mouldpincer", thingId = 91, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Mouldpincer.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Bloodcurl", thingId = 92, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Bloodcurl.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Leafscuttler", thingId = 93, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Leafscuttler.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Sparkion", thingId = 94, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Sparkion.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Swamp Snapper", thingId = 95, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Swamp_Snapper.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Mould Shell", thingId = 96, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Mould_Shell.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Reed Lurker", thingId = 97, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Reed_Lurker.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Neon Sparkid", thingId = 98, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Neon_Sparkid.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Vortexion", thingId = 99, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Vortexion.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Ivory Fang", thingId = 100, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Ivory_Fang.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Shadow Claw", thingId = 101, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Shadow_Claw.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
			-- Mount Example : thingId = mountId
			{name = "Snow Pelt", thingId = 102, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 60, icons = {"Snow_Pelt.gif"}, description = "Here you can purchase the Mount  for your character. Riding on a mount is not only cool, but also gives your character a speed boost."},
		}
	},

	{
		name = "Stroje",
		description = "To co, moze kupisz jakis nowy ciuszek?",
		state = GameStore.States.STATE_NONE,
		icons = {"Category_Outfits.png"},
		offers = {
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Citizen Addon", thingId = {male=128,female=136}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f128.png", "f136.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Hunter Addon", thingId = {male=129,female=137}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f129.png", "f137.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Mage Addon", thingId = {male=130,female=138}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 100, icons = {"f130.png", "f138.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Knight Addon", thingId = {male=131,female=139}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f131.png", "f139.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Nobleman Addon", thingId = {male=132,female=140}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 5, icons = {"f132.png", "f140.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Summoner Addon", thingId = {male=133,female=141}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 100, icons = {"f133.png", "f141.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Warrior Addon", thingId = {male=134,female=142}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f134.png", "f142.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Barbarian Addon", thingId = {male=143,female=147}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"f143.png", "f147.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Druid Addon", thingId = {male=144,female=148}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f144.png", "f148.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Wizard Addon", thingId = {male=145,female=149}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f145.png", "f149.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "oriental Addon", thingId = {male=146,female=150}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f146.png", "f150.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Pirate Addon", thingId = {male=151,female=155}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f151.png", "f155.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			-- Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Shaman Addon", thingId = {male=154,female=158}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f154.png", "f158.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Norseman Addon", thingId = {male=251,female=252}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 10, icons = {"f251.png", "f252.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Nightmare Addon", thingId = {male=268,female=269}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 10, icons = {"f268.png", "f269.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Jester Addon", thingId = {male=273,female=270}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 5, icons = {"f273.png", "f270.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Brotherhood Addon", thingId = {male=278,female=279}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 10, icons = {"f278.png", "f279.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Demonhunter Addon", thingId = {male=289,female=288}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 10, icons = {"f289.png", "f288.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Yalaharian Addon", thingId = {male=325,female=324}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 5, icons = {"f325.png", "f324.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Newly Wed", thingId = {male=328,female=329}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 30, icons = {"f328.png", "f329.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Warmaster Addon", thingId = {male=335,female=336}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 30, icons = {"f335.png", "f336.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Wayfarer Addon", thingId = {male=367,female=366}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f367.png", "f366.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Afflicted Addon", thingId = {male=430,female=431}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 5, icons = {"f430.png", "f431.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Elementalist Addon", thingId = {male=432,female=433}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 80, icons = {"f432.png", "f433.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Deepling Addon", thingId = {male=463,female=464}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f463.png", "f464.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Insectoid Addon", thingId = {male=465,female=466}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 30, icons = {"f465.png", "f466.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Entrepreneur Addon", thingId = {male=472,female=471}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f472.png", "f471.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Crystal Warlord Addon", thingId = {male=512,female=513}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f512.png", "f513.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Soil Guardian Addon", thingId = {male=516,female=514}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f516.png", "f514.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Demon Addon", thingId = {male=541,female=542}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f541.png", "f542.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Cave Explorer Addon", thingId = {male=544,female=575}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"f544.png", "f575.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Dream Warden Addon", thingId = {male=577,female=578}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f577.png", "f578.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Glooth Engineer Addon", thingId = {male=610,female=618}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f610.png", "f618.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Jersey", thingId = {male=619,female=620}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f619.png", "f620.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Champion Addon", thingId = {male=633,female=632}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f633.png", "f632.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Conjurer Addon", thingId = {male=634,female=635}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f634.png", "f635.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Beastmaster Addon", thingId = {male=637,female=636}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f637.png", "f636.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Chaos Acolyte Addon", thingId = {male=665,female=664}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f665.png", "f664.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Death Herald Addon", thingId = {male=667,female=666}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f667.png", "f666.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Ranger Addon", thingId = {male=684,female=683}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f684.png", "f683.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Ceremonial Garb Addon", thingId = {male=695,female=694}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f695.png", "f694.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Puppeteer Addon", thingId = {male=697,female=696}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f697.png", "f696.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Spirit Caller Addon", thingId = {male=699,female=698}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f699.png", "f698.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Evoker Addon", thingId = {male=725,female=724}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f725.png", "f724.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Seaweaver Addon", thingId = {male=733,female=732}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f733.png", "f732.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Recruiter Addon", thingId = {male=746,female=745}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f746.png", "f745.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Sea Dog Addon", thingId = {male=750,female=749}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f750.png", "f749.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Royal Pumpkin Addon", thingId = {male=760,female=759}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f760.png", "f759.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			--{name = "Rift Warrior Addon", thingId = {male=846,female=845}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f846.png", "f845.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Winter Warden Addon", thingId = {male=853,female=852}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f853.png", "f852.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Philosopher Addon", thingId = {male=874,female=873}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f874.png", "f873.png"}},
			-- Addon Example : thingId = lookType, addon = ( 1 = addon 1, 2 = addon 2, 3 = both addons)
			{name = "Arena Champion Addon", thingId = {male=884,female=885}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 60, icons = {"f884.png", "f885.png"}},
		}
	},

	{
		name = "Przedmioty",
		description = "A moze cos kupisz?",
		state = GameStore.States.STATE_NONE,
		icons = {"Category_Items.png"},
		offers = {
			{name = "crystalline token", thingId = 18423, count = 5, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"18423.png"}, description = "Become rich!"},
			-- Item Example : thingId = itemId
			{name = "Yalahari Mask", thingId = 9778, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Yalahari_Mask.png"}, description = "Become rich!"},
			{name = "Golden Helmet", thingId = 2471, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 100, icons = {"Golden_Helmet.png"}, description = "Become rich!"},
			{name = "Prismatic Helmet", thingId = 18403, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Prismatic_Helmet.png"}, description = "Become rich!"},
			{name = "Gill Gugel", thingId = 18398, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Gill_Gugel.png"}, description = "Become rich!"},
			{name = "Elite Draken Helmet", thingId = 12645, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Elite_Draken_Helmet.png"}, description = "Become rich!"},
			{name = "Werewolf Helmet", thingId = 24718, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Werewolf_Helmet.png"}, description = "Become rich!"},
			{name = "Depth Galea", thingId = 15408, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Depth_Galea.png"}, description = "Become rich!"},
			--Armorid--
			{name = "Demon Armor", thingId = 2494, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Demon_Armor.png"}, description = "Become rich!"},
			{name = "Fire Born Giant Armor", thingId = 8881, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Fireborn_Giant_Armor.png"}, description = "Become rich!"},
			{name = "Royal Draken Mail", thingId = 12642, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Royal_Draken_Mail.png"}, description = "Become rich!"},
			{name = "Gill Coat", thingId = 18399, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Gill_Coat.png"}, description = "Become rich!"},
			{name = "Depth Lorica", thingId = 15407, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 30, icons = {"Depth_Lorica.png"}, description = "Become rich!"},
			{name = "Furios Frock", thingId = 21725, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Furious_Frock.png"}, description = "Become rich!"},
			{name = "Ornate Chestplate", thingId = 15406, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Ornate_Chestplate.png"}, description = "Become rich!"},
			{name = "Earthborn Titan Armor", thingId = 8882, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Earthborn_Titan_Armor.png"}, description = "Become rich!"},
			{name = "Wind Born Colossus Armor", thingId = 8883, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Windborn_Colossus_Armor.png"}, description = "Become rich!"},
			{name = "Master Acher's Armor", thingId = 8888, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Master_Archer's_Armor.png"}, description = "Become rich!"},
			--Legsid--
			{name = "Demon Legs", thingId = 2495, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 30, icons = {"Demon_Legs.png"}, description = "Become rich!"},
			{name = "Grasshopper Legs", thingId = 15490, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Grasshopper_Legs.png"}, description = "Become rich!"},
			{name = "Depth Ocrea", thingId = 15409, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Depth_Ocrea.png"}, description = "Become rich!"},
			{name = "Primatic Legs", thingId = 18405, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Prismatic_Legs.png"}, description = "Become rich!"},
			{name = "Gill Legs", thingId = 18400, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Gill_Legs.png"}, description = "Become rich!"},
			{name = "Ornate Legs", thingId = 15412, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Ornate_Legs.png"}, description = "Become rich!"},
			{name = "Dwarven Legs", thingId = 2504, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Dwarven_Legs.png"}, description = "Become rich!"},
			{name = "Icy Culotte", thingId = 21700, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Icy_Culottes.png"}, description = "Become rich!"},
			--Bootsid--
			{name = "Boots of Haste", thingId = 2195, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 3, icons = {"Boots_of_Haste.png"}, description = "Become rich!"},
			{name = "Golden Boots", thingId = 2646, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 50, icons = {"Golden_Boots.png"}, description = "Become rich!"},
			{name = "Pair Soft Boots", thingId = 2640, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Pair_of_Soft_Boots.png"}, description = "Become rich!"},
			--Shieldid--
			{name = "Depth Scutum", thingId = 15411, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 3, icons = {"Depth_Scutum.png"}, description = "Become rich!"},
			{name = "Shield of Corruption", thingId = 12644, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 30, icons = {"Shield_of_Corruption.png"}, description = "Become rich!"},
			{name = "Prismatic Shield", thingId = 18410, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Prismatic_Shield.png"}, description = "Become rich!"},
			{name = "Ornate Shield", thingId = 15413, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Ornate_Shield.png"}, description = "Become rich!"},
			{name = "Spelbook of Vigilance", thingId = 18401, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Spellbook_of_Vigilance.png"}, description = "Become rich!"},
			{name = "Spellbook of Ancient Arcana", thingId = 16112, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 30, icons = {"Spellbook_of_Ancient_Arcana.png"}, description = "Become rich!"},
			{name = "Umbral spellbook", thingId = 22423, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Umbral_Spellbook.png"}, description = "Become rich!"},
			{name = "Umbral Master Spellbook", thingId = 22424, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 60, icons = {"Umbral_Master_Spellbook.png"}, description = "Become rich!"},
			{name = "Great Shield", thingId = 2522, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 80, icons = {"Great_Shield.png"}, description = "Become rich!"},
			{name = "Blessed Shield", thingId = 2523, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 100, icons = {"Blessed_Shield.png"}, description = "Become rich!"},
		}
	},

	{
		name = "Wyposazenie domu",
		description = "Odpicuj swoja chate nie do poznania, a moze to wlasnie Ciebie odwiedzi nasza ekipa MTV Cribs!",
		state = GameStore.States.STATE_NONE,
		icons = {"Category_HouseEquipment.png"},
		offers = {
			-- Item Example : thingId = itemId
			{name = "Parrot", thingId = 27088, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 180, icons = {"26890.png"}, description = "Become rich!"},
			{name = "Fish Tank", thingId = 26347, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 180, icons = {"26344.png"}, description = "Become rich!"},
			{name = "Dog House", thingId = 26353, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 150, icons = {"26349.png"}, description = "Become rich!"},
			{name = "Baby Dragon", thingId = 26098, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 250, icons = {"26098.png"}, description = "Become rich!"},
			{name = "Cat in a Basket", thingId = 26107, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 150, icons = {"26107.png"}, description = "Become rich!"},
			{name = "Hamster in a Wheel", thingId = 26100, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 180, icons = {"26100.png"}, description = "Become rich!"},
		}
	},

	{
		name = "Inne",
		description = "Jestesmy  tolerancyjni, wiec zmieniaj co chcesz.",
		state = GameStore.States.STATE_NONE,
		icons = {"Category_ExtraServices.png"},
		offers = {
			-- NameChange example
			{name = "Character Name Change", type = GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE, price = 20, icons = {"Product_CharacterNameChange.png"}},
			-- Sexchange example
			{name = "Character Sex Change", type = GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE, price = 20, icons = {"Product_CharacterSexChange.png"}},
			-- Promotion example
			--{name = "First Promotion", thingId = 1--[[ed/ms/rp/ek]], type = GameStore.OfferTypes.OFFER_TYPE_PROMOTION, price = 100, icons = {"Product_FirstPromotion.png"}}
		}
	},
}

-- For Explanation and information
-- view the readme.md file in github or via markdown viewer.

-- Non-Editable
local runningId = 1
for k, category in ipairs(GameStore.Categories) do
	if category.offers then
		for m, offer in ipairs(category.offers) do
			offer.id = runningId
			runningId = runningId + 1
			
			if not offer.type then
				offer.type = GameStore.OfferTypes.OFFER_TYPE_NONE
			end
		end
	end
end
