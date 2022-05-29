package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
GlobalItem  = {}

function GlobalItem.Fun(IsMatch)
    MSG("LYLUa 删除百科")
    DeleteAllWiki()
    MSG("LYLUa 使用道具")
    LoopUseItem("Phoenix Plume")
    LoopUseItem("Soul Leaf")
    LoopUseItem("Eternity Essence")
    LoopUseItem("Creation Fragment")
    LoopUseItem("Harmony Shard Pouch (M)")
    LoopUseItem("Ancient Platinum Coin")
    LoopUseItem("Launch Commemoration Gold Coin")
    LoopUseItem("Ancient Gold Coin")
    LoopUseItem("Thin Gold Bar")
    LoopUseItem("Thick Gold Bar")
    LoopUseItem("Stronghold Activity Relief Chest")
    LoopUseItem("Ascendant Ship Parts Chest ") 
    LoopUseItem("Ascendant Ship Parts Chest II") 
    LoopUseItem("Regulus' Light Currency Chest") 
    LoopUseItemBox(0,"Breath Selection Chest")
    LoopUseItemBox(0,"Sailing Coin Selection Chest")
    LoopUseItemBox(5,"Battle Item Selection Chest")
    LoopUseItemBox(0,"Ascendant Gem Selection Chest")

    -----------------------
    LoopUseItem("Gratitude Gift Item Pack")
    LoopUseItem("Gratitude Gift Decoration Pack")
    LoopUseItem("Pheon")
    LoopUseItem("[Event] Reskin Ticket")
    LoopUseItem("Menelik's Tome")
    LoopUseItem("Crystalline Aura (3 days)")

    LoopUseItem("Phantom Palace Normal Cleared Reward")
    LoopUseItem("Realm of Elementals Normal Cleared Reward")
    LoopUseItem("Gherdia Elimination Rewards (Normal)")
    LoopUseItem("Stardust Forest Clear Reward")
    LoopUseItem("Storm Temple Clear Reward")
    LoopUseItem("Ruptured Seal Site Cleared Reward")
    LoopUseItem("Battle Item Selection Chest")
 
    -----------------------

    	--使用卡片
	local ItemList = {
		"Ligheas Card",
		"Berhart Card",
		"Ugo Card",
		"Varut Card",
		"Giant Worm Card",
		"Dadan Card",
		"Jahia Card",
		"Gabrian Card",
		"Azaran Card",
		"Halrock Card",
		"Cadogan Card",
		"Nahun Card",	
		"Harzal Card",	
        "Solas Card",	
		"Rictus Card",	
		"Hiebike Card",	
		"Ed the Red Card",	
		"Heretic High Priest Card"
	}
	Item_L_UseBoxList(ItemList)

     	--使用卡片
	local ItemList = {
        "Rekiel Card",
        "Jagan Card",
        "J Card",
        "S Card",
        "Occel Card",		
		"Hybee Executioner Card",
		"Thanatos Card",	
		"Sir Valleylead Card",
		"Sakkul Card",
		"S Card",
		"Tir Card",
		"Sir Druden Card"
	}
	Item_L_UseBoxList(ItemList)

	if Task_L_GetLev() >= 48 then
		--删除药品
		local ItemList = {
            "HP Potion",
			"Apprentice Healing Potion",
			"Normal Healing Potion",
			"Major Healing Potion",
			"Adept Healing Potion",
			"Radiant Zagoras Crystals",
			"Vernil Carpentry Toolbox",
			"Remembrance Necklace",
			"Tournament Champion's Plate",
			"Epic Rapport Chest",
            "Useful Equipment Piece",
            "Broken Equipment Powder",
            "Entrance Ticket: Cube (Bound)",
            "Epic Rapport Selection Chest",
			"Old Logging Tool (Axe)"
		}
		Item_L_DeleteList(ItemList)

        
        --战斗道具
        local ItemList = {
            "Destruction Bomb (Bound)",
            "Clay Grenade (Bound)",
            "Whirlwind Grenade (Bound)",
            "Dark Grenade (Bound)",
            "Electric Grenade (Bound)",
            "Frost Grenade (Bound)",
            "Flame Grenade (Bound)",
            "Flash Grenade (Bound)",
            "Flame Grenade (Bound)",
            "Swiftness Robe (Bound)",
            "Thunder Potion (Bound)",
            "Protective Potion (Bound)",
            "Marching Flag (Bound)",
            "Structure: Everyone's Lost Ark",
            "Panacea (Bound)"
        }
        Item_L_DeleteList(ItemList)

        --删除道具
        local ItemList = {
            "Rare Battle Engraving Recipe Selection Pouch",
            "Uncommon Combat Engraving Recipe Selection Pouch",
            "Uncommon Battle Engraving Recipe Pouch",
            "Uncommon Engraving Recipe Selection Chest (Class Exclusive)",
            "Stronghold Energy (S)",
            "Stronghold Energy (M)",
            "Vernese Wine",
            "Veloran's Orders",
            "Rice",
            "Grain",
            "Connie's Orchard Storage Key",
            "Drops of Ether Engraving Recipe",
            "Expert Engraving Recipe",
            "Minor Life Energy Potion",
            "Leap's Essence",
            "Secret Map"
        }
        Item_L_DeleteList(ItemList)

        --删除道具
        local ItemList = {
            "Aura of Resonance Recovery Elixir (14 days)",
            "Max MP Increase Engraving Recipe"
        }
        Item_L_DeleteList(ItemList)
	end
end

return GlobalItem