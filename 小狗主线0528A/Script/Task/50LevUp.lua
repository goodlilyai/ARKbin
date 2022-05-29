
function LevUpGlobalFun(IsMatch)
	MSG("LYLUa: 50直升 0503")
	Task_L_SetFuHuo(2);
	Task_L_SetMomentDrug();
	---开任务奖励箱子
	Task_L_UseItemBoxAndPick("Royal Reward")
	Task_L_UseItemBoxAndPick("Borea's Domain Supplies")
	Task_L_UseItemBoxAndPick("Relic Box of the Dead")

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
		"Heretic High Priest Card",
		"Solas Card",	
		"Rictus Card",	
		"Hiebike Card",	
		"Ed the Red Card",	
		"Thanatos Card",	
		"Hybee Executioner Card",
		"Thanatos Card",	
		"Hybee Executioner Card",
		"Sir Valleylead Card",
		"Sakkul Card",	
		"Sir Druden Card"
	}
	Item_L_UseBoxList(ItemList)

	--删除道具
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
		"Panacea (Bound)",
		"Stronghold Energy (S)",
		"Stronghold Energy (M)",
		"Vernese Wine",
		"Veloran's Orders",
		"Rice",
		"Grain",
		"Secret Map"
	}
	Item_L_DeleteList(ItemList)

	Task_L_UseItemBook("Emote: Interrogate")
	Task_L_UseItemBook("Emote: Surrender")
	Task_L_UseItemBook("Emote: Respect")
	Task_L_UseItemBook("Emote: Cheers")
	Task_L_UseItemBook("Emote: Pray")

	--使用物品
	local ItemList = {
		"Phoenix Plume",--复活羽毛
		"Ancient Platinum Coin",
		"Ancient Gold Coin"
	}
	Item_L_UseItemList(ItemList)

	----------学习技能
	if Task_L_GetLev() >= 45 then
		Task_L_AddSkill("Shoulder Charge",7,1,3,0)
		Task_L_AddSkill("Whirlwind",10,3,2,1)
		Task_L_AddSkill("Power Break",10,3,2,2)
		Task_L_AddSkill("Finish Strike",10,2,3,1)
		Task_L_AddSkill("Sword Storm",10,3,2,2)
		Task_L_AddSkill("Aura Blade",10,1,2,1)
	end

	if Task_L_GetLev() >= 50 then
		--删除药品
		local ItemList = {
			"Apprentice Healing Potion",
			"Normal Healing Potion",
			"Major Healing Potion",
			"Adept Healing Potion",
			"Old Logging Tool (Axe)"
		}
		Item_L_DeleteList(ItemList)
	end

	----------自动装备物品
	Task_L_LoopEquipFun()

end

Auto50LevUpTask = {}
--自动主线任务
--返回值：2，混沌次数为0 
function Auto50LevUpTask.FB(IsMatch)
	---------------------------------------------------------------------------------
	----------------------------------------50级直升出生地图,贝隆城------------------
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10001) then

		local point = {"",0,100,10764,140,14}
		Task_L_AutoGetTo(0x18e0d ,1,10001,point,0,0) 
		Task_L_UseEquipBox("Сундучок исследователя I")

		local point = {"",0,300,10861,59,25}
		Task_L_Collection(0x18e0d ,2,point)
		--先预览职业，然后转职，在走到第三步的点
		local point = {"",0,100,11865,139,15}
		Task_L_AutoGetTo(0x18e0d ,3,10001,point,10,0) 
		
		local point = {"",0,100,12701,120,233}
		Task_L_TalkToNpc(0x18e0d ,4,point,"Beatrice",1,1,2)
	end
	---------------------------------------------------------------------------------

	if Fun_IsInMapByMapId(10200) then
		MSG("LYLUa: 跳过新手序列")
		LevUpPassLand()
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10021) then
		MSG("LYLUa: 跳过新手序列")
		LevUpPassLand()
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10023) then
		MSG("LYLUa: 跳过新手序列")
		LevUpPassLand()
	end
 	---------------------------------------------------------------------------------
	 if Fun_IsInMapByMapId(10008) then
		MSG("LYLUa: 跳过新手序列")
		LevUpPassLand()
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11102) then
		LevUpGlobalFun(0)

		if Task_L_UseEquipBox("North Vern Pass Equipment Chest") then
			Task_L_LoopEquipFun()
			Task_L_LoopEquipFun()
			Task_L_LoopEquipFun()
			Task_L_LoopEquipFun()
			Task_L_UseItemBook("Mount: Frost Wolf")--狼坐骑
			--Task_L_UseEquipBox("Маргаритка")--宠物蛋

			Task_L_PushDownSkill("Sword Storm",0)
			Task_L_PushDownSkill("Assault Blade",1)
			Task_L_PushDownSkill("Crime Hazard",2)
			Task_L_PushDownSkill("Finish Strike",3)
			Task_L_PushDownSkill("Shoulder Charge",4)
			Task_L_PushDownSkill("Whirlwind",5)
			Task_L_PushDownSkill("Power Break",6)
			Task_L_PushDownSkill("Aura Blade",7)
			Task_L_PushDwonDrug(0x401ed9,1,"Super Healing Potion")
			---删除没用的物品----
			Task_L_DeleteItem("Apprentice Healing Potion")
			Task_L_DeleteItem("Normal Healing Potion")
			Task_L_DeleteItem("Lion Mask")
			--Task_L_DeleteItem("Mount: Ladybug Selection Chest")	
			Task_L_ResetSkill()
			Task_L_ResetSkill()
		end

		if Fun_IsHaveTask(0x401ed9,1) == 1 then 
			CallPets()
		end

		local point = {"",1,2000,23530,-33009,3776}
		if Fun_IsInPoint(point) == 1 then
			local point = {"",2,100,23530,-33009,3776}
			Task_L_UseTaskItem(0x401ed9 ,1,point)
		else
			local point = {"",2,100,7563,7675,4337}
			Task_L_UseTaskItem(0x401ed9 ,1,point)
		end

		--使用传送阵
		local point = {"",1,100,5427,8032,4273}
		if Task_L_UseTransmitPoint(0x401ed9,2,"Crafting District",point) then
			local point = {"",1,100,7563,7675,4337}
			Task_L_TalkToNpc(0x401ed9 ,2,point,"Novice Instructor Ino",0,1,1)
		end

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,3,point,"Novice Instructor Ino",0,1,2)

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,4,point,"Novice Instructor Ino",0,1,3)

		if Fun_IsHaveTask(0x401ed9,5) == 1 then 
			Task_L_PushDwonDrug(0x401ed9,5,"Super Healing Potion")
			Task_L_UseItemBook("Mount: Frost Wolf")--狼坐骑

			--把马放下来，然后骑马
			Task_L_Horse(0x401ed9 ,5,"Frost Wolf")
		end

		local point = {"",1,1000,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,6,point,"Novice Instructor Ino",0,1,4)

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,7,point,"Novice Instructor Ino",0,1,5)

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,8,point,"Novice Instructor Ino",0,1,6)

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,9,point,"Novice Instructor Ino",0,1,7)

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,10,point,"Novice Instructor Ino",0,1,8)

		local point = {"",1,100,7563,7675,4337}
		Task_L_TalkToNpc(0x401ed9 ,11,point,"Novice Instructor Ino",0,1,9)

		if Task_L_GetTaskIsComplete(0x401ed9) then
			--石头解封
			local point = {"Professor Mosby",2,100,7707,7367,4340}
			if Task_L_StoneUnseal(0x401ed9 ,12,"Stone of Birth",point) then
				--装备石头
				Task_L_UseItemStone("Stone of Birth")
			end

			local point = {"",1,100,7563,7675,4337}
			Task_L_CompleteTask(0x401ed9,12,point,"Novice Instructor Ino",-1)
		else
			local point = {"",1,100,7563,7675,4337}
			Task_L_UseTaskItem(0x401ed9 ,12,point)
		end
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end

	if Fun_IsInMapByMapId(11101) then
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end
	if Fun_IsInMapByMapId(11111) then
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end
	if Fun_IsInMapByMapId(11112) then
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end
	if Fun_IsInMapByMapId(11113) then
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end
	if Fun_IsInMapByMapId(11114) then
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end
	if Fun_IsInMapByMapId(11115) then
		if Task_L_FindTask(0x401ed9) == 0 then
			return 50
		end
	end

end
return Auto50LevUpTask