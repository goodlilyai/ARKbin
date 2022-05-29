
function GlobalFun(IsMatch)
	MSG("LYLUa: 初始化  0526")
	Task_L_SetFuHuo(2)
	Task_L_SetMomentDrug()
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
		"S Card",
		"Tir Card",
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
		"Connie's Orchard Storage Key",
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
	if Task_L_GetLev() >= 12 then
		Task_L_AddSkill("Shoulder Charge",4,1,0,0)
		Task_L_AddSkill("Double Slash",4,2,0,0)
		Task_L_AddSkill("Assault Blade",4,2,0,0)
		Task_L_AddSkill("Crime Hazard",4,3,0,0)
	end

	if Task_L_GetLev() >= 14 then
		Task_L_AddSkill("Finish Strike",4,2,0,0)
		Task_L_AddSkill("Power Break",4,3,0,0)
	end

	if Task_L_GetLev() >= 17 then
		Task_L_AddSkill("Crime Hazard",7,3,2,0)
		Task_L_AddSkill("Finish Strike",7,2,3,0)
		Task_L_AddSkill("Power Break",7,3,2,0)
	end

	if Task_L_GetLev() >= 20 then
		Task_L_AddSkill("Crime Hazard",10,3,2,2)
		Task_L_AddSkill("Finish Strike",10,2,3,1)
	end

	if Task_L_GetLev() >= 30 then
		Task_L_AddSkill("Power Break",10,3,2,2)
	end

	if Task_L_GetLev() >= 40 then
		Task_L_AddSkill("Finish Strike",10,2,3,1)
		Task_L_AddSkill("Power Break",10,3,2,2)
		Task_L_AddSkill("Sword Storm",7,3,2,0)
		
		Task_L_PushDownSkill("Sword Storm",0)
	end

	if Task_L_GetLev() >= 45 then
		Task_L_AddSkill("Sword Storm",10,3,2,2)
	end

	if Task_L_GetLev() >= 48 then
		--删除药品
		local ItemList = {
			"Apprentice Healing Potion",
			"Normal Healing Potion",
			"Major Healing Potion",
			"Adept Healing Potion",
			"Radiant Zagoras Crystals",
			"Vernil Carpentry Toolbox",
			"Stronghold Energy (M)",
			"Remembrance Necklace",
			"Tournament Champion's Plate",
			"Epic Rapport Chest",
			"Old Logging Tool (Axe)"
		}
		Item_L_DeleteList(ItemList)
	end

	if Task_L_GetEquipLev() >= 300 then
		--删除药品
		local ItemList = {
			"Expert Healing Potion"
		}
		Item_L_DeleteList(ItemList)
	end

	----------自动装备物品
	Task_L_LoopEquipFun()

end

AutoTaskThread = {}
--自动主线任务
--返回值：2，混沌次数为0 
function AutoTaskThread.FB(IsMatch)
	package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
	local fun = require("Script.LYFun")
	local KingLutlandBasefun = require("Script.Task.TaskDungeon.KingLutlandBase")
	local LightInTheDarkFun = require("Script.Task.TaskDungeon.LightInTheDark")
	local PirateLairFun = require("Script.Task.TaskDungeon.PirateLair")
	local ToToHeartFun = require("Script.Task.TaskDungeon.ToToHeart")
	local CaveOfDeadFun = require("Script.Task.TaskDungeon.CaveOfDead")
	local LifeAndDeathFun = require("Script.Task.TaskDungeon.LifeAndDeath")
	local YanZhiEnchantmentNormalFun = require("Script.Task.TaskDungeon.YanZhiEnchantmentNormal");
	local AierGaiciFun = require("Script.Task.TaskDungeon.AierGaici")
	local AiXiManFun = require("Script.Task.TaskDungeon.AiXiMan")
	local JiuChangFun = require("Script.Task.TaskDungeon.JiuChang")
	local GlobalItemFun = require("Script.GlobalItem")
	---------------------------------------------------------------------------
	--1-50任务终止点
	if IsMatch == 50 then
		if Fun_IsInMapByMapId(30703) or Fun_IsInMapByMapId(30704) then
			local point = {"",2,100,12779,16778,1}
			Task_H_GetInDockAndBackLand(0x10d0b3,2,point) 
		end

		if Fun_IsHaveTask(0x10d0b3, 1) == 1 or Fun_IsHaveTask(0x10d0b3, 2) == 1 then
			return 50
		end

		if Fun_IsHaveTask(0x635dc, 1) == 1 then
			return 50
		end

		if Task_L_FindTask(0x10dad9) == 1 then
			return 50
		end

		if Task_L_FindTask(0x3d1329) == 1 then
			return 50
		end

		if Task_L_FindTask(0x4d9d89) == 1 then
			return 50
		end
		
		if Task_L_FindTask(0x639c1) == 1 then
			return 50
		end
		
		if Task_L_FindTask(0x452019) == 1 then
			return 50
		end
		if Task_L_FindTask(0x45201a) == 1 then
			return 50
		end
		if Task_L_FindTask(0x62e0a) == 1 then
			return 50
		end
	end

	---------------------------------------------------------------------------
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
	----------------------------------------家园地图---------------------------------
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(30651) then
		local point = {"",1,100,10393,3065,886}
		Task_L_TalkToNpc(0x41a0c9 ,1,point,"Adeline",0,1,1)

		local point1 = {"Collect",0,100,10492,4097,1072}
		local point2 = {"Collect",1,100,10325,4107,1072}
		local point3 = {"Collect",2,100,10581,3957,1072}
		Task_L_BranchLine(0x41a0c9,2,3,point1,point2,point3)

		local point = {"",1,100,10565,4339,1072}
		Task_L_TalkToNpc(0x41a0c9 ,3,point,"Mail Carrier Goldbeard",0,1,1)

		local point = {"",1,100,12010,4701,1319}
		Task_L_AutoGetTo(0x41a0c9 ,4,30651,point,0,0) 

		local point = {"",1,300,12077,4693,1319}
		Task_L_Collection(0x41a0c9 ,5,point)

		local point = {"",1,100,12077,4693,1319}
		Task_L_CompleteTask(0x41a0c9 ,5,point,"Adorable Felix",-1)

		local point = {"",1,100,12077,4693,1319}
		Task_L_TalkToNpc(0x41a0d0 ,1,point,"Adorable Felix",0,1,1)

		local point = {"",1,100,11905,4699,1319}
		Task_L_UseExpression(0x41a0d0,3,"Applause",point) 

		local point = {"",1,100,12077,4693,1319}
		Task_L_TalkToNpc(0x41a0d0 ,4,point,"Adorable Felix",0,1,2)

		local point = {"",1,100,11653,4483,1319}
		Task_L_TalkToNpc(0x41a0d0 ,5,point,"Adeline",0,1,9)

		local point1 = {"",1,100,12099,3747,1319}	
		local point2 = {"",1,100,12359,3573,1319}	
		local point3 = {"",1,100,12546,3347,2148}	
		Task_L_LongGetTo(0x41a0d0,6,30651,3,point1,point2,point3)
			
		local point = {"",1,300,12546,3347,2148}	
		Task_L_Collection(0x41a0d0 ,7,point)
	
		local point1 = {"",1,100,12546,3347,2148}
		local point2 = {"",1,100,12718,3484,2148}	
		local point3 = {"",1,100,12165,4072,1319}	
		if Task_L_LongGetTo(0x41a0ca,1,30651,3,point1,point2,point3) then
			local point = {"",1,100,12165,4072,1319}	
			Task_L_TalkToNpc(0x41a0ca ,1,point,"Adeline",0,1,8)
		end

		local point = {"",1,100,12165,4072,1319}	
		Task_L_UseTaskItem(0x41a0ca ,2,point)

		local point = {"",1,100,12165,4072,1319}	
		Task_L_TalkToNpc(0x41a0ca ,3,point,"Adeline",0,1,2)

		local point = {"",1,100,13684,374,1503}
		Task_L_AutoGetTo(0x41a0ca ,4,30651,point,0,0) 

		local point = {"",1,100,13817,-789,1503}	
		Task_L_TalkToNpc(0x41a0ca ,5,point,"Adeline",0,1,0xA)

		--0x41a0d1，1  需要制作 Purchase of new crafting tools  这个需要很久10秒 
		--做完需要接收 然后需要退出这个界面 需要标志
		Fun_L_HomeCraft(0x41a0d1 ,1,0)
		
		local point = {"",1,100,13817,-789,1503}	
		Task_L_TalkToNpc(0x41a0d1 ,2,point,"Adeline",0,1,4)
		--0x41a0d1，3  需要制作 HP Potions  这个需要很久10秒 
		--做完需要接收 然后需要退出这个界面 需要标志
		Fun_L_HomeCraft(0x41a0d1 ,3,1)

		local point = {"",1,100,14607,4952,1891}
		Task_L_AutoGetTo(0x41a0cb ,1,30651,point,0,0) 

		local point = {"",1,100,14607,4952,1891}
		Task_L_TalkToNpc(0x41a0cb ,2,point,"Adeline",0,1,3)

		local point = {"",1,100,14607,4952,1891}
		Task_L_CompleteTask(0x41a0cb ,2,point,"Adeline",-1)

		--0x41a0cd，1  需要制作 Build Bella Lucia  这个需要很久15秒 
		Fun_L_HomeCraft(0x41a0cd ,1,2)
		--0x41a0cd，2  需要制作 regular task  这个需要很久15秒 
		--做完需要接收 然后需要退出这个界面 需要标志
		Fun_L_HomeCraft(0x41a0cd ,2,3)

		local point = {"",1,100,14607,4952,1891}
		Task_L_TalkToNpc(0x41a0cd ,3,point,"Adeline",0,1,5)

		--0x41a0cc，1  需要制作 Trade Permit  这个需要很久15秒 
		--做完需要接收 然后需要退出这个界面 需要标志
		Fun_L_HomeCraft(0x41a0cc ,1,4)

		local point = {"Radiant Zagoras Crystals",1,300,10485,5339,1072}
		if Task_L_BuyHomeItem(0x41a0cc,2,1,1,point) then
			local point = {"",1,100,11632,4846,1319}
			Task_L_TalkToNpc(0x41a0cc ,2,point,"Adeline",0,1,6)
		end

		local point = {"",1,100,13623,8504,1319}
		Task_L_AutoGetTo(0x41a0cc ,3,30651,point,0,0) 

		local point = {"",1,100,13623,8504,1319}
		Task_L_CompleteTask(0x41a0cc ,4,point,"Adeline",-1)

		--0x41a0ce，1  需要制作 Lab2 Lv2  这个需要很久15秒 
		--做完需要接收 然后需要退出这个界面 需要标志
		Fun_L_HomeCraft(0x41a0ce ,1,5)

		local point = {"",1,100,13623,8504,1319}
		Task_L_TalkToNpc(0x41a0ce ,2,point,"Adeline",0,1,7)

		local point = {"",1,100,13623,8504,1319}
		Task_L_CompleteTask(0x41a0ce ,2,point,"Adeline",-1)

		Task_L_UseEquipBox("Structure: Bed")
		Task_L_UseEquipBox("Structure: Hut")
		Task_L_UseEquipBox("Structure: Food Ingredient Canopy")
		Task_L_UseEquipBox("Stronghold Crew Application Form: Austin")
		Task_L_UseEquipBox("Stronghold Crew Application Form: Zenith")
		Task_L_UseEquipBox("Structure: Wooden Barrel")
		Task_L_UseEquipBox("Structure: Solid Safe Box")
		Task_L_UseEquipBox("Structure: Load Wagon")
		Task_L_UseEquipBox("Structure: Wood Board Chair")
	
        local task_id_arr = { 0x41a0c9, 0x41a0ca,0x41a0cb,0x41a0cc,0x41a0cd,0x41a0ce ,0x41a0d0,0x41a0d1}
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { 13623,8504,1319 }  --坐标位置 用来判断
        local range = 500  --范围
        Task_CheckTaskOverEx(30651, task_id_arr, type, rangept, range)

	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10200) then
		--跳过新手中间任务

		Task_ForgottenLand(0x19f0a1,1)
		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10212) then
		GlobalFun(0)
		local point = {"",1,100,39,557,1727}
		Task_L_AutoGetTo(0x31129 ,1,10212,point,0,0) 
	
		--Task_L_UseEquipBox("Сундучок исследователя I")

		local point = {"",1,800,375,483,1728}
		Task_L_LoopAttackMonMore(0x31129,2,0,1,point)
				
		local point = {"",1,100,741,871,1728}
		Task_L_TalkToNpc(0x31129 ,3,point,"Armen",0,1,1)

		local point = {"",1,300,551,435,1728}
		Task_L_Collection(0x3112a ,1,point)
		
		local point = {"",1,300,312,4346,1731}
		Task_L_Collection(0x3112a ,2,point)
		
		local point = {"",1,300,436,1904,1728}	
		Task_L_Attack(0x3112a ,3,point,0,0)
		
		local point = {"",1,100,581,1304,1728}	
		Task_L_TalkToNpc(0x3112a ,4,point,"Armen",0,1,1)

		local point1 = {"Runa Pass",1,100,2078,287,1724}
		local point2 = {"Prideholme",1,100,10883,3975,764}
		local point3 = {"Prideholme Cathedral",1,100,11183,4001,-37345}	
		if Task_L_StageGoto(0x3112b ,1,3,point1,point2,point3) then
		
			local point = {"",1,100,11701,3942,-37350}
			Task_L_AutoGetTo(0x3112b ,1,10212,point,0,0) 
		end
		
		local point = {"",1,100,12033,3978,-37345}
		Task_L_TalkToNpc(0x3112b ,2,point,"Varut",0,1,1)

		local point = {"",1,100,10058,3990,-37345}
		Task_L_AutoGetTo(0x31519 ,1,10212,point,0,0) 

	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10008) then
		MSG("LYLUa: 坐船等待。。。")
		Task_L_TrainingGround(10008)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11119) then
		MSG("LYLUa: 坐船等待。。。")
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10326) then
		MSG("LYLUa: 坐船等待。。。")
	end
	---------------------------------------------------------------------------------
	----------------------------------------混沌副本---------------------------------
	---------------------------------------------------------------------------------
	if Fun_IsInChaos("Чертоги Хаоса") == 1 then
		Fun_ChaoAttack(0)
	end
	---------------------------------------------------------------------------
	-------------------------------卢兰西部------------------------------------
	---------------------------------------------------------------------------
	--第一张地图
	if Fun_IsInMapByMapId(10201) then
		GlobalFun(0)

		if IsMatch == 10 then
			MSG("Lei 10级邮寄")	

			local point = {"Prideholme",1,100,6862,8614,260}
			Task_L_LongGetTo(0x31519,1,10201,1,point)

			local point = {"",1,100,6862,8614,260}
			Task_L_Email(0x31519,1,point)
		else
			--这里是交任务
			local point = {"",1,100,10053,4334,517}
			Task_L_CompleteTask(0x31519 ,1,point,"Brother Alfael",2)
		end
		--使用马
		Task_L_UseItem(0x320cc ,1,"Loghill Black Horse")
		--把马放下来，然后骑马
		Task_L_Horse(0x320cc ,2,"Loghill Black Horse")

		local point1 = {"Prideholme",1,100,9065,8303,275}
		local point2 = {"Prideholme",1,100,9053,8569,275}
		local point3 = {"Neria's Tavern",1,100,9504,9061,-15355}	
		if Task_L_LongGetTo(0x31512,1,10201,3,point1,point2,point3) then
			local point = {"",1,100,9504,9061,-15355}
			Task_L_TalkToNpc(0x31512 ,1,point,"Neria",0,1,2)
		end
		
		local point1 = {"Neria's Tavern",1,100,9090,8681,-15359}
		local point2 = {"Neria's Tavern",1,100,9043,8284,-15359}
		local point3 = {"Prideholme",1,100,8571,8328,256}
		local point4 = {"Prideholme",1,50,8123,8539,256}
		local point5 = {"Alayla's Gear Shop",1,300,7611,9463,-18013}	
		if Task_L_LongGetTo(0x31512,2,10201,5,point1,point2,point3,point4,point5) then
			local point = {"",1,300,7611,9463,-18013}
			Task_L_TalkToNpc(0x31512 ,2,point,"Alayla",0,1,1)
		end
		
		local point1 = {"Alayla's Gear Shop",1,100,7636,9071,-18015}
		local point2 = {"Alayla's Gear Shop",1,100,7641,8736,-18015}
		local point3 = {"Prideholme",1,100,8965,6497,275}
		if Task_L_LongGetTo(0x31512,3,10201,3,point1,point2,point3) then
			local point = {"",1,300,8965,6497,275}
			Task_L_TalkToNpc(0x31512 ,3,point,"Ruden",0,1,2)
		end
		
		local point = {"",1,300,10422,5790,601}
		Task_L_Collection(0x31512 ,4,point)
		
		local point = {"",1,100,8965,6497,275}
		Task_L_TalkToNpc(0x31512 ,5,point,"Ruden",0,1,1)
		
		local point = {"",1,100,7903,4533,256}
		Task_L_TalkToNpc(0x31512 ,6,point,"Nall",0,1,1)
		
		local point = {"",1,300,7624,4070,285}
		Task_L_Collection(0x31512 ,7,point)
		
		local point = {"",1,100,7903,4533,256}
		Task_L_TalkToNpc(0x31512 ,8,point,"Nall",0,1,2)
		
		local point = {"",1,100,6075,3821,-259}
		Task_L_AutoGetTo(0x31512 ,9,10201,point,0,0) 
		
		local point = {"",1,100,6171,3919,-259}
		Task_L_TalkToNpc(0x31512 ,10,point,"Siera",0,1,1)
		
		--使用物品
		Task_L_UseItem(0x31512 ,11,"Song of Escape")
		
		local point = {"",1,100,6323,3815,-259}
		Task_L_TalkToNpc(0x31512 ,12,point,"Siera",0,1,2)

		local point = {"",1,200,5451,10329,3}
		Task_L_AutoGetTo(0x318f9 ,1,10201,point,0,0) 
		
		local point = {"",1,100,7546,8463,264}
		Task_L_TalkToNpc(0x318fb,2,point,"Delren",0,1,1) 
		--使用传送阵
		Task_L_UseTransmit(0x318fb,3,"Loghill Outpost","Loghill")
		
		local point1 = {"Prideholme",1,100,9065,8303,275}
		local point2 = {"Prideholme",1,100,9053,8569,275}
		local point3 = {"Neria's Tavern",1,100,9504,9061,-15355}	
		if Task_L_LongGetTo(0x31514,1,10201,3,point1,point2,point3) then
			local point = {"",1,100,9504,9061,-15355}
			Task_L_TalkToNpc(0x31514 ,1,point,"Neria",0,1,2)
		end
		
		
		if Fun_IsHaveTask(0x31511,1) == 1 then
			--接宠物任务
			Task_L_AcceptGlobalTask(0x451fd9) 
		end

		local point1 = {"Neria's Tavern",1,100,9090,8681,-15359}
		local point2 = {"Neria's Tavern",1,100,9043,8284,-15359}
		local point3 = {"Prideholme",1,100,7326,5216,258}
		Task_L_LongGetTo(0x451fd9,1,10201,3,point1,point2,point3)

		local point = {"",1,100,7326,5216,258}
		Task_L_TalkToNpc(0x451fd9 ,1,point,"Blueberry",0,1,1)

		local point = {"",1,300,7560,4947,260}
		Task_L_Collection(0x451fd9 ,2,point)

		local point = {"",1,100,7326,5216,258}
		Task_L_TalkToNpc(0x451fd9 ,3,point,"Blueberry",0,1,2)

		local point = {"",1,100,5901,6119,6}
		Task_L_TalkToNpc(0x451fd9 ,4,point,"Redberry",0,1,1)

		local point = {"",1,100,8825,6833,261}
		Task_L_TalkToNpc(0x451fd9 ,5,point,"Working Achatemeow",0,1,1)

		if Task_L_GetTaskIsComplete(0x451fd9) then
			--这里是交任务
			local point = {"",1,100,8825,6833,261}
			Task_L_CompleteTask(0x451fd9 ,5,point,"Working Achatemeow",-1)
		end

		Task_L_UseEquipBox("Pet: White Bunny")

		local point = {"",1,100,8825,6833,261}
		Task_L_TalkToNpc(0x451fda ,1,point,"Working Achatemeow",0,1,2)

		local point = {"",1,100,8825,6833,261}
		Task_L_TalkToNpc(0x451fda ,2,point,"Working Achatemeow",0,1,3)

		local point = {"",1,100,7326,5216,258}
		Task_L_TalkToNpc(0x451fda ,3,point,"Blueberry",0,1,3)

		local point = {"",1,300,7560,4947,260}
		Task_L_Collection(0x451fda ,4,point)

		local point = {"",1,100,7326,5216,258}
		Task_L_TalkToNpc(0x451fda ,5,point,"Blueberry",0,1,4)

		--这里是交任务
		local point = {"",1,100,8825,6833,261}
		Task_L_CompleteTask(0x451fda ,5,point,"Working Achatemeow",-1)

		local point1 = {"Neria's Tavern",1,100,9090,8681,-15359}
		local point2 = {"Neria's Tavern",1,100,9043,8284,-15359}
		local point3 = {"Prideholme",1,100,10609,3959,714}
		local point4 = {"Prideholme",1,100,10852,3986,765}
		local point5 = {"Prideholme Cathedral",1,300,12970,3961,-15355}	
		Task_L_LongGetTo(0x31511,1,10201,5,point1,point2,point3,point4,point5)
		--这里是交任务
		local point = {"",1,100,12921,3953,-15353}
		Task_L_CompleteTask(0x31511 ,2,point,"Varut",-1)
		
		local point = {"",1,100,12968,3998,-15353}
		Task_L_TalkToNpc(0x31513 ,1,point,"Armen",0,1,1)
		
		--使用传送阵
		Task_L_UseTransmit(0x31513,2,"Traveler's Nook","Loghill")
	end
	---------------------------------------------------------------------------
	--第二章地图
	if Fun_IsInMapByMapId(10211) then
		GlobalFun(0)
		MSG("Lei 第二章地图")
		local point = {"",1,2,3562,12785,-0}
		Task_L_TalkToNpc(0x318f9,1,point,"Arzhul",0,1,1)
		local point = {"",1,300,6122,15024,7}
		Task_L_Collection(0x318f9 ,2,point)
		
		local point = {"",1,300,2435,17914,264}
		Task_L_Collection(0x318f9 ,3,point)
		
		local point = {"",1,300,2590,22427,265}
		Task_L_Collection(0x318f9 ,4,point)

		local point = {"",1,300,2297,25715,265}
		Task_L_Collection(0x318f9 ,5,point)
		
		local point = {"",1,100,8075,27504,-0}
		Task_L_TalkToNpc(0x318f9,6,point,"Guard Aln",0,1,1)
		--进入场景副本  10213 
		local point = {"",1,100,1676,34219,507}	
		if Task_L_LongGetTo(0x318fd,1,10211,1,point) then
			local point = {"",1,100,2320,34186,763}
			Task_L_AutoGetTo(0x318fd ,1,10211,point,1,0x27E5) 
		end
		---------------------------------------
		local point1 = {"",2,100,6548,34248,1006}
		local point2 = {"",2,100,6332,32891,1006}	
		local point3 = {"",2,100,8094,27504,-0}	
		if Task_L_LongGetTo(0x318fd,2,10211,3,point1,point2,point3) then
			local point = {"",1,100,8094,27504,-0}
			Task_L_TalkToNpc(0x318fd,2,point,"Guard Aln",0,1,2)
		end

		local point = {"Loghill Outpost",1,100,12239,34578,292} 
		if Task_L_OpenTranMission(0x318fb,1,point) == 1 then
			local point = {"",1,100,11724,34819,256}
			Task_L_TalkToNpc(0x318fb,1,point,"Guard Mizel",0,1,1) 
		end
		--开传送阵

		--使用传送阵
		Task_L_UseTransmit(0x318fb,2,"Prideholme","Prideholme")
		
		local point = {"",1,100,11724,34819,256}
		Task_L_TalkToNpc(0x318fb,3,point,"Guard Mizel",0,1,4) 

		--到指定点打指定名字怪物
		local point = {"",1,300,15366,33060,256}	
		Task_L_AttackByName(0x318fb ,4,point,"Lieutenant Kugo",0)
		
		local point = {"",1,100,11724,34819,256}
		Task_L_TalkToNpc(0x318fb,5,point,"Guard Mizel",0,1,2) 
		
		if Task_L_GetTaskIsComplete(0x318fb) then
			--这里是交任务
			local point = {"",1,100,17140,21773,256}
			Task_L_CompleteTask(0x318fb ,6,point,"Stonemason Kahan",-1)
		else

			local point1 = {"",1,100,13466,32951,255}	
			local point2 = {"",1,100,17318,30808,255}		
			if Task_L_LongGetTo(0x318fb,6,10211,2,point1,point2) then
				local point = {"",1,100,17140,21773,256}
				Task_L_TalkToNpc(0x318fb,6,point,"Stonemason Kahan",0,1,2) 
			end
		end

		local point1 = {"",1,100,13785,21845,256}
		local point2 = {"",1,100,12113,16975,289}
		if Task_L_LongGetTo(0x318fe,1,10211,2,point1,point2) then
			local point = {"Fiona Plains",1,100,12113,16975,289}
			if Task_L_OpenTranMission(0x318fe,1,point) == 1 then
				--进入场景副本 10217
				local point = {"",1,100,15853,17546,506}	
				if Task_L_LongGetTo(0x318fe,1,10211,1,point) then
					local point = {"",1,100,15856,16541,686}
					Task_L_AutoGetTo(0x318fe,1,10211,point,1,0x027E9) 
				end
			end
		end
	
		--使用传送阵
		local point = {"",1,100,12239,34578,292} 
		Task_L_UseTransmitPoint(0x318fe,2,"Loghill Outpost",point)
		
		local point = {"",1,100,11724,34819,256}
		Task_L_TalkToNpc(0x318fe,2,point,"Guard Mizel",0,1,3) 
		
		local point1 = {"",2,100,9892,42256,254}
		local point2 = {"",2,100,12661,38455,355}
		if Task_L_LongGetTo(0x320c9,1,10211,2,point1,point2) then
			local point = {"",1,100,13993,38620,256}
			Task_L_TalkToNpc(0x320c9,1,point,"Shudeal",0,1,1) 
		end
		
		local point = {"",1,300,17125,38398,263}	
		Task_L_AttackByName(0x320c9 ,2,point,"Venomist Robber",0) 

		local point = {"",1,100,17490,47434,256}
		Task_L_AutoGetTo(0x320c9,3,10211,point,0,0) 

		local point = {"Traveler's Nook",1,100,17541,47694,269}
		if Task_L_OpenTranMission(0x320ca,1,point) == 1 then
			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 50,0,0)
			--修理
			if Fun_IsHaveTask(0x320ca,1) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Loghill", --大地图
						"Kolsh Valley", --小地图
						"Traveler's Nook", --传送阵
						{ 18147,48347,255 }, --修理NPC坐标
						{ 18033,47725,255 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end
			local point = {"",1,100,18330,47816,256}
			Task_L_TalkToNpc(0x320ca,1,point,"Shelter Keeper Maydok",0,1,1) 
		end
		--进入场景副本 10227
		local point = {"",1,100,16680,55993,512}	
		if Task_L_LongGetTo(0x320ca,2,10211,1,point) then
			local point = {"",1,100,17202,56614,512}
			Task_L_AutoGetTo(0x320ca,2,10211,point,1,0x27F3) 
		end

		local point = {"",1,100,18330,47816,256}
		Task_L_TalkToNpc(0x320ca,3,point,"Shelter Keeper Maydok",0,1,2) 

		--进入正常副本  10253
		local point = {"",1,100,10513,48627,256}	
		if Task_L_LongGetTo(0x31ce1,1,10211,1,point) then
			GlobalFun(0)
			local point = {"",1,100,10621,49389,305}
			Task_L_AutoGetTo(0x31ce1,1,10211,point,2,0x280D) 
		end

		if Fun_IsHaveTask(0x31518,1) == 1 then

			Fun_SetBackHomeInfo(80, 50,0,0)
			if Fun_IsNeedBackHome() == 1 then

				local point = {"Clika",1,100,18015,47722,256}
				Task_L_BuyItem(0x31518,1,50,1,"Apprentice Healing Potion",point)
				Task_L_PushDwonDrug(0x31518,1,"Apprentice Healing Potion")
				local BackHomeInfo = {
					0, --1比较小地图
					"Loghill", --大地图
					"Kolsh Valley", --小地图
					"Traveler's Nook", --传送阵
					{ 18147,48347,255 }, --修理NPC坐标
					{ 18015,47722,256 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			else
				--使用传送阵 进入剧情副本  10214
				Task_L_UseTransmit(0x31518,1,"Prideholme","Prideholme")
			end
		end

		--使用传送阵 进入剧情副本  10214
		Task_L_UseTransmit(0x31514,1,"Prideholme","Prideholme")
		
		if Task_L_GetTaskIsComplete(0x31513) then
			--这里是交任务
			local point = {"",1,100,18287,48148,256}
			Task_L_CompleteTask(0x31513 ,2,point,"Edma",2)
		else
			local point = {"",1,100,18287,48148,256}
			Task_L_TalkToNpc(0x31513,2,point,"Edma",2,1,1) 
		end

		local point = {"",1,100,28414,55574,256}
		Task_L_AutoGetTo(0x324b1,1,10211,point,0,0) 
		
	end
	---------------------------------------------------------------------------
	--第三章地图
	if Fun_IsInMapByMapId(10220) then
		GlobalFun(0)
		local point = {"",1,100,1039,-611,-512}
		Task_L_TalkToNpc(0x324b1,1,point,"Ankumo Herald",0,1,1) 

		local point = {"",1,100,8785,764,-508}
		Task_L_TalkToNpc(0x324b1,2,point,"Garoa",0,1,1) 
		
		local point1 = {"Collect",0,300,6388,-1731,-377}
		local point2 = {"Collect",1,300,7871,4976,-377}
		local point3 = {"Collect",2,300,-406,5686,-121}
		Task_L_BranchLine(0x324b1,3,3,point1,point2,point3)
		
		local point = {"",1,100,3254,10548,-0}
		Task_L_TalkToNpc(0x324b2,1,point,"Armen",0,1,1) 
		
		local point = {"",0,300,2814,10378,-33}
		Task_L_Collection(0x324b2 ,2,point)
		
		local point1 = {"",0,300,4059,13297,-0}
		local point2 = {"",0,300,3730,13426,-0}
		local point3 = {"",0,300,3376,13223,-0}
		local point4 = {"",0,300,2805,12691,-0}
		Task_L_LoopCollectMore(0x324b2,3,0,4,point1,point2,point3,point4)
		
		local point1 = {"",0,300,2630,12310,-0}
		local point2 = {"",0,300,3319,13522,-0}
		Task_L_LoopCollectMore(0x324b2,3,1,2,point1,point2)
		
		local point = {"",1,100,3254,10548,-0}
		Task_L_TalkToNpc(0x324b2,4,point,"Armen",0,1,2) 
		--开传送阵

		local point = {"",1,100,7107,12401,0}	
		if Task_L_LongGetTo(0x324b2,5,10220,1,point) then
			local point = {"",1,600,10712,13778,255}	
			--Task_L_AttackPoint(0x324b2,5,point)

			local point = {"",2,100,10712,13778,255}	
			if Task_L_LongGetTo(0x324b2,5,10220,1,point) then
				local point = {"Border Watch",1,100,17138,13154,292}
				if Task_L_OpenTranMission(0x324b2,5,point) == 1 then
					Task_L_LoopEquipFun()
					--买30瓶 600的药, 并且卖东西
					local point = {"Foreman",1,100,17138,12081,256}
					Task_L_BuyItem(0x324b2,5,50,1,"Apprentice Healing Potion",point)

					--1.持久  2.背包空余
					Fun_SetBackHomeInfo(80, 50,0,0)
					--修理
					if Fun_IsHaveTask(0x324b2,5) == 1 then
						if Fun_IsNeedBackHome() == 1 then
							MSG("LYlua 进入了修理函数")
							local BackHomeInfo = {
								0, --1比较小地图
								"Ankumo Mountain", --大地图
								"Border Watch", --小地图
								"Border Watch", --传送阵
								{ 16652,12215,255 }, --修理NPC坐标
								{ 17125,12088,255 } --买卖NPC坐标
							}
							Fun_BackHome(BackHomeInfo)
						end
					end
					local point = {"",1,100,15669,14908,256}
					Task_L_AutoGetTo(0x324b2 ,5,10220,point,0,0) 
				end
			end
		end


		
		local point = {"",1,100,15675,14999,256}
		Task_L_TalkToNpc(0x324b3,1,point,"Armen",0,1,3) 
		
		local point1 = {"",1,800,15841,9709,256}	
		local point2 = {"",1,800,13770,14297,256}	
		Task_L_LoopAttackMonMore(0x324b3 ,2,0,2,point1,point2)

		local point = {"",1,100,15675,14999,256}
		Task_L_TalkToNpc(0x324b3,3,point,"Armen",0,1,5) 
		
		local point = {"",1,100,23001,7286,768}
		Task_L_TalkToNpc(0x324b3,4,point,"Border Guard Vant",0,1,2) 


		local point1 = {"",1,800,20537,5840,768}	
		local point2 = {"",1,800,20146,7288,768}	
		Task_L_LoopAttackMonMore(0x324b4 ,1,0,2,point1,point2)

		--进入剧情副本 10228
		local point = {"",1,100,15087,5944,512}	
		if Task_L_LongGetTo(0x324b4,2,10220,1,point) then
			local point = {"",1,100,15013,5267,512}
			Task_L_AutoGetTo(0x324b4 ,2,10220,point,1,0x27F4) 
		end
		
		local point = {"",1,100,16706,14108,256}
		Task_L_TalkToNpc(0x324b6,1,point,"Border Guard Parker",0,1,1) 	
		
		local point = {"",1,100,16706,14108,256}
		Task_L_TalkToNpc(0x324b6,2,point,"Armen",0,1,6) 

		--进入正常副本 10251
		local point = {"",1,100,8194,23669,637}	
		if Task_L_LongGetTo(0x32899,1,10220,1,point) then
			local point = {"",1,100,8133,24538,394}
			Task_L_AutoGetTo(0x32899 ,1,10220,point,2,0x280B) 
		end
		
		local point = {"",1,100,16706,14108,256}
		Task_L_TalkToNpc(0x324b7,1,point,"Border Guard Parker",0,1,2) 
		
		local point = {"",1,100,15652,15003,256}
		Task_L_TalkToNpc(0x324b7,2,point,"Armen",0,1,4) 
		
		local point = {"",1,100,15909,14487,256}
		Task_L_AutoGetTo(0x324b7 ,3,10220,point,0,0) 	
		
		local point = {"",1,100,19063,13497,224}
		Task_L_AutoGetTo(0x324b7 ,4,10220,point,0,0) 
	end
	---------------------------------------------------------------------------
	--第四章地图
	if Fun_IsInMapByMapId(10222) then
		GlobalFun(0)
		local point = {"",1,100,424,-554,-0}
		Task_L_TalkToNpc(0x32c81,1,point,"Jeda",0,1,1) 

		local point = {"",1,100,4859,3203,-0}
		Task_L_TalkToNpc(0x32c81,2,point,"Merchant Veness",0,1,1) 	
		
		--打水浇灭马车
		local point1 = {"",1,200,6522,2620,-58}	
		local point2 = {"",10,300,7827,1123,-0}		
		Task_L_CarryItem(0x32c81,3,1,point1,point2)
		
		local point = {"",1,600,8900,547,-0}	
		Task_L_LoopAttackMonMore(0x32c81 ,3,0,1,point)	
		
		local point = {"",1,100,4830,3192,-0}
		Task_L_TalkToNpc(0x32c81,4,point,"Merchant Veness",0,1,2) 

		local point1 = {"",1,100,8272,3449,0}
		local point2 = {"",1,100,7934,5632,0}
		local point3 = {"",1,100,8586,8645,0}
		if Task_L_LongGetTo(0x32c81,5,10222,3,point1,point2,point3) then
			--开传送阵
			local point = {"Regria Monastery",1,100,10388,12975,571}
			if Task_L_OpenTranMission(0x32c81,5,point) ==1 then
				
				--1.持久  2.背包空余
				Fun_SetBackHomeInfo(80, 50,0,0)
				--修理
				if Fun_IsHaveTask(0x32c81,5) == 1 then
					if Fun_IsNeedBackHome() == 1 then
						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Rethramis Border", --大地图
							"Regria Monastery", --小地图
							"Regria Monastery", --传送阵
							{ 12350,14855,534 }, --修理NPC坐标
							{ 10328,15073,534 } --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				end

				local point = {"",1,100,10892,13882,545}
				Task_L_AutoGetTo(0x32c81 ,5,10222,point,0,0) 
			end
		end
		
		local point = {"",2,100,11381,13461,547}
		if Task_L_LongGetTo(0x32c83,1,10222,1,point) then
			local point = {"",1,100,10974,13871,540}
			Task_L_TalkToNpc(0x32c83,1,point,"Brother Alred",0,1,1) 
		end	
		
		local point1 = {"",0,500,8837,19533,-0}
		local point2 = {"",1,300,8880,19533,-0}	
		Task_L_LoopAttackMonMore(0x32c83 ,2,0,2,point1,point2)
		
		--使用传送阵
		Task_L_UseTransmit(0x32c83,3,"Regria Monastery","Regria Monastery")  

		local point = {"",1,100,10919,13849,545}
		Task_L_TalkToNpc(0x32c83,3,point,"Brother Alred",0,1,3) 
		
		local point = {"",1,100,12063,13026,537}
		Task_L_TalkToNpc(0x32c83,4,point,"Armen",0,1,1) 
		
		local point = {"",1,100,10974,13871,540}
		Task_L_TalkToNpc(0x32c84,1,point,"Brother Alred",0,1,2) 

		local point1 = {"",1,100,5179,16210,0}
		local point2 = {"",1,100,10676,18470,-0}
		local point3 = {"",1,100,17020,17538,255}
		local point4 = {"",1,100,20906,20076,511}
		local point5 = {"",1,100,22944,23833,525}
		if Task_L_LongGetTo(0x32c84,2,10222,5,point1,point2,point3,point4,point5) then
		--开传送阵
			local point = {"Border Post",1,100,22944,23833,525}
			if Task_L_OpenTranMission(0x32c84,2,point) == 1 then
				local point = {"",1,100,23530,22719,512}
				Task_L_TalkToNpc(0x32c84,2,point,"Brother Dylom",0,1,1)
			end 
		end

		local point = {"",1,500,20791,21593,512}	
		Task_L_LoopAttackMonMore(0x32c84 ,3,0,1,point)

		local point = {"",1,100,23530,22719,512}
		Task_L_TalkToNpc(0x32c84,4,point,"Brother Dylom",0,1,2)

		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80, 50,0,0)
		--修理
		if Fun_IsHaveTask(0x3306a,1) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,100,10388,12975,571}
				if Task_L_UseTransmitPoint(0x3306a,1,"Regria Monastery",point) then

					Task_L_LoopEquipFun()
					--买100瓶 600的药, 并且卖东西
					local point = {"Rose",1,100,10328,15073,534}
					Task_L_BuyItem(0x3306a,1,100,1,"Apprentice Healing Potion",point)

					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Rethramis Border", --大地图
						"Regria Monastery", --小地图
						"Regria Monastery", --传送阵
						{ 12350,14855,534 }, --修理NPC坐标
						{ 10328,15073,534 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,100,22944,23833,525}
				if Task_L_UseTransmitPoint(0x3306a,1,"Border Post",point) then
					--进入正常副本  10252
					local point = {"",1,100,24116,17600,512}	
					if Task_L_LongGetTo(0x3306a,1,10222,1,point) then
						local point = {"",1,100,25009,17385,512}
						Task_L_AutoGetTo(0x3306a,1,10222,point,2,0x280C) 
					end
				end
			end
		end



		local point = {"",1,100,12063,13026,537}
		Task_L_TalkToNpc(0x32c85,1,point,"Armen",0,1,3) 

		local point = {"",1,100,12063,13026,537}
		Task_L_TalkToNpc(0x32c85,2,point,"Armen",0,1,4) 

		local point = {"",1,100,10974,13871,540}
		Task_L_TalkToNpc(0x32c85,3,point,"Brother Alred",0,1,4) 
		--使用传送阵
		Task_L_UseTransmit(0x32c85,4,"Border Post","Border Post")

		local point = {"",1,100,23880,24396,512}
		Task_L_AutoGetTo(0x32c85,4,10222,point,0,0) 
	end
	---------------------------------------------------------------------------
	-------------------------------欧狄亚--------------------------------------
	---------------------------------------------------------------------------
	--第1张图
	if Fun_IsInMapByMapId(10611) then
		GlobalFun(0)

		local point = {"",1,150,-3114,-13258,1024}
		Task_L_TalkToNpc(0x92ba9,1,point,"Armen",5,1,1) 

		local point = {"",1,100,-2506,-14921,1024}	
		if Task_L_LongGetTo(0x92ba9,2,10611,1,point) then
			local point = {"",1,100,1847,-13159,1024}
			Task_L_AutoGetTo(0x92ba9,2,10611,point,0,0) 	
		end

		local point = {"",1,100,2963,-12040,1024}
		Task_L_TalkToNpc(0x92baa,1,point,"Armen",0,1,1) 	

		local point = {"",1,100,2667,-12324,1024}
		Task_L_TalkToNpc(0x92baa,2,point,"Toralon",0,1,1) 

		local point = {"",1,100,9275,-11369,1535}
		Task_L_TalkToNpc(0x92baa,3,point,"Baogin",0,1,1)

		local point = {"",1,100,2209,-5416,1535}
		Task_L_AutoGetTo(0x92baa,4,10611,point,0,0) 
		
		local point = {"",1,800,1939,-4561,1535}	
		Task_L_LoopAttackMonMore(0x92baa ,5,0,1,point)

		local point = {"",1,100,-5225,-8155,1535}
		Task_L_TalkToNpc(0x92bab,1,point,"Gus",0,1,1) 

		local point = {"",1,800,-9939,-4714,1534}	
		Task_L_LoopAttackMonMore(0x92bab ,2,0,1,point)	
		
		local point1 = {"",1,100,-9420,-2512,1533}	
		local point2 = {"",1,100,-8558,-1291,1525}	
		local point3 = {"",1,100,-6867,-1579,1233}	
		local point4 = {"",1,100,-5383,-1152,895}
		local point5 = {"",1,100,-2615,-1209,511}	
		local point6 = {"",1,100,-2271,7202,556}
		if Task_L_LongGetTo(0x92bab,3,10611,6,point1,point2,point3,point4,point5,point6) then
			--开传送阵
			local point = {"Salt Works",1,100,-2271,7202,556}
			if Task_L_OpenTranMission(0x92bab,3,point) == 1 then

				--1.持久  2.背包空余
				Fun_SetBackHomeInfo(80, 50,0,0)
				--修理
				if Fun_IsHaveTask(0x92bab,3) == 1 then
					if Fun_IsNeedBackHome() == 1 then
						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Saland Hill", --大地图
							"Salt Works", --小地图
							"Salt Works", --传送阵
							{ 145,7195,511 }, --修理NPC坐标
							{ -1322,6468,511 } --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				end

				local point = {"",1,100,-686,7191,512}
				Task_L_TalkToNpc(0x92bab,3,point,"Baldi",0,1,6) 
			end
		end

		local point = {"",1,100,-1667,7366,512}
		Task_L_TalkToNpc(0x92bac,1,point,"Armen",0,1,2) 

		Task_L_LoopEquipFun()
		--买100瓶 600的药, 并且卖东西
		local point = {"Hansen",1,100,-1388,6515,512}
		Task_L_BuyItem(0x92bac,2,100,1,"Apprentice Healing Potion",point)

		local point = {"",1,100,-686,7191,512}
		Task_L_TalkToNpc(0x92bac,2,point,"Baldi",0,1,1) 

		local point = {"",1,100,-1667,7366,512}
		Task_L_TalkToNpc(0x92bac,3,point,"Armen",0,1,1) 

		local point = {"",1,100,-5754,3563,1024}
		Task_L_TalkToNpc(0x92bad,1,point,"Fobet",0,1,1) 

		local point = {"",0,300,-15306,6684,1024}
		Task_L_Collection(0x92bad ,2,point)

		local point = {"",1,100,-2271,7202,556}
		if Task_L_UseTransmitPoint(0x92bae,1,"Salt Works",point) then
			local point = {"",1,100,-686,7191,512}
			Task_L_TalkToNpc(0x92bae,1,point,"Baldi",0,1,5)
		end

		local point = {"",1,300,8187,3711,769}
		Task_L_LoopAttackMonMore(0x92bae ,2,0,1,point)	

		if (Fun_IsHaveTaskBranch(0x92bae ,2,0) == 0) then
			local point1 = {"",2,100,8811,3089,769}
			local point2 = {"",2,100,10467,3995,772}
			local point3 = {"",1,100,9518,4466,1020}
			if Task_L_LongGetTo(0x92bae,2,10611,3,point1,point2,point3) then 
				--使用传送阵
				local point = {"",1,500,9518,4466,1020}
				Task_L_LoopAttackMonMore(0x92bae ,2,1,1,point)	
				--Task_L_UseTransmit(0x92bae,3,"Salt Works","Salt Works") --这里需要修改
			end
		end
		---------
		
		local point1 = {"",2,100,9061,3871,1029}
		local point2 = {"",1,100,11876,3142,511}
		local point3 = {"",1,100,11758,4606,511}
		if Task_L_LongGetTo(0x92bae,3,10611,3,point1,point2,point3) then
			local point = {"",1,200,11758,4606,511}
			Task_L_AttackPoint(0x92bae,3,point)

			local point = {"",1,100,12773,5879,512}
			Task_L_TalkToNpc(0x92bae,3,point,"Zarka",0,1,1)
		end
		---------

		local point = {"",1,100,12190,10659,512}
		Task_L_TalkToNpc(0x92baf,1,point,"Armen",0,1,1)	
		
		local point = {"",0,300,12231,10528,512}
		Task_L_Collection(0x92baf ,2,point)	

		local point = {"",1,100,11470,15076,512}
		Task_L_AutoGetTo(0x92baf,3,10611,point,0,0) 

		local point1 = {"Collect",0,100,11699,15878,512}
		local point2 = {"Collect",1,100,10872,17377,512}
		local point3 = {"Collect",2,100,12112,18717,512}
		Task_L_BranchLine(0x92f91,1,3,point1,point2,point3)

		local point = {"",1,100,12689,22372,509}
		Task_L_TalkToNpc(0x92f91,2,point,"Revil",0,1,1)	
		
		local point = {"",1,100,9086,25546,509}
		Task_L_TalkToNpc(0x92f91,3,point,"Lokon",0,1,1)

		
		--开传送阵
		local point = {"Salttree Habitat",1,100,5454,23483,530}
		if Task_L_OpenTranMission(0x92f92,1,point) == 1 then
			local point = {"",1,100,4096,30555,509}
			Task_L_AutoGetTo(0x92f92,1,10611,point,0,0) 
		end

		local point = {"",1,300,2521,42211,509}	
		Task_L_AttackByName(0x92f92 ,2,point,"Dadan",0)

		local point = {"",1,100,3080,43662,514}
		Task_L_TalkToNpc(0x92f92,3,point,"Thunder",0,1,1)

		local point1 = {"",1,100,2295,42932,508}
		local point2 = {"",1,100,2704,40970,508}
		local point3 = {"",1,100,2966,36685,508}
		local point4 = {"",1,100,11452,35967,507}
		local point5 = {"",1,100,15046,31493,509}
		local point6 = {"",1,100,21061,28719,530}
		if Task_L_LongGetTo(0x92f94,1,10611,6,point1,point2,point3,point4,point5,point6) then
			--开传送阵
			local point = {"Nomad Camp",1,100,21061,28719,530}
			if Task_L_OpenTranMission(0x92f94,1,point) == 1 then
				
				--1.持久  2.背包空余
				Fun_SetBackHomeInfo(80, 50,0,0)
				--修理
				if Fun_IsHaveTask(0x92f94,1) == 1 then
					if Fun_IsNeedBackHome() == 1 then
						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Saland Hill", --大地图
							"Aregal Salt Plains", --小地图
							"Nomad Camp", --传送阵
							{ 20295,30561,508 }, --修理NPC坐标
							{ 19958,29064,508 } --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				end
				local point = {"",1,100,20105,28654,514}
				Task_L_TalkToNpc(0x92f94,1,point,"Reoff",0,1,1)--这里会卡
			end
		end


		
		local point = {"",1,100,20835,29718,509}
		Task_L_TalkToNpc(0x92f94,2,point,"Thunder",0,1,1)

		local point = {"",1,300,27050,20748,507}
		if Task_L_Collection(0x92f94 ,3,point) then
			--使用传送阵
			Task_L_UseTransmit(0x92f95,1,"Nomad Camp","Nomad Camp")
		end

		local point = {"",1,100,20623,29806,509}
		Task_L_TalkToNpc(0x92f95,1,point,"Armen",0,1,1)

		local point = {"",1,100,20835,29718,509}
		Task_L_TalkToNpc(0x92f95,2,point,"Thunder",0,1,10)

		local point = {"",1,100,23374,33002,776}
		Task_L_AutoGetTo(0x92f95,3,10611,point,0,0) 

		--进入剧情副本  10616
		local point = {"",1,300,24344,33428,776}
		Task_L_Collection(0x92f95 ,4,point)

		--进入剧情副本  10616  有时候会出现BUG需要运行这边
		local point = { "", 1, 100, 24352,33265,776}
		if Task_L_LongGetTo(0x92f96, 1, 10611, 1, point) then
			local point = { "", 1, 100,24178,33562,776 }
			Task_L_AutoGetTo(0x92f96, 1, 10611, point, 1, 0x2978)
		end

		local point = {"",1,100,24858,33015,845}
		Task_L_TalkToNpc(0x92f97,1,point,"Thunder",0,1,4)

		local point1 = {"",1,300,20549,33562,509}
		local point2 = {"",1,300,19870,33309,509}
		local point3 = {"",1,300,20385,34290,509}
		Task_L_LoopCollectMore(0x92f97,2,0,3,point1,point2,point3)

		local point = {"",1,100,23468,32883,776}
		Task_L_TalkToNpc(0x92f97,3,point,"Praghe",0,1,1)

		local point = {"",1,100,24881,33002,849}
		Task_L_TalkToNpc(0x92f97,4,point,"Thunder",0,1,5)

		local point = {"",1,300,25000,32947,849}
		Task_L_Collection(0x92f97 ,5,point)

		local point = {"",1,100,24881,33002,849}
		Task_L_TalkToNpc(0x92f98,1,point,"Thunder",0,1,3)

		local point = {"",1,100,23900,33107,776}
		Task_L_TalkToNpc(0x92f98,2,point,"Armen",0,1,2)

		--开传送阵
		local point = {"Submerged Ruins",1,100,19171,16656,530}
		if Task_L_OpenTranMission(0x92f98,3,point) == 1 then
			local point = {"",1,100,18303,17524,517}
			Task_L_AutoGetTo(0x92f98,3,10611,point,0,0) 
		end

		---------------------------------------------------------
		--修理
		if Fun_IsHaveTask(0x92f99,1) == 1 then
			Fun_SetBackHomeInfo(90, 50,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,100,21061,28719,530}
				if Task_L_UseTransmitPoint(0x92f99,1,"Nomad Camp",point) then
					Task_L_LoopEquipFun()

					local point = {"Vilma",1,100,19958,29064,508}
					Task_L_BuyItem(0x92f99,1,100,5,"Major Healing Potion",point)
					Task_L_PushDwonDrug(0x92f99,1,"Major Healing Potion")

					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Saland Hill", --大地图
						"Aregal Salt Plains", --小地图
						"Nomad Camp", --传送阵
						{ 20295,30561,508 }, --修理NPC坐标
						{ 19958,29064,508 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,3000,18474,17465,518}
				if Fun_IsInPoint(point) == 1 then
					--进入团队副本 10691
					local point = {"",1,100,18382,17604,509}	
					if Task_L_LongGetTo(0x92f99,1,10611,1,point) then
						local point = {"",1,100,17605,17671,506}
						Task_L_AutoGetTo(0x92f99,1,10611,point,3,0x29C3) 	
					end
				else
					local point = {"",1,100,19171,16656,530}
					if Task_L_UseTransmitPoint(0x92f99,1,"Submerged Ruins",point) then
						--进入团队副本 10691
						local point = {"",1,100,18382,17604,509}	
						if Task_L_LongGetTo(0x92f99,1,10611,1,point) then
							local point = {"",1,100,17605,17671,506}
							Task_L_AutoGetTo(0x92f99,1,10611,point,3,0x29C3) 	
						end
					end
				end
			end
		end
		---------------------------------------------------------


		Task_L_UseItemBook("Emote: Pray")

		local point = {"",1,100,20845,29736,509}
		Task_L_TalkToNpc(0x92f9a,1,point,"Thunder",0,1,14)
		
		local point = {"",1,100,30120,22430,509}
		Task_L_AutoGetTo(0x92f9a,2,10611,point,0,0) 		
	end
	---------------------------------------------------------------------------
	--第2张图
	if Fun_IsInMapByMapId(10619) then
		GlobalFun(0)
		local point = {"",1,100,-13362,12727,512}
		Task_L_TalkToNpc(0x93379,1,point,"Morina",0,1,1)

		--Task_L_UseEquipBox("Сундучок исследователя II")
		
		local point1 = {"",1,100,-13156,10968,511}	
		local point2 = {"",1,100,-8488,10189,1022}	
		local point3 = {"",1,100,-4853,9089,1022}	
		local point4 = {"",1,100,-4008,3722,511}	
		if Task_L_LongGetTo(0x93379,2,10619,4,point1,point2,point3,point4) then

			local point = {"",1,100,-3114,2373,520}
			Task_L_TalkToNpc(0x93379,2,point,"Foxfire",0,1,1)
		end

		local point = {"",1,100,-8417,-6466,-111}
		Task_L_AutoGetTo(0x9337a,1,10619,point,0,0) 

		local point = {"",1,100,-8417,-6466,-111}
		Task_L_TalkToNpc(0x9337a,2,point,"Armen",0,1,1)

		local point1 = {"",1,100,-4733,-2981,512}	
		local point2 = {"",1,100,830,1688,512}	
		Task_L_LongGetTo(0x9337a,3,10619,2,point1,point2)

		--开传送阵
		local point = {"Ozhorn Assembly Area",1,100,1511,1308,521}
		if Task_L_OpenTranMission(0x9337a,4,point)	== 1 then

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 50,0,0)
			--修理
			if Fun_IsHaveTask(0x9337a,4) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Ozhorn Hill", --大地图
						"Assembly Area", --小地图
						"Ozhorn Assembly Area", --传送阵
						{ -13,1525,511 }, --修理NPC坐标
						{ 238,745,511 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,810,1676,512}
			Task_L_TalkToNpc(0x9337a,4,point,"Tajahan",0,1,1)
		end

		local point = {"",1,100,6102,-1859,511}
		Task_L_TalkToNpc(0x9337b,1,point,"Negev",0,1,1)

		local point1 = {"",0,900,5929,-6346,512}
		local point2 = {"",0,900,6518,-7892,511}
		local point3 = {"",0,900,7606,-9144,511}	
		local point4 = {"",0,900,4866,-8332,704}
		Task_L_LoopAttackMonMore(0x9337b,2,0,4,point1,point2,point3,point4)
		
		local point = {"",1,100,6102,-1859,511}
		Task_L_TalkToNpc(0x9337b,3,point,"Negev",0,1,3)	

		local point = {"",1,100,10993,4434,511}
		Task_L_TalkToNpc(0x9337b,4,point,"Armen",0,1,1)

		local point = {"",1,100,11977,2642,511}
		Task_L_TalkToNpc(0x9337b,5,point,"Stengel",0,1,1)

		local point = {"",1,100,11238,9717,1024}
		Task_L_AutoGetTo(0x9337d,1,10619,point,0,0) 

		local point1 = {"",0,100,11737,10742,1029}
		local point2 = {"",0,100,12017,10811,1032}
		local point3 = {"",0,100,12307,10453,1032}	
		local point4 = {"",0,100,13139,11005,1024}
		Task_L_LoopCollectMore(0x9337d,2,0,4,point1,point2,point3,point4)

		local point = {"",1,100,13324,11832,1027}
		Task_L_AutoGetTo(0x9337d,3,10619,point,0,0) 
		--开传送阵
		local point = {"Ozhorn Assembly Area",1,100,14996,10585,2096}
		if Task_L_OpenTranMission(0xc3cd3,3,point) == 1	then
			local point = {"",1,100,13343,11862,1026}
			Task_L_AutoGetTo(0xc3cd3,3,10619,point,0,0) 
		end
	end
	---------------------------------------------------------------------------
	-------------------------------卢兰中部------------------------------------
	---------------------------------------------------------------------------
	--第1张图
	if Fun_IsInMapByMapId(10811) then
		GlobalFun(0)
		local point = {"",1,100,1864,3758,512}
		Task_L_TalkToNpc(0xc3cd1,2,point,"Kiel",0,1,2)
		--Task_L_UseEquipBox("Сундучок исследователя II")

		local point = {"",1,100,4577,2524,1024}
		Task_L_TalkToNpc(0xc3cd1,3,point,"Armen",0,1,11)

		local point = {"",1,100,5827,1804,1024}
		Task_L_TalkToNpc(0xc3cd2,1,point,"Danev",0,1,1)

		local point1 = {"Collect",0,300,5247,1070,1024}
		local point2 = {"Collect",1,300,4128,436,1024}
		local point3 = {"Collect",2,300,4028,1677,1024}
		Task_L_BranchLine(0xc3cd2,2,3,point1,point2,point3)

		local point = {"",1,100,5827,1804,1024}
		Task_L_TalkToNpc(0xc3cd2,3,point,"Danev",0,1,2)

		local point = {"",1,100,11947,12105,1589}
		Task_L_TalkToNpc(0xc3cd3,1,point,"Hayne",0,1,1)

		--进入剧情副本 10825
		local point = {"",1,100,12452,12018,1821}	
		if Task_L_LongGetTo(0xc3cd3,2,10811,1,point) then
			local point = {"",1,100,13196,12040,2053}
			Task_L_AutoGetTo(0xc3cd3,2,10811,point,1,0x2A49) 
		end
		--开传送阵
		local point = {"Zagoras Fortress",1,100,14996,10585,2096}
		if Task_L_OpenTranMission(0xc3cd3,3,point)	== 1 then
			Task_L_LoopEquipFun()
			--买50瓶 968的药, 并且卖东西
			local point = {"Erme",1,100,16935,10390,2048}
			Task_L_BuyItem(0xc3cd3,3,50,5,"Major Healing Potion",point)

			--放药到F1
			Task_L_PushDwonDrug(0xc3cd3,3,"Major Healing Potion")

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 50,0,0)
			--修理
			if Fun_IsHaveTask(0xc3cd3,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Mount Zagoras", --大地图
						"Zagoras Fortress", --小地图
						"Zagoras Fortress", --传送阵
						{ 14182,12361,2047 }, --修理NPC坐标
						{ 16964,10414,2047 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end
			local point = {"",1,100,16466,10868,2048}
			Task_L_TalkToNpc(0xc3cd3,3,point,"Thirain",0,1,14)
		end
		
		local point = {"",1,100,16033,13609,2048}
		Task_L_TalkToNpc(0xc3cd5,1,point,"Armen",0,1,13)
			
		local point1 = {"",0,100,15355,13673,2048}
		local point2 = {"",0,100,16095,14175,2048}
		local point3 = {"",0,100,16759,12341,2048}	
		local point4 = {"",0,100,16088,12742,2048}
		Task_L_LoopCollectMore(0xc3cd5,2,0,4,point1,point2,point3,point4)
	
		local point = {"",1,100,16461,10538,2048}
		Task_L_TalkToNpc(0xc3cd5,3,point,"Meehan",0,1,1)

		local point = {"",1,100,16033,13609,2048}
		Task_L_TalkToNpc(0xc3cd5,4,point,"Armen",0,1,14)

		local point = {"",1,100,16477,10877,2048}
		Task_L_TalkToNpc(0xc3cd7,1,point,"Thirain",0,1,15)
		--开传送阵
		local point = {"Eastern Ruins",1,100,16777,22174,2072}
		if Task_L_OpenTranMission(0xc3cd7,2,point)	== 1 then
			local point = {"",1,100,26609,18005,2560}
			Task_L_TalkToNpc(0xc3cd7,2,point,"Herod",0,1,6)
		end

		local point1 = {"",0,300,24937,14808,2048}
		local point2 = {"",0,300,24296,14602,2048}
		local point3 = {"",0,300,24688,13273,2048}	
		Task_L_LoopCollectMore(0xc3cd7,3,0,3,point1,point2,point3)

		local point = {"",1,100,26609,18005,2560}
		Task_L_TalkToNpc(0xc3cd7,4,point,"Herod",0,1,4)

		local point = {"",1,300,26670,17872,2560}
		Task_L_Collection(0xc3cd7 ,5,point)	
		
		local point = {"",1,100,26609,18005,2560}
		if Task_L_TalkToNpc(0xc3cd7,6,point,"Herod",0,1,7) then
			--使用传送阵
			Task_L_UseTransmit(0xc3cd8,1,"Zagoras Fortress","Zagoras Fortress")
		end
		
		local point = {"",1,100,16033,13609,2048}
		Task_L_TalkToNpc(0xc3cd8,1,point,"Armen",0,1,17)

		local point1 = {"",0,600,14070,23726,2048}	
		local point2 = {"",0,600,14017,22325,2048}
		Task_L_LoopAttackMonMore(0xc3cd8 ,2,0,2,point1,point2)	

		local point = {"",1,100,16477,10877,2048}
		Task_L_TalkToNpc(0xc3cd8,3,point,"Thirain",0,1,13)

		local point = {"",1,100,16035,1459,1024}
		Task_L_TalkToNpc(0xc3cd9,1,point,"Mak",0,1,1)

		local point = {"",1,100,14125,1919,1024}
		Task_L_TalkToNpc(0xc3cd9,2,point,"Maller",0,1,2)

		local point1 = {"",0,300,13388,1278,1024}
		local point2 = {"",0,300,13470,1800,1024}
		local point3 = {"",0,300,13231,2057,1024}	
		local point4 = {"",0,300,12410,2120,1024}
		local point5 = {"",0,300,12127,1454,1024}	
		Task_L_LoopCollectMore(0xc3cd9,3,0,5,point1,point2,point3,point4,point5)
	
		local point = {"",1,100,14125,1919,1024}
		Task_L_TalkToNpc(0xc3cd9,4,point,"Maller",0,1,3)

		local point = {"",1,100,14125,1919,1024}
		Task_L_TalkToNpc(0xc3cd9,5,point,"Maller",0,1,4)
		--使用物品
		Task_L_UseItem(0xc3cd9 ,6,"Song of Valor")
		
		local point = {"",1,100,16035,1459,1024}
		Task_L_TalkToNpc(0xc3cd9,7,point,"Mak",0,1,2)  

		local point = {"",1,100,25570,2516,1024}
		Task_L_TalkToNpc(0xc3cda,1,point,"Thirain",0,1,12)  

		local point = {"",1,100,22975,-3720,1023}
		Task_L_AutoGetTo(0xc3cda,2,10811,point,0,0) 


	end
	---------------------------------------------------------------------------
	--第2张图
	if Fun_IsInMapByMapId(10812) then
		GlobalFun(0)
		local point = {"",1,100,2924,22072,2050}
		Task_L_TalkToNpc(0xc3cda,3,point,"Armen",0,1,18)
		
		----------------------
		--先去买锄头
		local point = {"Nickel",1,100,13150,13471,1025}
		Task_L_BuyLifeItem(0x451fc9,2,2,point)

		local point = {"Dazzling Ore",1,300,16333,8832,1024}
		Task_L_CollectLifeItem(0x451fc9,2,"Copper Ore",point)

		if Task_L_GetTaskIsComplete(0x451fc9)  then
			Task_L_UseTransmit(0x451fc9,2,"Termia Library","Luterra Castle")
		end
		----------------------
		--Task_L_UseEquipBox("Сундучок исследователя III")

		local point = {"",1,100,2924,22072,2050}
		Task_L_TalkToNpc(0xc40b9,1,point,"Armen",0,1,10)

		local point = {"",1,100,3292,22429,2048}
		Task_L_TalkToNpc(0xc40b9,2,point,"Lloyd",0,1,2)

		--进入剧情副本  10826
		local point = {"",1,100,10152,11209,1025}	
		if Task_L_LongGetTo(0xc40b9,3,10812,1,point) then
			local point = {"",1,100,10460,11965,1025}
			Task_L_AutoGetTo(0xc40b9,3,10812,point,1,0x2A4A)
		end
		--开传送阵
		local point = {"Lakebar",1,100,10085,13570,1044}
		if Task_L_OpenTranMission(0xc40b9,4,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 968的药, 并且卖东西
			local point = {"Ethan",1,100,10501,15220,1024}
			Task_L_BuyItem(0xc40b9,4,50,5,"Major Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 50,0,0)
			--修理
			if Fun_IsHaveTask(0xc40b9,4) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Lakebar", --大地图
						"Lakebar Village", --小地图
						"Lakebar", --传送阵
						{ 12558,13337,1020 }, --修理NPC坐标
						{ 10491,15184,1023 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end


			local point = {"",1,100,11916,16053,1022}
			Task_L_TalkToNpc(0xc40b9,4,point,"Thirain",0,1,0x16)
		end


		local point = {"",1,100,11916,16053,1022}
		Task_L_TalkToNpc(0xc40bb,1,point,"Thirain",0,1,0x15)
	
		local point1 = {"",0,800,5286,3106,1533}
		local point2 = {"",0,800,6239,2181,1536}
		local point3 = {"",0,800,5567,1184,1536}	
		Task_L_LoopAttackMonMore(0xc40bb,2,0,3,point1,point2,point3)
		
		local point = {"",0,800,9746,-680,2048}
		Task_L_LoopAttackMonMore(0xc40bb,2,1,1,point)

		local point = {"",1,100,11916,16053,1022}
		Task_L_TalkToNpc(0xc40bb,3,point,"Thirain",0,1,0x14)

		local point = {"",1,100,11916,16053,1022}
		Task_L_TalkToNpc(0xc40bc,1,point,"Thirain",0,1,0x13)

		local point = {"",1,100,10874,15486,1024}
		Task_L_TalkToNpc(0xc40bc,2,point,"Hordern",0,1,1)

		local point = {"",1,100,11916,16053,1022}
		Task_L_TalkToNpc(0xc40bc,3,point,"Thirain",0,1,0x12)

		local point = {"",1,100,10917,16410,1015}
		Task_L_TalkToNpc(0xc40bd,1,point,"Armen",0,1,9)
		
		local point1 = {"Collect",0,300,10251,16410,1017}
		local point2 = {"Collect",1,300,11290,14097,1021}
		local point3 = {"Collect",2,300,9654,16315,1012}
		Task_L_BranchLine(0xc40bd,2,3,point1,point2,point3)

		local point = {"",1,100,10917,16410,1015}
		Task_L_TalkToNpc(0xc40bd,3,point,"Armen",0,1,8)

		local point = {"",1,100,10886,15488,1024}
		Task_L_TalkToNpc(0xc40be,1,point,"Hordern",0,1,2)


		local point = {"",1,100,10288,4387,1277}
		Task_L_TalkToNpc(0xc40be,2,point,"Fobus",0,1,1)
		

		local point1 = {"Collect",0,300,9690,4303,1280}
		local point2 = {"Collect",1,300,8671,4076,1280}
		local point3 = {"Collect",2,300,9691,3696,1280}
		Task_L_BranchLine(0xc40be,3,3,point1,point2,point3)

		local point = {"",1,100,10886,15488,1024}
		Task_L_TalkToNpc(0xc40bf,1,point,"Hordern",0,1,7)

		local point = {"",1,300,13231,14083,1024}
		Task_L_Collection(0xc40bf ,2,point)	
		
		local point = {"",1,100,13243,14033,1024}
		Task_L_TalkToNpc(0xc40bf,3,point,"Artisan Urr",0,1,3)

		local point = {"",1,100,13243,14033,1024}
		Task_L_UseTaskItem(0xc40bf,4,point)

		if IsMatch == 22 then
			return 22
		else
			local point1 = {"",0,800,9964,8679,1021}
			local point2 = {"",0,800,11123,9580,1020}
			local point3 = {"",0,800,12034,8019,1024}	
			Task_L_LoopAttackMonMore(0xc40bf,5,0,3,point1,point2,point3)
		

			local point1 = {"",0,800,21349,10057,1533}
			local point2 = {"",0,800,20311,11256,1536}
			Task_L_LoopAttackMonMore(0xc40bf,5,1,2,point1,point2)
		end
		
		local point = {"",1,100,24241,11453,1536}
		Task_L_TalkToNpc(0xc40bf,6,point,"Mirren",0,1,1)
		--开传送阵
		local point = {"Lakebar Encampment",1,100,24278,12293,1559}
		if Task_L_OpenTranMission(0xc40bf,7,point) == 1 then 	

			local point = {"",1,100,10085,13570,1044}
			Task_L_UseTransmitPoint(0xc40bf,7,"Lakebar",point)

			local point = {"",1,100,13215,13985,1024}
			Task_L_TalkToNpc(0xc40bf,7,point,"Artisan Urr",0,1,4)
		end

		local point = {"",1,100,11916,16053,1022}
		Task_L_TalkToNpc(0xc40c0,1,point,"Thirain",0,1,0x11)

		if Task_L_GetTaskIsComplete(0xc40c0) then
			local point = {"",1,100,11910,16109,1024}
			Task_L_CompleteTask(0xc40c0 ,2,point,"Thirain",-1)
		else
			local point = {"",1,100,10917,16410,1015}
			Task_L_TalkToNpc(0xc40c0,2,point,"Armen",2,1,7)
		end
		----------------------------------------------
		if Fun_IsHaveTask(0xc44a2,1) == 1 then 
			Fun_SetBackHomeInfo(80, 40,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,3000,24637,-2360,2048}	
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,10085,13570,1044}
					Task_L_UseTransmitPoint(0xc44a2,1,"Lakebar",point)
				else
					Task_L_LoopEquipFun()
					local point = {"Ethan",1,100,10501,15220,1024}
					Task_L_BuyItem(0xc44a2,1,50,5,"Major Healing Potion",point)

					local BackHomeInfo = {
						0, --1比较小地图
						"Lakebar", --大地图
						"Lakebar Village", --小地图
						"Lakebar", --传送阵
						{ 12558,13337,1020 }, --修理NPC坐标
						{ 10491,15184,1023 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,4000,11203,13605,1021}	
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,24278,12293,1559}
					Task_L_UseTransmitPoint(0xc44a2,1,"Lakebar Encampment",point)
				else
					--进入剧情副本 10851
					local point = {"",1,100,24637,-2360,2048}	
					if Task_L_LongGetTo(0xc44a2,1,10812,1,point) then
						local point = {"",1,100,25269,-2520,2048}
						Task_L_AutoGetTo(0xc44a2,1,10812,point,1,0x2A63)
					end
				end
			end
		end
		-----------------------------------------------
		local point = {"",1,100,10085,13570,1044}
		if Task_L_UseTransmitPoint(0xc44a3,1,"Lakebar",point) then

			local point = {"Hordern",6,300,10882,15464,1024}  
			Task_L_BranchTalkToNpc(0xc44a3,1,0,point)

			local point = {"Artisan Urr",5,300,13227,13941,1024}  
			Task_L_BranchTalkToNpc(0xc44a3,1,1,point)
		end

		local point = {"",1,100,24278,12293,1559}
		Task_L_UseTransmitPoint(0xc44a3,2,"Lakebar Encampment",point)

		local point = {"",1,100,25698,23810,2098}
		Task_L_AutoGetTo(0xc44a3,2,10812,point,0,0) 

		if Task_L_FindTask(0xc38ee) == 1 then
			if IsMatch == 26 then
				return 26
			else
				Task_L_UseTransmit(0xc38eb,1,"Palace Entrance","Luterra Castle")
			end
		end
		
		if Fun_IsHaveTask(0xc38eb, 1) == 1 then
			if IsMatch == 26 then
				return 26
			else
				Task_L_UseTransmit(0xc38eb,1,"Palace Entrance","Luterra Castle")
			end
		end

		if Fun_IsHaveTask(0xc38ea, 2) == 1 then
			Task_L_UseTransmit(0xc38ea,2,"Palace Entrance","Luterra Castle")
		end

		if Fun_IsHaveTask(0xc63e1, 1) == 1 then
			--使用传送阵
			Task_L_UseTransmit(0xc63e1,1,"Pumpkin Farm","Pumpkin Farm")
		end

		if Fun_IsHaveTask(0xc63e2, 1) == 1 then
			--使用传送阵
			if IsMatch == 30 then
				return 30
			else
				Task_L_UseTransmit(0xc63e2,1,"Pumpkin Farm","Pumpkin Farm")
			end
		end
	end
	---------------------------------------------------------------------------
	--第3张图
	if Fun_IsInMapByMapId(10813) then
		GlobalFun(0)
		local point = {"",1,100,3729,-1962,2212}
		Task_L_TalkToNpc(0xc4889,1,point,"Thenon",0,1,1)
		
		--Task_L_UseEquipBox("Сундучок исследователя III")

		--开传送阵
		local point = {"Medrick Monastery",1,100,12782,9734,2922}
		if Task_L_OpenTranMission(0xc4889,2,point) == 1 then	

			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Liane",1,100,11278,8468,2900}
			Task_L_BuyItem(0xc4889,2,50,5,"Major Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50,50,0,0)
			--修理
			if Fun_IsHaveTask(0xc4889,2) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Medrick Monastery", --大地图
						"Medrick Monastery", --小地图
						"Medrick Monastery", --传送阵
						{ 10599,9342,2896 }, --修理NPC坐标
						{ 11278,8468,2900 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,10960,10064,2896}
			Task_L_TalkToNpc(0xc4889,2,point,"Efferin",0,1,2)
		end

		--进入剧情副本  10827
		local point = {"",0,100,7652,12726,2130}
		if Task_L_LongGetTo(0xc4889,3,10813,1,point) then
			local point = {"",1,100,8287,13083,2131}
			Task_L_AutoGetTo(0xc4889,3,10813,point,1,0x2A4B) 
		end

		local point = {"",1,100,12714,9298,2896}
		Task_L_TalkToNpc(0xc4889,4,point,"Thirain",0,1,0x2A)

		local point = {"",1,100,12714,9298,2896}
		Task_L_TalkToNpc(0xc488b,1,point,"Thirain",0,1,0x19)

		local point = {"",1,100,12057,8894,2898}
		Task_L_TalkToNpc(0xc488b,2,point,"Armen",0,1,0x15)

		local point = {"",1,100,10960,10064,2896}
		Task_L_TalkToNpc(0xc488b,3,point,"Efferin",0,1,3)

		if Task_L_FindTask(0xc488b) == 1 then
			local point = {"",1,2000,9866,-580,-15032}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,100,12782,9734,2922}
				Fun_L_Transmit("Medrick Monastery",point)
			end
		end

		local point1 = {"",0,800,12574,3043,2888}
		local point2 = {"",0,800,11611,769,2888}
		local point3 = {"",0,800,11771,-904,2888}
		Task_L_LoopAttackMonMore(0xc488b,4,0,3,point1,point2,point3)

		if Task_L_FindTask(0xc488b) == 1 then
			local point = {"",1,2000,9866,-580,-15032}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,100,12782,9734,2922}
				Fun_L_Transmit("Medrick Monastery",point)
			end
		end

		local point1 = {"",0,800,12574,3043,2888}
		local point2 = {"",0,800,11611,769,2888}
		local point3 = {"",0,800,12019,-1028,2888}
		Task_L_LoopAttackMonMore(0xc488b,4,1,3,point1,point2,point3)---支线多点打怪，需要优化


		local point = {"",1,100,19182,344,2890}
		Task_L_TalkToNpc(0xc488b,5,point,"Zenon",0,1,1)

		local point1 = {"",10,100,24281,1761,2688}
		local point2 = {"",10,100,27648,12400,1653}
		local point3 = {"",0,100,25216,12835,560}
		if Task_L_LongGetTo(0xc488c,1,10813,3,point1,point2,point3) then 
			--开传送阵
			local point = {"Nahun's Lift",1,100,25216,12835,560}
			if Task_L_OpenTranMission(0xc488c,1,point) == 1 then
				local point = {"",0,100,23790,14722,512}
				if Task_L_LongGetTo(0xc488c,1,10813,1,point) then 
					local point = {"",1,100,21007,18493,-0}
					Task_L_TalkToNpc(0xc488c,1,point,"Thirain",0,1,0x1A)
				end
			end
		end

		local point = {"",1,100,21017,17461,-0}
		Task_L_TalkToNpc(0xc488c,2,point,"Barchan",0,1,2)

		local point = {"",1,100,21007,18493,-0}
		Task_L_TalkToNpc(0xc488c,3,point,"Thirain",0,1,0x1B)

		local point1 = {"",0,500,14556,18608,-1}
		local point2 = {"",0,500,13243,17907,-1}
		local point3 = {"",0,500,12334,17366,-1}
		local point4 = {"",0,500,11978,19407,-0}
		local point5 = {"",0,500,13230,19492,-0}
		Task_L_LoopAttackMonMore(0xc488c,4,0,5,point1,point2,point3,point4,point5)

		--开传送阵
		local point = {"Freyad Lake",1,100,14459,24762,-1001}
		if Task_L_OpenTranMission(0xc488c,4,point) == 1 then	
			local point1 = {"",0,100,19256,25424,-1024}
			local point2 = {"",0,100,19398,24314,-1025}
			local point3 = {"",0,100,20783,22816,-1030}
			Task_L_LoopCollectMore(0xc488c,4,1,3,point1,point2,point3)
		end

		local point = {"",1,100,25420,25762,-1024}
		Task_L_TalkToNpc(0xc488c,5,point,"Thirain",0,1,0x1C)

		local point = {"",1,100,25420,25762,-1024}
		Task_L_TalkToNpc(0xc488d,1,point,"Thirain",0,1,0x1D)
		
		local point = {"",1,100,26525,23745,-1024}
		Task_L_AutoGetTo(0xc488d,2,10813,point,0,0)

		local point = {"",1,100,10960,10064,2896}
		Task_L_TalkToNpc(0xc38ed,3,point,"Efferin",0,1,4)

		local point = {"",1,100,9841,13528,2166}	
		Task_L_Collection(0xc38ed,4,point)

		--使用传送阵
		Task_L_UseTransmit(0xc38ed,5,"Palace Entrance","Luterra Castle")
	end
	---------------------------------------------------------------------------
	--第4张图
	if Fun_IsInMapByMapId(10814) then
		GlobalFun(0)
		local point = {"",1,100,4891,-884,2048}
		Task_L_TalkToNpc(0xc4c71,1,point,"Friske",0,1,1)
		
		--Task_L_UseEquipBox("Сундучок исследователя III")

		local point1 = {"",0,500,4106,715,2048}
		local point2 = {"",0,500,3157,1652,2048}
		local point3 = {"",0,500,3157,1652,2048}
		local point4 = {"",0,500,2267,337,2048}
		Task_L_LoopAttackMonMore(0xc4c71,2,0,4,point1,point2,point3,point4)
		
		local point1 = {"",0,500,4106,715,2048}
		local point2 = {"",0,500,3157,1652,2048}
		local point3 = {"",0,500,3157,1652,2048}
		local point4 = {"",0,500,2267,337,2048}
		Task_L_LoopAttackMonMore(0xc4c71,2,1,4,point1,point2,point3,point4)	
		
		local point = {"",1,100,8745,3690,1536}	
		if Task_L_LongGetTo(0xc4c71,3,10814,1,point) then
			local point = {"",1,100,14636,1482,1536}
			Task_L_TalkToNpc(0xc4c71,3,point,"Toibonen",0,1,1)
		end
		
		local point = {"",1,100,14636,1482,1536}
		Task_L_TalkToNpc(0xc4c72,1,point,"Toibonen",0,1,2)

		local point = {"",1,300,12697,8707,1043}	
		Task_L_Collection(0xc4c72,2,point)
		
		--开传送阵
		local point = {"Spring Refugee Outpost",1,100,9226,14412,1047}
		if Task_L_OpenTranMission(0xc4c72,3,point) == 1 then

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 50,0,0)
			--修理
			if Fun_IsHaveTask(0xc4c72,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Bilbrin Forest", --大地图
						"Spring Refugee Outpost", --小地图
						"Spring Refugee Outpost", --传送阵
						{ 9151,12184,1026 }, --修理NPC坐标
						{ 9480,12227,1023 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,10362,13524,1024}
			Task_L_TalkToNpc(0xc4c72,3,point,"Johanan",0,1,2)
		end

		local point = {"",1,100,10362,13524,1024}
		Task_L_TalkToNpc(0xc4c73,1,point,"Johanan",0,1,1)

		local point = {"",1,100,9384,13289,1024}
		Task_L_TalkToNpc(0xc4c73,2,point,"Thirain",0,1,0x1E)

		local point = {"",1,100,10091,13659,1024}
		Task_L_TalkToNpc(0xc4c73,3,point,"Cassleford",0,1,2)
		
		local point = {"",1,100,9384,13289,1024}
		Task_L_TalkToNpc(0xc4c73,4,point,"Thirain",0,1,0x1F)

		local point1 = {"",0,600,22352,10785,1535}
		local point2 = {"",0,600,22229,8803,1535}
		local point3 = {"",0,600,22432,7348,1531}
		Task_L_LoopAttackMonMore(0xc4c73,5,0,3,point1,point2,point3)

		local point = {"",1,100,9454,13936,1024}
		Task_L_TalkToNpc(0xc4c74,1,point,"Armen",0,1,0x16)

		--开传送阵
		local point = {"Helmon Castle Remains",1,100,17269,23492,1559}
		if Task_L_OpenTranMission(0xc4c74,2,point) == 1 then
			local point = {"",1,100,17121,22176,1541}
			Task_L_TalkToNpc(0xc4c74,2,point,"Enang",0,1,1)
		end
		--进入场景副本 10828
		local point = {"",1,100,19672,22445,1797}	
		if Task_L_LongGetTo(0xc4c74,3,10814,1,point) then
			local point = {"",1,100,20617,22486,1777}
			Task_L_AutoGetTo(0xc4c74,3,10814,point,1,0x02A4C) 	
		end

		local point = {"",1,100,17407,23170,1536}
		Task_L_TalkToNpc(0xc4c76,1,point,"Thirain",0,1,0x21)

		local point = {"",1,100,17121,22176,1541}
		Task_L_TalkToNpc(0xc4c76,2,point,"Enang",0,1,2)

		local point = {"",1,100,18279,23424,1535}
		Task_L_TalkToNpc(0xc4c76,3,point,"Armen",0,1,0x17)

		local point = {"",1,100,17407,23170,1536}
		Task_L_TalkToNpc(0xc4c76,4,point,"Thirain",0,1,0x22)

		local point = {"Dernan",99,300,17507,22224,1536}  
		Task_L_BranchTalkToNpc(0xc4c77,1,0,point)

		local point = {"Zenon",99,300,17507,22224,1536}   
		Task_L_BranchTalkToNpc(0xc4c77,1,1,point)

		local point = {"Meehan",99,300,17507,22224,1536} 
		Task_L_BranchTalkToNpc(0xc4c77,1,2,point)

		local point = {"Riwella",99,300,17507,22224,1536} 
		Task_L_BranchTalkToNpc(0xc4c77,1,3,point)

		local point = {"Lloyd",99,300,17507,22224,1536}  
		Task_L_BranchTalkToNpc(0xc4c77,1,4,point)	

		local point = {"",1,100,17407,23170,1536}
		Task_L_TalkToNpc(0xc4c77,2,point,"Thirain",0,1,0x23)

		local point = {"",1,100,2247,19530,1243}
		Task_L_AutoGetTo(0xc4c77,3,10814,point,0,0) 

	end
	---------------------------------------------------------------------------
	--第5张图
	if Fun_IsInMapByMapId(10815) then
		GlobalFun(0)
		local point = {"",1,100,23730,-2170,2560}
		Task_L_TalkToNpc(0xc5059,1,point,"Armen",0,1,0x19)
		
		--Task_L_UseEquipBox("Сундучок исследователя III")

		local point1 = {"",0,600,17072,369,2048}
		local point2 = {"",0,600,17024,510,2048}
		local point3 = {"",0,600,15689,-896,2048}
		local point4 = {"",0,600,15392,933,2048}
		Task_L_LoopAttackMonMore(0xc5059,2,0,4,point1,point2,point3,point4)	
		--开传送阵
		local point = {"Front Outpost",1,100,8653,4604,2095}
		if Task_L_OpenTranMission(0xc5059,3,point) == 1 then
			
			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 50,0,0)
			--修理
			if Fun_IsHaveTask(0xc5059,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Battlebound Plains", --大地图
						"Front Outpost", --小地图
						"Front Outpost", --传送阵
						{ 6727,5105,2047 }, --修理NPC坐标
						{ 6998,6645,2047 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,7554,6162,2048}
			Task_L_TalkToNpc(0xc5059,3,point,"Thirain",0,1,0x24)
		end

		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc5059) then
			local point = {"",1,100,11887,20176,511}
			Task_L_CompleteTask(0xc5059 ,4,point,"Thirain",-1)
		else
			--进入场景副本 10829
			local point = {"",1,100,5731,8191,2048}	
			if Task_L_LongGetTo(0xc5059,4,10815,1,point) then
				local point = {"",1,100,6320,8925,2048}
				Task_L_AutoGetTo(0xc5059,4,10815,point,1,0x2A4D) 	
			end
		end

		local point = {"",1,100,12015,20045,512}
		Task_L_TalkToNpc(0xc505d,1,point,"Thirain",0,1,0x26)

		--开传送阵
		local point = {"Blackblood Ridge",1,100,11221,18450,535}
		if Task_L_OpenTranMission(0xc505d,2,point)	== 1 then
			--搬东西
			local point1 = {"",1,200,12214,18903,512}	
			local point2 = {"",1,100,11863,20078,512}		
			Task_L_CarryItem(0xc505d,2,0,point1,point2)
			local point1 = {"",1,200,11048,19013,512}	
			local point2 = {"",1,100,11863,20078,512}		
			Task_L_CarryItem(0xc505d,2,1,point1,point2)
		end

		local point = {"",1,100,12208,18573,512}	
		Task_L_Collection(0xc505d,3,point)
		--使用表情
		local point = {"",1,100,12229,18608,512}
		Task_L_UseExpression(0xc505d,4,"Encourage",point) 

		local point = {"",1,100,8708,22825,1152}	
		Task_L_Collection(0xc505d,5,point)
		
		local point = {"",1,100,12006,20019,512}
		Task_L_TalkToNpc(0xc505d,6,point,"Thirain",0,1,0x27)

		--进入剧情副本 10894
		local point = {"",1,100,12461,23492,528}
		Task_L_AutoGetTo(0xc505d,7,10815,point,0,0) 	
	end
	---------------------------------------------------------------------------
	-------------------------------卢兰东部------------------------------------
	---------------------------------------------------------------------------
	--第1张图
	if Fun_IsInMapByMapId(10801) then
		GlobalFun(0)

		if Fun_IsHaveTask(0xc38ee,1) == 1 then
			Task_L_AcceptGlobalTask(0x10ec6f)
		end

		---------------------------
		--[[
		if Task_L_FindTask(0x41a0c9) == 1 then
			local point = {"",1,100,9498,-14,1544}
			Task_L_UseMusic(0x41a0c9,1,"Song of Hearth and Home",point)
		end
		
		if Task_L_FindTask(0xc38e9) == 0 then--家园任务
			if Task_L_FindTask(0xc38ea) == 0 then--家园任务
				--家园任务
				local point = {"",1,100,9498,-14,1544}
				Task_L_TalkToNpc(0x41a0cf,1,point,"Royal Receptionist",0,1,1)

				local point = {"",1,100,9498,-14,1544}
				Task_L_TalkToNpc(0x41a0cf,2,point,"Royal Receptionist",0,1,2)

				local point = {"",1,100,9498,-14,1544}
				Task_L_UseMusic(0x41a0c8,1,"Song of Hearth and Home",point)
				
			end
		end
		--]]
		---------------------------
		--[[
		if Task_L_FindTask(0x41a0c8) == 0 then--家园任务	
			if Task_L_FindTask(0x41a0c9) == 0 then--家园任务
				if Task_L_FindTask(0x41a0cf) == 0 then--家园任务
					--]]
					
					--开传送阵
					local point = {"Market District",1,100,3383,4578,424}
					if Task_L_OpenTranMission(0x10ec6f,1,point) == 1 then
							
						--1.持久  2.背包空余
						Fun_SetBackHomeInfo(80, 50,0,0)
						--修理
						if Fun_IsHaveTask(0x10ec6f,1) == 1 then
							if Fun_IsNeedBackHome() == 1 then
								MSG("LYlua 进入了修理函数")
								local BackHomeInfo = {
									0, --1比较小地图
									"Luterra Castle", --大地图
									"Luterra Castle", --小地图
									"Market District", --传送阵
									{ 4943,4511,447 }, --修理NPC坐标
									{ 5390,4446,447 } --买卖NPC坐标
								}
								Fun_BackHome(BackHomeInfo)
							end
						end

						local point = {"",1,100,-161,6894,453}
						Task_L_TalkToNpc(0x10ec6f,1,point,"Brite",0,1,1)
					end
					--[[
				end
			end
		end
			--]]	
		if Task_L_GetTaskIsComplete(0x10ec6f) then
			local point = {"",1,100,-161,6894,453}
			Task_L_CompleteTask(0x10ec6f ,1,point,"Brite",-1)

			--接受任务
			local point = {"Brite",1,100,-161,6894,453}
			Task_L_AcceptTask(0xc38ee,1,0x10ec74 ,point)
		
		end
		--解封石头
		local point = {"Brite",1,100,-161,6894,453}
		Task_L_StoneUnseal(0x10ec74 ,1,"Stone of Birth",point)

		Task_L_UseItemStone("Stone of Birth")

		local point = {"",1,100,-161,6894,453}
		Task_L_TalkToNpc(0x10ec74,2,point,"Brite",0,1,2)

		if Task_L_GetTaskIsComplete(0x10ec74) then
			local point = {"",1,100,-161,6894,453}
			Task_L_CompleteTask(0x10ec74 ,2,point,"Brite",-1)

			--这里放接受
			Task_L_AcceptGlobalTask(0x451fd0)
		end

		local point = {"",1,100,2924,5757,447}
		Task_L_TalkToNpc(0x451fd0,1,point,"Legendary Adventurer",0,1,9)

		if Task_L_GetTaskIsComplete(0x451fd0) then
			local point = {"",1,100,2924,5757,447}
			Task_L_CompleteTask(0x451fd0 ,1,point,"Legendary Adventurer",-1)
		end

		--[[
		if Task_L_FindTask(0x41a0c8) == 0 then--家园任务	
			if Task_L_FindTask(0x41a0c9) == 0 then--家园任务
				if Task_L_FindTask(0x41a0cf) == 0 then--家园任务
					--]]
					local point = {"",1,100,4612,-151,770}
					Task_L_TalkToNpc(0xc38ee,1,point,"Bard Shannon",0,1,1)
					--[[
				end
			end
		end
		--]]

		local point = {"Termia Library",1,100,2193,-2337,264}
		if Task_L_OpenTranMission(0xc38ee,2,point) == 1 then
			if Task_L_GetTaskIsComplete(0xc38ee) then
				local point = {"",1,100,4612,-151,770}
				Task_L_CompleteTask(0xc38ee ,2,point,"Bard Shannon",-1)

				--Task_L_AcceptGlobalTask(0x451fc9)	
			else
				--绑定回城
				local point = {"Portal Statue",1,100,4736,115,770}
				Task_L_SetBackHome(0xc38ee,2,point)
			end
		end

		----------------------------------------

		--开传送阵
		local point = {"Termia Library",1,100,2193,-2337,264}
		if Task_L_OpenTranMission(0x451fc9,1,point) == 1 then

			local point1 = {"Luterra Castle",1,100,518,-3478,63}
			local point2 = {"Luterra Castle",1,50,806,-3481,94}
			local point3 = {"Neria's Tavern",1,100,1537,-3131,-14271}
			if Task_L_LongGetTo(0x451fc9,1,10801,3,point1,point2,point3) then
				local point = {"",1,100,1537,-3131,-14271}
				Task_L_TalkToNpc(0x451fc9,1,point,"Chapman",0,1,1)
			end
		end

		----采矿回来交任务
		if Task_L_GetTaskIsComplete(0x451fc9) then
			local point1 = {"Luterra Castle",1,100,518,-3478,63}
			local point2 = {"Luterra Castle",1,50,806,-3481,94}
			local point3 = {"Neria's Tavern",1,100,1537,-3131,-14271}
			if Task_L_LongGetTo(0x451fc9,2,10801,3,point1,point2,point3) then
				local point = {"",1,100,1537,-3131,-14271}
				Task_L_CompleteTask(0x451fc9 ,2,point,"Chapman",-1)
				Fun_Sleep(2000)
				--使用传送阵  这里还需要一个 ID
				Task_L_UseTransmit(0xc38eb,1,"Market District","Luterra Castle")
			end
		else
			--使用传送阵 去采矿
			Task_L_UseTransmit(0x451fc9,2,"Lakebar","Lakebar Village")
		end
		----------------------------------------

		--这个牵涉两个地图
		local point = {"",1,100,17861,2,-14236}
		Task_L_TalkToNpc(0xc38e9,1,point,"Thirain",0,1,8)

		----------------------------------------亲密度
		MSG("Lei 亲密度")
		local point = {"",1,100,17861,2,-14236}
		--Task_L_CommunicationForNpc(0xc38e9 ,2,point,"Thirain")

		--Task_L_UseItem(0xc38e9 ,2,"100-Gold Coin")
		--Task_L_UseItem(0xc38e9 ,2,"100-Gold Coin")
		---------------------------------------
	
		local point = {"",1,100,17293,129,-14331}
		Task_L_TalkToNpc(0xc38e9,2,point,"Armen",0,1,2)

		local point = {"",1,100,13000,-2041,-14589}
		Task_L_TalkToNpc(0xc38e9,3,point,"Knight Commander Cassleford",0,1,1)

		local point = {"",1,100,12064,-2271,-14591}
		Task_L_AutoGetTo(0xc38e9,4,10801,point,0,0) 

		--这个牵涉两个地图
		local point1 = {"Luterra Palace",1,100,10979,-28,-14567}
		local point2 = {"Luterra Palace",1,50,10597,33,-14567}
		local point3 = {"Luterra Castle",1,100,9769,-140,1538}
		if Task_L_LongGetTo(0xc38ea,1,10801,3,point1,point2,point3) then
			local point = {"",1,100,9769,-140,1538}
			Task_L_TalkToNpc(0xc38ea ,1,point,"Royal Guard Captain Ranche",0,1,1)
		end
		
		--开传送阵
		local point = {"Palace Entrance",1,100,9683,1671,1569}
		if Task_L_OpenTranMission(0xc38ea,2,point) == 1 then
			--判断任务是否完成
			if Task_L_GetTaskIsComplete(0xc38ea) then
				local point = {"",1,100,9438,5366,991}
				Task_L_CompleteTask(0xc38ea ,2,point,"Arena Manager Lorence",-1)
			else
				local point = {"",1,100,9802,5636,992}
				Task_L_AutoGetTo(0xc38ea,2,10801,point,0,0) 
			end
		end

		--[[
		if Task_L_FindTask(0x451fc9) == 0 then--挖矿任务
			if Task_L_FindTask(0x41a0c8) == 0 then--家园任务	
				if Task_L_FindTask(0x41a0c9) == 0 then--家园任务
					if Task_L_FindTask(0x41a0cf) == 0 then--家园任务
					--]]			
						if IsMatch == 0 then
							MSG("Lei 26级邮寄")		
							local point = {"",1,100,3686,3699,384}
							Task_L_Email(0xc38eb,1,point)
						else
							if IsMatch == 26 then
								if Fun_IsHaveTask(0xc38eb, 1) == 1 then
									return 26
								end
							else
								local point = {"",1,100,902,5407,452}
								Task_L_TalkToNpc(0xc38eb ,1,point,"Finance Manager Jereint",0,1,1)
							end
						end
						--[[
					end
				end
			end
		end
		--]]
		local point = {"",1,100,-6297,-40,-256}
		Task_L_TalkToNpc(0xc38eb ,2,point,"Guard Captain Steg",0,1,1)

		local point1 = {"",1,100,-7620,-50,-263}	
		local point2 = {"",1,100,-8193,1911,-2}
		Task_L_LongGetTo(0xc5829,1,10801,2,point1,point2)

		local point = {"Market District",1,100,3383,4578,424}
		if Task_L_OpenTranMission(0xc5830,1,point) == 1 then
			--这个牵涉两个地图
			local point1 = {"Luterra Castle",1,100,3359,-4519,310}
			local point2 = {"Luterra Castle",1,50,3642,-4579,389}
			local point3 = {"Termia Library",1,100,4852,-4053,-23535}
			if Task_L_LongGetTo(0xc5830,1,10801,3,point1,point2,point3) then
				local point = {"",1,100,4852,-4053,-23535}
				Task_L_TalkToNpc(0xc5830 ,1,point,"Armen",0,1,4)
			end
		end

		if Fun_IsHaveTask(0xc5830, 2) == 1 then
			local point = {"",1,2000,4852,-4053,-23535}
			if Fun_IsInPoint(point) == 1 then
				--使用传送阵
				Task_L_UseTransmit(0xc5830,2,"Palace Entrance","Luterra Castle")
			end
		end
		
		if Task_L_GetTaskIsComplete(0xc5830) then
			--使用传送阵
			Task_L_UseTransmit(0xc5830,2,"Bishu Manor","Bishu Manor")
		else
			--这个牵涉两个地图
			local point1 = {"Luterra Castle",1,100,10164,5,1636}
			local point2 = {"Luterra Castle",1,50,10436,2,1635}
			local point3 = {"Luterra Palace",1,100,11905,-66,-14591}
			if Task_L_LongGetTo(0xc5830,2,10801,3,point1,point2,point3) then
				local point = {"",1,100,17857,-46,-14236}
				Task_L_TalkToNpc(0xc5830 ,2,point,"Thirain",0,1,0x0C)
			end
		end

		--这个牵涉两个地图
		local point1 = {"Luterra Castle",1,100,10164,5,1636}
		local point2 = {"Luterra Castle",1,50,10436,2,1635}
		local point3 = {"Luterra Palace",1,100,17857,-46,-14236}
		if Task_L_LongGetTo(0xc5c16,1,10801,3,point1,point2,point3) then
			local point = {"",1,100,17857,-46,-14236}
			Task_L_TalkToNpc(0xc5c16,1,point,"Thirain",0,1,5)
		end

		--使用传送阵
		Task_L_UseTransmit(0xc5c16,2,"Pumpkin Farm","Sunbright Hill")

		if Task_L_GetTaskIsComplete(0xc38ec) then

			if Fun_IsHaveTask(0xc38ec, 1) == 1 then
				local point = {"",1,2000,4852,-4053,-23535}
				if Fun_IsInPoint(point) == 1 then
					--使用传送阵
					Task_L_UseTransmit(0xc38ec,1,"Palace Entrance","Luterra Castle")
				end
			end
			--这个牵涉两个地图
			local point1 = {"Luterra Castle",1,100,10164,5,1636}
			local point2 = {"Luterra Castle",1,50,10436,2,1635}
			local point3 = {"Luterra Palace",1,100,17857,-46,-14236}
			if Task_L_LongGetTo(0xc38ec,1,10801,3,point1,point2,point3) then
				local point = {"",1,100,17857,-46,-14236}
				Task_L_CompleteTask(0xc38ec ,1,point,"Thirain",-1)

				local point = {"",1,100,17857,-46,-14236}
				Task_L_TalkToNpc(0xc38ed,1,point,"Thirain",0,1,0x14)

				--使用传送阵
				Task_L_UseTransmit(0xc38ed,2,"Termia Library","Luterra Castle")
			end
		else
			local point1 = {"Luterra Castle",1,100,3359,-4519,310}
			local point2 = {"Luterra Castle",1,50,3642,-4579,389}
			local point3 = {"Termia Library",1,100,4852,-4053,-23535}
			if Task_L_LongGetTo(0xc38ec,1,10801,3,point1,point2,point3) then
				local point = {"",1,100,4852,-4053,-23535}
				Task_L_TalkToNpc(0xc38ec ,1,point,"Armen",0,1,0x0A)
			end
		end

		local point1 = {"Luterra Palace",1,100,10979,-28,-14567}
		local point2 = {"Luterra Palace",1,50,10597,33,-14567}
		local point3 = {"Luterra Castle",1,100,3359,-4519,310}
		local point4 = {"Luterra Castle",1,100,3642,-4579,389}
		local point5 = {"Termia Library",1,100,5885,-4590,-23535}
		if Task_L_LongGetTo(0xc38ed,2,10801,5,point1,point2,point3,point4,point5) then
			local point = {"",1,300,5885,-4590,-23535}
			Task_L_TalkToNpc(0xc38ed,2,point,"Librarian Fudor",0,1,1)
		end

		--使用传送阵
		Task_L_UseTransmit(0xc38ed,3,"Medrick Monastery","Medrick Monastery")

		local point = {"",1,100,9557,1156,1536}
		Task_L_TalkToNpc(0xc38ed,5,point,"Brother Frantz",0,1,1)

		local point1 = {"Luterra Castle",1,100,12550,-5938,1024}
		local point2 = {"Luterra Castle",1,50,12598,-5679,1024}
		local point3 = {"Kadan Cathedral Basement",1,100,15044,3486,-23551}
		if Task_L_LongGetTo(0xc38ed,6,10801,3,point1,point2,point3) then
			local point = {"",1,100,14989,3617,-23551}	
			Task_L_Collection(0xc38ed,6,point)
		end

		local point = {"",1,100,15214,268,-23551}
		Task_L_TalkToNpc(0xc38ed,7,point,"Nomed",0,1,1)


		local point1 = {"Kadan Cathedral Basement",1,100,15223,-913,-23551}
		local point2 = {"Kadan Cathedral Basement",1,50,15231,-1354,-23551}
		local point3 = {"Luterra Castle",1,100,7656,-4823,1280}
		if Task_L_LongGetTo(0xc38ed,8,10801,3,point1,point2,point3) then
			local point = {"",1,100,7656,-4823,1280}
			Task_L_TalkToNpc(0xc38ed,8,point,"Mikeel",0,1,2)
		end

		--30级任务邮寄
		if IsMatch == 1 then 
			if Task_L_FindTask(0x451fc9) == 0 then	
				MSG("Lei 30邮寄")		
				local point = {"",1,100,3686,3699,384}
				Task_L_Email(0xc63e2,1,point)
			end
		else
			if Fun_IsHaveTask(0xc63e2, 1) == 1 then
				if IsMatch == 30 then
					return 30
				else
					--使用传送阵
					Task_L_UseTransmit(0xc63e2,1,"Pumpkin Farm","Pumpkin Farm")
				end
			end
		end

		Task_L_UseTransmit(0xc63e1,1,"Pumpkin Farm","Pumpkin Farm")

		--[[
		if Task_L_FindTask(0x41a0c8) == 0 then--家园任务	
			if Task_L_FindTask(0x41a0c9) == 0 then--家园任务
				if Task_L_FindTask(0x41a0cf) == 0 then--家园任务
					--]]
					if Fun_IsHaveTask(0xc7385, 2) == 1 then
						if IsMatch == 33 then
							MSG("Lei 33邮寄")		
							local point = {"",1,100,3686,3699,384}
							Task_L_Email(0xc7385,2,point)
						end
					end
					--[[
				end
			end
		end
		--]]
		local point1 = {"Luterra Castle",1,100,10164,5,1636}
		local point2 = {"Luterra Castle",1,50,10436,2,1635}
		local point3 = {"Luterra Palace",1,100,17857,-46,-14236}
		if Task_L_LongGetTo(0xc63e3,1,10801,3,point1,point2,point3) then
			local point = {"",1,100,17857,-46,-14236}
			Task_L_TalkToNpc(0xc63e3,1,point,"Thirain",0,1,0x0E)
		end

		--使用传送阵
		Task_L_UseTransmit(0xc63e3,2,"Clay Soldier Garden","Sunbright Hill")

		--第6张图任务回来报告
		if Task_L_GetTaskIsComplete(0xc6f9d) then
			local point1 = {"Luterra Palace",1,100,10979,-28,-14567}
			local point2 = {"Luterra Palace",1,50,10597,33,-14567}
			local point3 = {"Luterra Castle",1,100,-202,6865,453}
			if Task_L_LongGetTo(0xc6f9d,3,10801,3,point1,point2,point3) then
				local point = {"",1,100,-202,6865,453}
				Task_L_CompleteTask(0xc6f9d ,3,point,"Brite",-1)
				--这个任务交完会给一个 石头 然后就可以解封了
			end
		else
			--这个牵涉两个地图
			local point1 = {"Luterra Castle",1,100,10164,5,1636}
			local point2 = {"Luterra Castle",1,50,10436,2,1635}
			local point3 = {"Luterra Palace",1,100,11905,-66,-14591}
			if Task_L_LongGetTo(0xc6f9d,3,10801,3,point1,point2,point3) then
				local point = {"",1,100,17857,-46,-14236}
				Task_L_TalkToNpc(0xc6f9d ,3,point,"Thirain",0,1,0x0F)
			end
		end

		--解封石头，有BUG，应该要用卢恩币来解封 解封暂时不写
		--local point = {"Brite",1,100,5359,6585,512}
		--Task_L_StoneUnseal(0xc6f9e ,2,"Небольшой растрескавшийся фетранит",point)

		local point = {"",1,100,-202,6865,453}
		Task_L_UseTaskItem(0xc6f9e,1,point)
		
		--使用传送阵
		Task_L_UseTransmit(0xc6f9e,2,"Mistfog Shelter","Mistfog Shelter")

		--这个牵涉两个地图
		local point1 = {"Luterra Castle",1,100,10164,5,1636}
		local point2 = {"Luterra Castle",1,50,10436,2,1635}
		local point3 = {"Luterra Palace",1,100,17857,-46,-14236}
		if Task_L_LongGetTo(0xc7769,1,10801,3,point1,point2,point3) then
			local point = {"",1,100,17857,-46,-14236}
			Task_L_CompleteTask(0xc7769 ,1,point,"Thirain",-1)
		end

		--使用传送阵
		Task_L_UseTransmit(0xc7b51,1,"Borea Castle","Боэр Морхен")

		Task_L_UseTransmit(0x3d0d6a,5,"Wavestrand Port","Wavestrand Port")
		
	end
	---------------------------------------------------------------------------
	--第2张图
	if Fun_IsInMapByMapId(10816) then
		GlobalFun(0)
		local point = {"",1,100,16031,2144,1536}
		--Task_L_TalkToNpc(0xc5829,1,point,"Farmer Luban",0,1,2)
		Task_L_TalkToNpc(0xc5829,1,point,"Farmer Ruvian",0,1,2)

		local point1 = {"",0,600,16138,3257,1535}
		local point2 = {"",0,600,16016,4600,1536}
		Task_L_LoopAttackMonMore(0xc5829,2,0,2,point1,point2)	
		
		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Jedin",1,100,17611,7422,1536}
		Task_L_BuyItem(0xc5829,3,50,3,"Adept Healing Potion",point)

		--放药到F1
		Task_L_PushDwonDrug(0xc5829,3,"Adept Healing Potion")

		local point = {"",1,100,17282,8010,1550}
		Task_L_TalkToNpc(0xc5829,3,point,"Monterque Manor Butler Evald",0,1,2)

		--开传送阵
		local point = {"Monterque Manor",1,100,16217,7130,1583}
		if Task_L_OpenTranMission(0xc5829,4,point) == 1 then
			--判断任务是否完成
			if Task_L_GetTaskIsComplete(0xc5829) then
				local point = {"",1,100,17812,7671,1550}
				Task_L_CompleteTask(0xc5829 ,4,point,"Norin Nahun",-1)
			else
				local point = {"",1,100,17784,7848,1541}
				Task_L_TalkToNpc(0xc5829,4,point,"Monterque Nahun",0,1,1)
			end
		end

		local point = {"",1,100,12641,8175,1317}
		Task_L_TalkToNpc(0xc582a,1,point,"Farm Manager Pico",0,1,1)

		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc582a) then
			local point = {"",1,100,13776,16393,1538}
			Task_L_CompleteTask(0xc582a ,2,point,"Blacksmith Prot",-1)
		else
			local point1 = {"",0,100,12467,9885,1534}
			local point2 = {"",0,100,12018,10091,1531}
			Task_L_LoopCollectMore(0xc582a,2,0,2,point1,point2)

			local point1 = {"",0,100,14468,13907,1536}
			local point2 = {"",0,100,14688,14227,1536}
			Task_L_LoopCollectMore(0xc582a,2,1,2,point1,point2)
		end
		--这个交任务得一个箱子 Royal Reward   还有一个30级的 石头
		local point = {"",1,100,9643,11245,1546}
		Task_L_TalkToNpc(0xc582b,1,point,"Angler Melvil",0,1,1)
		
		--开传送阵
		local point = {"Bishu Manor",1,100,3999,12322,1559}
		if Task_L_OpenTranMission(0xc582b,2,point) == 1 then
			local point = {"",1,100,7198,9114,1546}
			Task_L_TalkToNpc(0xc582b,2,point,"Bishu Nahun",0,1,1)
		end

		local point = {"",1,100,7160,8895,1555}
		Task_L_TalkToNpc(0xc582b,3,point,"Elia Nahun",0,1,3)

		local point = {"",1,100,2519,10689,1398}
		Task_L_TalkToNpc(0xc582b,4,point,"Farm Manager Nicholas",0,1,1)

		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc582b) then
			local point = {"",1,100,-573,7212,1536}
			Task_L_CompleteTask(0xc582b ,5,point,"Tristan",-1)	
		else
			local point1 = {"",0,300,2353,10098,1398}
			local point2 = {"",0,300,1523,9790,1395}
			local point3 = {"",0,300,953,9731,1393}
			local point4 = {"",0,300,519,10734,1396}
			local point5 = {"",0,300,680,11290,1394}
			Task_L_LoopCollectMore(0xc582b,5,0,5,point1,point2,point3,point4,point5)
		end
		Task_L_UseItemBook("Emote: Surrender")

		local point1 = {"",0,500,-953,2583,1024}
		local point2 = {"",0,500,-1175,1471,1024}
		local point3 = {"",0,500,-1268,601,1024}
		Task_L_LoopCollectMore(0xc582c,1,0,3,point1,point2,point3)

		local point1 = {"",0,500,-953,2583,1024}
		local point2 = {"",0,500,-1175,1471,1024}
		local point3 = {"",0,500,-1268,601,1024}
		Task_L_LoopAttackMonMore(0xc582c,1,2,3,point1,point2,point3)	

		local point = {"",0,500, 971,477,1024}
		Task_L_LoopAttackMonMore(0xc582c,1,1,1,point)

		local point1 = {"",1,100,194,-1491,1024}	
		local point2 = {"",1,100,5256,-438,1536}	
		if 	Task_L_LongGetTo(0xc582c,2,10816,2,point1,point2) then
			local point = {"",1,100,10854,675,1536}
			Task_L_TalkToNpc(0xc582c,2,point,"Mill Owner Swain",0,1,2)
		end

		--使用传送阵
		Task_L_UseTransmit(0xc582c,3,"Monterque Manor","Monterque Manor")

		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc582c) then
			local point = {"",1,100,17813,7666,1550}
			Task_L_CompleteTask(0xc582c ,3,point,"Norin Nahun",-1)	
		else
			local point = {"",1,100,17784,7848,1541}
			Task_L_TalkToNpc(0xc582c,3,point,"Monterque Nahun",0,1,2)
		end

		local point = {"",1,100,14589,8898,1533}
		Task_L_TalkToNpc(0xc582d,1,point,"Stable Manager Veronica",0,1,2)	

		local point = {"",1,100,9327,13007,1536}	
		if 	Task_L_LongGetTo(0xc582d,2,10816,1,point) then
			local point = {"",1,100,6421,9124,1546}
			Task_L_TalkToNpc(0xc582d,2,point,"Bishu's Butler Bron",0,1,1)
		end
		
		local point = {"",1,100,7198,9114,1546}
		Task_L_TalkToNpc(0xc582e,1,point,"Bishu Nahun",0,1,2)
		--进入场景副本 10830
		local point = {"",1,100,6925,16988,1304}	
		if Task_L_LongGetTo(0xc582e,2,10816,1,point) then
			local point = {"",1,100,7232,17968,1023}
			Task_L_AutoGetTo(0xc582e,2,10816,point,1,0x2A4E) 	
		end

		local point = {"",1,100,1513,12605,1536}
		Task_L_CompleteTask(0xc5830 ,2,point,"Farm Woman Milla",-1)
		--到下个地图
		local point = {"",1,100,1464,19961,1536}
		Task_L_AutoGetTo(0xc5c11,1,10816,point,0,0) 

		
		if Fun_IsHaveTask(0xc7385, 2) == 1 then
			if IsMatch == 33 then
				Task_L_UseTransmit(0xc7385,2,"Market District","Market District")
			else
				local point = {"",1,100,17784,7848,1541}
				Task_L_TalkToNpc(0xc7385,2,point,"Monterque Nahun",0,1,3)
			end
		end

		--使用传送阵
		Task_L_UseTransmit(0xc7385,3,"Sien Inn","Sien Inn")

		Task_L_UseTransmit(0xc5830,1,"Market District","Luterra Castle")	
		Task_L_UseTransmit(0xc5830,1,"Palace Entrance","Luterra Castle")
	end
	---------------------------------------------------------------------------
	--第3张地图
	if Fun_IsInMapByMapId(10817) then
		GlobalFun(0)
		local point = {"",1,100,-24660,-16769,1024}
		Task_L_TalkToNpc(0xc5c11,1,point,"Court Musician Odin",0,1,1)

		--Task_L_UseItemBook("Эмоция: поражение")

		local point1 = {"",0,600,-25182,-17977,1024}
		local point2 = {"",0,600,-25638,-16588,1024}
		Task_L_LoopAttackMonMore(0xc5c11,2,0,2,point1,point2)
		
		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc5c11) then
			local point = {"",1,100,-24663,-16762,1024}
			Task_L_CompleteTask(0xc5c11 ,3,point,"Court Musician Odin",-1)
		else
			local point = {"",1,100,-24582,-12374,1556}	
			Task_L_Collection(0xc5c11,3,point)
		end

		local point = {"",1,100,-17758,-14628,768}
		Task_L_TalkToNpc(0xc5c18,1,point,"Noel's Apprentice Largo",0,1,1)
		
		local point = {"",0,600,-18919,-13668,768}
		Task_L_LoopAttackMonMore(0xc5c18,2,0,1,point)

		local point = {"",1,100,-17758,-14628,768}
		Task_L_TalkToNpc(0xc5c18,3,point,"Noel's Apprentice Largo",0,1,2)

		local point1 = {"",0,600,-17505,-22158,768}
		local point2 = {"",0,600,-18099,-23561,768}
		Task_L_LoopAttackMonMore(0xc5c12,1,2,2,point1,point2)

		local point = {"",0,600,-14794,-24275,768}
		Task_L_LoopAttackMonMore(0xc5c12,1,0,1,point)

		local point = {"",0,600,-14794,-24275,768}
		Task_L_LoopAttackMonMore(0xc5c12,1,1,1,point)

		local point1 = {"",0,600,-13014,-20217,768}
		local point2 = {"",0,600,-12337,-20802,768}
		Task_L_LoopAttackMonMore(0xc5c12,2,1,2,point1,point2)

		local point = {"",0,800,-11527,-20241,768}
		Task_L_LoopAttackMonMore(0xc5c12,2,0,1,point)
		
		--开传送阵
		local point = {"Pumpkin Farm",1,100,-12164,-16414,791}
		if Task_L_OpenTranMission(0xc5c12,3,point)	== 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Ainee",1,100, -12847,-15414,768}
			Task_L_BuyItem(0xc5c12,3,100,3,"Adept Healing Potion",point)

			--放药到F1
			Task_L_PushDwonDrug(0xc5c12,3,"Adept Healing Potion")
			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50, 50,0,0)
			--修理
			if Fun_IsHaveTask(0xc5c12,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Sunbright Hill", --大地图
						"Sunbright Hill", --小地图
						"Pumpkin Farm", --传送阵
						{ -14495,-14028,768 }, --修理NPC坐标
						{  -12847,-15414,768 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,-13498,-14713,768}	
			Task_L_Collection(0xc5c12,3,point)
		end

		local point = {"",1,100,-13581,-14670,768}
		Task_L_TalkToNpc(0xc5c12,4,point,"Former World Harvest Aiden",0,1,1)	

		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc5c13) then
			local point = {"",1,100,-13497,-14748,768}
			Task_L_CompleteTask(0xc5c13 ,1,point,"Bard Noel",-1)	
		else
			local point = {"",1,100,-13863,-14403,768}	
			Task_L_Collection(0xc5c13,1,point)
		end

		local point = {"",1,100,-6490,-16422,1286}
		Task_L_TalkToNpc(0xc5c14,1,point,"Bard Lento",0,1,1)	
		
		local point = {"",1,100,-6688,-14148,1152}
		Task_L_TalkToNpc(0xc5c14,2,point,"Announcer",0,1,1)	

		--判断任务是否完成
		if Task_L_GetTaskIsComplete(0xc5c14) then
			local point = {"",1,100,-11074,-13000,768}
			Task_L_CompleteTask(0xc5c14 ,3,point,"Bard Allegro",-1)
		else
			local point = {"",1,100,-6490,-16422,1286}
			Task_L_TalkToNpc(0xc5c14,3,point,"Bard Lento",0,1,2)	
		end
		--对话完就进入剧情副本  10831
		local point = {"",1,100,-11074,-13000,768}
		Task_L_TalkToNpc(0xc5c15,1,point,"Bard Allegro",0,1,3)

		--如果副本失败，重新进
		local point = {"",1,100,-11133,-13056,768}	
		if Task_L_LongGetTo(0xc5c15,2,10817,1,point) then
			local point = {"",1,100,-10849,-13179,768}
			Task_L_AutoGetTo(0xc5c15,2,10817,point,1,0x2A4F) 
		end

		--使用传送阵
		Task_L_UseTransmit(0xc5c16,1,"Palace Entrance","Luterra Castle")

		if Task_L_GetTaskIsComplete(0xc5c16) then
			local point = {"",1,100,-16320,-7332,768}
			Task_L_CompleteTask(0xc5c16 ,2,point,"Forest Keeper Jerome",-1)			
		else
			local point1 = {"",1,100,-9383,-16939,1023}
			local point2 = {"",1,100,-8778,-10908,1024}		
			if Task_L_LongGetTo(0xc5c16,2,10817,2,point1,point2) then
				local point = {"",1,100,-15895,-7356,768}
				Task_L_AutoGetTo(0xc5c16,2,10817,point,0,0) 
			end
		end

		local point = {"",1,100,-16058,-7167,768}	
		Task_L_Collection(0xc5c17,1,point)

		local point = {"",1,100,-16320,-7332,768}
		Task_L_TalkToNpc(0xc5c17,2,point,"Forest Keeper Jerome",0,1,3)

		local point1 = {"",0,600,-14831,-8252,768}
		local point2 = {"",0,600,-15212,-9345,768}
		Task_L_LoopAttackMonMore(0xc5c17,3,0,2,point1,point2)
		local point1 = {"",0,600,-14831,-8252,768}
		local point2 = {"",0,600,-15212,-9345,768}
		Task_L_LoopAttackMonMore(0xc5c17,3,1,2,point1,point2)
		local point1 = {"",0,600,-14831,-8252,768}
		local point2 = {"",0,600,-15212,-9345,768}
		Task_L_LoopAttackMonMore(0xc5c17,3,2,2,point1,point2)

		local point = {"",1,100,-15968,-7335,768}
		Task_L_UseTaskItem(0xc5c17,4,point)

		local point = {"",1,100,-16037,-7170,768}
		Task_L_TalkToNpc(0xc5c17,5,point,"Archaeologist Joff",0,1,1)	

		---------------------------------------------------------
		--修理
		if Fun_IsHaveTask(0xc5ff9,1) == 1 then
			local point = {"Clay Soldier Garden",1,100,-14988,-5630,792}
			if Task_L_OpenTranMission(0xc5ff9,1,point) == 1 then
				Fun_SetBackHomeInfo(90, 50,0,0)
				if Fun_IsNeedBackHome() == 1 then
					local point = {"",1,100,-12164,-16414,791}
					if Task_L_UseTransmitPoint(0xc5ff9,1,"Pumpkin Farm",point) then
						Task_L_LoopEquipFun()

						local point = {"Ainee",1,100, -12847,-15414,768}
						Task_L_BuyItem(0xc5ff9,1,50,3,"Adept Healing Potion",point)
						Task_L_PushDwonDrug(0xc5ff9,1,"Adept Healing Potion")

						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Sunbright Hill", --大地图
							"Sunbright Hill", --小地图
							"Pumpkin Farm", --传送阵
							{ -14495,-14028,768 }, --修理NPC坐标
							{ -12847,-15414,768 } --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				else
					local point = {"",1,3000,-14649,-4847,768}
					if Fun_IsInPoint(point) == 1 then
						--进入团队副本  10892
						local point = {"",1,100,-14643,-4857,768}	
						if Task_L_LongGetTo(0xc5ff9,1,10817,1,point) then
							local point = {"",1,100,-14973,-4007,881}
							Task_L_AutoGetTo(0xc5ff9,1,10817,point,3,0x2A8C) 
						end
					else
						local point = {"",1,100,-14988,-5630,792}
						if Task_L_UseTransmitPoint(0xc5ff9,1,"Clay Soldier Garden",point) then
							--进入团队副本  10892
							local point = {"",1,100,-14643,-4857,768}	
							if Task_L_LongGetTo(0xc5ff9,1,10817,1,point) then
								local point = {"",1,100,-14973,-4007,881}
								Task_L_AutoGetTo(0xc5ff9,1,10817,point,3,0x2A8C) 
							end
						end
					end
				end
			end
		end
		---------------------------------------------------------

		--使用传送阵
		Task_L_UseTransmit(0xc38ec,1,"Termia Library","Luterra Castle")

		local point = {"",1,100,-5663,-16778,1280}	
		Task_L_Collection(0xc63e1,1,point)

		local point = {"",1,100,-11074,-13000,768}
		Task_L_TalkToNpc(0xc63e1,2,point,"Bard Allegro",0,1,4)

		Task_L_UseItem(0xc63e1,3,"Song of Trixion")

		if Fun_IsHaveTask(0xc63e2, 1) == 1 then
			--30级任务邮寄
			if IsMatch == 1 then 
				Task_L_UseTransmit(0xc63e2,1,"Palace Entrance","Luterra Castle")
			else

				if IsMatch == 30 then
					return 30
				else
					--使用传送阵
					local point = {"",1,100,-11074,-13000,768}
					Task_L_UseMusic(0xc63e2,1,"Song of Trixion",point)
				end
			end
		end

		--使用传送阵
		Task_L_UseTransmit(0xc63e3,1,"Palace Entrance","Luterra Castle")
		
		local point = {"",1,100,-20133,-6352,768}
		Task_L_AutoGetTo(0xc63e3,2,10817,point,0,0) 
		
	end
	---------------------------------------------------------------------------
	--第4章地图
	if Fun_IsInMapByMapId(10818) then
		GlobalFun(0)
		local point = {"",1,100,-19932,-26622,1024}
		Task_L_TalkToNpc(0xc63e3,3,point,"Orchard Keeper Filch",0,1,1)

		local point1 = {"",0,300,-19401,-24835,1024}
		local point2 = {"",0,300,-19142,-24148,986}
		local point3 = {"",0,300,-17833,-24824,1024}
		local point4 = {"",0,300,-17075,-24110,1024}
		Task_L_LoopCollectMore(0xc63e3,4,0,4,point1,point2,point3,point4)

		--开传送阵
		local point = {"Sien Inn",1,100,-15544,-21800,1048}
		if Task_L_OpenTranMission(0xc63e3,5,point)	== 1 then
			--进入剧情副本 10832
			local point = {"",1,100,-15678,-20879,1024}	
			if Task_L_LongGetTo(0xc63e3,5,10818,1,point) then
				local point = {"",1,100,-15540,-20187,1024}
				Task_L_AutoGetTo(0xc63e3,5,10818,point,1,0x2A50) 
			end
		end

		local point = {"",1,100,-10972,-27972,744}
		Task_L_TalkToNpc(0xc63e4,1,point,"Herbalist Morpheo",0,1,5)

		local point = {"",1,100,-10972,-27972,744}
		Task_L_Collection(0xc63e4,2,point)

		local point = {"",1,100,-10972,-27972,744}
		Task_L_TalkToNpc(0xc63e4,3,point,"Herbalist Morpheo",0,1,2)	
		
		local point1 = {"",0,600,-9846,-26662,725}
		local point2 = {"",0,600,-10978,-25730,723}
		Task_L_LoopAttackMonMore(0xc63e4,4,0,2,point1,point2)
		
		local point = {"",0,600,-11416,-26411,766}
		Task_L_LoopAttackMonMore(0xc63e4,4,1,1,point)

		local point = {"",1,100,-11625,-27773,742}
		Task_L_Collection(0xc63e4,5,point)

		local point = {"",1,100,-10935,-27978,748}
		Task_L_TalkToNpc(0xc63e4,6,point,"Herbalist Morpheo",0,1,4)	

		local point = {"",1,100,-7358,-24907,1022}
		Task_L_TalkToNpc(0xc63e5,1,point,"Zinnervale",0,1,4) 

		local point = {"",1,100,-7358,-24907,1022}
		Task_L_Collection(0xc63e5,2,point)

		local point = {"",1,100,-7358,-24907,1022}
		Task_L_TalkToNpc(0xc63e5,3,point,"Zinnervale",0,1,2)

		local point = {"",1,100,-7357,-25432,1023}
		Task_L_Collection(0xc63e5,4,point)

		local point = {"",1,100,-7358,-24907,1022}
		Task_L_TalkToNpc(0xc63e5,5,point,"Zinnervale",0,1,3)

		local point = {"",1,100,-15115,-20504,1024}
		Task_L_TalkToNpc(0xc63e5,6,point,"Sidereal Shandi",0,1,5)

		local point1 = {"",1,100,-24197,-18745,1018}
		local point2 = {"",1,100,-24849,-10335,1023}
		if Task_L_LongGetTo(0xc63e6,1,10818,2,point1,point2) then
			local point = {"",1,100,-22540,-10435,768}
			Task_L_TalkToNpc(0xc63e6,1,point,"Armen",0,1,4)
		end

		local point = {"",1,100,-23141,-9670,768}
		Task_L_TalkToNpc(0xc63e6,2,point,"Forest Keeper Auric",0,1,3)

		local point = {"",1,100,-25789,-6519,1408}
		Task_L_AutoGetTo(0xc63e6,3,10818,point,0,0) 
		
		local point = {"",0,600,-28441,-6251,1408}
		Task_L_LoopAttackMonMore(0xc63e6,4,0,1,point)
		--开传送阵
		local point = {"Deier Village",1,100,-19588,-5401,1070}
		if Task_L_OpenTranMission(0xc63e6,5,point) == 1 then
			local point = {"",1,100,-17133,-3073,1024}
			Task_L_TalkToNpc(0xc63e6,5,point,"Soldier Tarant",0,1,2)
		end

		local point1 = {"",0,300,-14235,-5500,1022}
		local point2 = {"",0,300,-13535,-6085,1024}
		local point3 = {"",0,300,-12859,-6840,1024}
		Task_L_LoopCollectMore(0xc63e7,1,0,3,point1,point2,point3)

		local point = {"",1,100,-13054,-8822,772}
		Task_L_TalkToNpc(0xc63e7,2,point,"Armen",0,1,5)

		local point = {"",1,100,-13067,-9116,772}
		Task_L_TalkToNpc(0xc63e7,3,point,"Reina",0,1,1)

		local point = {"",0,800,-7566,-6321,1024}
		Task_L_LoopAttackMonMore(0xc63e7,4,0,1,point)
		
		local point = {"",0,600,-8921,-9502,1024}
		Task_L_LoopAttackMonMore(0xc63e7,5,0,1,point)

		local point = {"",0,600,-10808,-12182,768}
		Task_L_LoopAttackMonMore(0xc63e7,5,1,1,point)

		local point = {"",1,100,-2109,-9758,1024}
		Task_L_TalkToNpc(0xc63e8,1,point,"Billy",0,1,1)	

		local point = {"",1,100,-2306,-9665,1024}
		Task_L_TalkToNpc(0xc63e8,2,point,"Armen",0,1,6)	

		--开传送阵
		local point = {"Circus Encampment",1,100,-2642,-10438,1056}
		if Task_L_OpenTranMission(0xc63e8,3,point)	== 1 then
		
			local point = {"",1,100,-3048,-6152,1024}
			Task_L_AutoGetTo(0xc63e8,3,10818,point,0,0) 
		end

		local point = {"",1,100,-10972,-27972,744}
		Task_L_TalkToNpc(0xc7385,3,point,"Herbalist Morpheo",0,1,3)

		Task_L_UseTransmit(0xc7385,4,"Land of Puruus","Land of Puruus")
		
	end
	---------------------------------------------------------------------------
	--第5张图
	if Fun_IsInMapByMapId(10819) then
		GlobalFun(0)
		--开传送阵
		local point = {"Styxia Village",1,100,6330,11287,534}
		if Task_L_OpenTranMission(0xc63e8,3,point)	== 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Sans",1,100,7278,11397,512}
			Task_L_BuyItem(0xc63e8,3,50,3,"Adept Healing Potion",point)

			--放药到F1
			Task_L_PushDwonDrug(0xc63e8,3,"Adept Healing Potion")

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50, 50,0,0)

			if Fun_IsHaveTask(0xc63e8,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Blackrose Chapel", --大地图
						"Blackrose Chapel", --小地图
						"Styxia Village", --传送阵
						{ 8037,12867,512 }, --修理NPC坐标
						{ 7263,11407,512 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,5186,13370,512}
			Task_L_TalkToNpc(0xc63e8,3,point,"Seria",0,1,2)
		end
		
		local point = {"",1,100,5427,13596,512}
		Task_L_TalkToNpc(0xc63e8,4,point,"Armen",0,1,8)	

		local point = {"",1,100,5840,13842,512}
		Task_L_TalkToNpc(0xc67c9,1,point,"Styxia Chief Maya",0,1,1)		

		local point = {"",1,100,6253,14004,511}
		Task_L_TalkToNpc(0xc67c9,2,point,"Marco",0,1,1)
		
		local point1 = {"",1,200,7501,11663,512}	
		local point2 = {"",1,100,6208,13994,511}		
		Task_L_CarryItem(0xc67c9,3,0,point1,point2)

		local point = {"",1,100,6253,14004,511}
		Task_L_TalkToNpc(0xc67c9,4,point,"Marco",0,1,2)

		local point = {"",1,100,15650,10960,-0}
		Task_L_AutoGetTo(0xc67c9,5,10819,point,0,0) 

		local point = {"",1,100,16256,11788,-0}
		Task_L_TalkToNpc(0xc67c9,6,point,"Brian",0,1,1)

		local point = {"",1,100,14918,7869,-0}
		Task_L_TalkToNpc(0xc67ca,1,point,"Charon",0,1,1)

		local point1 = {"",0,500,17367,8381,-0}
		local point2 = {"",0,500,17520,7130,-0}
		local point3 = {"",0,500,17405,6534,-0}
		Task_L_LoopCollectMore(0xc67ca,2,0,3,point1,point2,point3)

		local point = {"",1,100,14931,7868,-0}
		Task_L_TalkToNpc(0xc67ca,3,point,"Charon",0,1,2)
		
		local point = {"",1,100,18848,10782,140}
		Task_L_AutoGetTo(0xc67cb,1,10819,point,0,0) 
		
		
		--开传送阵
		local point = {"Church Interior",1,100,18020,12001,149}
		if Task_L_OpenTranMission(0xc67cb,2,point)	== 1 then
			local point = {"",1,100,19765,11853,128}
			Task_L_TalkToNpc(0xc67cb,2,point,"Heretic-Disguised Armen",0,1,1)
		end


		local point = {"",1,500,21708,13345,134}
		Task_L_Collection(0xc67cb,3,point)
		
		
		local point1 = {"Collect",0,500,22808,10917,256}
		local point2 = {"Collect",1,500,23821,14818,-159}
		local point3 = {"Collect",2,500,21868,16074,113}
		Task_L_BranchLine(0xc67cb,4,3,point1,point2,point3)

		--交任务就进了副本 10833
		local point = {"",1,100,19765,11853,128}
		Task_L_TalkToNpc(0xc67cc,1,point,"Heretic-Disguised Armen",0,1,2)	

		--如果掉线之后，需要这里走
		--进入剧情副本  10833
		local point = {"",1,100,19719,11749,128}	
		if Task_L_LongGetTo(0xc67cc,2,10819,1,point) then
			local point = {"",1,100,19302,11932,128}
			Task_L_AutoGetTo(0xc67cc,2,10819,point,1,0x2A51) 	
		end

		local point = {"",1,100,26205,7698,-234}
		Task_L_TalkToNpc(0xc67cd,1,point,"Armen",0,1,7)	

	
		--进入副本  10852
		local point = {"",1,100,26813,7474,-216}	
		if Task_L_LongGetTo(0xc67cd,2,10819,1,point) then
			local point = {"",1,100,27058,7056,-166}
			Task_L_AutoGetTo(0xc67cd,2,10819,point,2,0x2A64) 	
		end

		--使用传送阵到传送点
		local point = {"",1,100,6152,11210,561}
		Task_L_UseTransmitPoint(0xc67ce,1,"Styxia Village",point)
		
		local point = {"",1,100,8260,21500,-256}
		Task_L_TalkToNpc(0xc67ce,1,point,"Hunter Ferna",0,1,1)
		
		local point = {"",1,100,7507,26095,-256}
		Task_L_Collection(0xc67ce,2,point)

		local point = {"",1,100,5419,26400,-256}
		Task_L_AutoGetTo(0xc67ce,3,10819,point,0,0) 
	end
	---------------------------------------------------------------------------
	--第6张地图
	if Fun_IsInMapByMapId(10820) then
		GlobalFun(0)
		local point = {"",1,100,-14316,-22890,1021}
		Task_L_TalkToNpc(0xc6f99,1,point,"Zinnervale",0,1,1)

		--开传送阵
		local point = {"Mistfog Shelter",1,100,-13604,-18553,1042}
		if Task_L_OpenTranMission(0xc6f99,2,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Gent",1,100,-13077,-18973,1016}
			Task_L_BuyItem(0xc6f99,2,50,3,"Adept Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50, 50,0,0)

			if Fun_IsHaveTask(0xc6f99,2) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Leyar Terrace", --大地图
						"Leyar Terrace", --小地图
						"Mistfog Shelter", --传送阵
						{ -13739,-17947,1019 }, --修理NPC坐标
						{ -13077,-18973,1016 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,-14018,-16281,1022}
			Task_L_TalkToNpc(0xc6f99,2,point,"Muren",0,1,1)
		end

		local point = {"",1,100,-13676,-17101,1023}
		Task_L_UseExpression(0xc6f99,3,"Talk",point) 

		local point = {"",1,100,-13676,-17101,1023}
		Task_L_TalkToNpc(0xc6f99,4,point,"Varbisch",0,1,1)
		
		local point = {"",1,100,-13676,-17101,1023}
		Task_L_UseExpression(0xc6f99,5,"Sad",point) 

		local point = {"",1,100,-13676,-17101,1023}
		Task_L_TalkToNpc(0xc6f99,6,point,"Varbisch",0,1,2)

		local point = {"",1,100,-7609,-15301,1433}
		Task_L_TalkToNpc(0xc6f9a,1,point,"Seria",0,1,1)

		local point = {"",1,100,-7736,-13814,1446}
		Task_L_TalkToNpc(0xc6f9a,2,point,"Leader of Puruus Jahia",0,1,1)

		local point = {"",1,100,-5717,-10357,1275}
		Task_L_TalkToNpc(0xc6f9a,3,point,"Commander of Puruus Ligheas",0,1,1)

		local point = {"Elder Ranesh",1,300,-6268,-9109,1274}  
		Task_L_BranchTalkToNpc(0xc6f9a,4,1,point)

		local point = {"Elder Borosh",1,300,-6694,-8905,1280}  
		Task_L_BranchTalkToNpc(0xc6f9a,4,0,point)
		
		local point = {"",0,300,-7034,-8054,1280}
		Task_L_LoopCollectMore(0xc6f9a,4,2,1,point)

		--开传送阵
		local point = {"Land of Puruus",1,100,-6280,-8416,1297}
		if Task_L_OpenTranMission(0xc6f9a,5,point)	== 1 then
			local point = {"",1,100,-5717,-10357,1275}
			Task_L_TalkToNpc(0xc6f9a,5,point,"Commander of Puruus Ligheas",0,1,2)
		end

		local point = {"",1,100,-6002,-12986,1298}
		Task_L_TalkToNpc(0xc6f9b,1,point,"Seria",0,1,2)	

		local point1 = {"Collect",0,100,-6142,-12049,1278}
		local point2 = {"Collect",1,100,-5677,-13594,1307}
		Task_L_BranchLine(0xc6f9b,2,2,point1,point2)

		local point1 = {"",2,100,-5208,-12992,1299}
		local point2 = {"",1,100,-4414,-12552,2311}
		if Task_L_LongGetTo(0xc6f9b,2,10820,2,point1,point2) then
			local point = {"Collect",2,100,-4402,-12546,2311}
			Task_L_BranchLine(0xc6f9b,2,1,point)
		end

		local point1 = {"",2,100,-5080,-12916,2320}
		local point2 = {"",1,100,-5994,-13063,1295}	
		if Task_L_LongGetTo(0xc6f9b,3,10820,2,point1,point2) then
			local point = {"",1,100,-6002,-12986,1298}
			Task_L_TalkToNpc(0xc6f9b,3,point,"Seria",0,1,3)	
		end

		--要用药水丢怪
		local point1 = {"Controlled Puruu Warrior",1,300,-6528,-14894,1455}
		local point2 = {"Controlled Puruu Warrior",1,300,-6272,-16080,1444}	
		Task_L_LoopUseTaskItemForMon(0xc6f9b,4,0,2,point1,point2)

		local point = {"",1,100,-7736,-13814,1446}
		Task_L_TalkToNpc(0xc6f9b,5,point,"Leader of Puruus Jahia",0,1,2)

		local point = {"",1,100,-5717,-10357,1275}
		Task_L_TalkToNpc(0xc6f9c,1,point,"Commander of Puruus Ligheas",0,1,3)

		local point = {"",1,100,-11175,-7744,1280}
		Task_L_TalkToNpc(0xc6f9c,2,point,"Tovish",0,1,1)

		--进入剧情副本  10834
		local point = {"",1,100,-12673,-6391,859}	
		if Task_L_LongGetTo(0xc6f9c,3,10820,1,point) then
			local point = {"",1,100,-12181,-6045,764}
			Task_L_AutoGetTo(0xc6f9c,3,10820,point,1,0x2A52) 	
		end

		local point = {"",1,100,-13919,-17656,1021}
		Task_L_AutoGetTo(0xc6f9d,1,10820,point,0,0) 

		local point = {"",1,100,-14704,-16929,1020}
		Task_L_TalkToNpc(0xc6f9d,2,point,"Injured Armen",0,1,1)	

		--使用传送阵  回主城报告 
		Task_L_UseTransmit(0xc6f9d,3,"Palace Entrance","Luterra Castle")

		local point = {"",1,100,-14558,-16881,1020}
		Task_L_TalkToNpc(0xc6f9e,2,point,"Seria",0,1,4)


		local point1 = {"Collect",0,100,-17120,-13581,1015}
		local point2 = {"Collect",1,100,-19255,-15504,617}
		local point3 = {"Collect",2,100,-23145,-12274,474}
		Task_L_BranchLine(0xc6f9e,3,3,point1,point2,point3)

		local point = {"",1,100,-23134,-9425,614}
		Task_L_AutoGetTo(0xc6f9e,4,10820,point,0,0) 

		local point = {"",1,100,-22595,-9179,616}
		Task_L_TalkToNpc(0xc6f9e,5,point,"Dominic",0,1,1)

		--进入剧情副本  10835
		local point = {"",1,100,-21096,-8096,533}	
		if Task_L_LongGetTo(0xc6f9e,6,10820,1,point) then
			local point = {"",1,100,-20296,-8100,505}
			Task_L_AutoGetTo(0xc6f9e,6,10820,point,1,0x2A53) 	
		end

		local point = {"",1,100,-22079,-4665,615}
		Task_L_AutoGetTo(0xc7381,1,10820,point,0,0) 

		local point = {"",1,100,-7736,-13814,1446}
		Task_L_TalkToNpc(0xc7385,4,point,"Leader of Puruus Jahia",0,1,4)
		--使用传送阵
		Task_L_UseTransmit(0xc7385,5,"Borea Castle","Borea's Domain")
	end
	---------------------------------------------------------------------------
	--第7张地图
	if Fun_IsInMapByMapId(10821) then
		GlobalFun(0)
	
		local point = {"",1,100,-23807,-17112,1437}
		Task_L_TalkToNpc(0xc7381,1,point,"Halrock",0,1,1)

		--开传送阵
		local point = {"Borea Castle",1,100,-25196,-17273,816}
		if Task_L_OpenTranMission(0xc7381,2,point) == 1 then	
			local point = {"",1,100,-20709,-11916,512}
			Task_L_TalkToNpc(0xc7381,2,point,"Kazan",0,1,1)
		end
		
		local point1 = {"",2,100,-20139,-12320,511}	
		local point2 = {"",2,100,-19840,-12582,257}	
		local point3 = {"",2,100,-19032,-12662,3}	
		local point4 = {"",1,100,-19013,-13091,-1024}	
		if Task_L_LongGetTo(0xc7381,3,10821,4,point1,point2,point3,point4) then
			local point = {"",1,100,-18976,-13376,-1024}
			Task_L_TalkToNpc(0xc7381,3,point,"Hunior",0,1,1)
		end

		local point = {"",1,300,-18078,-14707,-1024}
		Task_L_Collection(0xc7381,4,point)

		local point = {"",1,300,-18167,-17395,-1024}
		Task_L_Collection(0xc7381,5,point)

		local point = {"",1,100,-18728,-18369,-1024}
		Task_L_TalkToNpc(0xc7383,1,point,"Erick",0,1,1)

		local point1 = {"",2,100,-19238,-18329,-1024}	
		local point2 = {"",2,100,-20212,-18911,5}	
		local point3 = {"",2,100,-20270,-19577,257}	
		local point4 = {"",1,100,-21440,-28728,512}	
		if Task_L_LongGetTo(0xc7383,2,10821,4,point1,point2,point3,point4) then
			local point = {"",1,100,-21440,-28728,512}
			Task_L_TalkToNpc(0xc7383,2,point,"Gabrian",0,1,1)
		end

		local point1 = {"",0,600,-21545,-27347,512}
		local point2 = {"",0,600,-21007,-26232,512}
		Task_L_LoopAttackMonMore(0xc7383,3,0,2,point1,point2)

		local point1 = {"",0,200,-21547,-25956,512}
		local point2 = {"",0,200,-22744,-26598,512}
		Task_L_LoopCollectMore(0xc7383,3,1,2,point1,point2)

		local point = {"",1,100,-19382,-28866,512}
		Task_L_TalkToNpc(0xc7383,4,point,"Azaran",0,1,1)

		local point1 = {"",0,500,-18887,-27691,512}
		local point2 = {"",0,500,-18873,-27141,512}
		local point3 = {"",0,500,-18397,-26594,512}
		local point4 = {"",0,500,-17761,-27875,512}
		Task_L_LoopCollectMore(0xc7383,5,0,4,point1,point2,point3,point4)

		local point = {"",1,100,-18474,-23613,514}
		Task_L_TalkToNpc(0xc7383,6,point,"Archer Rosa",0,1,1)

		--开传送阵
		local point = {"Forlorn Camp",1,100,-14138,-28534,791}
		if Task_L_OpenTranMission(0xc7383,7,point)	== 1 then
			local point = {"",1,100,-13652,-28277,768}
			Task_L_TalkToNpc(0xc7383,7,point,"Dimur",0,1,1)
		end
		--使用传送阵到传送点
		local point = {"",1,100,-25355,-17240,818}
		Task_L_UseTransmitPoint(0xc7383,8,"Borea Castle",point)

		local point = {"",1,100,-23807,-17112,1437}
		Task_L_TalkToNpc(0xc7383,8,point,"Halrock",0,1,7)

		local point = {"",1,100,-26397,-14178,768}
		Task_L_TalkToNpc(0xc7382,1,point,"Armen",0,1,1)

		local point1 = {"",0,100,-26167,-14161,768}
		local point2 = {"",0,100,-25532,-14114,768}
		local point3 = {"",0,100,-25610,-14892,768}
		Task_L_LoopCollectMore(0xc7382,2,0,3,point1,point2,point3)

		local point = {"",1,100,-26537,-14121,768}
		Task_L_TalkToNpc(0xc7382,3,point,"Seria",0,1,2)

		local point = {"",1,100,-26629,-15393,832}
		Task_L_TalkToNpc(0xc7382,4,point,"Marilyn",0,1,2)
		--使用传送阵到传送点
		local point = {"",1,100,-14236,-28664,818}
		Task_L_UseTransmitPoint(0xc7382,5,"Forlorn Camp",point)

		local point = {"",1,100,-13652,-28277,768}
		Task_L_TalkToNpc(0xc7382,5,point,"Dimur",0,1,2)

		local point1 = {"",1,500,-13094,-22553,512}
		local point2 = {"",1,500,-11851,-22286,512}
		local point3 = {"",1,500,-11822,-22946,512}
		Task_L_LoopAttackMonMore(0xc7384,1,0,3,point1,point2,point3)
		
		local point = {"",1,100,-13429,-18142,521}
		Task_L_AutoGetTo(0xc7384,2,10821,point,0,0) 
		
		local point1 = {"",0,500,-13248,-17101,512}
		local point2 = {"",0,500,-13811,-16222,512}
		local point3 = {"",0,500,-14327,-16541,512}
		Task_L_LoopAttackMonMore(0xc7384,3,1,3,point1,point2,point3)

		local point1 = {"",1,500,-15802,-15865,513}
		local point2 = {"",1,500,-15324,-14457,512}
		Task_L_LoopAttackMonMore(0xc7384,3,0,2,point1,point2)
		
		local point1 = {"",1,100,-10707,-13062,512}
		local point2 = {"",1,100,-4728,-7477,512}
		Task_L_LongGetTo(0xc7384,4,10821,2,point1,point2)

		--开传送阵
		local point = {"Galatur's Forge",1,100,-5986,-5673,593}
		if Task_L_OpenTranMission(0xc7384,5,point)	== 1 then
			local point = {"",1,100,-4072,-6132,514}
			Task_L_TalkToNpc(0xc7384,5,point,"Borotur",0,1,4)
		end
		local point = {"",1,100,-3750,-5420,516}
		Task_L_Collection(0xc7389,1,point)

		local point1 = {"",0,100,-6861,-6579,512}
		local point2 = {"",0,100,-6869,-7108,512}
		local point3 = {"",0,100,-7525,-7404,512}
		Task_L_LoopCollectMore(0xc7389,2,0,3,point1,point2,point3)

		local point = {"",1,100,-8219,-5780,512}
		Task_L_Collection(0xc7389,3,point)

		local point = {"",1,100,-8805,-5802,512}
		Task_L_TalkToNpc(0xc7389,4,point,"Baro",0,1,2)

		local point1 = {"",0,100,-8191,-6637,512}
		local point2 = {"",0,100,-7636,-7235,512}
		local point3 = {"",0,100,-7132,-7530,512}
		Task_L_LoopCollectMore(0xc7389,5,0,3,point1,point2,point3)

		local point = {"",1,100,-4072,-6132,514}
		Task_L_TalkToNpc(0xc7389,6,point,"Borotur",0,1,5)

		local point1 = {"",0,600,-4922,-8726,512}
		local point2 = {"",0,600,-5764,-8508,512}
		Task_L_LoopAttackMonMore(0xc7389,7,0,2,point1,point2)

		local point = {"",1,100,-4072,-6132,514}
		Task_L_TalkToNpc(0xc7389,8,point,"Borotur",0,1,6)
		--使用传送阵到传送点
		local point = {"",1,100,-25355,-17240,818}
		Task_L_UseTransmitPoint(0xc7385,1,"Borea Castle",point)

		local point = {"",1,100,-23807,-17112,1437}
		Task_L_TalkToNpc(0xc7385,1,point,"Halrock",0,1,4)

		--使用传送阵
		Task_L_UseTransmit(0xc7385,2,"Monterque Manor","Monterque Manor")

		local point = {"",1,100,-23807,-17112,1437}
		Task_L_TalkToNpc(0xc7385,5,point,"Halrock",0,1,5)

		--使用传送阵到传送点
		local point = {"",1,100,-5961,-5452,620}
		Task_L_UseTransmitPoint(0xc7386,1,"Galatur's Forge",point)

		local point = {"",1,100,-4072,-6132,514}
		Task_L_TalkToNpc(0xc7386,1,point,"Borotur",0,1,3)
		
		local point1 = {"",1,100,-5913,-10545,512}	
		local point2 = {"",1,100,-10107,-8647,512}
		if Task_L_LongGetTo(0xc7386,2,10821,2,point1,point2) then
			local point = {"",1,100,-15044,-7277,768}
			Task_L_TalkToNpc(0xc7386,2,point,"Lund",0,1,1)
		end
		local point = {"",1,100,-14066,-5143,512}
		Task_L_AutoGetTo(0xc7386,3,10821,point,0,0) 

		--进入剧情副本  10896
		local point = {"",1,100,-18489,-10733,512}	
		if Task_L_LongGetTo(0xc7386,4,10821,1,point) then
			local point = {"",1,100,-18913,-10796,512}
			Task_L_AutoGetTo(0xc7386,4,10821,point,1,0x2A90) 	
		end

		local point = {"",1,100,-23807,-17112,1437}
		Task_L_TalkToNpc(0xc7387,1,point,"Halrock",0,1,6)

		local point1 = {"",0,100,-25757,-16412,768}
		local point2 = {"",0,100,-25426,-15511,768}
		Task_L_LoopCollectMore(0xc7387,2,0,2,point1,point2)

		local point = {"",1,100,-26397,-14178,768}
		Task_L_TalkToNpc(0xc7387,3,point,"Armen",0,1,3)

		local point = {"",1,100,-26859,-15211,832}
		Task_L_TalkToNpc(0xc7387,4,point,"Morpheo",0,1,1)

		local point = {"",1,100,-30171,-15898,898}
		Task_L_TalkToNpc(0xc7387,5,point,"Jahia",0,1,1)

		local point = {"",1,100,-28885,-19115,896}
		Task_L_TalkToNpc(0xc7387,6,point,"Monterque",0,1,1)

		local point = {"",1,100,-25623,-14442,768}
		Task_L_TalkToNpc(0xc7387,7,point,"Gabrian",0,1,1)

		local point = {"",1,100,-24787,-10967,1412}
		Task_L_TalkToNpc(0xc7387,8,point,"Azaran",0,1,1)

		local point = {"",1,100,-25623,-14442,768}
		Task_L_TalkToNpc(0xc7388,1,point,"Gabrian",0,1,2)

		local point = {"",1,100,-26366,-14319,768}
		Task_L_TalkToNpc(0xc7388,2,point,"Executor Solas",0,1,1)

		local point = {"",1,100,-26366,-14319,768}
		Task_L_UseExpression(0xc7388,3,"Deny",point) 

		local point = {"",1,100,-26397,-14178,768}
		Task_L_TalkToNpc(0xc7388,4,point,"Armen",0,1,4)

		local point1 = {"",0,100,-25613,-13979,768}
		local point2 = {"",0,100,-25579,-14157,768}
		local point3 = {"",0,100,-25701,-14782,768}
		local point4 = {"",0,100,-25716,-14991,768}
		local point5 = {"",0,100,-25623,-15427,768}
		Task_L_LoopCollectMore(0xc7388,5,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,-26645,-15383,832}
		Task_L_TalkToNpc(0xc7388,6,point,"Marilyn",0,1,4)

		local point1 = {"",0,100,-27653,-15257,832}
		local point2 = {"",0,100,-27480,-15196,835}
		local point3 = {"",0,100,-27750,-13547,768}
		Task_L_LoopCollectMore(0xc7388,7,0,3,point1,point2,point3)

		local point = {"",1,100,-24787,-10967,1412}
		Task_L_TalkToNpc(0xc7388,8,point,"Azaran",0,1,2)

		local point1 = {"Collect",0,100,-27767,-8893,510}
		local point2 = {"Collect",1,100,-26378,-4821,512}
		Task_L_BranchLine(0xc738a,1,2,point1,point2)
		
		local point = {"",1,100,-24977,-5424,512}
		Task_L_AutoGetTo(0xc738a,2,10821,point,0,0) 

		local point = {"",1,100,-24977,-5424,512}
		Task_L_Collection(0xc738a,3,point)

		local point = {"",1,100,-25786,-6554,512}
		Task_L_TalkToNpc(0xc738a,4,point,"Stake Burning Witness",0,1,1)

		local point = {"",1,100,-25355,-17240,818}
		Task_L_UseTransmitPoint(0xc738a,5,"Borea Castle",point)

		local point = {"",1,100,-26645,-15383,832}
		Task_L_TalkToNpc(0xc738a,6,point,"Marilyn",0,1,5)
		
		Task_L_UseItemBoxAndPick("Armen's Old Bag")

		if Task_L_GetTaskIsComplete(0xc7769) then
			Task_L_UseTransmit(0xc7769,1,"Palace Entrance","Luterra Castle")
		else
			--进入剧情副本  10853
			local point = {"",1,100,-30448,-7110,513}	
			if Task_L_LongGetTo(0xc7769,1,10821,1,point) then
				local point = {"",1,100,-30537,-6401,512}
				Task_L_AutoGetTo(0xc7769,1,10821,point,1,0x2A65) 	
			end
		end

		--c7b51  这里有个背包开，里面有紫色戒指和武器
		local point = {"",1,100,-21645,-1658,512}
		Task_L_AutoGetTo(0xc7b51,1,10821,point,0,0) 
	end
	---------------------------------------------------------------------------
	--第8张地图
	if Fun_IsInMapByMapId(10804) then
		GlobalFun(0)
		local point = {"",1,100,8746,3811,760}
		Task_L_TalkToNpc(0xc7b51,1,point,"Guard Tiburon",0,1,1)

		--开传送阵
		local point = {"Wavestrand Port",1,100,6794,6974,562}
		if Task_L_OpenTranMission(0xc7b51,2,point) == 1 then
			local point1 = {"",1,100,8543,7349,521}
			local point2 = {"",1,100,8941,7321,521}
			local point3 = {"",1,100,8473,-21134,729}
			if Task_L_LongGetTo(0xc7b51,2,10804,3,point1,point2,point3) then
				local point = {"",1,100,8473,-21134,729}
				Task_L_TalkToNpc(0xc7b51,2,point,"Cals",0,1,1)
			end
		end

		local point = {"",1,100,8473,-21134,729}
		Task_L_Collection(0xc7b51,3,point)

		local point = {"",1,100,8473,-21134,729}
		Task_L_TalkToNpc(0xc7b51,4,point,"Cals",0,1,8)

		local point1 = {"Guard Office",1,100,8166,-21636,729}
		local point2 = {"Guard Office",1,100,7855,-21957,729}
		local point3 = {"Wavestrand Port",1,100,7521,7515,456}
		if Task_L_LongGetTo(0xc7b51,5,10804,3,point1,point2,point3) then
			local point = {"",1,100,2605,8891,257}
			Task_L_TalkToNpc(0xc7b51,5,point,"Balmos",0,1,1)
		end

		local point = {"",1,100,2107,9125,257}
		Task_L_AutoGetTo(0xc7b51,6,10804,point,0,0) 
		
		local point = {"",1,100,2107,9125,257}
		Task_L_TalkToNpc(0xc7b51,7,point,"Cals",0,1,9)

		local point = {"",0,100,369,9946,257}
		Task_L_LoopCollectMore(0xc7b51,8,1,1,point)

		local point = {"",0,100,2752,9537,241}
		Task_L_LoopCollectMore(0xc7b51,8,0,1,point)

		local point = {"",0,100,3584,8450,257}
		Task_L_LoopCollectMore(0xc7b51,8,2,1,point)

		local point = {"",1,100,2605,8891,257}
		Task_L_TalkToNpc(0xc7b51,9,point,"Balmos",0,1,4)

		local point1 = {"",1,100,4843,6547,256}
		local point2 = {"",1,100,5235,6640,256}
		local point3 = {"",1,100,14249,-10416,518}
		if Task_L_LongGetTo(0xc7b52,1,10804,3,point1,point2,point3) then
			local point = {"",1,100,14249,-10416,518}
			Task_L_TalkToNpc(0xc7b52,1,point,"Inath",0,1,1)
		end

		local point = {"",1,100,14074,-9593,518}
		Task_L_Collection(0xc7b52,2,point)

		local point = {"",1,100,14249,-10416,518}
		Task_L_TalkToNpc(0xc7b52,3,point,"Inath",0,1,2)

		local point = {"",1,100,14091,-9994,518}
		Task_L_TalkToNpc(0xc7b53,1,point,"Eudi",0,1,1)

		local point = {"",1,10,14272,-10236,518}
		Task_L_TalkToNpc(0xc7b53,2,point,"Puego",0,1,3)

		local point = {"",1,100,14091,-9994,518}
		Task_L_TalkToNpc(0xc7b53,3,point,"Eudi",0,1,4)

		local point = {"",1,100,14091,-9994,518}
		Task_L_TalkToNpc(0xc7b53,4,point,"Eudi",0,1,3)

		local point = {"",1,100,13832,-10878,518}
		Task_L_TalkToNpc(0xc7b53,5,point,"Deniro",0,1,1)

		local point1 = {"",1,100,13923,-10548,517}
		local point2 = {"",1,100,13457,-10558,517}
		local point3 = {"",1,100,4681,6641,256}
		if Task_L_LongGetTo(0xc7b53,6,10804,3,point1,point2,point3) then
			local point = {"",0,100,4864,7013,256}
			Task_L_LoopCollectMore(0xc7b53,6,0,1,point)
		
			local point = {"",0,100,7228,8006,455}
			Task_L_LoopCollectMore(0xc7b53,6,1,1,point)
		
			local point = {"",0,100,8471,8352,521}
			Task_L_LoopCollectMore(0xc7b53,6,2,1,point)
		end

		local point1 = {"",1,100,8796,8431,521}
		local point2 = {"",1,100,8971,8755,527}
		local point3 = {"",1,100,14596,-20790,729}
		if Task_L_LongGetTo(0xc7b53,7,10804,3,point1,point2,point3) then
			local point = {"",1,100,14596,-20790,729}
			Task_L_TalkToNpc(0xc7b53,7,point,"Overstock Manager Miltz",0,1,1)
		end

		if Fun_IsHaveTask(0xc7b54, 1) == 1 then
			if IsMatch == 35 then
				MSG("Lei 35级邮寄")		
				local point = {"",1,100,6947,7555,456}
				Task_L_Email(0xc7b54,1,point)
			else
				--进入剧情副本  10839
				local point1 = {"",1,100,14322,-21456,729}
				local point2 = {"",1,100,14252,-21811,729}
				local point3 = {"",1,100,8391,8090,521}
				local point4 = {"",1,100,9300,11391,252}
				if Task_L_LongGetTo(0xc7b54,1,10804,4,point1,point2,point3,point4) then
					local point = {"",1,100,9745,11548,252}
					Task_L_AutoGetTo(0xc7b54,1,10804,point,1,0x2A57) 	
				end
			end
		end

		local point1 = {"",1,100,8543,7349,521}
		local point2 = {"",1,100,8941,7321,521}
		local point3 = {"",1,100,8492,-21125,729}
		if Task_L_LongGetTo(0xc7b54,2,10804,3,point1,point2,point3) then
			local point = {"",1,100,8500,-21139,729}
			Task_L_TalkToNpc(0xc7b54,2,point,"Cals",0,1,2)
		end

		local point = {"",1,100,7498,-20489,729}
		Task_L_TalkToNpc(0xc7b54,3,point,"Guard Pisharo",0,1,1)

		local point = {"",1,100,7566,-20062,730}
		Task_L_UseExpression(0xc7b54,4,"Talk",point) 

		local point = {"",1,100,7566,-20062,730}
		Task_L_UseExpression(0xc7b54,5,"Fury",point) 

		local point = {"",1,100,7670,-19958,730}
		Task_L_TalkToNpc(0xc7b54,6,point,"Eudi",0,1,1)

		local point = {"",1,100,8500,-21139,729}
		Task_L_TalkToNpc(0xc7b54,7,point,"Cals",0,1,6)

		local point = {"",1,100,8630,-21057,729}
		Task_L_Collection(0xc7b54,8,point)

		local point = {"",1,100,8630,-21057,729}
		Task_L_UseTaskItem(0xc7b54,9,point)

		local point1 = {"",1,100,8230,-21630,729}
		local point2 = {"",1,100,7853,-21963,729}
		local point3 = {"",1,100,5518,3432,246}
		Task_L_LongGetTo(0xc7b54,10,10804,3,point1,point2,point3)

		--第9张图副本打完，自动到这个地图
		local point = {"",1,100,3197,13703,-144}
		Task_L_TalkToNpc(0xc7b55,1,point,"Blackfang",0,1,1)
		
		if Fun_IsHaveTask(0xc7b56, 1) == 1 then
			if IsMatch == 37 then
				MSG("Lei 37级邮寄")		
				local point = {"",1,100,6947,7555,456}
				Task_L_Email(0xc7b56,1,point)
			else
				local point = {"",1,100,3187,13335,-144}
				Task_L_TalkToNpc(0xc7b56,1,point,"Eshu",0,1,1)
			end
		end

		--使用箱子
		Task_L_UseEquipBox("Pirate's Crate")  
		Task_L_UseEquipBox("Crew Application Form: Eshu")  

		local point = {"",1,100,3187,13335,-144}
		Task_L_TalkToNpc(0xc7b56,3,point,"Eshu",0,1,2)

		local point = {"",1,100,3459,11538,268}
		Task_L_AutoGetTo(0xc7b56,4,10804,point,0,0) 

		local point = {"",1,100,3108,11550,257}
		Task_L_TalkToNpc(0xc7b56,5,point,"Meehan",0,1,1)
		
		local point = {"",1,100,3038,12037,257}
		Task_L_TalkToNpc(0xc7b56,6,point,"Cassleford",0,1,1)
		
		local point = {"",1,100,2818,12156,257}
		Task_L_TalkToNpc(0xc7b56,7,point,"Cals",0,1,1)
		
		local point = {"",1,100,2630,12084,257}
		Task_L_TalkToNpc(0xc7b56,8,point,"Thirain",0,1,1)
		--这里要航海了，需要各种数据

		local point = {"",1,100,3302,13909,-144}
		Task_L_AutoGetTo(0x3d0ce9,1,10804,point,0,0) 
		
		local point = {"",1,100,3302,13909,-144}
		Task_L_AutoGetTo(0x3d0d6a,2,10804,point,0,0) 

		if Fun_IsHaveTask(0x3d0d6a,5) == 1 then
			MSG("Lei  准备坐船回卢特兰")
			local point = {"",1,100,13673,11826,-126}--这个坐标需要修正
			Fun_L_InShip(11111,10804,point)
		end
	end
	---------------------------------------------------------------------------
	--第9张地图
	if Fun_IsInMapByMapId(10823) then
		GlobalFun(0)
		local point = {"",1,100,20058,8313,264}
		Task_L_TalkToNpc(0xc7b54,10,point,"Deekop",0,1,1)
		
		local point = {"",1,100,19720,8030,128}
		Task_L_TalkToNpc(0xc7f39,1,point,"Cynthia",0,1,1)

		local point1 = {"",0,100,19197,7684,128}
		local point2 = {"",0,100,17726,8092,128}
		Task_L_LoopCollectMore(0xc7f39,2,0,2,point1,point2)

		local point = {"",1,100,19720,8030,128}
		Task_L_TalkToNpc(0xc7f39,3,point,"Cynthia",0,1,2)

		local point = {"",1,100,18804,9599,128}
		Task_L_TalkToNpc(0xc7f39,4,point,"Beane",0,1,1)

		local point1 = {"",0,500,15413,10600,-0}
		local point2 = {"",0,500,14318,11800,-0}
		local point3 = {"",0,500,14474,12938,-0}
		local point4 = {"",0,500,15606,12842,-0}
		Task_L_LoopAttackMonMore(0xc7f39,5,0,4,point1,point2,point3,point4)

		local point = {"",1,100,18804,9599,128}
		Task_L_TalkToNpc(0xc7f39,6,point,"Beane",0,1,2)

		local point1 = {"Collect",0,100,20130,9390,136}
		local point2 = {"Collect",1,100,18767,8531,128}
		local point3 = {"Collect",2,100,18381,7782,128}
		Task_L_BranchLine(0xc7f39,7,3,point1,point2,point3)

		local point = {"",1,100,20058,8313,264}
		Task_L_TalkToNpc(0xc7f39,8,point,"Deekop",0,1,3)

		local point = {"",1,100,16973,5990,255}
		Task_L_TalkToNpc(0xc7f39,9,point,"Squad Leader Axel",0,1,1)

		local point1 = {"",0,500,17922,4803,512}
		local point2 = {"",0,500,18808,3228,512}
		local point3 = {"",0,500,17867,3551,512}
		local point4 = {"",0,500,16033,3036,512}
		Task_L_LoopAttackMonMore(0xc7f39,10,0,4,point1,point2,point3,point4)

		--这里会出现BUG，
		local point = {"Port Guard",1,2000,14474,3853,512}
		Task_L_LoopTalkNpc(0xc7f39,10,1,point)
		
		local point = {"",1,100,14504,7924,256}
		Task_L_TalkToNpc(0xc7f39,11,point,"Jinock",0,1,1)

		local point = {"",1,100,7431,10342,1024}
		Task_L_TalkToNpc(0xc7f3a,1,point,"Mereg",0,1,1)

		local point = {"",1,100,7431,10342,1024}
		Task_L_Collection(0xc7f3a,2,point)

		local point = {"",1,100,7431,10342,1024}
		Task_L_TalkToNpc(0xc7f3a,3,point,"Mereg",0,1,2)

		local point = {"",1,300,2367,12653,1280}
		Task_L_TalkToNpc(0xc7f3a,4,point,"Illicit Market Merchant Tobai",0,1,3)

		local point = {"",1,300,2260,12384,1280}
		Task_L_LoopAttackMonMore(0xc7f3a,5,0,1,point)

		local point = {"",1,300,2319,13036,1280}
		Task_L_LoopAttackMonMore(0xc7f3a,6,0,1,point)

		local point = {"",1,300,2367,12653,1280}
		Task_L_TalkToNpc(0xc7f3a,7,point,"Illicit Market Merchant Tobai",0,1,2)

		local point = {"",1,600,2475,12777,1280}
		Task_L_Collection(0xc7f3a,8,point)

		local point = {"",1,100,7431,10342,1024}
		Task_L_TalkToNpc(0xc7f3a,9,point,"Mereg",0,1,3)

		local point = {"",1,100,7247,10317,1024}
		Task_L_TalkToNpc(0xc7f3a,10,point,"Cals",0,1,1)	
		
		local point = {"",1,100,7431,10342,1024}
		Task_L_TalkToNpc(0xc7f3a,11,point,"Mereg",0,1,4)

		local point = {"",1,100,6960,9846,1024}
		Task_L_Collection(0xc7f3a,12,point)

		local point = {"",1,100,7566,9272,1024}
		Task_L_TalkToNpc(0xc7f3a,13,point,"Karab",0,1,1)

		local point1 = {"",1,100,7530,10578,1024}
		local point2 = {"",1,100,6961,9792,1024}		
		Task_L_CarryItem(0xc7f3a,14,10,point1,point2)
		
		local point = {"",1,100,6973,9847,1024}
		Task_L_TalkToNpc(0xc7f3b,1,point,"Phorba",0,1,1)	

		local point = {"",1,100,6992,10918,1024}
		Task_L_TalkToNpc(0xc7f3b,2,point,"Jinock",0,1,1)
		
		--进入剧情副本  10836
		local point1 = {"",1,100,6958,23221,512}
		local point2 = {"",1,100,4017,22858,768}
		if Task_L_LongGetTo(0xc7f3b,3,10823,2,point1,point2) then
			local point = {"",1,100,3465,22736,768}
			Task_L_AutoGetTo(0xc7f3b,3,10823,point,1,0x2A54) 	
		end

		local point = {"",1,100,2301,25100,776}
		Task_L_TalkToNpc(0xc7f3b,4,point,"Cals",0,1,1)

		--开传送阵
		local point = {"Guard Encampment",1,100,14594,17801,106}
		if Task_L_OpenTranMission(0xc7f3c,1,point) == 1 then	
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Caros",1,100,14156,17936,66}
			Task_L_BuyItem(0xc7f3c,1,50,3,"Adept Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 40,0,0)
			
			if Fun_IsHaveTask(0xc7f3c,1) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Croconys Seashore", --大地图
						"Guard Encampment", --小地图
						"Guard Encampment", --传送阵
						{ 15375,16821,63 }, --修理NPC坐标
						{ 14156,17936,66 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,14744,16976,64}
			Task_L_TalkToNpc(0xc7f3c,1,point,"Guard Ken",0,1,1)
		end

		local point1 = {"",0,500,16568,17208,64}
		local point2 = {"",0,500,16841,16364,64}
		local point3 = {"",0,500,17522,16417,64}
		Task_L_LoopAttackMonMore(0xc7f3c,2,0,3,point1,point2,point3)

		local point = {"",1,100,10202,23634,512}
		Task_L_TalkToNpc(0xc7f3c,3,point,"Guard Marx",0,1,1)

		local point = {"",1,100,10043,23745,512}
		Task_L_Collection(0xc7f3c,4,point)
		
		local point1 = {"Pirate Explorer",0,900,11174,23790,512}
		local point2 = {"Pirate Explorer",0,900,11514,22322,512}	
		Task_L_LoopUseTaskItemForMon(0xc7f3c,5,0,2,point1,point2)

		local point = {"",1,100,10202,23634,512}
		Task_L_TalkToNpc(0xc7f3c,6,point,"Guard Marx",0,1,2) 

		local point = {"",1,100,9733,27834,1024}
		Task_L_AutoGetTo(0xc7f3c,7,10823,point,0,0)
		
		local point = {"",1,100,11684,32485,1023}
		Task_L_Collection(0xc7f3c,8,point)

		local point = {"",1,100,11684,32485,1023}
		Task_L_TalkToNpc(0xc7f3c,9,point,"Lesti",0,1,1)

		local point = {"",1,100,7502,33235,512}
		Task_L_Collection(0xc7f3c,10,point)

		local point = {"",1,100,7502,33235,512}
		Task_L_TalkToNpc(0xc7f3c,11,point,"Reti",0,1,4)

		local point = {"",1,100,7502,33235,512}
		Task_L_TalkToNpc(0xc7f3d,1,point,"Reti",0,1,2)

		local point = {"",1,100,5325,31541,512}
		Task_L_Collection(0xc7f3d,2,point)

		local point = {"",1,100,5325,31541,512}
		Task_L_UseTaskItem(0xc7f3d,3,point)
		
		local point = {"",1,100,7502,33235,512}
		Task_L_TalkToNpc(0xc7f3d,4,point,"Reti",0,1,3)

		if Fun_IsHaveTask(0xc7f3e,1) == 1 then
			local point = {"",1,1000,14679,17871,106}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",1,100,15504,21457,256}
				local point2 = {"",1,100,10018,23461,512}
				local point3 = {"",1,100,10713,29182,1024}
				local point4 = {"",1,100,8562,32372,512}
				local point5 = {"",1,100,6257,37113,800}
				Task_L_LongGetTo(0xc7f3e,1,10823,5,point1,point2,point3,point4,point5)
			end
		end

		if Fun_IsHaveTask(0xc7f3e,2) == 1 then
			local point = {"",1,1000,14679,17871,106}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",1,100,15504,21457,256}
				local point2 = {"",1,100,10018,23461,512}
				local point3 = {"",1,100,10713,29182,1024}
				local point4 = {"",1,100,8562,32372,512}
				local point5 = {"",1,100,6257,37113,800}
				Task_L_LongGetTo(0xc7f3e,2,10823,5,point1,point2,point3,point4,point5)
			end
		end

		local point1 = {"",1,600,5704,37500,792}
		local point2 = {"",1,600,5165,39151,800}
		local point3 = {"",1,600,4444,39870,800}
		Task_L_LoopAttackMonMore(0xc7f3e,1,0,3,point1,point2,point3)

		local point1 = {"",1,600,5704,37500,792}
		local point2 = {"",1,600,5165,39151,800}
		local point3 = {"",1,600,4444,39870,800}
		Task_L_LoopAttackMonMore(0xc7f3e,1,1,3,point1,point2,point3)
		
		local point = {"",1,100,5737,42117,1024}
		Task_L_AutoGetTo(0xc7f3e,2,10823,point,0,0)	

		local point = {"",1,100,5737,42117,1024}
		Task_L_Collection(0xc7f3e,3,point)

		local point = {"",1,100,5737,42117,1024}
		Task_L_TalkToNpc(0xc7f3e,4,point,"Rosa",0,1,1)	

		--开传送阵
		local point = {"Black Fox Assembly Area",1,100,10182,39533,523}
		if Task_L_OpenTranMission(0xc7f3e,5,point) == 1 then
			local point = {"",1,100,10883,39677,512}
			Task_L_TalkToNpc(0xc7f3e,5,point,"Benya",0,1,1)
		end

		local point = {"",1,300,14137,41931,913}
		Task_L_TalkToNpc(0xc7f3f,1,point,"Haronin",0,1,1)
		
		local point1 = {"",1,300,13901,40971,630}
		Task_L_AttackPoint(0xc7f3f,2,point)

		local point1 = {"",1,100,13901,40971,630}
		local point2 = {"",1,100,14248,41742,910}		
		Task_L_CarryItem(0xc7f3f,2,0,point1,point2)

		local point = {"",1,300,14167,41709,909}	
		Task_L_Collection(0xc7f3f,3,point)

		local point = {"",1,100,14137,41931,913}
		Task_L_TalkToNpc(0xc7f3f,4,point,"Haronin",0,1,2)

		local point = {"",1,100,11680,46077,512}
		Task_L_AutoGetTo(0xc7f3f,5,10823,point,0,0)	

		local point = {"",1,100,11470,46543,524}
		Task_L_TalkToNpc(0xc7f40,1,point,"Cals",0,1,1)

		local point = {"",1,900,11558,46474,524}
		Task_L_TalkToNpc(0xc7f40,2,point,"Rosa",0,1,1)

		--进入剧情副本  10837
		local point = {"",1,100,7130,48018,1123}
		if Task_L_LongGetTo(0xc7f40,3,10823,1,point) then
			local point = {"",1,100,6642,48007,1200}
			Task_L_AutoGetTo(0xc7f40,3,10823,point,1,0x2A55) 	
		end

		local point = {"",1,100,3416,47565,1200}
		Task_L_TalkToNpc(0xc7f40,4,point,"Blackfang",0,1,2)

		--开传送阵
		local point = {"Stormcry Grotto",1,100,10893,53088,534}
		if Task_L_OpenTranMission(0xc7f41,1,point) == 1 then

			-----------------------------------------------
			if Fun_IsHaveTask(0xc7f41,1) == 1 then
				Fun_SetBackHomeInfo(80, 40,0,0)
				if Fun_IsNeedBackHome() == 1 then
					local point = {"",1,2000,14594,17801,106}
					if Fun_IsInPoint(point) == 0 then
						local point = {"",1,100,14594,17801,106}
						Task_L_UseTransmitPoint(0xc7f41,1,"Guard Encampment",point)
					else
						Task_L_LoopEquipFun()
						local point = {"Caros",1,100,14156,17936,66}
						Task_L_BuyItem(0xc7f41,1,50,3,"Adept Healing Potion",point)
						Task_L_PushDwonDrug(0xc7f41,1,"Adept Healing Potion")
						local BackHomeInfo = {
							0, --1比较小地图
							"Croconys Seashore", --大地图
							"Guard Encampment", --小地图
							"Guard Encampment", --传送阵
							{ 15375,16821,63 }, --修理NPC坐标
							{ 14156,17936,66 } --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				else
					local point = {"Guard Encampment",1,2000,14594,17801,106}
					if Fun_IsInPoint(point) == 1 then
						local point = {"",1,100,10893,53088,534}
						Task_L_UseTransmitPoint(0xc7f41,1,"Stormcry Grotto",point)
					else
						--进入副本  10854
						local point1 = {"",2,100,12590,52692,512}
						local point2 = {"",1,100,17350,53703,1700}
						if Task_L_LongGetTo(0xc7f41,1,10823,2,point1,point2) then
							local point = {"",1,100,17592,54319,1700}
							Task_L_AutoGetTo(0xc7f41,1,10823,point,2,0x2A66) 	
						end
					end
				end
			end
			-----------------------------------------------

		end
	end
	---------------------------------------------------------------------------
	-------------------------------托托克岛------------------------------------
	---------------------------------------------------------------------------
	--第1张地图
	if Fun_IsInMapByMapId(11011) then
		GlobalFun(0)
		--开传送阵


		local point = {"Oceanscent Seashore",1,100,8380,6591,542}
		if Task_L_OpenTranMission(0xf4a12,1,point)	== 1 then
			local point = {"",1,100,7140,4268,512}
			Task_L_TalkToNpc(0xf4a12,1,point,"Pastata",0,1,2)
		end
		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Hiren",1,100,8555,4907,512}
		Task_L_BuyItem(0xf4a12,2,50,4,"Expert Healing Potion",point)
		
		Task_L_PushDwonDrug(0xf4a12,2,"Expert Healing Potion")
		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(50, 50,0,0)
		--修理
		if Fun_IsHaveTask(0xf4a12,2) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Seaswept Woods", --大地图
					"Boulder Seashore", --小地图
					"Oceanscent Seashore", --传送阵
					{ 9054,5664,512 }, --修理NPC坐标
					{ 8555,4907,512 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		local point = {"",1,100,4755,5634,512}
		Task_L_TalkToNpc(0xf4a12,2,point,"Pocoya",0,1,3)
		
		local point = {"",1,300,6489,8212,512}
		Task_L_TalkToNpc(0xf4a12,3,point,"Posaka",0,1,1)

		local point = {"",1,100,8678,6194,512}
		Task_L_TalkToNpc(0xf4a12,4,point,"Pokura",0,1,1)

		local point1 = {"",0,600,8055,7445,512}
		local point2 = {"",0,600,8782,8028,512}	
		Task_L_LoopCollectMore(0xf4a12,5,0,2,point1,point2)

		local point = {"",1,600,10480,8754,512}
		Task_L_TalkToNpc(0xf4a12,6,point,"Pepeno",0,1,1)
		
		local point = {"",1,600,10859,8839,512}	
		Task_L_Collection(0xf4a12,7,point)

		--进入剧情副本  11017
		local point1 = {"",2,100,11126,8480,512}
		local point2 = {"",1,100,12155,8367,1524}
		if Task_L_LongGetTo(0xf4a13,1,11011,2,point1,point2) then
			local point = {"",1,100,12670,8550,1527}
			Task_L_AutoGetTo(0xf4a13,1,11011,point,1,0x2B09) 	
		end

		local point1 = {"",2,100,11277,8568,1504}
		local point2 = {"",1,100,8421,9770,512}
		local point3 = {"",1,100,6336,14489,1024}
		if Task_L_LongGetTo(0xf4a14,1,11011,3,point1,point2,point3) then
			local point = {"",1,100,11647,15363,1024}
			Task_L_Collection(0xf4a14,1,point)
		end

		local point = {"",1,100,11647,15363,1024}
		Task_L_TalkToNpc(0xf4a14,2,point,"Mokamoka",0,1,2)

		local point = {"",1,100,11470,15235,1024}
		Task_L_UseTaskItem(0xf4a14,3,point)
		
		local point = {"",1,100,11647,15363,1024}
		Task_L_TalkToNpc(0xf4a14,4,point,"Mokamoka",0,1,1)


		--开传送阵
		local point = {"Cashew Tree Forest",1,100,12347,14885,1049}
		if Task_L_OpenTranMission(0xf4a14,5,point)	== 1 then
			local point1 = {"",0,300,7447,18670,1200}
			local point2 = {"",0,300,6638,18496,1200}
			local point3 = {"",0,300,6325,19040,1200}	
			local point4 = {"",0,300,5757,19618,1200}
			local point5 = {"",0,300,5694,20486,1200}	
			Task_L_LoopCollectMore(0xf4a14,5,0,5,point1,point2,point3,point4,point5)
		end
		local point = {"",1,100,13705,25281,1024}
		Task_L_UseTaskItem(0xf4a14,6,point)

		if Task_L_GetTaskIsComplete(0xf4a14) then
			local point = {"",1,100,18305,24077,776}
			Task_L_CompleteTask(0xf4a14 ,7,point,"Mokamoka",-1)
		else
			local point1 = {"",0,300,14979,24786,1024}
			local point2 = {"",0,300,14985,24218,1024}
			local point3 = {"",0,300,15398,23992,1024}	
			local point4 = {"",0,300,15401,23001,1024}
			local point5 = {"",0,300,14996,22964,1035}	
			Task_L_LoopCollectMore(0xf4a14,7,0,5,point1,point2,point3,point4,point5)
		end

		if Task_L_GetTaskIsComplete(0xf4a15) then
			local point = {"",1,100,24241,21998,1024}
			Task_L_CompleteTask(0xf4a15 ,1,point,"Mokamoka",-1)
		else
			local point = {"",1,300,20399,24840,511}
			Task_L_Collection(0xf4a15,1,point)
		end

		--开传送阵
		local point = {"Ancient Grindstone Vestige",1,100,26685,18910,1049}
		if Task_L_OpenTranMission(0xf4a16,1,point)	== 1 then		
			local point1 = {"",0,400,25527,19055,1024}
			local point2 = {"",0,400,24781,18704,1024}
			local point3 = {"",0,400,24948,16837,1024}	
			Task_L_LoopCollectMore(0xf4a16,1,0,3,point1,point2,point3)
		
			local point1 = {"",0,400,25489,18824,1024}
			local point2 = {"",0,400,24822,18693,1024}
			local point3 = {"",0,400,26132,17488,1024}	
			Task_L_LoopCollectMore(0xf4a16,1,1,3,point1,point2,point3)
		end
		local point = {"",1,400,25256,17643,1024}
		Task_L_Collection(0xf4a16,2,point)

		if Task_L_GetTaskIsComplete(0xf4a16) then
			local point = {"",1,100,28548,9854,1499}
			Task_L_CompleteTask(0xf4a16 ,3,point,"Mokamoka",-1)
		else
			local point = {"",1,400,28548,9854,1499}
			Task_L_UseTaskItem(0xf4a16,3,point)
		end

		local point = {"",1,400,28548,9854,1499}
		Task_L_Collection(0xf4a17,1,point)

		--使用F5之后进入 剧情副本  11015
		local point = {"",1,100,28710,10061,1500}
		Task_L_UseTaskItem(0xf4a17,2,point)

		local point = {"",1,100,28710,10061,1500}
		if Task_L_LongGetTo(0xf4629,1,11011,1,point) then
			local point = {"",1,100,28830,9906,1500}
			Task_L_AutoGetTo(0xf4629,1,11011,point,1,11015) 	
		end

		local point = {"",1,100,9471,2937,525}
		Task_L_AutoGetTo(0x3d10d2,2,11011,point,0,0) 
	end
	---------------------------------------------------------------------------
	--第2张地图
	if Fun_IsInMapByMapId(11001) then
		GlobalFun(0)
		--开传送阵

		local point = {"Mokoko Village Plaza",1,100,2703,4085,-319}
		if Task_L_OpenTranMission(0xf462a,1,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Narinari",1,100,2686,2742,-340}
			Task_L_BuyItem(0xf462a,1,50,4,"Expert Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50,40,0,0)
			--修理
			if Fun_IsHaveTask(0xf462a,1) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Mokoko Village", --大地图
						"Whistle Plaza", --小地图
						"Mokoko Village Plaza", --传送阵
						{ 4681,5852,-329 }, --修理NPC坐标
						{ 2686,2742,-340 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			--进入剧情副本  11016
			local point = {"",1,100,7716,5607,375}
			if Task_L_LongGetTo(0xf462a,1,11001,1,point) then
				local point = {"",1,100,8219,5648,500}
				Task_L_AutoGetTo(0xf462a,1,11001,point,1,0x2B08) 	
			end
		end

		if Task_L_GetTaskIsComplete(0xf462b) then
			local point = {"",1,100,3019,8323,521}
			Task_L_CompleteTask(0xf462b ,1,point,"Chitata",-1)
		else
			local point1 = {"",1,200,4452,7145,247}	
			local point2 = {"",1,100,2792,7910,514}		
			Task_L_CarryItem(0xf462b,1,0,point1,point2)
		end

		local point = {"",1,100,2858,8454,514}
		Task_L_Collection(0xf462c,1,point)

		if Task_L_GetTaskIsComplete(0xf462c) then
			local point = {"",1,100,3626,3345,-340}
			Task_L_CompleteTask(0xf462c ,2,point,"Totoma",-1)
		else
			local point = {"",1,100,3459,2948,-328}
			Task_L_Collection(0xf462c,2,point)
		end

		local point = {"",1,100,3625,3342,-340}
		Task_L_Collection(0xf462d,1,point)

		local point = {"",1,100,3625,3342,-340}
		Task_L_UseTaskItem(0xf462d,2,point)

		if Task_L_GetTaskIsComplete(0xf462d) then
			local point = {"",1,100,1746,7539,650}
			Task_L_CompleteTask(0xf462d ,3,point,"Mokamoka",-1)
		else
			local point = {"",1,100,1746,7539,650}
			Task_L_AutoGetTo(0xf462d,3,11001,point,0,0) 
		end

		local point = {"",1,100,1078,7832,678}
		Task_L_AutoGetTo(0xf462e,1,11001,point,0,0) 

		local point = {"",1,100,3204,4057,-340}
		Task_L_UseTaskItem(0xf59b1,2,point)

		local point1 = {"",1,100,8204,5656,500}
		local point2 = {"",1,100,8442,5691,500}
		local point3 = {"",1,100,8886,5739,-5097}
		if Task_L_LongGetTo(0xf59b1,3,11001,3,point1,point2,point3) then
			local point = {"",1,100,8886,5739,-5097}
			Task_L_TalkToNpc(0xf59b1,3,point,"Totoma",0,1,5)
		end

		local point1 = {"",1,100,8472,5725,-5106}
		local point2 = {"",1,100,8200,5736,-5123}
		local point3 = {"",1,100,3266,8195,525}
		if Task_L_LongGetTo(0xf59b1,4,11001,3,point1,point2,point3) then
			local point = {"",1,100,3266,8195,525}
			Task_L_TalkToNpc(0xf59b1,4,point,"1st Elder",0,1,3)
		end

		local point = {"",1,100,3410,8107,525}
		Task_L_TalkToNpc(0xf59b1,5,point,"4th Elder",0,1,1)

		local point = {"",1,100,3228,7857,514}
		Task_L_TalkToNpc(0xf59b1,6,point,"7th Elder",0,1,1)

		local point = {"",1,100,3095,8100,514}
		Task_L_TalkToNpc(0xf59b1,7,point,"10th Elder",0,1,1)

		--使用传送阵
		Task_L_UseTransmit(0xf59b1,8,"Sweetwater Farm","Mokoko Farm")

		if Task_L_GetTaskIsComplete(0xf55ca) then
			local point = {"",1,100,8848,5550,-5101}
			Task_L_CompleteTask(0xf55ca ,4,point,"Mokamoka",-1)
		else
			local point1 = {"",1,100,8204,5656,500}
			local point2 = {"",1,100,8442,5691,500}
			local point3 = {"",1,100,8886,5739,-5097}
			if Task_L_LongGetTo(0xf55ca,4,11001,3,point1,point2,point3) then
				local point = {"",1,100,8886,5739,-5097}
				Task_L_TalkToNpc(0xf55ca,4,point,"Totoma",0,1,7)
			end
		end

		--使用传送阵
		Task_L_UseTransmit(0xf55cb,1,"Tortoyk's Arm","Forest of Giants")

		local point1 = {"",1,100,8204,5656,500}
		local point2 = {"",1,100,8442,5691,500}
		local point3 = {"",1,100,8886,5739,-5097}
		if Task_L_LongGetTo(0xf55d0,2,11001,3,point1,point2,point3) then
			local point = {"",1,100,8886,5739,-5097}
			Task_L_TalkToNpc(0xf55d0,2,point,"Totoma",0,1,1)
		end

		local point1 = {"",1,100,8472,5725,-5106}
		local point2 = {"",1,100,8200,5736,-5123}
		local point3 = {"",1,100,3266,8195,525}
		if Task_L_LongGetTo(0xf55d0,3,11001,3,point1,point2,point3) then
			local point = {"",1,100,3098,8190,521}
			Task_L_Collection(0xf55d0,3,point)
		end

		local point = {"",1,100,3986,4581,-340}
		Task_L_Collection(0xf55d0,4,point)

		local point1 = {"",1,100,5040,3116,-337}
		local point2 = {"",1,100,5353,3152,-340}
		local point3 = {"",1,100,5962,-6336,-5104}
		if Task_L_LongGetTo(0xf55d0,5,11001,3,point1,point2,point3) then
			local point = {"",1,100,5962,-6336,-5104}
		Task_L_Collection(0xf55d0,5,point)
		end

		local point1 = {"",1,100,5572,-6312,-5104}
		local point2 = {"",1,100,5270,-6348,-5104}
		local point3 = {"",1,100,8204,5656,500}
		local point4 = {"",1,100,8442,5691,500}
		local point5 = {"",1,100,8886,5739,-5097}
		if Task_L_LongGetTo(0xf55d1,1,11001,5,point1,point2,point3,point4,point5) then
			local point = {"",1,100,8886,5739,-5097}
			Task_L_TalkToNpc(0xf55d1,1,point,"Totoma",0,1,8)
		end

		local point = {"",1,100,8886,5739,-5097}
		Task_L_TalkToNpc(0xf55d1,3,point,"Totoma",0,1,9)

		Task_L_UseEquipBox("Crew Application Form: Mokamoka")

		--使用传送阵
		Task_L_UseTransmit(0x3d10d2,2,"Oceanscent Seashore","Oceanscent Seashore")
	end
	---------------------------------------------------------------------------
	--第3张地图
	if Fun_IsInMapByMapId(11012) then
		GlobalFun(0)
		local point1 = {"",12,300,3542,2055,1293}
		local point2 = {"",1,100,3113,2457,199}
		if Task_L_LongGetTo(0xf462e,1,11012,2,point1,point2) then
			local point = {"",1,100,2307,7156,-0}
			Task_L_CompleteTask(0xf462e ,1,point,"Mokamoka",-1)
		end

		local point = {"",1,100,3305,9468,-0}
		Task_L_Collection(0xf4df9,1,point)

		local point1 = {"",1,200,3571,9478,-0}	
		local point2 = {"",10,300,4034,10670,-0}
		Task_L_CarryItem(0xf4df9,2,0,point1,point2)

		local point1 = {"",1,200,3817,9695,-0}	
		local point2 = {"",1,100,3971,10757,-0}		
		Task_L_CarryItem(0xf4df9,3,0,point1,point2)

		local point = {"",1,100,2341,7225,-0}
		Task_L_TalkToNpc(0xf4df9,4,point,"Mokamoka",0,1,1)

		if Fun_IsHaveTask(0xf4dfa,1) == 1 then 
			local point = {"",1,2000,4149,1654,1280}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",12,300,3542,2055,1293}
				local point2 = {"",1,100,3113,2457,199}
				local point3 = {"",1,100,3233,6867,-0}
				Task_L_LongGetTo(0xf4dfa,1,11012,3,point1,point2,point3)
			else
				local point = {"",1,100,8068,3543,400}
				Task_L_TalkToNpc(0xf4dfa,1,point,"Mushumushu",0,1,1)
			end
		end

		if Fun_IsHaveTask(0xf4dfa,2) == 1 then 
			local point = {"",1,2000,4149,1654,1280}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",12,300,3542,2055,1293}
				local point2 = {"",1,100,3113,2457,199}
				local point3 = {"",1,100,3233,6867,-0}
				Task_L_LongGetTo(0xf4dfa,2,11012,3,point1,point2,point3)
			else
				local point = {"",1,100,7861,2616,400}
				Task_L_Collection(0xf4dfa,2,point)
			end
		end

		if Fun_IsHaveTask(0xf4dfa,3) == 1 then 
			local point = {"",1,2000,4149,1654,1280}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",12,300,3542,2055,1293}
				local point2 = {"",1,100,3113,2457,199}
				local point3 = {"",1,100,3233,6867,-0}
				Task_L_LongGetTo(0xf4dfa,3,11012,3,point1,point2,point3)
			else
				local point = {"",1,100,6354,4889,400}
				Task_L_AutoGetTo(0xf4dfa,3,11012,point,11,0) 
			end
		end

		if Fun_IsHaveTask(0xf4dfa,4) == 1 then 
			local point = {"",1,2000,4149,1654,1280}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",12,300,3542,2055,1293}
				local point2 = {"",1,100,3113,2457,199}
				local point3 = {"",1,100,3233,6867,-0}
				Task_L_LongGetTo(0xf4dfa,4,11012,3,point1,point2,point3)
			else
				local point = {"",1,100,7468,2182,400}
				Task_L_AutoGetTo(0xf4dfa,4,11012,point,0,0) 
			end
		end
		
		local point = {"",1,100,7468,2182,400}
		Task_L_Collection(0xf4dfa,5,point)

		local point = {"",1,100,7518,2694,400}
		Task_L_Collection(0xf4dfa,6,point)

		local point = {"",1,100,7859,3192,400}
		Task_L_Collection(0xf4dfa,7,point)

		local point = {"",1,100,14148,12201,474}
		Task_L_Collection(0xf4dfa,8,point)

		if Task_L_GetTaskIsComplete(0xf4dfa) then
			local point = {"",1,100,14191,12294,474}
			Task_L_CompleteTask(0xf4dfa ,9,point,"Mokamoka",0)
		else
			local point = {"",1,100,14269,12224,474}
			Task_L_TalkToNpc(0xf4dfa,9,point,"Picopico",0,1,1)
		end

		--开传送阵
		local point = {"Sweetwater Farm",1,100,12404,11182,526}
		if Task_L_OpenTranMission(0xf4dfb,1,point) == 1 then

			if Fun_IsHaveTask(0xf4dfb,1) == 1 then

				Task_L_LoopEquipFun()
				local point = {"Nominomi",1,100,12562,11757,476}
				Task_L_BuyItem(0xf4dfb,1,50,4,"Expert Healing Potion",point)
				Task_L_PushDwonDrug(0xf4dfb,1,"Expert Healing Potion")

				Fun_SetBackHomeInfo(80,40,0,0)
				if Fun_IsNeedBackHome() == 1 then

					local BackHomeInfo = {
						0, --1比较小地图
						"Sweetwater Forest", --大地图
						"Sweetwater Forest", --小地图
						"Sweetwater Farm", --传送阵
						{ 12839,10803,479 }, --修理NPC坐标
						{ 12562,11757,476 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			--这里完成任务获得一个瓢虫坐骑
			Task_L_UseItem(0xf4dfb ,1,"Red Ladybug")
			local point = {"",1,100,14066,10439,480}
			Task_L_Collection(0xf4dfb,1,point)
		end

		local point = {"",1,500,15843,11617,479}
		Task_L_Collection(0xf4dfb,2,point)

		if Task_L_GetTaskIsComplete(0xf4dfb) then
			local point = {"",1,100,6994,22456,454}
			Task_L_CompleteTask(0xf4dfb ,3,point,"Mokamoka",0)
		else
			local point1 = {"",0,500,6447,15516,464}
			local point2 = {"",0,600,4986,15529,464}
			Task_L_LoopAttackMonMore(0xf4dfb,3,0,2,point1,point2)
		end

		--进入剧情副本  11018
		local point = {"",1,100,7122,22291,454}
		if Task_L_LongGetTo(0xf4dfc,1,11012,1,point) then
			local point = {"",1,100,6591,22429,477}
			Task_L_AutoGetTo(0xf4dfc,1,11012,point,1,0x2B0A) 	
		end

		local point = {"",1,100,7009,22341,454}
		Task_L_UseTaskItem(0xf4dfd,1,point)

		local point = {"",1,100,12351,20070,464}
		Task_L_AutoGetTo(0xf4dfd,2,11012,point,0,0) 
		
		local point1 = {"",1,200,14574,21388,464}	
		local point2 = {"",1,100,14803,21060,451}		
		Task_L_CarryItem(0xf4dfd,3,0,point1,point2)

		local point = {"",1,300,14758,21123,463}
		Task_L_Collection(0xf4dfd,4,point)

		if Task_L_GetTaskIsComplete(0xf4dfd) then
			local point = {"",1,100,25127,24672,1422}
			Task_L_CompleteTask(0xf4dfd ,5,point,"Mokamoka",0)
		else
			--开传送阵
			local point = {"Woodland Path",1,100,21552,21206,468}
			if Task_L_OpenTranMission(0xf4dfd,5,point) == 1 then
				local point1 = {"",2,100,25123,20250,950}
				local point2 = {"",1,100,25102,24640,1422}
				Task_L_LongGetTo(0xf4dfd,5,11012,2,point1,point2)
			end
		end

		--进入普通副本  11051
		local point1 = {"",2,100,25204,24994,1428}
		local point2 = {"",1,100,26361,27240,354}
		if Task_L_LongGetTo(0xf4dfe,1,11012,2,point1,point2) then
			local point = {"",1,100,26944,27456,131}
			Task_L_AutoGetTo(0xf4dfe,1,11012,point,2,0x2B2B) 	
		end

		--使用传送阵
		Task_L_UseTransmit(0xf59b1,1,"Mokoko Village Plaza","Whistle Plaza")

		local point = {"",1,100,14264,12210,474}
		Task_L_TalkToNpc(0xf59b1,8,point,"Picopico",0,1,2)

		local point1 = {"",1,100,17631,6651,912}
		local point2 = {"",1,100,26003,3976,912}
		Task_L_LongGetTo(0xf51e1,1,11012,2,point1,point2)

	end
	---------------------------------------------------------------------------
	--第4张地图
	if Fun_IsInMapByMapId(11013) then
		GlobalFun(0)
		local point = {"Chicachica",1,100,5021,2755,-44}  
		Task_L_BranchTalkToNpc(0xf51e1,1,0,point)

		local point = {"Pookapooka",1,100,6374,3300,-0}  
		Task_L_BranchTalkToNpc(0xf51e1,1,1,point)

		local point = {"Chocochoco",1,100,7497,3336,-0}  
		Task_L_BranchTalkToNpc(0xf51e1,1,2,point)

		local point1 = {"",2,100,7718,3620,-0}
		local point2 = {"",1,100,9743,8824,1536}
		if Task_L_LongGetTo(0xf51e1,2,11013,2,point1,point2) then
			local point = {"",1,100,9752,8828,1536}
			Task_L_TalkToNpc(0xf51e1,2,point,"Mokamoka",0,1,1)
		end

		local point1 = {"",0,800,8680,9088,1536}
		local point2 = {"",0,800,10645,7872,1536}
		Task_L_LoopAttackMonMore(0xf51e2,1,0,2,point1,point2)
		
		local point1 = {"",2,100,10906,10062,1536}
		local point2 = {"",1,100,11000,12145,2048}
		if Task_L_LongGetTo(0xf51e2,2,11013,2,point1,point2) then
			local point1 = {"",0,800,11000,12145,2048}
			local point2 = {"",0,800,11527,13706,2048}
			Task_L_LoopAttackMonMore(0xf51e2,2,0,2,point1,point2)

			local point1 = {"",0,500,10779,13266,2048}
			local point2 = {"",0,500,10666,14517,2047}
			local point3 = {"",0,500,11514,14904,2048}
			Task_L_LoopCollectMore(0xf51e2,2,1,3,point1,point2,point3)
		end

		local point1 = {"",1,100,11976,10628,2048}
		local point2 = {"",1,100,16490,15042,2560}
		if Task_L_LongGetTo(0xf51e3,1,11013,2,point1,point2) then
			--开传送阵
			local point = {"Rocky Forest Hill",1,100,15174,16477,2338}
			if Task_L_OpenTranMission(0xf51e3,1,point) == 1 then
				--进入剧情副本  11019
				local point1 = {"",10,200,17170,14579,2557}
				local point2 = {"",1,100,18257,13678,3584}	
				if Task_L_LongGetTo(0xf51e3,1,11013,2,point1,point2) then
					local point = {"",1,100,17850,13413,3585}
					Task_L_AutoGetTo(0xf51e3,1,11013,point,1,0x2B0B) 	
				end
			end
		end

		local point = {"Rocky Forest Hill",1,100,15174,16477,2338}
		if Task_L_OpenTranMission(0xf51e3,1,point) == 1 then
			--进入剧情副本  11019
			local point1 = {"",10,200,17170,14579,2557}
			local point2 = {"",1,100,18257,13678,3584}	
			if Task_L_LongGetTo(0xf51e3,1,11013,2,point1,point2) then
				local point = {"",1,100,17850,13413,3585}
				Task_L_AutoGetTo(0xf51e3,1,11013,point,1,0x2B0B) 	
			end
		end
		
		local point = {"",1,100,15021,16366,2362}
		if Task_L_UseTransmitPoint(0xf51e6,1,"Rocky Forest Hill",point) then
			local point = {"",1,100,18241,17267,2304}
			Task_L_TalkToNpc(0xf51e6,1,point,"Mokamoka",0,1,1)
		end
		
		local point = {"",1,100,18160,17404,2304}
		Task_L_Collection(0xf51e6,2,point)

		local point = {"",1,300,18241,17267,2304}
		Task_L_TalkToNpc(0xf51e6,3,point,"Mokamoka",0,1,2)
		
		local point1 = {"",0,500,15147,18469,2304}
		local point2 = {"",0,500,13766,18308,2304}
		local point3 = {"",0,500,14498,17439,2304}
		Task_L_LoopCollectMore(0xf51e6,4,0,3,point1,point2,point3)

		local point = {"",1,300,18160,17404,2304}
		Task_L_Collection(0xf51e6,5,point)

		local point = {"",1,300,18160,17404,2304}
		Task_L_TalkToNpc(0xf51e6,6,point,"Setino",0,1,1)

		local point = {"",1,300,18160,17404,2304}
		Task_L_Collection(0xf51e6,7,point)

		local point = {"",1,300,18241,17267,2304}
		Task_L_TalkToNpc(0xf51e6,8,point,"Mokamoka",0,1,3)

		--进入剧情副本  11020
		local point1 = {"",1,100,20640,17792,2306}
		local point2 = {"",2,100,25467,19337,2560}
		local point3 = {"",1,100,25634,19405,3093}	
		if Task_L_LongGetTo(0xf51e4,1,11013,3,point1,point2,point3) then
			local point = {"",1,100,25931,19383,3068}
			Task_L_AutoGetTo(0xf51e4,1,11013,point,1,0x2B0C) 	
		end

		local point = {"",1,100,22748,22176,2952}
		Task_L_AutoGetTo(0xf51e5,1,11013,point,0,0) 	

		local point1 = {"",0,600,22863,22714,3072}
		local point2 = {"",0,600,21975,23149,3072}
		local point3 = {"",0,600,21332,22378,3072}
		local point4 = {"",0,600,20987,23355,3072}
		Task_L_LoopAttackMonMore(0xf51e5,2,0,4,point1,point2,point3,point4)
		
		--开传送阵
		local point = {"Rocky Forest Graveyard",1,100,22507,28173,3618}
		if Task_L_OpenTranMission(0xf51e5,3,point) == 1 then
			local point = {"",1,100,29204,29601,3584}
			Task_L_AutoGetTo(0xf51e5,3,11013,point,0,0) 
		end
		
	end
	---------------------------------------------------------------------------
	--第5张地图
	if Fun_IsInMapByMapId(11014) then
		GlobalFun(0)
		local point = {"",1,100, 714,-3654,-4069}
		Task_L_CompleteTask(0xf51e5 ,3,point,"Mokamoka",-1)

		--------------------------------------------
		--开传送阵
		local point = {"Stonehearth",1,100,1101,-2643,-4019}
		if Task_L_OpenTranMission(0xf55cc,1,point) == 1 then
			
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Ropiropi",1,100,1530,-2705,-4069}
			Task_L_BuyItem(0xf55cc,1,50,4,"Expert Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80,40,0,0)
			--修理
			if Fun_IsHaveTask(0xf55cc,1) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Forest of Giants", --大地图
						"Stonehearth", --小地图
						"Stonehearth", --传送阵
						{ 685,-3055,-4069 }, --修理NPC坐标
						{ 1530,-2705,-4069 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,3529,-932,-3818}
			Task_L_AutoGetTo(0xf55cc,1,11014,point,0,0) 
		end
		
		local point = {"",1,300,4071,-906,-3811}
		Task_L_Collection(0xf55cc,2,point)

		local point = {"",1,300,4071,-906,-3811}
		Task_L_TalkToNpc(0xf55cc,3,point,"Pastata",0,1,1)

		local point = {"",1,300,4071,-906,-3811}
		Task_L_UseTaskItem(0xf55cc,4,point)


		if Task_L_GetTaskIsComplete(0xf55cc) then
			local point = {"",1,100, 8068,8923,-1508}
			Task_L_CompleteTask(0xf55cc ,5,point,"Mokamoka",-1)
		else
			local point1 = {"",2,100,4229,1361,-3812}
			local point2 = {"",10,100,8708,7731,-3544}	
			local point3 = {"",1,100,8291,8846,-1508}	
			Task_L_LongGetTo(0xf55cc,5,11014,3,point1,point2,point3)
		end

		--开传送阵
		local point = {"Tortoyk's Arm",1,100,8492,9800,-1476}
		if Task_L_OpenTranMission(0xf55c9,1,point)	== 1 then

			--进入剧情副本 11021
			local point1 = {"",2,100,7867,8831,-1481}
			local point2 = {"",2,100,7677,8782,-1791}	
			local point3 = {"",2,100,7432,8846,-2213}	
			local point4 = {"",1,100,7241,8924,-2501}	
			if Task_L_LongGetTo(0xf55c9,1,11014,4,point1,point2,point3,point4) then
				local point = {"",1,100,7099,8398,-2532}
				Task_L_AutoGetTo(0xf55c9,1,11014,point,1,0x2B0D) 	
			end
		end
		
		local point = {"",1,100,-3131,7677,-2743}
		Task_L_AutoGetTo(0xf55ca,1,11014,point,0,0) 
		
		local point = {"",1,100,-3052,7821,-2736}
		Task_L_TalkToNpc(0xf55ca,2,point,"Mokamoka",0,1,1)

		--使用传送阵
		Task_L_UseTransmit(0xf55ca,3,"Mokoko Village Plaza","Цветочная площадь")

		local point1 = {"",10,100,5921,11122,-1496}
		local point2 = {"",1,100,5128,11194,-2532}	
		if Task_L_LongGetTo(0xf55cb,1,11014,2,point1,point2) then
			local point = {"",1,600,6127,12953,-2524}
			Task_L_Collection(0xf55cb,1,point)
		end

		if Task_L_GetTaskIsComplete(0xf55cb) then
			local point = {"",1,100, 7868,13136,-1508}
			Task_L_CompleteTask(0xf55cb ,2,point,"Mokamoka",-1)
		else
			local point1 = {"",10,100,5507,11187,-2527}
			local point2 = {"",1,100,7609,11777,-1502}	
			if Task_L_LongGetTo(0xf55cb,2,11014,2,point1,point2) then
				local point = {"",1,100,7609,11777,-1502}
				Task_L_Collection(0xf55cb,2,point)
			end
		end

		local point1 = {"",2,100,8982,14267,-1508}
		local point2 = {"",1,100,9436,14343,-1739}	
		if Task_L_LongGetTo(0xf55cd,1,11014,2,point1,point2) then
			local point = {"",1,100,9436,14343,-1739}
			Task_L_Collection(0xf55cd,1,point)
		end
		
		local point1 = {"",2,100,9232,14205,-1736}
		local point2 = {"",10,100,13874,15601,-1492}
		local point3 = {"",10,100,18495,18080,-466}
		local point4 = {"",2,100,26800,17603,537}	
		local point5 = {"",2,100,23353,13421,915}	
		local point6 = {"",1,100,23797,13403,657}	
		if Task_L_LongGetTo(0xf55cd,2,11014,6,point1,point2,point3,point4,point5,point6) then
			local point = {"",1,100,23797,13403,657}	
			Task_L_Collection(0xf55cd,2,point)
		end

		local point = {"",1,100,23852,13338,657}	
		Task_L_Collection(0xf55cd,3,point)

		local point = {"",1,100,23847,13464,657}	
		Task_L_Collection(0xf55cd,4,point)
		
		local point = {"",1,100,23816,13480,657}	
		Task_L_Collection(0xf55cd,5,point)
		
		local point1 = {"",2,100,23631,13482,657}
		local point2 = {"",2,100,21983,16478,1050}
		local point3 = {"",1,100,22694,18973,538}
		if Task_L_LongGetTo(0xf55ce,1,11014,3,point1,point2,point3) then
			local point = {"",1,100,22694,18973,538}
			Task_L_TalkToNpc(0xf55ce,1,point,"Mokamoka",0,1,1)
		end

		--开传送阵
		local point = {"Tortoyk's Head",1,100,22542,20253,570}
		if Task_L_OpenTranMission(0xf55ce,2,point)	== 1 then
			local point1 = {"",1,100,22510,25297,1048}
			local point2 = {"",1,100,19443,25035,1048}
			local point3 = {"",1,100,18154,20353,536}
			if Task_L_LongGetTo(0xf55ce,2,11014,3,point1,point2,point3) then
				local point = {"",1,100,15885,23234,533}
				Task_L_TalkToNpc(0xf55ce,2,point,"Mokamoka",0,1,2)
			end
		end
		
		local point = {"",1,100,15885,23234,533}
		Task_L_UseTaskItem(0xf55ce,3,point)

		local point = {"",1,100,15892,23548,523}	
		Task_L_Collection(0xf55ce,4,point)

		-------------------------------------------
		if Fun_IsHaveTask(0xf55cf,1) == 1 then
			Fun_SetBackHomeInfo(80,40,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,2000,1530,-2705,-4069}
				if Fun_IsInPoint(point) == 0 then
					local point = {"",1,100,1101,-2643,-4019}
					Task_L_UseTransmitPoint(0xf55cf,1,"Stonehearth",point)
				else
					Task_L_LoopEquipFun()
					local point = {"Ropiropi",1,100,1530,-2705,-4069}
					Task_L_BuyItem(0xf55cf,1,50,4,"Expert Healing Potion",point)
					Task_L_PushDwonDrug(0xf55cf,1,"Expert Healing Potion")

					local BackHomeInfo = {
						0, --1比较小地图
						"Forest of Giants", --大地图
						"Stonehearth", --小地图
						"Stonehearth", --传送阵
						{ 685,-3055,-4069 }, --修理NPC坐标
						{ 1530,-2705,-4069 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,2000,1530,-2705,-4069}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,22542,20253,570}
					Task_L_UseTransmitPoint(0xf55cf,1,"Tortoyk's Head",point)
				else
					--进入副本  11052
					local point = {"",1,100,15885,23234,533}
					if Task_L_LongGetTo(0xf55cf,1,11014,1,point) then
						local point = {"",1,100,15081,23589,536}
						Task_L_AutoGetTo(0xf55cf,1,11014,point,2,0x2B2C) 	
					end
				end
			end
		end

		--使用传送阵
		Task_L_UseTransmit(0xf55d0,1,"Mokoko Village Plaza","Whistle Plaza")
	end
	---------------------------------------------------------------------------
	-------------------------------安忆谷--------------------------------------
	---------------------------------------------------------------------------
	--第1张
	if Fun_IsInMapByMapId(10701) then
		GlobalFun(0)
		--开传送阵
		local point = {"Port",1,100,-13797,12259,431}
		if Task_L_OpenTranMission(0xac1e9,1,point)	== 1 then
			local point1 = {"Collect",1,100,-14782,10211,384}
			local point2 = {"Collect",2,100,-14541,9952,384}
			local point3 = {"Collect",0,100,-10751,14254,385}
			local point4 = {"Collect",3,100,-10080,14587,384}
			Task_L_BranchLine(0xac1e9,1,4,point1,point2,point3,point4)
		end

		local point = {"",1,100,-7863,14498,256}
		Task_L_TalkToNpc(0xac1e9,2,point,"Jinbang",0,1,1)

		local point = {"",1,100,-7611,14413,256}	
		Task_L_Collection(0xac1e9,3,point)

		local point = {"",1,100,-7863,14498,256}
		Task_L_TalkToNpc(0xac1e9,4,point,"Jinbang",0,1,2)


		--开传送阵
		local point = {"City Hall",1,100,-5324,8947,467}
		if Task_L_OpenTranMission(0xac1e9,5,point) == 1 then	
			local point = {"",1,100,-2704,9945,610}
			Task_L_TalkToNpc(0xac1e9,5,point,"Pahan",0,1,1)
		end
		local point = {"",1,100,-2552,10204,610}
		Task_L_TalkToNpc(0xac1fc,1,point,"Leader Geon",0,1,4)

		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Maryang",1,100,-9635,4146,384}
		Task_L_BuyItem(0xac1fc,2,50,4,"Expert Healing Potion",point)
		
		Task_L_PushDwonDrug(0xac1fc,2,"Expert Healing Potion")
		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80,40,0,0)
		--修理
		if Fun_IsHaveTask(0xac1fc,2) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Port City Changhun", --大地图
					"Goldfish House", --小地图
					"City Hall", --传送阵
					{ -5672,3442,384 }, --修理NPC坐标
					{ -9635,4146,384 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		local point1 = {"",1,100,-8376,4053,383}
		local point2 = {"",1,100,-10132,-11371,380}	
		if Task_L_LongGetTo(0xac1fc,2,10701,2,point1,point2) then
			local point = {"",1,100,-10132,-11371,380}
			Task_L_TalkToNpc(0xac1fc,2,point,"Herbalist Najin",0,1,1)	
		end
		
		local point1 = {"",1,50,-10402,-11334,378}
		local point2 = {"",1,100,-8919,4510,384}	
		if Task_L_LongGetTo(0xac1fc,3,10701,2,point1,point2) then
			local point = {"",1,100,-8919,4663,384}
			Task_L_TalkToNpc(0xac1fc,3,point,"Little Kid",0,1,1)	
		end

		local point1 = {"",0,100,-8919,4510,384}
		local point2 = {"",0,100,-8782,4343,384}
		local point3 = {"",0,100,-8985,4171,384}
		Task_L_LoopCollectMore(0xac1fc,4,0,3,point1,point2,point3)

		local point = {"",1,100,-7527,5109,256}
		Task_L_TalkToNpc(0xac1fc,5,point,"Jobin",0,1,1)
		
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1fc,6,point,"Yuul",0,1,1)

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1fc,7,point,"Yuul",0,1,0x1E)

		--这里角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1ea,1,point,"Yuul",0,1,2)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1ea,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1ea,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1ea,3,point,"Yuul",0,1,3)

		local point1 = {"",1,100,-5455,6229,256}
		local point2 = {"",1,100,-10095,-7866,260}	
		if Task_L_LongGetTo(0xac1ec,1,10701,2,point1,point2) then
			local point = {"",1,100,-10095,-7866,260}
			Task_L_TalkToNpc(0xac1ec,1,point,"Woobo",0,1,1)	
		end

		local point1 = {"",1,200,-9901,-7514,260}
		local point2 = {"",1,100,-10488,-6635,260}		
		Task_L_CarryItem(0xac1ec,2,0,point1,point2)
		
		local point = {"",1,100,-10095,-7866,260}
		Task_L_TalkToNpc(0xac1ec,3,point,"Woobo",0,1,2)	

		local point = {"",1,100,-10095,-7866,260}
		Task_L_TalkToNpc(0xac1ed,1,point,"Woobo",0,1,3)	

		if Fun_IsHaveTaskBranch(0xac1ed ,2,2) == 1 then
			local point1 = {"",1,100,-11621,-6460,260}
			local point2 = {"",1,100,-5640,6578,256}	
			if Task_L_LongGetTo(0xac1ed,2,10701,2,point1,point2) then
				local point = {"",1,100,-5640,6578,256}
				Task_L_LoopCollectMore(0xac1ed,2,2,1,point)
			end
		end
		
		if Fun_IsHaveTaskBranch(0xac1ed ,2,2) == 0 then
			if Fun_IsHaveTaskBranch(0xac1ed ,2,1) == 1 then
				local point = {"",1,100,-10480,5247,384}
				Task_L_LoopCollectMore(0xac1ed,2,1,1,point)
			end
		end

		if Fun_IsHaveTaskBranch(0xac1ed ,2,1) == 0 then
			if Fun_IsHaveTaskBranch(0xac1ed ,2,2) == 0 then
				if Fun_IsHaveTaskBranch(0xac1ed ,2,0) == 1 then
					local point1 = {"",1,100,-8376,4053,383}
					local point2 = {"",1,100,-10132,-11371,380}	
					if Task_L_LongGetTo(0xac1ed,2,10701,2,point1,point2) then
						local point = {"",1,100,-10132,-11371,380}
						Task_L_LoopCollectMore(0xac1ed,2,0,1,point)
					end
				end
			end
		end

		local point1 = {"",1,50,-10402,-11334,378}
		local point2 = {"",1,100,-5455,6229,256}
		local point3 = {"",1,100,-10095,-7866,260}	
		if Task_L_LongGetTo(0xac1ed,3,10701,3,point1,point2,point3) then
			local point = {"",1,100,-10095,-7866,260}
			Task_L_TalkToNpc(0xac1ed,3,point,"Woobo",0,1,4)	
		end

		local point = {"",1,100,-10095,-7866,260}
		Task_L_TalkToNpc(0xac1ee,1,point,"Woobo",0,1,5)

		local point = {"",1,100,-9814,-7897,260}
		Task_L_UseTaskItem(0xac1ee,2,point)

		local point = {"",1,100,-9814,-7897,260}
		Task_L_UseTaskItem(0xac1ee,3,point)

		local point = {"",1,100,-9814,-7897,260}
		Task_L_UseTaskItem(0xac1ee,4,point)

		local point = {"",1,100,-9329,-8055,260}	
		Task_L_Collection(0xac1ee,5,point)

		local point = {"",1,100,-9618,-8095,264}	
		Task_L_Collection(0xac1ee,6,point)

		local point = {"",1,100,-10095,-7866,260}
		Task_L_TalkToNpc(0xac1ee,7,point,"Woobo",0,1,6)

		--进入角斗场
		local point1 = {"",1,100,-11621,-6460,260}
		local point2 = {"",1,100,-9967,10484,-18}
		if Task_L_LongGetTo(0xac1ef,1,10701,2,point1,point2) then
			local point = {"",1,100,-9820,10411,-18}
			Task_L_TalkToNpc(0xac1ef,1,point,"Yuul",0,1,0x0E)
		end

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1ef,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1ef,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1ef,3,point,"Yuul",0,1,0x0F)

		local point = {"",1,100,-11279,19024,527}
		Task_L_AutoGetTo(0xab663,1,10701,point,0,0) 
		
		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f1,1,point,"Yuul",0,1,0x0D)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1f1,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1f1,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f1,3,point,"Yuul",0,1,0x0C)

		local point = {"",1,100,-5928,9012,384}
		if Task_L_LongGetTo(0xac1fe,1,10701,1,point) then
			Fun_Sleep(5000)
			local point = {"Villager",1,100,-5928,9012,384}
			Task_L_BranchTalkToNpc(0xac1fe,1,1,point)
		end

		local point = {"",1,100,-5932,8594,384}
		if Task_L_LongGetTo(0xac1fe,1,10701,1,point) then
			Fun_Sleep(5000)
			local point = {"Villager",1,100,-5932,8594,384}
			Task_L_BranchTalkToNpc(0xac1fe,1,0,point)
		end

		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f2,1,point,"Yuul",0,1,0x12)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1f2,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1f2,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f2,3,point,"Yuul",0,1,0x13)

		local point = {"",1,100,-8945,11522,384}
		if Task_L_LongGetTo(0xac1ff,1,10701,1,point) then
			local point = {"Jeok Family Trainee",1,50,-8945,11522,384}
			Task_L_BranchTalkToNpc(0xac1ff,1,1,point)
		end

		local point = {"",1,100,-9206,11733,384}  
		if Task_L_LongGetTo(0xac1ff,1,10701,1,point) then
			local point = {"Jeok Family Trainee",1,50,-9206,11733,384}  
			Task_L_BranchTalkToNpc(0xac1ff,1,0,point)
		end

		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f3,1,point,"Yuul",0,1,0x9)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1f3,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1f3,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f3,3,point,"Yuul",0,1,8)

		local point = {"",1,100,-2723,9947,614}
		Task_L_TalkToNpc(0xac1f3,4,point,"Pahan",0,1,0x0C)

		local point = {"",1,100,-6862,1240,555}
		Task_L_AutoGetTo(0xac5d2,1,10701,point,0,0) 

		local point = {"",1,100,-2721,9927,614}
		Task_L_TalkToNpc(0xac5d5,4,point,"Pahan",0,1,0x0B)

		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f5,1,point,"Yuul",0,1,0x11)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1f5,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1f5,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f5,3,point,"Yuul",0,1,0x10)

		local point = {"",1,100,-5913,10263,384}
		Task_L_TalkToNpc(0xac1f5,4,point,"Wonpho",0,1,1)

		local point = {"",1,100,-2721,9927,614}
		Task_L_TalkToNpc(0xac1fd,1,point,"Pahan",0,1,5)

		local point = {"",1,100,-2721,9927,614}
		Task_L_UseTaskItem(0xac1fd,2,point)

		local point = {"",1,100,-2721,9927,614}
		Task_L_UseTaskItem(0xac1fd,3,point)

		local point = {"",1,100,-2721,9927,614}
		Task_L_UseTaskItem(0xac1fd,4,point)

		local point = {"",1,100,-2721,9927,614}
		Task_L_TalkToNpc(0xac1fd,5,point,"Pahan",0,1,6)

		local point = {"",1,100,-4504,15736,521}
		Task_L_TalkToNpc(0xac1fd,6,point,"Zaun",0,1,4)

		local point = {"",1,100,-2721,9927,614}
		Task_L_TalkToNpc(0xac1fd,7,point,"Pahan",0,1,7)

		--使用传送阵
		Task_L_UseTransmit(0xac1fd,8,"Around Yeon's Barrier","Rattan Hill")

		local point = {"",1,100,-4504,15736,521}
		Task_L_TalkToNpc(0xac9bd,4,point,"Zaun",0,1,2)

		local point = {"",1,100,-2721,9927,614}
		Task_L_TalkToNpc(0xac9bd,5,point,"Pahan",0,1,4)

		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f7,1,point,"Yuul",0,1,0x16)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1f7,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1f7,2,10701,point,1,0x29E6) 	
		end
		
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f7,3,point,"Yuul",0,1,0x17)

		local point1 = {"",1,100,-3793,15091,512}
		local point2 = {"",1,100,-6885,-10041,256}
		if Task_L_LongGetTo(0xac1f7,4,10701,2,point1,point2) then
			local point = {"",1,100,-6885,-10041,256}
			Task_L_TalkToNpc(0xac1f7,4,point,"Gildal",0,1,1)
		end

		local point1 = {"",1,100,-7218,-10550,256}
		local point2 = {"",1,100,-9571,14542,384} 
		if Task_L_LongGetTo(0xac200,1,10701,2,point1,point2) then

			local point = {"Jinmo",2,100,-9571,14542,384}
			Task_L_BranchTalkToNpc(0xac200,1,0,point)
		
			local point = {"Howan",2,100,-9680,14705,384}  
			Task_L_BranchTalkToNpc(0xac200,1,1,point)
		end

		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f8,1,point,"Yuul",0,1,0x1A)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1f8,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1f8,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-10006,9803,-18}
		Task_L_TalkToNpc(0xac1f8,3,point,"Gumga",0,1,1)

		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1f8,4,point,"Yuul",0,1,0x1B)

		local point = {"",1,100,-2721,9927,614}
		Task_L_TalkToNpc(0xac1f8,5,point,"Pahan",0,1,8)

		--使用传送阵
		Task_L_UseTransmit(0xac1f8,6,"Spring of Echoes","Spring of Echoes")

		--进入角斗场
		local point = {"",1,100,-9820,10411,-18}
		Task_L_TalkToNpc(0xac1fa,1,point,"Yuul",0,1,0x1D)

		--如果在里面异常退出，再进
		local point = {"",1,100,-10566,10433,-4}
		if Task_L_LongGetTo(0xac1fa,2,10701,1,point) then
			local point = {"",1,100,-10371,10137,-4}
			Task_L_AutoGetTo(0xac1fa,2,10701,point,1,0x29E6) 	
		end

		local point = {"",1,100,-10636,10431,-4}
		Task_L_TalkToNpc(0xac1fa,3,point,"Wei",0,1,4)

		--使用传送阵
		Task_L_UseTransmit(0xacda7,1,"Cloud Valley","Twilight Mists")	

		if Task_L_GetTaskIsComplete(0xac1fb) then
			local point = {"",1,100,-10281,9933,-4}
			Task_L_CompleteTask(0xac1fb ,1,point,"Pahan",-1)
		else
			local point = {"",1,100,-2568,10193,610}
			Task_L_TalkToNpc(0xac1fb,1,point,"Leader Geon",0,1,3)
		end

		local point = {"",1,100,-4504,15736,521}
		Task_L_TalkToNpc(0xac201,1,point,"Zaun",0,1,5)

		local point = {"",1,100,-4504,15736,521}
		Task_L_UseTaskItem(0xac201,2,point)

		if Task_L_GetTaskIsComplete(0xac201) then
			local point = {"",1,100,-4504,15736,521}
			Task_L_CompleteTask(0xac201 ,3,point,"Zaun",-1)
		else
			local point = {"",1,100,-4504,15736,521}
			Task_L_UseTaskItem(0xac201,3,point)
		end

		local point = {"",1,100,-13797,12259,431}
		Task_L_UseTransmitPoint(0x3d10d3,1,"Port",point)

		local point = {"",1,100,-16865,10182,273}
		Task_L_AutoGetTo(0x3d10d3,1,10701,point,0,0) 	

	end
	---------------------------------------------------------------------------
	--第2张
	if Fun_IsInMapByMapId(10721) then
		GlobalFun(0)
		--开传送阵
		local point = {"Market District",1,100,2703,3793,1068}
		if Task_L_OpenTranMission(0xab663,1,point)	== 1 then
			local point = {"",1,100,3432,5600,895}
			Task_L_TalkToNpc(0xab663,1,point,"Warrim",0,1,3)
		end

		local point = {"",1,100,3432,5600,895}
		Task_L_UseTaskItem(0xab663,2,point)

		local point = {"",1,100,3432,5600,895}
		Task_L_TalkToNpc(0xab663,3,point,"Warrim",0,1,1)

		local point1 = {"",1,100,3522,5219,895}
		local point2 = {"",1,100,4416,5316,895}
		local point3 = {"",1,100,4335,5491,895}
		Task_L_LoopCollectMore(0xab663,4,0,3,point1,point2,point3)

		local point = {"",1,100,3432,5600,895}
		Task_L_TalkToNpc(0xab663,5,point,"Warrim",0,1,4)

		local point = {"",1,100,11138,3714,1146}
		Task_L_TalkToNpc(0xab664,1,point,"Warrim",0,1,1)

		local point1 = {"Collect",0,100,11444,3916,1146}
		local point2 = {"Collect",1,100,11272,4230,1146}
		Task_L_BranchLine(0xab664,2,2,point1,point2)

		local point = {"",1,100,11138,3714,1146}
		Task_L_TalkToNpc(0xab664,3,point,"Warrim",0,1,2)

		local point = {"",1,100,13503,-2062,1279}
		Task_L_AutoGetTo(0xab664,4,10721,point,0,0) 

		local point = {"",1,300,13503,-2062,1279}
		Task_L_TalkToNpc(0xab664,5,point,"Warrim",0,1,6)

		local point = {"",1,300,13503,-2062,1279}
		Task_L_TalkToNpc(0xab665,1,point,"Warrim",0,1,7)
		
		--进入剧情副本 10766
		local point = {"",1,100,13867,-2142,1279}
		Task_L_Collection(0xab665,2,point)

		--如果在里面异常退出，再进
		local point = {"",1,100,13202,-2232,1279}
		if Task_L_LongGetTo(0xab665,3,10721,1,point) then
			local point = {"",1,100,13683,-2209,1279}
			Task_L_AutoGetTo(0xab665,3,10721,point,1,0x2A0E) 	
		end

		local point = {"",1,300,13503,-2062,1279}
		Task_L_TalkToNpc(0xab665,4,point,"Warrim",0,1,8)

		--开传送阵
		local point = {"Manor Entrance",1,100,12940,-3871,1473}
		if Task_L_OpenTranMission(0xac1f1,1,point)	== 1 then
			--使用传送阵
			Task_L_UseTransmit(0xac1f1,1,"City Hall","Port City Changhun")
		end

	end
	---------------------------------------------------------------------------
	--第3张
	if Fun_IsInMapByMapId(10722) then
		GlobalFun(0)
		--开传送阵
		local point = {"Cold Haunted House",1,100,14811,7353,1070}
		if Task_L_OpenTranMission(0xac5d2,1,point)	== 1 then
			local point = {"",1,100,11432,5420,1024}
			if Task_L_LongGetTo(0xac5d2,1,10722,1,point) then
				--开传送阵
				local point = {"Yeon Family Training Grounds",1,100,9148,2120,1197}
				if Task_L_OpenTranMission(0xac5d2,1,point)	== 1 then

					local point = {"",1,100,8671,2998,1170}
					Task_L_TalkToNpc(0xac5d2,1,point,"Sayun",0,1,1)
				end
			end
		end


		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Jinsohwa",1,100,9067,3474,1166}
		Task_L_BuyItem(0xac5d2,2,50,4,"Expert Healing Potion",point)
		
		Task_L_PushDwonDrug(0xac5d2,2,"Expert Healing Potion")
		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80,40,0,0)
		--修理
		if Fun_IsHaveTask(0xac5d2,2) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Rattan Hill", --大地图
					"Yeon Clan Training Grounds", --小地图
					"Yeon Family Training Grounds", --传送阵
					{ 8041,3729,1161 }, --修理NPC坐标
					{ 9067,3474,1166 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		local point1 = {"",0,800,11353,5426,1024}
		local point2 = {"",0,800,12370,5803,1024}
		local point3 = {"",0,800,12931,4152,1024}
		local point4 = {"",0,800,13490,3086,1024}
		Task_L_LoopAttackMonMore(0xac5d2,2,0,4,point1,point2,point3,point4)

		local point = {"",1,100,17312,2332,1015}
		Task_L_TalkToNpc(0xac5d2,3,point,"Suryon",0,1,1)

		local point = {"",1,100,9148,2120,1197}
		Task_L_UseTransmitPoint(0xac5d2,4,"Yeon Family Training Grounds",point)

		local point = {"",1,100,8671,2998,1170}
		Task_L_TalkToNpc(0xac5d2,4,point,"Sayun",0,1,2)

		local point = {"",1,100,8671,2998,1170}
		Task_L_TalkToNpc(0xac5d3,1,point,"Sayun",0,1,3)

		local point = {"",1,100,14811,7353,1070}
		Task_L_UseTransmitPoint(0xac5d3,2,"Cold Haunted House",point)

		local point = {"",1,100,14088,7352,1024}
		Task_L_TalkToNpc(0xac5d3,2,point,"Gonchan",0,1,1)

		--开传送阵
		local point = {"Around Yeon's Barrier",1,100,8744,16333,1371}
		if Task_L_OpenTranMission(0xac5d3,3,point) == 1 then
			--开传送阵
			local point = {"Open Grave",1,100,14929,16356,1368}
			if Task_L_OpenTranMission(0xac5d3,3,point) == 1 then
				local point1 = {"",2,100,11971,12982,896}
				local point2 = {"",1,100,12713,13105,1126}
				local point3 = {"",1,100,-4619,11390,1758}
				if Task_L_LongGetTo(0xac5d3,3,10722,3,point1,point2,point3) then
					local point = {"",1,100,-4619,11390,1758}
					Task_L_TalkToNpc(0xac5d3,3,point,"Dr. Sakeel",0,1,1)
				end
			end
		end 

		local point = {"",1,1000,-5177,11198,1758}
		if Fun_IsInPoint(point) == 1 then
			local point1 = {"",1,100,-4851,11147,1758}
			local point2 = {"",1,100,-5177,11198,1758}
			local point3 = {"",1,100,12565,12641,1251}
			if Task_L_LongGetTo(0xac5d3,4,10722,3,point1,point2,point3) then
				local point = {"",1,100,12747,12582,1307}	
				Task_L_Collection(0xac5d3,4,point)
			end
		else
			local point1 = {"",2,100,11971,12982,896}
			local point2 = {"",1,100,12565,12641,1251}
			if Task_L_LongGetTo(0xac5d3,4,10722,2,point1,point2) then
				local point = {"",1,100,12747,12582,1307}	
				Task_L_Collection(0xac5d3,4,point)
			end
		end
		
		local point = {"",0,100,12747,12582,1307}
		Task_L_UseTaskItem(0xac5d3,5,point)
		
		local point = {"",1,100,14929,16356,1368}
		Task_L_UseTransmitPoint(0xac5d3,6,"Open Grave",point)

		local point = {"",1,800,21552,11891,1536}
		Task_L_LoopAttackMonMore(0xac5d3,6,0,1,point)--03.29
		
		local point = {"",1,100,14811,7353,1070}
		Task_L_UseTransmitPoint(0xac5d3,7,"Cold Haunted House",point)

		local point = {"",1,100,17136,2447,1015}
		Task_L_TalkToNpc(0xac5d3,7,point,"Dr. Sakeel",0,1,2)

		local point = {"",1,100,17245,2325,1015}
		Task_L_TalkToNpc(0xac5d4,1,point,"Suryon",0,1,2)

		local point = {"",1,100,9148,2120,1197}
		Task_L_UseTransmitPoint(0xac5d4,2,"Yeon Family Training Grounds",point)

		local point = {"",1,100,10128,5360,1024}
		Task_L_TalkToNpc(0xac5d4,2,point,"Wonpho",0,1,1)

		local point = {"",1,100,10128,5360,1024}
		Task_L_TalkToNpc(0xac5d4,3,point,"Wonpho",0,1,2)

		local point = {"",1,100,8744,16333,1371}
		Task_L_UseTransmitPoint(0xac5d5,1,"Around Yeon's Barrier",point)

		local point = {"",1,100,8071,18478,1077}
		Task_L_TalkToNpc(0xac5d5,1,point,"Yeon Lee",0,1,2)

		--------------------------------------------------------
		if Fun_IsHaveTask(0xac5d5,2) == 1 then
			Fun_SetBackHomeInfo(80,40,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,2000,9067,3474,1166}
				if Fun_IsInPoint(point) == 0 then
					local point = {"",1,100,9148,2120,1197}
					Task_L_UseTransmitPoint(0xac5d5,2,"Yeon Family Training Grounds",point)
				else
					Task_L_LoopEquipFun()
					local point = {"Jinsohwa",1,100,9067,3474,1166}
					Task_L_BuyItem(0xac5d5,2,50,4,"Expert Healing Potion",point)
					Task_L_PushDwonDrug(0xac5d5,2,"Expert Healing Potion")
					local BackHomeInfo = {
						0, --1比较小地图
						"Rattan Hill", --大地图
						"Yeon Clan Training Grounds", --小地图
						"Yeon Family Training Grounds", --传送阵
						{ 8041,3729,1161 }, --修理NPC坐标
						{ 9067,3474,1166 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)

				end
			else
				local point = {"",1,2000,9067,3474,1166}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,8744,16333,1371}
					Task_L_UseTransmitPoint(0xac5d5,2,"Around Yeon's Barrier",point)
				else
					--进入副本  10762
					local point = {"",1,100,8158,18171,1077}
					if Task_L_LongGetTo(0xac5d5,2,10722,1,point) then
						local point = {"",1,100,7815,18613,1077}
						Task_L_AutoGetTo(0xac5d5,2,10722,point,2,0x2A0A)	
					end
				end
			end
		end
	
		--------------------------------------------------------
		local point = {"",1,100,8071,18478,1077}
		Task_L_TalkToNpc(0xac5d5,3,point,"Yeon Lee",0,1,1)

		--使用传送阵
		Task_L_UseTransmit(0xac5d5,4,"City Hall","City Hall")

		local point = {"",1,100,14465,22024,1709}
		Task_L_TalkToNpc(0xac1fd,8,point,"Muyul",0,1,1)

		local point = {"",1,100,14107,22773,1705}
		Task_L_AutoGetTo(0xac9b9,1,10722,point,0,0)	
	end
	---------------------------------------------------------------------------
	--第4张
	if Fun_IsInMapByMapId(10723) then
		GlobalFun(0)
		local point = {"",1,100,-11345,-551,2064}
		Task_L_TalkToNpc(0xac9b9,1,point,"Sir Druden",0,1,1)

		--开传送阵
		local point = {"Ascetic Temple",1,100,-12011,2431,2145}
		if Task_L_OpenTranMission(0xac9b9,2,point)	== 1 then
		--买50瓶 1592的药, 并且卖东西
		local point = {"Jinmurin",1,100,-12488,317,2069}
		Task_L_BuyItem(0xac9b9,2,50,4,"Expert Healing Potion",point)

		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80,30,0,0)
		--修理
		if Fun_IsHaveTask(0xac9b9,2) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Melody Forest", --大地图
					"Ascetic Temple", --小地图
					"Ascetic Temple", --传送阵
					{ -11445,1282,2113 }, --修理NPC坐标
					{ -12488,317,2069 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

			local point1 = {"",2,100,-12263,2972,2099}
			local point2 = {"",1,100,-11945,3781,1600}
			if Task_L_LongGetTo(0xac9b9,2,10723,2,point1,point2) then
				local point1 = {"",1,300,-11649,3705,1600}
				local point2 = {"",1,300,-11754,4713,1600}
				local point3 = {"",1,300,-10853,4575,1600}
				local point4 = {"",1,300,-10469,5162,1600}
				local point5 = {"",1,300,-10193,5529,1600}
				Task_L_LoopAttackMonMore(0xac9b9,2,0,5,point1,point2,point3,point4,point5)
			end

			local point1 = {"",0,500,-7547,7868,2146}
			local point2 = {"",0,500,-7672,8069,2153}
			local point3 = {"",0,500,-8148,8414,2151}
			Task_L_LoopCollectMore(0xac9b9,2,2,3,point1,point2,point3)
			
			local point1 = {"",1,200,-8958,9074,1970}
			local point2 = {"",1,200,-9194,9232,1890}
			local point3 = {"",1,300,-9842,9381,1710}
			Task_L_LoopAttackMonMore(0xac9b9,2,1,3,point1,point2,point3)
		end

		--开传送阵
		local point = {"Spring of Echoes",1,100,-10823,10261,1731}
		if Task_L_OpenTranMission(0xac9b9,3,point)	== 1 then
			local point = {"",1,100,-12011,2431,2145}
			Task_L_UseTransmitPoint(0xac9b9,3,"Ascetic Temple",point)
			
			local point = {"",1,100,-11345,-551,2064}
			Task_L_TalkToNpc(0xac9b9,3,point,"Sir Druden",0,1,2)
		end

		local point = {"",1,100,-11345,-551,2064}
		Task_L_TalkToNpc(0xac9ba,1,point,"Sir Druden",0,1,3)

		local point1 = {"",2,100,-12281,2986,2099}
		local point2 = {"",2,100,-18207,10659,1600}
		local point3 = {"",1,100,-16811,12227,1698}
		if Task_L_LongGetTo(0xac9ba,2,10723,3,point1,point2,point3) then
			local point = {"",1,100,-16811,12227,1698}
			Task_L_TalkToNpc(0xac9ba,2,point,"Hao",0,1,1)
		end

		local point = {"",1,100,-16811,12227,1698}
		Task_L_TalkToNpc(0xac9ba,3,point,"Hao",0,1,2)

		local point = {"",1,100,-16811,12227,1698}
		Task_L_TalkToNpc(0xac9bb,1,point,"Hao",0,1,3)

		--开传送阵
		local point = {"Barrier's Shadow",1,100,-18167,13662,1645}
		if Task_L_OpenTranMission(0xac9bb,2,point) == 1 then
			local point = {"",0,1200,-17048,18498,1700}
			Task_L_LoopAttackMonMore(0xac9bb,2,1,1,point)
		end

		local point = {"",1,100,-16811,12227,1698}
		Task_L_TalkToNpc(0xac9bb,3,point,"Hao",0,1,4)

		local point = {"",1,100,-12011,2431,2145}
		Task_L_UseTransmitPoint(0xac9bb,4,"Ascetic Temple",point)

		local point = {"",1,100,-11345,-551,2064}
		Task_L_TalkToNpc(0xac9bb,4,point,"Sir Druden",0,1,4)

		local point = {"",1,100,-11345,-551,2064}
		Task_L_TalkToNpc(0xac9bc,1,point,"Sir Druden",0,1,5)

		local point = {"",1,100,-11345,-551,2064}
		Task_L_TalkToNpc(0xac9bd,1,point,"Sir Druden",0,1,7)

		local point = {"",1,100,-18167,13662,1645}
		Task_L_UseTransmitPoint(0xac9bd,2,"Barrier's Shadow",point)

		local point = {"",1,100,-19337,16692,1600}
		Task_L_TalkToNpc(0xac9bd,2,point,"Huchon",0,1,1)	

		local point1 = {"Collect",0,100,-19487,16708,1600}
		local point2 = {"Collect",1,100,-19410,17123,1600}
		local point3 = {"Collect",2,100,-19269,16875,1600}
		Task_L_BranchLine(0xac9bd,3,3,point1,point2,point3)
		
		--使用传送阵
		Task_L_UseTransmit(0xac9bd,4,"City Hall","Port City Changhun")

		local point1 = {"",1,100,-6998,11659,2500}
		local point2 = {"",2,100,-6261,14708,2500}
		local point3 = {"",2,100,-5603,14776,3012}
		local point4 = {"",1,100,-4879,14987,3524}
		Task_L_LongGetTo(0xac1f8,6,10723,4,point1,point2,point3,point4)
	end
	---------------------------------------------------------------------------
	--第5张
	if Fun_IsInMapByMapId(10725) then
		GlobalFun(0)

		local point = {"",1,100,1535,12934,3073}
		Task_L_TalkToNpc(0xacda3,1,point,"Chungrim",0,1,1)

		local point = {"",0,300,3302,15820,2560}
		Task_L_LoopCollectMore(0xacda3,2,0,1,point)

		local point = {"",0,300,5527,10561,2048}
		Task_L_LoopCollectMore(0xacda3,2,1,1,point)

		local point = {"",0,300,5908,6263,2304}
		Task_L_LoopCollectMore(0xacda3,2,2,1,point)
		
		--开传送阵
		local point = {"Amethyst Fog",1,100,5528,6649,2352}
		if Task_L_OpenTranMission(0xacda3,3,point) == 1 then
			local point = {"",1,100,6564,6041,2304}
			Task_L_TalkToNpc(0xacda3,3,point,"Haun",0,1,1)
		end

		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Sojin",1,100,6025,7121,2304}
		Task_L_BuyItem(0xacda3,4,100,4,"Expert Healing Potion",point)


		local point = {"",1,300,11883,9194,2175}
		Task_L_TalkToNpc(0xacda3,4,point,"Jangmin",0,1,2)

		local point = {"",1,300,11883,9194,2175}
		Task_L_TalkToNpc(0xacda4,1,point,"Jangmin",0,1,3)

		local point = {"",1,100,11779,9103,2175}
		Task_L_UseExpression(0xacda4,2,"Surprised",point) 
		
		local point = {"",1,300,11883,9194,2175}
		Task_L_TalkToNpc(0xacda4,3,point,"Jangmin",0,1,1)

		local point1 = {"",2,100,12220,9704,2172}
		local point2 = {"",1,100,13298,11759,1536}
		if Task_L_LongGetTo(0xacda4,4,10725,2,point1,point2) then
			local point1 = {"",0,800,13276,11808,1536}
			local point2 = {"",0,600,13748,13131,1536}
			local point3 = {"",0,600,13936,13818,1536}
			Task_L_LoopAttackMonMore(0xacda4,4,0,3,point1,point2,point3)
		end

		--开传送阵
		local point = {"Cloud Valley",1,100,14558,11526,1581}
		if Task_L_OpenTranMission(0xacda4,5,point) == 1 then
			local point = {"",1,300,13082,17535,1614}
			Task_L_TalkToNpc(0xacda4,5,point,"Sir Valleylead",0,1,1)
		end

		local point = {"",0,200,20569,18212,1024}
		Task_L_LoopCollectMore(0xacda5,1,2,1,point)

		local point = {"",0,200,22775,18632,1280}
		Task_L_LoopCollectMore(0xacda5,1,0,1,point)

		local point = {"",0,200,21767,16944,1280}
		Task_L_LoopCollectMore(0xacda5,1,3,1,point)

		local point = {"",0,200,20934,16165,1280}
		Task_L_LoopCollectMore(0xacda5,1,1,1,point)

		local point = {"",1,200,22788,16753,1280}
		Task_L_AutoGetTo(0xacda5,2,10725,point,0,0) 	
		
		local point1 = {"",2,100,22788,16753,1280}
		local point2 = {"",1,100,24260,17728,1785}
		if Task_L_LongGetTo(0xacda5,3,10725,2,point1,point2) then
			local point = {"",1,100,24260,17728,1785}
			Task_L_TalkToNpc(0xacda5,3,point,"Arang",0,1,1)
		end

		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80, 40,0,0)
		if Fun_IsHaveTask(0xacda5,4) == 1 then
			if FindTransmit("Nimbus Cavern") == 0 then
				local point1 = {"",2,100,22879,16883,1809}
				local point2 = {"",1,100,17122,16914,1024}
				local point3 = {"",1,100,19605,22329,806}
				if Task_L_LongGetTo(0xacda5,4,10725,3,point1,point2,point3) then
					--开传送阵
					local point = {"Nimbus Cavern",1,100,19605,22329,806}
					Task_L_OpenTranMission(0xacda5,4,point)
				end
			else
				if Fun_IsNeedBackHome() == 1 then
					local point = {"",1,100,5528,6649,2352}
					if Task_L_UseTransmitPoint(0xacda5,4,"Amethyst Fog",point) then
	
						Task_L_LoopEquipFun()
						--买50瓶 1592的药, 并且卖东西
						local point = {"Sojin",1,100,6025,7121,2304}
						Task_L_BuyItem(0xacda5,4,100,4,"Expert Healing Potion",point)
						Task_L_PushDwonDrug(0xacda5,4,"Expert Healing Potion")

						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Twilight Mists", --大地图
							"Amethyst Fog", --小地图
							"Amethyst Fog", --传送阵
							{ 6276,6769,2304 }, --修理NPC坐标
							{ 6025,7121,2304 } --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				else
					local point = {"",1,100,20659,22611,768}
					if Fun_IsInPoint(point) == 0 then
						local point = {"",1,100,19605,22329,806}
						Task_L_UseTransmitPoint(0xacda5,4,"Nimbus Cavern",point)
					end
					
					--进入副本  10764
					local point1 = {"",2,100,22879,16883,1809}
					local point2 = {"",1,100,20765,23872,768}
					if Task_L_LongGetTo(0xacda5,4,10725,2,point1,point2) then
						local point = {"",1,100,20901,24423,768}
						Task_L_AutoGetTo(0xacda5,4,10725,point,2,0x2A0C) 	
					end	
				end
			end
		end
		
		local point = {"",1,300,20911,23945,768}
		Task_L_TalkToNpc(0xacda5,5,point,"Wei",0,1,6)

		local point = {"",1,300,13082,17535,1614}
		Task_L_TalkToNpc(0xacda5,6,point,"Sir Valleylead",0,1,6)

		local point = {"",1,300,13082,17535,1614}
		Task_L_TalkToNpc(0xacda8,1,point,"Sir Valleylead",0,1,7)

		local point1 = {"",0,600,12026,15398,1280}
		local point2 = {"",0,600,12059,15104,1280}
		local point3 = {"",0,600,10366,15061,1280}
		local point4 = {"",0,600,10135,15073,1280}
		local point5 = {"",0,600,9968,15070,1280}
		local point6 = {"",0,600,10111,12886,1152}
		local point7 = {"",0,600,10195,12692,1152}
		local point8 = {"",0,600,9526,13280,1152}
		Task_L_LoopCollectMore(0xacda8,2,0,8,point1,point2,point3,point4,point5,point6,point7,point8)

		local point1 = {"",0,800,11572,15186,1280}
		local point2 = {"",0,800,10699,13516,1280}
		Task_L_LoopAttackMonMore(0xacda8,2,1,2,point1,point2)

		local point = {"",1,300,13082,17535,1614}
		Task_L_TalkToNpc(0xacda8,3,point,"Sir Valleylead",0,1,8)

		--使用传送阵
		Task_L_UseTransmit(0xac1fa,1,"City Hall","Port City Changhun")

		local point = {"",1,300,16679,9279,1292}
		Task_L_TalkToNpc(0xacda7,1,point,"Wei",0,1,5)


		if Fun_IsHaveTask(0xacda7,2) == 1 then
			Fun_SetBackHomeInfo(90, 30,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",0,3000,16679,9279,1292}
				if Fun_IsInPoint(point) == 0 then
					Task_L_LoopEquipFun()
					local point = {"Sojin",1,100,6025,7121,2304}
					Task_L_BuyItem(0xacda7,2,100,4,"Expert Healing Potion",point)
					Task_L_PushDwonDrug(0xacda7,2,"Expert Healing Potion")

					local BackHomeInfo = {
						0, --1比较小地图
						"Twilight Mists", --大地图
						"Twilight Mists", --小地图
						"Amethyst Fog", --传送阵
						{ 6276,6769,2304 }, --修理NPC坐标
						{ 6025,7121,2304 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				else
					local point = {"",1,100,5528,6649,2352}
					Task_L_UseTransmitPoint(0xacda7,2,"Amethyst Fog",point)
				end
			else
				local point = {"",0,3000,5528,6649,2352}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,14558,11526,1581}
					Task_L_UseTransmitPoint(0xacda7,2,"Cloud Valley",point)
				else
					--进入副本  10765
					local point = {"",1,100,16679,9279,1292}
					if Task_L_LongGetTo(0xacda7,2,10725,1,point) then
						local point = {"",1,100,17045,9129,1309}
						Task_L_AutoGetTo(0xacda7,2,10725,point,2,0x2A0D) 	
					end
				end
			end
		end

		local point = {"",1,300,16763,8922,1292}
		Task_L_TalkToNpc(0xacda7,3,point,"Sir Valleylead",0,1,5)

		--使用传送阵
		Task_L_UseTransmit(0xac1fb,1,"City Hall","Port City Changhun")
	end
	---------------------------------------------------------------------------
	-------------------------------阿尔因泰------------------------------------
	---------------------------------------------------------------------------
	--第1张
	if Fun_IsInMapByMapId(10421) then
		GlobalFun(0)

		local point = {"",1,100,-25178,3570,670}
		Task_L_TalkToNpc(0x4ab51,1,point,"Krueger",0,1,1)
		
		--开传送阵
		local point = {"Lupen Port",1,100,-22550,6533,581}
		if Task_L_OpenTranMission(0x4ab51,2,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Sophie",1,100,-22411,4761,542}
			Task_L_BuyItem(0x4ab51,2,80,4,"Expert Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 20,0,0)
			--修理
			if Fun_IsHaveTask(0x4ab51,2) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Arid Path", --大地图
						"Lupen Port", --小地图
						"Lupen Port", --传送阵
						{ -23880,6438,542 }, --修理NPC坐标
						{ -22411,4761,542 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,-23263,5568,547}
			Task_L_TalkToNpc(0x4ab51,2,point,"Mathias",0,1,1)
		end


		if Task_L_GetTaskIsComplete(0x4ab51) then
			local point = {"",1,100,-23263,5568,547}
			Task_L_CompleteTask(0x4ab51 ,3,point,"Mathias",-1)
		else
			local point1 = {"Collect",0,100,-19323,3269,470}
			local point2 = {"Collect",3,100,-21025,4781,673}
			local point3 = {"Collect",2,100,-22313,8392,681}
			local point4 = {"Collect",1,100,-24311,8525,681}
			Task_L_BranchLine(0x4ab51,3,4,point1,point2,point3,point4)
		end

		local point = {"",1,100,-23263,5568,547}
		Task_L_TalkToNpc(0x4ab52,1,point,"Mathias",0,1,2)

		local point1 = {"",10,100,-21630,9591,761}
		local point2 = {"",1,100,-15803,12948,1246}	
		if Task_L_LongGetTo(0x4ab52,2,10421,2,point1,point2) then
			local point = {"",1,300,-15803,12948,1246}
			Task_L_Collection(0x4ab52,2,point)
		end

		local point = {"",1,300,-15803,12948,1246}
		Task_L_TalkToNpc(0x4ab52,3,point,"Marx",0,1,1)

		if Fun_IsHaveTask(0x4ab52,4) == 1 then
			local point = {"",1,2000,-22550,6533,581}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,-21630,9591,761}
				local point2 = {"",1,100,-15803,12948,1246}	
				Task_L_LongGetTo(0x4ab52,4,10421,2,point1,point2)
			else
				local point = {"",1,100,-17817,10012,1870}
				if Task_L_LongGetTo(0x4ab52,4,10421,1,point) then
					local point = {"",1,300,-15382,10932,2260}
					Task_L_Collection(0x4ab52,4,point)
				end
			end
		end

		local point = {"",1,300,-15803,12948,1246}
		Task_L_TalkToNpc(0x4ab52,5,point,"Marx",0,1,2)

		local point = {"",1,300,-15803,12948,1246}
		Task_L_TalkToNpc(0x4ab52,6,point,"Marx",0,1,2)

		if Task_L_GetTaskIsComplete(0x4ab52) then
			local point = {"",1,300,-15803,12948,1246}
			Task_L_CompleteTask(0x4ab52 ,7,point,"Marx",-1)
		else
			local point = {"",1,300,-16136,12993,1246}
			Task_L_TalkToNpc(0x4ab52,7,point,"Regulator Guard Berkel",0,1,1)
		end

		if Fun_IsHaveTask(0x4ab53,1) == 1 then
			local point = {"",1,3000,-22550,6533,581}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,-21630,9591,761}
				local point2 = {"",1,100,-15803,12948,1246}
				Task_L_LongGetTo(0x4ab53,1,10421,2,point1,point2)
			else
				--开传送阵
				local point = {"Guard Post",1,100,-9934,14050,1270}
				if Task_L_OpenTranMission(0x4ab53,1,point) == 1 then
					local point = {"",1,300,-8952,13698,1246}
					Task_L_TalkToNpc(0x4ab53,1,point,"Guard Captain Schweiger",0,1,1)
				end
			end
		end

		local point = {"",1,300,-8952,13698,1246}
		Task_L_UseTaskItem(0x4ab53,2,point)

		--进入剧情副本  10431
		local point1 = {"",10,100,-9661,12863,1332}
		local point2 = {"",1,100,-8709,12859,2629}	
		if Task_L_LongGetTo(0x4ab53,3,10421,2,point1,point2) then
			local point = {"",1,100,-8295,12881,2629}
			Task_L_AutoGetTo(0x4ab53,3,10421,point,1,0x28BF) 
		end

		local point = {"",1,100,-9934,14050,1270}
		Task_L_UseTransmitPoint(0x4ab53,4,"Guard Post",point)

		local point1 = {"",10,100,-9069,12864,2629}
		local point2 = {"",1,100,-8952,13698,1246}	
		if Task_L_LongGetTo(0x4ab53,4,10421,2,point1,point2) then
			local point = {"",1,300,-8952,13698,1246}
			Task_L_TalkToNpc(0x4ab53,4,point,"Guard Captain Schweiger",0,1,2)
		end

		local point = {"",1,100,-22550,6533,581}
		Task_L_UseTransmitPoint(0x4ab54,1,"Lupen Port",point)

		local point = {"",1,100,-21036,4773,673}
		Task_L_TalkToNpc(0x4ab54,1,point,"Port Guard Captain Kling",0,1,1)

		local point = {"",1,100,-19862,5223,769}
		Task_L_AutoGetTo(0x4ab54,2,10421,point,0,0) 

		local point = {"",1,100,-19874,5367,767}
		Task_L_TalkToNpc(0x4ab54,3,point,"Mathias",0,1,3)	

		--进入 第二章
		local point = {"",1,100,-19597,5124,769}
		Task_L_Collection(0x4ab54,4,point)

		local point = {"",1,300,-24514,2825,670}
		Task_L_TalkToNpc(0x3d10d4,1,point,"Haberk",0,1,1)

		Task_L_UseEquipBox("Crew Application Form: Haberk")
		--这里要去航海，潜水，然后去另一个岛

		local point = {"",1,100,-26689,4954,473}
		Task_L_AutoGetTo(0x3d10d4,3,10421,point,0,0) 


		--新加修理
		if Fun_IsHaveTask(0x4b321,3) == 1 then
			Fun_SetBackHomeInfo(80, 20,0,0)
			if Fun_IsNeedBackHome() == 1 then
				Task_L_LoopEquipFun()
				local point = {"Sophie",1,100,-22411,4761,542}
				Task_L_BuyItem(0x4b321,3,80,4,"Expert Healing Potion",point)

				Task_L_PushDwonDrug(0x4b321,3,"Expert Healing Potion")
				local BackHomeInfo = {
					0, --1比较小地图
					"Arid Path", --大地图
					"Lupen Port", --小地图
					"Lupen Port", --传送阵
					{ -23880,6438,542 }, --修理NPC坐标
					{ -22411,4761,542 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			else
				local point = {"",1,3000,-22550,6533,581}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,24368,18525,1578}
					Task_L_UseTransmitPoint(0x4b321,3,"Airship Crash Site",point)
				end
			end
		end
	end
	---------------------------------------------------------------------------
	--第2张
	if Fun_IsInMapByMapId(10401) then
		GlobalFun(0)

		--开传送阵
		local point = {"Business District",1,100,17319,7141,1395}
		if Task_L_OpenTranMission(0x4a769,1,point) == 1 then
			local point1 = {"",1,100,18753,7639,1285}
			local point2 = {"",1,50,18773,8021,1285}
			local point3 = {"",1,100,30655,39572,56}	
			if Task_L_LongGetTo(0x4a769,1,10401,3,point1,point2,point3) then
				local point = {"",1,100,30655,39572,56}
				Task_L_TalkToNpc(0x4a769,1,point,"Editor-in-Chief Phillan Kaiman",0,1,1)	
			end
		end

		local point1 = {"",1,100,30045,39340,56}
		local point2 = {"",1,50,30028,38911,60}
		local point3 = {"",1,100,19559,8471,1813}	
		Task_L_LongGetTo(0x4a769,2,10401,3,point1,point2,point3) 
		
		local point1 = {"",1,100,13950,10485,1540}
		local point2 = {"",1,100,8349,8020,1379}
		Task_L_LongGetTo(0x4a769,3,10401,2,point1,point2) 

		local point = {"",1,100,8349,8020,1379}
		--Task_L_AutoGetTo(0x4a769,3,10401,point,0,0) 

		local point = {"",1,100,7116,9165,650}
		Task_L_TalkToNpc(0x4a769,4,point,"Print Shop Owner Rickman",0,1,1)	

		local point = {"",1,100,6701,11831,512}
		Task_L_LoopCollectMore(0x4a769,5,1,1,point)

		--开传送阵
		local point = {"Market District",1,100,8394,11405,818}
		if Task_L_OpenTranMission(0x4a769,5,point) == 1 then
			local point = {"",1,100,9260,12040,820}
			Task_L_Collection(0x4a769,5,point)
		end

		local point = {"",1,100,11901,9016,768}
		Task_L_TalkToNpc(0x4a769,6,point,"Print Shop Owner Rickman",0,1,2)
		
		local point = {"",1,100,11748,9205,774}
		Task_L_Collection(0x4a769,7,point)

		local point1 = {"Collect",1,100,7453,7221,647}
		local point2 = {"Collect",0,100,7356,7360,653}
		local point3 = {"Collect",3,100,7276,7468,647}
		local point4 = {"Collect",2,100,7178,7616,655}	
		Task_L_BranchLine(0x4a76a,1,4,point1,point2,point3,point4)

		local point = {"",1,100,8349,8020,1379}
		Task_L_AutoGetTo(0x4a76a,2,10401,point,0,0) 

		if Task_L_GetTaskIsComplete(0x4a76a) then
			local point = {"",1,100,30655,39572,56}
			Task_L_CompleteTask(0x4a76a ,3,point,"Editor-in-Chief Phillan Kaiman",-1)
		else
			local point = {"",1,100,17319,7141,1395}
			if Task_L_UseTransmitPoint(0x4a76a,3,"Business District",point) then
				local point1 = {"",1,100,18753,7639,1285}
				local point2 = {"",1,50,18773,8021,1285}
				local point3 = {"",1,100,30655,39572,56}	
				if Task_L_LongGetTo(0x4a76a,3,10401,3,point1,point2,point3) then
					local point = {"",1,100,30655,39572,56}
					Task_L_Collection(0x4a76a,3,point)
				end
			else
				local point1 = {"",1,50,13934,10354,1540}
				local point2 = {"",1,100,18753,7639,1285}
				local point3 = {"",1,50,18773,8021,1285}
				local point4 = {"",1,100,30655,39572,56}	
				if Task_L_LongGetTo(0x4a76a,3,10401,4,point1,point2,point3,point4) then
					local point = {"",1,100,30655,39572,56}
					Task_L_Collection(0x4a76a,3,point)
				end
			end
		end

		local point1 = {"",1,100,30045,39340,56}
		local point2 = {"",1,50,30028,38911,60}
		local point3 = {"",1,100,20316,8564,1813}	
		Task_L_LongGetTo(0x4a76b,1,10401,3,point1,point2,point3) 

		local point = {"",1,100,20533,19273,1289}
		Task_L_AutoGetTo(0x4a76b,2,10401,point,0,0) 


		--开传送阵
		local point = {"Municipal District",1,100,20467,21213,1602}
		if Task_L_OpenTranMission(0x4a76b,3,point) == 1 then
			local point = {"",1,100,20463,20784,1563}
			Task_L_TalkToNpc(0x4a76b,3,point,"Administrative Worker Benden",0,1,1)
		end

		local point1 = {"",1,100,21618,21580,1574}
		local point2 = {"",1,100,21988,21988,1600}
		local point3 = {"",1,100,9163,45694,3}	
		if Task_L_LongGetTo(0x4a76b,4,10401,3,point1,point2,point3) then
			local point = {"",1,100,9163,45694,3}	
			Task_L_Collection(0x4a76b,4,point)
		end

		local point = {"",1,100,8931,46880,4}
		Task_L_TalkToNpc(0x4a76b,5,point,"Administrative Worker Benden",0,1,2)

		if Task_L_GetTaskIsComplete(0x4a76b) then
			local point = {"",1,100,10448,48678,-12}
			Task_L_CompleteTask(0x4a76b ,6,point,"Sasha",-1)
		else
			local point = {"",1,100,10763,48313,-12}
			Task_L_TalkToNpc(0x4a76b,6,point,"Bastian",0,1,4)
		end

		local point = {"",1,100,10448,48678,-12}
		Task_L_TalkToNpc(0x4a76c,1,point,"Sasha",0,1,1)

		local point = {"",1,100,20467,21213,1602}
		Task_L_UseTransmitPoint(0x4a76c,2,"Municipal District",point)

		local point = {"",1,100,18757,16221,1028}
		Task_L_TalkToNpc(0x4a76c,2,point,"Regulator Intelligence Agent Wulf",0,1,1)
	
		local point1 = {"",1,100,18887,15794,1024}
		local point2 = {"",1,100,19548,15775,773}
		local point3 = {"",1,100,2497,72110,-446}
		if Task_L_LongGetTo(0x4a76c,3,10401,3,point1,point2,point3) then
			local point = {"",1,100,2497,72110,-446}
			Task_L_TalkToNpc(0x4a76c,3,point,"Hacker Siltero",0,1,1)	
		end

		local point = {"",1,100,639,72749,-115}	
		Task_L_Collection(0x4a76c,4,point)

		local point = {"",1,100,966,72183,-115}
		Task_L_TalkToNpc(0x4a76c,5,point,"Communicator",0,1,1)	

		local point = {"",1,100,1048,72297,-120}
		Task_L_AutoGetTo(0x4a76c,6,10401,point,0,0) 

		local point = {"",1,100,7084,34962,2}
		Task_L_TalkToNpc(0x4a76c,7,point,"Manager TSM MK II",0,1,1)	

		if Fun_IsHaveTask(0x4a76c,8) == 1 then 
			local point = {"",1,2000,7084,34962,2}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,100,20467,21213,1602}
				Task_L_UseTransmitPoint(0x4a76c,8,"Municipal District",point)
			end
		end

		local point1 = {"",1,100,21618,21580,1574}
		local point2 = {"",1,100,21988,21988,1600}
		local point3 = {"",1,100,10448,48678,-12}
		if Task_L_LongGetTo(0x4a76c,8,10401,3,point1,point2,point3) then
			local point = {"",1,100,10448,48678,-12}
			Task_L_Collection(0x4a76c,8,point)
		end


		local point = {"",1,100,10448,48678,-12}
		Task_L_UseTaskItem(0x4a76c,9,point)

		local point = {"",1,100,10448,48678,-12}
		Task_L_TalkToNpc(0x4a76c,10,point,"Sasha",0,1,7)

		if Task_L_GetTaskIsComplete(0x4a76c) then
			local point = {"",1,100,10448,48678,-12}
			Task_L_CompleteTask(0x4a76c ,11,point,"Sasha",-1)
		else
			local point = {"",1,100,10763,48313,-12}
			Task_L_TalkToNpc(0x4a76c,11,point,"Bastian",0,1,8)
		end

		local point = {"",1,100,20467,21213,1602}
		Task_L_UseTransmitPoint(0x4af39,1,"Municipal District",point)
		
		local point = {"",1,100,23811,13899,1549}
		Task_L_AutoGetTo(0x4af39,1,10401,point,0,0) 

		local point1 = {"",1,100,21618,21580,1574}
		local point2 = {"",1,100,21988,21988,1600}
		local point3 = {"",1,100,10758,48320,-12}
		if Task_L_LongGetTo(0x4b325,3,10401,3,point1,point2,point3) then
			local point = {"",1,100,10758,48320,-12}
			Task_L_CompleteTask(0x4b325 ,3,point,"Bastian",-1)
		end

		local point = {"",1,100,10448,48678,-12}
		Task_L_TalkToNpc(0x4a76d,1,point,"Sasha",0,1,2)

		--接受任务
		local point = {"Sasha",1,100,10448,48678,-12}
		Task_L_AcceptTask(0x4a76d,2,0x4a7d8,point)

		local point = {"",1,100,11074,50467,56}
		Task_L_TalkToNpc(0x4a7d8,1,point,"Assistant Inga",0,1,1)		
		
		local point = {"",1,100,10763,48313,-12}
		Task_L_TalkToNpc(0x4a76d,2,point,"Bastian",0,1,1)

		local point1 = {"Collect",0,100,10510,46431,-6}
		local point2 = {"Collect",1,100,10906,46434,-6}
		local point3 = {"Collect",2,100,10858,46956,-6}
		local point4 = {"Collect",3,100,10529,46971,-6}
		Task_L_BranchLine(0x4a76d,3,4,point1,point2,point3,point4)
		
		if Task_L_GetTaskIsComplete(0x4a76d) then
			local point = {"",1,100,10448,48678,-12}
			Task_L_CompleteTask(0x4a76d ,4,point,"Sasha",-1)
		else
			local point = {"",1,100,10763,48313,-12}
			Task_L_TalkToNpc(0x4a76d,4,point,"Bastian",0,1,2)
		end

		local point = {"",1,100,8927,32385,-308}
		if Fun_IsInPoint(point) == 1 then
			local point = {"",1,100,7522,36014,1}
			Task_L_TalkToNpc(0x4a7d8,2,point,"Assistant Audra",0,1,1)
		else
			if Fun_IsHaveTask(0x4a7d8,2) == 1 then
				local point = {"",1,100,8394,11405,818}
				Task_L_UseTransmitPoint(0x4b709,1,"Market District",point)

				--开传送阵
				local point = {"Industrial District",1,100,11110,18486,814}
				if Task_L_OpenTranMission(0x4b709,1,point) == 1 then
					local point1 = {"",1,100,11502,21681,871}
					local point2 = {"",1,100,11522,22136,871}
					local point3 = {"",1,100,7522,36014,1}
					if Task_L_LongGetTo(0x4a7d8,2,10401,3,point1,point2,point3) then
						local point = {"",1,100,7522,36014,1}
						Task_L_TalkToNpc(0x4a7d8,2,point,"Assistant Audra",0,1,1)
					end
				end
			end
		end

		--[[
		local point1 = {"",1,100,11502,21681,871}
		local point2 = {"",1,100,11522,22136,871}
		local point3 = {"",1,100,7522,36014,1}
		if Task_L_LongGetTo(0x4a7d8,3,10401,3,point1,point2,point3) then
		--接受任务
			local point = {"Assistant Audra",1,100,7522,36014,1}
			Task_L_AcceptTask(0x4a7d8,3,0x4a7d9,point)
		end
		--]]

		local point1 = {"",1,200,7646,35589,1}	
		local point2 = {"",1,100,8912,36630,1}		
		Task_L_CarryItem(0x4a7d8,3,0,point1,point2)

		local point = {"",1,100,7522,36014,1}
		Task_L_TalkToNpc(0x4a7d8,4,point,"Assistant Audra",0,1,2)

		local point1 = {"",0,100,9083,33001,-309} 
		local point2 = {"",0,100,8732,33035,-309} 
		Task_L_LoopCollectMore(0x4a7d9,1,0,2,point1,point2)

		local point1 = {"Collect",0,300,9002,35823,1}
		local point2 = {"Collect",1,300,9017,36191,1}
		local point3 = {"Collect",2,300,9023,36379,1}
		local point4 = {"Collect",3,300,9030,37116,1}
		Task_L_BranchLine(0x4a7d9,2,4,point1,point2,point3,point4)

		local point = {"",1,100,7522,36014,1}
		Task_L_UseTaskItem(0x4a7d9,3,point)

		if Task_L_GetTaskIsComplete(0x4a7d9) then
			local point = {"",1,100,7535,36038,1}
			Task_L_CompleteTask(0x4a7d9,3,point,"Assistant Audra",-1)
		end

		local point = {"",1,100,11110,18486,814}
		Task_L_UseTransmitPoint(0x4a7d8,5,"Industrial District",point)

		local point = {"",1,100,10256,20973,863}
		Task_L_TalkToNpc(0x4a7d8,5,point,"Special Equipment Crafter",0,1,1)

		if Task_L_GetTaskIsComplete(0x4a7d8) then
			local point = {"",1,100,4936,18811,266}
			Task_L_CompleteTask(0x4a7d8,5,point,"Factory Inspector Rodo",-1)
		end

		if Task_L_FindTask(0x4a7d8) == 0 then
			--下一个地图
			local point = {"",1,100,5291,13891,1540}
			Task_L_AutoGetTo(0x4b709,1,10401,point,0,0) 
		end

		if Task_L_GetTaskIsComplete(0x4a76e) then
			local point = {"",1,100,10448,48678,-12}
			Task_L_CompleteTask(0x4a76e ,2,point,"Sasha",-1)
		else
			local point1 = {"",1,100,21618,21580,1574}
			local point2 = {"",1,100,21988,21988,1600}
			local point3 = {"",1,100,10758,48320,-12}
			if Task_L_LongGetTo(0x4a76e,2,10401,3,point1,point2,point3) then
				local point = {"",1,100,10763,48313,-12}
				Task_L_TalkToNpc(0x4a76e,2,point,"Bastian",0,1,3)
			end
		end

		local point = {"",1,100,11110,18486,814}
		Task_L_UseTransmitPoint(0x2df1b9,1,"Industrial District",point)

		local point = {"",1,100,13875,24083,1561}
		Task_L_AutoGetTo(0x2df1b9,1,10401,point,0,0) 

		local point1 = {"",1,100,21618,21580,1574}
		local point2 = {"",1,100,21988,21988,1600}
		local point3 = {"",1,100,10758,48320,-12}
		if Task_L_LongGetTo(0x2df1bb,2,10401,3,point1,point2,point3) then

			local point = {"",1,100,10763,48313,-12}
			Task_L_CompleteTask(0x2df1bb ,2,point,"Bastian",-1)
		end

		if Task_L_GetTaskIsComplete(0x4a76f) then
			local point = {"",1,100,10763,48313,-12}
			Task_L_CompleteTask(0x4a76f ,1,point,"Bastian",-1)

			Task_L_AcceptGlobalTask(0x451fca)
		else
			local point = {"",1,100,10448,48678,-12}
			Task_L_TalkToNpc(0x4a76f,1,point,"Sasha",0,1,3)
		end

		if Task_L_FindTask(0x4a7cd) == 0 then
			local point = {"",1,100,8394,11405,818}
			Task_L_UseTransmitPoint(0x4a770,1,"Market District",point)

			--[[
			----------插入支线任务---------
			local point1 = {"",1,100,9468,12248,824}
			local point2 = {"",1,100,21768,35254,1}
			if Task_L_LongGetTo(0x4a770,1,10401,2,point1,point2) then
				--接受任务
				local point = {"Pazek",1,100,21768,35254,1}
				Task_L_AcceptTask(0x4a770,1,0x4a7cd,point)
			end
			--]]
		end

		local point1 = {"",1,100,9320,11886,820}
		local point2 = {"",1,100,9468,12248,824}
		local point3 = {"",1,100,21585,35184,1}
		if Task_L_LongGetTo(0x451fca,1,10401,3,point1,point2,point3) then
			local point = {"",1,100,21585,35184,1}
			Task_L_TalkToNpc(0x451fca,1,point,"Bird",0,1,1)
		end

		local point = {"",1,100,21585,35184,1}
		Task_L_CompleteTask(0x451fca,1,point,"Bird",-1)

		local point = {"",1,100,22565,35231,-53}
		Task_L_TalkToNpc(0x4a7cd,1,point,"Neria",0,1,6)

		local point = {"",1,100,22553,35172,-53}
		Task_L_UseMusic(0x4a7cd,2,"Song of Valor",point)

		local point = {"",1,100,22565,35231,-53}
		Task_L_TalkToNpc(0x4a7cd,3,point,"Neria",0,1,7)

		if Task_L_GetTaskIsComplete(0x4a7cd) then
			local point = {"",1,100,21768,35254,1}
			Task_L_CompleteTask(0x4a7cd,3,point,"Pazek",-1)
		end
		
		local point1 = {"",1,100,21253,34630,1}
		local point2 = {"",1,100,21251,34049,1}
		local point3 = {"",1,100,9503,11873,820}
		Task_L_LongGetTo(0x4a770,1,10401,3,point1,point2,point3)

		local point = {"",1,100,11647,11636,1033}
		Task_L_AutoGetTo(0x4a770,1,10401,point,0,0) 

		local point1 = {"",1,100,11614,11597,1033}
		local point2 = {"",1,100,11900,11900,1033}
		local point3 = {"",1,100,22056,69414,134}
		if Task_L_LongGetTo(0x4a770,2,10401,3,point1,point2,point3) then
			local point = {"",1,100,22056,69414,134}
			Task_L_TalkToNpc(0x4a770,2,point,"Telend the Watcher",0,1,1)
		end

		local point = {"",0,100,21927,69223,134}	
		Task_L_Collection(0x4a770,3,point)

		--[[
		local point = {"",1,100,17319,7141,1395}
		Task_L_UseTransmitPoint(0x4a770,4,"Business District",point)

		--接受任务
		local point = {"Mercenary Zeira",1,100,17663,4838,1026}
		Task_L_AcceptTask(0x4a770,4,0x4a7df,point)

		local point1 = {"",1,100,19851,6141,1287}
		local point2 = {"",1,100,31040,33679,56}
		if Task_L_LongGetTo(0x4a7df,1,10401,2,point1,point2) then
			local point = {"",1,100,31010,33683,56}
			Task_L_TalkToNpc(0x4a7df,1,point,"Stern Times Reporter Anteri",0,1,2)
		end

		if Task_L_GetTaskIsComplete(0x4a7df) then
			local point1 = {"",1,100,29190,33927,64}
			local point2 = {"",1,100,17663,4838,1026}
			if Task_L_LongGetTo(0x4a7df,1,10401,2,point1,point2) then
				local point = {"",1,100,17663,4838,1026}
				Task_L_CompleteTask(0x4a7df,1,point,"Mercenary Zeira",-1)
			end
		end
		--]]
		local point = {"",1,100,20467,21213,1602}
		Task_L_UseTransmitPoint(0x4a770,4,"Municipal District",point)

		local point1 = {"",1,100,21618,21580,1574}
		local point2 = {"",1,100,21988,21988,1600}
		local point3 = {"",1,100,10758,48320,-12}
		if Task_L_LongGetTo(0x4a770,4,10401,3,point1,point2,point3) then
			local point = {"",1,100,10763,48313,-12}
			Task_L_TalkToNpc(0x4a770,4,point,"Bastian",0,1,9)
		end

		local point = {"",1,100,10763,48313,-12}	
		Task_L_Collection(0x4a770,6,point)

		local point = {"",1,100,10763,48313,-12}
		Task_L_TalkToNpc(0x4a770,7,point,"Bastian",0,1,10)

		--使用传送阵
		--Task_L_UseTransmit(0x3d10d4,1,"Clockwork Square","Clockwork Square")

		Task_L_UseTransmit(0x3d10d4,1,"Lupen Port","Lupen Port")
	end
	---------------------------------------------------------------------------
	--第3张
	if Fun_IsInMapByMapId(10422) then
		GlobalFun(0)

		local point = {"",1,100,3660,9403,2189}
		Task_L_TalkToNpc(0x4af39,1,point,"Regulator Intelligence Agent Nina",0,1,1) 

		local point1 = {"",10,100,4760,8595,2412}
		local point2 = {"",1,100,9000,8593,1536}
		if Task_L_LongGetTo(0x4af39,2,10422,2,point1,point2) then
			local point1 = {"",0,800,9867,8342,1536}
			local point2 = {"",0,1200,10895,8111,1536}
			local point3 = {"",0,1200,9926,9846,1536}	
			Task_L_LoopAttackMonMore(0x4af39,2,0,3,point1,point2,point3)
		end

		local point1 = {"",10,100,13296,7589,1636}
		local point2 = {"",1,100,15400,7342,2244}
		if Task_L_LongGetTo(0x4af39,3,10422,2,point1,point2) then
			local point = {"",1,100,15400,7342,2244}
			Task_L_TalkToNpc(0x4af39,3,point,"Regulator Hans",0,1,1)
		end

		local point = {"",1,100,14463,7306,2246}
		Task_L_Collection(0x4af39,4,point)

		if Task_L_GetTaskIsComplete(0x4af39) then
			local point = {"",1,100,15400,7342,2244}
			Task_L_CompleteTask(0x4af39 ,5,point,"Regulator Hans",-1)
		else
			local point = {"",1,100,16385,4340,2249}
			Task_L_Collection(0x4af39,5,point)
		end
		
		local point = {"",1,100,15400,7342,2244}
		Task_L_TalkToNpc(0x4af3a,1,point,"Regulator Hans",0,1,2)

		--接受任务
		local point = {"Researcher Belkin",1,100,14844,6870,2243}
		--Task_L_AcceptTask(0x4af3a,2,0x4af9d,point)

		local point1 = {"",10,100,13699,7144,2338}
		local point2 = {"",1,100,11908,9798,1536}
		if Task_L_LongGetTo(0x4af9d,1,10422,2,point1,point2) then
			local point = {"",1,300,11908,9798,1536}
			Task_L_Collection(0x4af9d,1,point)
		end

		local point = {"",1,300,11406,12702,1664}
		Task_L_Collection(0x4af9d,2,point)

		local point = {"",1,300,11531,16809,1920}
		Task_L_Collection(0x4af9d,3,point)

		local point1 = {"",10,100,13699,7144,2338}
		local point2 = {"",1,100,13482,18318,1922}
		if Task_L_LongGetTo(0x4af3a,2,10422,2,point1,point2) then
			--开传送阵  这个传送阵名字重复 无法开启
			--local point = {"警備所",1,100,11552,13152,1693}
			--Task_L_OpenTranMission(0x4af3a,2,point)	
			local point = {"",1,100,13482,18318,1922}
			Task_L_TalkToNpc(0x4af3a,2,point,"Chief Zaira",0,1,2)
		end

		local point = {"",0,1500,2669,9259,2189}
		if Fun_IsInPoint(point) == 1 then
			if Task_L_FindTask(0x4af3a) == 1 then
				local point1 = {"",10,100,4760,8595,2412}
				local point2 = {"",1,100,9000,8593,1536}
				Task_L_LongGetTo(0x4af3a,1,10422,2,point1,point2)

				local point1 = {"",10,100,4760,8595,2412}
				local point2 = {"",1,100,9000,8593,1536}
				Task_L_LongGetTo(0x4af3a,2,10422,2,point1,point2)

				local point1 = {"",10,100,4760,8595,2412}
				local point2 = {"",1,100,9000,8593,1536}
				Task_L_LongGetTo(0x4af3a,3,10422,2,point1,point2)

				local point1 = {"",10,100,4760,8595,2412}
				local point2 = {"",1,100,9000,8593,1536}
				Task_L_LongGetTo(0x4af3a,4,10422,2,point1,point2)

				local point1 = {"",10,100,4760,8595,2412}
				local point2 = {"",1,100,9000,8593,1536}
				Task_L_LongGetTo(0x4af3a,5,10422,2,point1,point2)
			end
		end

		local point = {"",1,100,13479,18303,1922}
		Task_L_CompleteTask(0x4af9d ,3,point,"Chief Zaira",-1)

		local point1 = {"",1,200,11204,18633,1920}	
		local point2 = {"",1,100,13828,18570,1931}		
		Task_L_CarryItem(0x4af3a,3,0,point1,point2)
		
		local point = {"",1,100,13996,18519,1921}
		Task_L_Collection(0x4af3a,4,point)

		local point1 = {"Collect",2,100,13195,18810,1923}
		local point2 = {"Collect",1,100,13195,19170,1923}
		local point3 = {"Collect",0,100,13408,19268,1925}
		Task_L_BranchLine(0x4af3a,5,3,point1,point2,point3)
		
		if Task_L_GetTaskIsComplete(0x4af3a) then
			local point = {"",1,100,13482,18318,1922}
			Task_L_CompleteTask(0x4af3a ,6,point,"Chief Zaira",-1)
		else
			local point = {"",1,100,13723,18017,1930}
			Task_L_Collection(0x4af3a,6,point)
		end

		if Fun_IsHaveTask(0x4af3b,1) == 1 then 
			--接受任务
			local point = {"Mercenary Meijer",1,100,12809,12608,1664}
			Task_L_AcceptTask(0x4af3b,1,0x4af9f,point)

			local point1 = {"",0,800,11099,10003,1536}
			local point2 = {"",0,800,12771,8868,1536}
			local point3 = {"",0,800,10912,8065,1536}
			local point4 = {"",0,800,9674,8396,1536}		
			Task_L_LoopAttackMonMore(0x4af9f,1,0,4,point1,point2,point3,point4)

			
			local point1 = {"",10,100,13296,7589,1636}
			local point2 = {"",1,100,15400,7342,2244}
			if Task_L_LongGetTo(0x4af3b,1,10422,2,point1,point2) then
				local point = {"",1,100,15400,7342,2244}
				Task_L_TalkToNpc(0x4af3b,1,point,"Regulator Hans",0,1,3)
			end
		end

		if Fun_IsHaveTask(0x4af3b,2) == 1 then 
			local point = {"",1,100,14797,6870,2243}
			Task_L_CompleteTask(0x4af9f ,1,point,"Researcher Belkin",-1)
		end

		local point = {"",1,100,16560,5882,2407}                                    
		Task_L_TalkToNpc(0x4af3b,2,point,"Regulator Ernst",0,1,2)

		---------------------
		if Fun_IsHaveTask(0x4af3b,3) == 1 then
			Fun_SetBackHomeInfo(80, 20,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point1 = {"",10,100,20551,5768,1611}
				local point2 = {"",10,100,13699,7144,2338}
				local point3 = {"",1,100,12294,12771,1664}
				if Task_L_LongGetTo(0x4af3b,3,10422,3,point1,point2,point3) then
					Task_L_LoopEquipFun()
					local point = {"Keller",1,100,13409,13287,1664}
					Task_L_BuyItem(0x4af3b,3,80,4,"Expert Healing Potion",point)
					Task_L_PushDwonDrug(0x4af3b,3,"Expert Healing Potion")
					local BackHomeInfo = 
					{
						0, --1比较小地图
						"Scraplands", --大地图
						"Scraplands", --小地图
						"Guard Post1", --传送阵
						{ 12516,12255,1664 }, --修理NPC坐标
						{ 13409,13287,1664 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				--进入剧情副本 10432
				local point1 = {"",10,100,13296,7589,1636}
				local point2 = {"",10,100,17037,5843,2398}
				local point3 = {"",1,100,20627,5949,1611}
				if Task_L_LongGetTo(0x4af3b,3,10422,3,point1,point2,point3) then
					local point = {"",1,100,20777,5795,1611}
					Task_L_AutoGetTo(0x4af3b,3,10422,point,1,0x28C0) 
					Fun_Sleep(10000)
				end
			end
		end


		if Task_L_FindTask(0x4b0c9) == 0 then

			local point = {"",1,100,24996,6798,1545}
			Task_L_TalkToNpc(0x4afa2,1,point,"Regulator Bruch",0,1,1)
			
			local point = {"New Researcher",0,100,24252,4090,1551}		
			Task_L_AcctackNpc(0x4afa2,2,point)

			local point = {"",1,100,24989,6820,1545}
			Task_L_UseTaskItem(0x4afa2,3,point)
			
			if Task_L_GetTaskIsComplete(0x4afa2) then
				local point = {"",1,100,24989,6820,1545}
				Task_L_CompleteTask(0x4afa2,3,point,"Regulator Bruch",-1)
			end
			
			if Task_L_GetTaskIsComplete(0x4af3b) then
				local point1 = {"",10,100,20551,5768,1611}
				local point2 = {"",1,100,15400,7342,2244}
				if Task_L_LongGetTo(0x4af3b,4,10422,2,point1,point2) then
					local point = {"",1,100,15400,7342,2244}
					Task_L_CompleteTask(0x4af3b ,4,point,"Regulator Hans",-1)

				end
			else
				
				local point1 = {"",10,100,17037,5843,2398}
				local point2 = {"",1,100,20627,5949,1611}
				if Task_L_LongGetTo(0x4af3b,4,10422,2,point1,point2) then

					local point = {"",1,100,25044,6797,1545}
					Task_L_TalkToNpc(0x4af3b,4,point,"Regulator Bruch",0,1,2)  

					--接受任务
					local point = {"Power Core Chief Hauser",0,100,25169,6951,1548}
					Task_L_AcceptTask(0x4af3b,4,0x4afa2,point)--这个任务有10金币
				end
			end
		end

		local point1 = {"",10,100,13699,7144,2338}
		local point2 = {"",1,100,12575,8166,1536}	
		local point3 = {"",1,100,12964,12112,1664}
		if Task_L_LongGetTo(0x4af3c,1,10422,3,point1,point2,point3) then

			--接受任务
			local point = {"Regulator Kariza",0,100,12675,12167,1664}
			Task_L_AcceptTask(0x4af3c,1,0x4afa3,point)--这个任务没有金币	

			local point = {"",1,100,12964,12112,1664}
			Task_L_TalkToNpc(0x4af3c,1,point,"Regulator Ernst",0,1,1)
		end

		local point = {"",1,100,12675,12167,1664}
		Task_L_TalkToNpc(0x4afa3,1,point,"Regulator Kariza",0,1,1)

		local point1 = {"",0,800,22757,14642,1536}
		local point2 = {"",0,800,23216,15793,1536}
		Task_L_LoopAttackMonMore(0x4afa3,2,0,2,point1,point2)

		local point = {"",1,100,23556,18475,1535}
		Task_L_AutoGetTo(0x4af3c,2,10422,point,0,0) 

		if Task_L_GetTaskIsComplete(0x4afa3) then
			local point = {"",1,100,23417,18254,1536}
			Task_L_CompleteTask(0x4afa3 ,2,point,"Tamarra",-1)	
		end

		local point = {"",1,100,23556,18475,1535}
		Task_L_TalkToNpc(0x4af3c,3,point,"Alix",0,1,1)

		if Fun_IsHaveTask(0x4af3c,4) == 1 then
			local point = {"",0,3000,1944,9120,2306}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,4760,8595,2412}
				local point2 = {"",1,100,11861,9888,1536}
				local point3 = {"",1,100,19027,12934,1536}
				Task_L_LongGetTo(0x4af3c,4,10422,3,point1,point2,point3)
			else
				--开传送阵
				local point = {"Airship Crash Site",1,100,24368,18525,1578}
				if Task_L_OpenTranMission(0x4af3c,4,point) == 1 then
					local point1 = {"",0,300,24064,17605,1536}
					local point2 = {"",0,300,24139,17047,1536}
					local point3 = {"",0,300,23148,17416,1536}
					local point4 = {"",0,300,23022,16492,1536}
					local point5 = {"",0,300,23990,15603,1536}	
					Task_L_LoopCollectMore(0x4af3c,4,0,5,point1,point2,point3,point4,point5)
				end
			end
		end
		
		local point1 = {"",0,500,21365,15843,1536}
		local point2 = {"",0,500,19290,15615,1536}
		local point3 = {"",0,500,18470,15630,1536}
		local point4 = {"",0,500,18504,14238,1536}
		local point5 = {"",0,500,19231,12575,1536}	
		Task_L_LoopCollectMore(0x4af3c,5,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,300,23475,18305,1535}
		Task_L_TalkToNpc(0x4af3c,6,point,"Tamarra",0,1,1)

		local point = {"",1,100,23556,18475,1535}
		Task_L_TalkToNpc(0x4af3c,7,point,"Alix",0,1,2)

		if Task_L_GetTaskIsComplete(0x4af3c) then
			local point = {"",1,100,23556,18475,1535}
			Task_L_CompleteTask(0x4af3c ,8,point,"Alix",-1)
		else
			local point = {"",1,300,23302,18460,1535}
			Task_L_TalkToNpc(0x4af3c,8,point,"Communicator",0,1,1)
		end

		--接受任务  这个任务需要去炸石头
		--local point = {"Tamarra",0,100,23475,18305,1535}
		--Task_L_AcceptTask(0x4b321,1,0x4afa4,point)

		local point1 = {"",0,800,21328,17851,1536}
		local point2 = {"",0,800,18760,17749,1536}
		Task_L_LoopCollectMore(0x4b12d,1,0,2,point1,point2)--触发性区域任务

		--if Task_L_FindTask(0x4afa4) == 0 then
			local point = {"",1,100,29230,13809,1536}
			Task_L_AutoGetTo(0x4b321,1,10422,point,0,0) 
		--end

		local point = {"",1,100,29230,13809,1536}
		Task_L_LongGetTo(0x4b321,3,10422,1,point)
	end
	---------------------------------------------------------------------------
	--第4张
	if Fun_IsInMapByMapId(10423) then

		GlobalFun(0)

		local point = {"",1,300,-27127,14050,2560}
		Task_L_TalkToNpc(0x4b321,1,point,"Lab Director Yulia",0,1,1)

		--进入剧情副本 10433
		local point = {"",1,100,-22701,10579,3080}
		Task_L_TalkToNpc(0x4b321,2,point,"Krause",0,1,1)

		--新加修理
		if Fun_IsHaveTask(0x4b321,3) == 1 then
			if Task_L_GetTaskIsComplete(0x4b321) then
			else
				Fun_SetBackHomeInfo(80, 20,0,0)
				if Fun_IsNeedBackHome() == 1 then
					local point = {"",1,3000,-22550,6533,581}
					if Fun_IsInPoint(point) == 0 then
						local point = {"",1,100,-22550,6533,581}
						Task_L_UseTransmitPoint(0x4b321,3,"Lupen Port",point)
					end
				end
			end
		end

		if Task_L_GetTaskIsComplete(0x4b321) then
			--接受任务
			local point = {"Research Chief Dare",0,100,-16231,8393,3087}
			Task_L_AcceptTask(0x4b321,3,0x4b385,point)

			local point1 = {"",1,200,-15935,8349,3090}	
			local point2 = {"",1,100,-16035,12199,3072}		
			Task_L_CarryItem(0x4b385,1,0,point1,point2)

			if Task_L_GetTaskIsComplete(0x4b385) then
				local point = {"",1,300,-16002,12152,3070}
				Task_L_CompleteTask(0x4b385 ,1,point,"Researcher Raien",-1)
			end

			local point = {"",1,300,-16060,14165,3340}
			Task_L_CompleteTask(0x4b321 ,3,point,"Lab Director Yulia",-1)
		else
			--纠错 10433
			local point = {"",1,100,-22865,10446,3079}
			if Task_L_LongGetTo(0x4b321,3,10423,1,point) then
				local point = {"",1,100,-22367,10420,3079}
				Task_L_AutoGetTo(0x4b321,3,10423,point,1,0x28C1) 
			end
		end
		--开传送阵
		local point = {"Nebelhorn Lab",1,100,-18082,14944,3534}
		if Task_L_OpenTranMission(0x4b322,1,point) == 1	then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Klein",1,300, -15580,14389,3342}
			Task_L_BuyItem(0x4b322,1,50,4,"Expert Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 20,0,0)
			--修理
			if Fun_IsHaveTask(0x4b322,1) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Nebelhorn", --大地图
						"Nebelhorn Lab", --小地图
						"Nebelhorn Lab", --传送阵
						{ -17868,13537,3337 }, --修理NPC坐标
						{  -15580,14389,3342 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,-16703,14919,3462}
			Task_L_TalkToNpc(0x4b322,1,point,"Communicator",0,1,1)
		end

		local point = {"",1,500,-16051,14165,3340}
		Task_L_TalkToNpc(0x4b322,2,point,"Lab Director Yulia",0,1,2)

		local point1 = {"",10,100,-9138,19433,3936}
		local point2 = {"",1,100,-7669,19959,1550}
		if Task_L_LongGetTo(0x4b322,3,10423,2,point1,point2) then

			local point1 = {"",0,800,-7006,21252,1550}
			local point2 = {"",0,800,-6139,22075,1515}
			local point3 = {"",0,800,-5142,21910,1550}
			Task_L_LoopCollectMore(0x4b322,3,0,3,point1,point2,point3)
		end

		local point1 = {"",1,100,-13232,16685,3938}
		local point2 = {"",10,100,-9138,19433,3936}
		local point3 = {"",1,100,-7669,19959,1550}
		if Task_L_LongGetTo(0x4b322,4,10423,3,point1,point2,point3) then
			--开传送阵
			local point = {"Oasis",1,100,-4643,15220,2087}
			if Task_L_OpenTranMission(0x4b322,4,point) == 1 then
				local point = {"",1,100,-3041,26428,1515}
				if Task_L_LongGetTo(0x4b322,4,10423,1,point) then

					local point1 = {"",0,800,-2360,25929,1515}
					local point2 = {"",0,800,-3689,26257,1550}
					local point3 = {"",0,1200, -3679,27565,1550}
					Task_L_LoopAttackMonMore(0x4b518,1,0,3,point1,point2,point3)
				
					local point = {"",1,100,-9310,24981,1536}
					Task_L_TalkToNpc(0x4b322,4,point,"Researcher Mannah",0,1,1)	
				end
			end
		end

		local point = {"",1,100,-9310,24981,1536}
		Task_L_TalkToNpc(0x4b323,1,point,"Researcher Mannah",0,1,2)	

		local point = {"",1,100,-20661,26678,1535}
		Task_L_AutoGetTo(0x4b323,2,10423,point,0,0) 

		local point = {"",1,3000,-18082,15037,3534}
		if Fun_IsInPoint(point) == 1 then
			local point1 = {"",10,100,-20099,20079,2866}
			local point2 = {"",1,100,-22027,22374,1761}
			Task_L_LongGetTo(0x4b323,3,10423,2,point1,point2)
		else
			local point1 = {"",0,800,-21900,26628,1536}
			local point2 = {"",0,800,-21651,25727,1536}
			local point3 = {"",0,800,-23149,26495,1536}
			local point4 = {"",0,800,-22752,27694,1536}
			Task_L_LoopAttackMonMore(0x4b323,3,0,4,point1,point2,point3,point4)
		end
		
		local point = {"",1,100,-22018,23129,1532}
		Task_L_AutoGetTo(0x4b323,4,10423,point,0,0)

		local point = {"",1,100,-21414,22142,1769}
		Task_L_TalkToNpc(0x4b323,5,point,"Chief Safi",0,1,1)

		local point = {"",1,100,-18082,14944,3534}
		Task_L_UseTransmitPoint(0x4b323,6,"Nebelhorn Lab",point)

		local point = {"",1,300,-16051,14165,3340}
		Task_L_TalkToNpc(0x4b323,6,point,"Lab Director Yulia",0,1,3)

		local point = {"",1,300,-16051,14165,3340}
		Task_L_TalkToNpc(0x4b324,1,point,"Lab Director Yulia",0,1,4)

		local point = {"",1,100,-19386,17765,2882}
		Task_L_AutoGetTo(0x4b324,2,10423,point,0,0)
		

		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80, 20,0,0)
		--修理
		if Fun_IsHaveTask(0x4b325,1) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,100,-18082,14944,3534}
				if Task_L_UseTransmitPoint(0x4b325,1,"Nebelhorn Lab",point) then
					local point = {"Klein",1,300, -15580,14389,3342}
					Task_L_BuyItem(0x4b325,1,100,4,"Expert Healing Potion",point)
		
					--放药到F1
					Task_L_PushDwonDrug(0x4b325,1,"Expert Healing Potion")
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Nebelhorn", --大地图
						"Nebelhorn Lab", --小地图
						"Nebelhorn Lab", --传送阵
						{ -17868,13537,3337 }, --修理NPC坐标
						{  -15580,14389,3342 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				--进入团队副本  10491  克拉提尔的心脏 这个需要仔细测试
				local point1 = {"",10,100,-19002,17798,3041}
				local point2 = {"",1,100,-16803,17752,6544}
				if Task_L_LongGetTo(0x4b325,1,10423,2,point1,point2) then
					local point = {"",1,100,-15895,17770,6553}
					Task_L_AutoGetTo(0x4b325,1,10423,point,3,0x28FB) 
				end
			end
		end


		

		local point = {"",1,100,-18082,14944,3534}
		Task_L_UseTransmitPoint(0x4b325,2,"Nebelhorn Lab",point)

		local point = {"",1,300,-16051,14165,3340}
		Task_L_TalkToNpc(0x4b325,2,point,"Lab Director Yulia",0,1,5)


		if Task_L_GetTaskIsComplete(0x4b325) then
			--使用传送阵
			Task_L_UseTransmit(0x4b325,3,"Municipal District","Municipal District")
		else
			local point = {"",1,100,-16277,14202,3340}
			Task_L_TalkToNpc(0x4b325,3,point,"Sasha",0,1,1)
		end


	end
	---------------------------------------------------------------------------
	--第5张
	if Fun_IsInMapByMapId(10424) then
		GlobalFun(0)

		local point = {"",1,100,24214,9434,-0}
		Task_L_TalkToNpc(0x4b709,1,point,"Regulator Deyan",0,1,1)

		local point1 = {"",0,1000,19102,10376,-9}
		local point2 = {"",0,1000,18988,9359,-9}
		Task_L_LoopAttackMonMore(0x4b709,2,0,2,point1,point2)

		if Task_L_GetTaskIsComplete(0x4b709) then
			local point = {"",1,100,14807,7611,-275}
			Task_L_CompleteTask(0x4b709 ,3,point,"Regulator Intelligence Agent Heyden",-1)
		else
			local point1 = {"",2,100,18998,8232,-9}
			local point2 = {"",1,100,18781,6047,11}
			if Task_L_LongGetTo(0x4b709,3,10424,1,point1,point2) then
				local point = {"",1,300,18830,6150,11}
				Task_L_Collection(0x4b709,3,point)
			end
		end

		--开传送阵
		local point = {"Junkyard",1,100,14716,6850,-241}
		if Task_L_OpenTranMission(0x4b70a,1,point) == 1 then
			local point = {"",1,100,14038,8097,-275}
			Task_L_Collection(0x4b70a,1,point)
		end
		
		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Rennell",1,100, 14494,8208,-267}
		Task_L_BuyItem(0x4b70a,2,50,4,"Expert Healing Potion",point)

		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80, 20,0,0)
		--修理
		if Fun_IsHaveTask(0x4b70a,2) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Windbringer Hills", --大地图
					"Waste Facility", --小地图
					"Junkyard", --传送阵
					{ 14029,8331,-275 }, --修理NPC坐标
					{  14494,8208,-267 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end
		
		--进入剧情副本  10434
		local point = {"",1,300,14807,7611,-275}
		Task_L_TalkToNpc(0x4b70a,2,point,"Regulator Intelligence Agent Heyden",0,1,1)

		if Task_L_GetTaskIsComplete(0x4b70a) then
			local point = {"",1,100,14807,7611,-275}
			Task_L_CompleteTask(0x4b70a ,3,point,"Regulator Intelligence Agent Heyden",-1)
		else
			--进入剧情副本  10434
			local point = {"",1,100,14950,7277,-283}
			if Task_L_LongGetTo(0x4b70a,3,10424,1,point) then
				local point = {"",1,100,15356,7244,-283}
				Task_L_AutoGetTo(0x4b70a,3,10424,point,1,0x28C2) 
			end
		end
		
		if Task_L_GetTaskIsComplete(0x4b70b) then
			local point1 = {"",10,100,15954,12221,-537}
			local point2 = {"",1,100,17188,13843,341}
			if Task_L_LongGetTo(0x4b70b,1,10424,2,point1,point2) then
				local point = {"",1,100,16463,19139,3}
				Task_L_CompleteTask(0x4b70b ,1,point,"Regulator Verner",-1)

				--接受任务
				--local point = {"Mercenary Leavre",0,100,16019,18578,2}
				--Task_L_AcceptTask(0x4b70b,1,0x4b76f,point)
			end
		else
			local point = {"",1,700,14275,13272,-640}
			Task_L_Collection(0x4b70b,1,point)

			local point1 = {"",0,800,14255,10302,-635}
			local point2 = {"",0,800,14739,11488,-635}
			Task_L_LoopAttackMonMore(0x4b8ff,1,0,2,point1,point2)
		end

		--接受任务
		local point = {"Mercenary Leavre",0,100,16000,18513,-0}
		--Task_L_AcceptTask(0x2dedd1,1,0x4b771,point)		

		--接受任务
		local point = {"Mercenary Yona",0,100,7658,20436,-0}
		--Task_L_AcceptTask(0x2dedd1,1,0x4b772,point)	

		local point1 = {"",0,900,6098,20445,-1}
		local point2 = {"",0,900,6007,19464,-0}
		Task_L_LoopAttackMonMore(0x4b772,1,0,2,point1,point2)
		
		--要用药水丢怪
		local point1 = {"Desert Ant",1,600,6634,22422,-0}
		local point2 = {"Desert Ant",1,600,5768,23666,-0}	
		Task_L_LoopUseTaskItemForMon(0x4b771,1,0,2,point1,point2)

		--要用药水丢怪
		local point1 = {"Desert Ant",1,600,6634,22422,-0}
		local point2 = {"Desert Ant",1,600,5768,23666,-0}	
		Task_L_LoopUseTaskItemForMon(0x4b771,2,0,2,point1,point2)	

		if Task_L_GetTaskIsComplete(0x4b771) then
			local point = {"",1,300,7754,20473,-0}
			Task_L_CompleteTask(0x4b771,1,point,"Mercenary Yona",-1)
		end

		if Task_L_GetTaskIsComplete(0x4b772) then
			local point = {"",1,300,7754,20473,-0}
			Task_L_CompleteTask(0x4b772,1,point,"Mercenary Yona",-1)
		end

		local point = {"",1,100,12593,24820,-0}
		Task_L_AutoGetTo(0x2dedd1,1,10424,point,0,0) 
		
	end
	---------------------------------------------------------------------------
	--第6张
	if Fun_IsInMapByMapId(10425) then
		GlobalFun(0)

		local point = {"Totrich Resident",1,100,14230,10396,2}  
		Task_L_BranchTalkToNpc(0x2dedd1,2,0,point)

		local point = {"Totrich Resident",1,100,11427,11892,0}  
		Task_L_BranchTalkToNpc(0x2dedd1,2,1,point)

		local point = {"Totrich Resident",1,100,11101,8807,-0}  
		Task_L_BranchTalkToNpc(0x2dedd1,2,2,point)

		--开传送阵
		local point = {"Clockwork Square",1,100,9680,8525,44}
		if Task_L_OpenTranMission(0x2dedd1,3,point) == 1 then
			local point = {"",1,100,13563,9094,169}
			Task_L_Collection(0x2dedd1,3,point)
		end 

		local point = {"",1,100,15114,11725,18}
		Task_L_Collection(0x2dedd1,4,point)

		local point = {"",1,100,10964,12943,-0}
		Task_L_Collection(0x2dedd1,5,point)

		local point = {"",1,100,10247,8783,-0}
		Task_L_Collection(0x2dedd1,6,point)

		local point1 = {"",0,1000,10971,4166,-0}
		local point2 = {"",0,1000,9256,4727,-0}
		local point3 = {"",0,1000,8670,3344,-0}
		Task_L_LoopAttackMonMore(0x2dedd1,7,0,3,point1,point2,point3)

		local point = {"",1,100,12501,10341,101}
		Task_L_TalkToNpc(0x2dedd1,8,point,"Instigating Villager",0,1,1)

		local point = {"",1,100,12501,10341,101}
		Task_L_Collection(0x2dedd1,9,point)

		local point = {"",1,100,12950,9519,101}
		Task_L_TalkToNpc(0x2dedd1,10,point,"Instigating Villager",0,1,1)

		if Task_L_GetTaskIsComplete(0x2dedd1) then
			local point1 = {"",1,100,13381,9205,169}
			local point2 = {"",1,100,13684,9275,169}
			local point3 = {"",1,100,10140,40686,32}
			if Task_L_LongGetTo(0x2dedd1,11,10425,3,point1,point2,point3) then
				if Task_L_GetTaskIsComplete(0x4b773) then
					local point = {"",1,100,10140,40686,32}
					Task_L_CompleteTask(0x4b773,1,point,"Tavern Master",-1)
				end
				local point = {"",1,100,10716,41467,133}
				Task_L_CompleteTask(0x2dedd1 ,11,point,"Techel",-1)
			end
		else
			local point = {"",1,100,12950,9519,101}
			Task_L_Collection(0x2dedd1,11,point)
		end

		local point = {"",1,100,10716,41467,133}
		Task_L_TalkToNpc(0x2dedd2,1,point,"Techel",0,1,1)

		if Task_L_GetTaskIsComplete(0x2dedd2) then
			local point = {"",1,100,4175,3400,-0}
			Task_L_CompleteTask(0x2dedd2 ,2,point,"Regulator Intelligence Agent Yaruz",-1)
		else
			local point1 = {"",1,100,10258,41133,31}
			local point2 = {"",1,100,9925,41214,31}
			local point3 = {"",1,100,9696,8164,-0}
			if Task_L_LongGetTo(0x2dedd2,2,10425,3,point1,point2,point3) then

				local point1 = {"",0,500,7937,7666,-0}
				local point2 = {"",0,500,9119,6775,29}
				local point3 = {"",0,500,7982,5855,-0}
				local point4 = {"",0,500,7643,5298,-0}
				Task_L_LoopCollectMore(0x2dedd2,2,0,4,point1,point2,point3,point4)

				local point1 = {"",0,500,8897,7906,-0}
				local point2 = {"",0,500,8239,7207,-0}
				local point3 = {"",0,500,7546,6166,-0}
				Task_L_LoopAttackMonMore(0x2dedd2,2,1,3,point1,point2,point3)	
			end
		end

		local point = {"",1,100,3567,4997,-1024}
		Task_L_TalkToNpc(0x2dedd3,1,point,"Regulator Guard Nix",0,1,1)

		if Task_L_GetTaskIsComplete(0x2dedd3) then
			local point = {"",1,100,3567,4997,-1024}
			Task_L_CompleteTask(0x2dedd3 ,2,point,"Regulator Guard Nix",-1)
		else
			Fun_SetBackHomeInfo(80, 20,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,1500,3578,4825,-1024}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,9680,8525,44}
					Task_L_UseTransmitPoint(0x2dedd3,2,"Clockwork Square",point)
				else
					local point = {"Jane",1,300, 11886,11073,-0}
					Task_L_BuyItem(0x2dedd3,2,100,4,"Expert Healing Potion",point)
					Task_L_PushDwonDrug(0x2dedd3,2,"Expert Healing Potion")
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Totrich", --大地图
						"Totrich", --小地图
						"Clockwork Square", --传送阵
						{ 8747,13189,-0 }, --修理NPC坐标
						{ 11886,11073,-0 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,1500,3578,4825,-1024}
				if Fun_IsInPoint(point) == 0 then
					local point = {"",1,100,9680,8525,44}
					Task_L_UseTransmitPoint(0x2dedd3,2,"Clockwork Square",point)
				end

				--进入副本  10462
				local point = {"",1,100,3578,4825,-1024}
				if Task_L_LongGetTo(0x2dedd3,2,10425,1,point) then
					local point = {"",1,100,4137,4773,-1024}
					Task_L_AutoGetTo(0x2dedd3,2,10425,point,2,0x28DE) 
				end
			end
		end

		if Task_L_FindTask(0x2dee35) == 0 then
			--使用传送阵
			Task_L_UseTransmit(0x4a76e,1,"Municipal District","Municipal District")
		end
		
		--[[
		if Task_L_FindTask(0x2dee35) == 0 and Task_L_FindTask(0x2dee36) == 0 then
			local point1 = {"",1,100,13381,9205,169}
			local point2 = {"",1,100,13684,9275,169}
			local point3 = {"",1,100,10210,40674,32}
			if Task_L_LongGetTo(0x3d10d4,1,10425,3,point1,point2,point3) then
				--接受任务
				local point = {"Tavern Master",1,100,10210,40674,32}
				Task_L_AcceptTask(0x3d10d4,1,0x2dee35,point)
			end
		end
		--]]
		local point1 = {"",1,100,10258,41133,31}
		local point2 = {"",1,100,9925,41214,31}
		local point3 = {"",1,100,6585,10200,0}
		local point4 = {"",1,100,6894,10312,0}
		local point5 = {"",1,100,7962,41758,32}	
		if Task_L_LongGetTo(0x2dee35,1,10425,5,point1,point2,point3,point4,point5) then
			local point = {"",1,100,7962,41758,32}	
			Task_L_TalkToNpc(0x2dee35,2,point,"Viltri",0,1,1)
		end

		local point1 = {"",1,100,10258,41133,31}
		local point2 = {"",1,100,9925,41214,31}
		local point3 = {"",1,100,6585,10200,0}
		local point4 = {"",1,100,6894,10312,0}
		local point5 = {"",1,100,7962,41758,32}	
		if Task_L_LongGetTo(0x2dee35,2,10425,5,point1,point2,point3,point4,point5) then
			local point = {"",1,100,7962,41758,32}	
			Task_L_TalkToNpc(0x2dee35,2,point,"Viltri",0,1,1)
		end

		local point = {"",1,100,8167,41411,32}	
		Task_L_TalkToNpc(0x2dee35,3,point,"Ruri",0,1,1)

		local point = {"",1,100,8167,41411,32}	
		Task_L_UseExpression(0x2dee35,4,"Encourage",point) 

		local point = {"",1,100,8230,41557,32}	
		Task_L_TalkToNpc(0x2dee35,5,point,"Heben",0,1,1)

		local point = {"",1,100,8230,41557,32}	
		Task_L_UseExpression(0x2dee35,6,"Surrender",point) 
	
		local point = {"",1,100,8134,42014,113}	
		Task_L_TalkToNpc(0x2dee35,7,point,"Rene",0,1,1)

		local point = {"",1,100,8134,42014,113}	
		Task_L_UseTaskItem(0x2dee35,8,point)

		local point = {"",1,100,8134,42014,113}	
		Task_L_UseExpression(0x2dee35,9,"Deny",point) 

		local point = {"",1,100,8134,42014,113}	
		Task_L_TalkToNpc(0x2dee35,10,point,"Rene",0,1,2)

		local point1 = {"",1,100,6585,10200,0}
		local point2 = {"",1,100,6894,10312,0}
		local point3 = {"",1,100,7596,42133,32}	
		if Task_L_LongGetTo(0x2dee35,11,10425,3,point1,point2,point3) then
			local point = {"",1,100,7596,42133,32}
			Task_L_TalkToNpc(0x2dee35,11,point,"Schuban",0,1,1)
		end

		local point1 = {"",1,100,6585,10200,0}
		local point2 = {"",1,100,6894,10312,0}
		local point3 = {"",1,100,7596,42133,32}	
		if Task_L_LongGetTo(0x2dee35,12,10425,3,point1,point2,point3) then
			local point = {"",1,100,7596,42133,32}	
			Task_L_UseExpression(0x2dee35,12,"Encourage",point) 
		end

		local point1 = {"",1,100,6585,10200,0}
		local point2 = {"",1,100,6894,10312,0}
		local point3 = {"",1,100,7596,42133,32}	
		if Task_L_LongGetTo(0x2dee35,13,10425,3,point1,point2,point3) then
			local point = {"",1,100,7596,42133,32}		
			Task_L_TalkToNpc(0x2dee35,13,point,"Schuban",0,1,2)
		end

		if Task_L_GetTaskIsComplete(0x2dee35) then
			local point = {"",1,100,7962,41758,32}
			Task_L_CompleteTask(0x2dee35,13,point,"Viltri",-1)

			--使用传送阵
			Task_L_UseTransmit(0x3d10d4,1,"Lupen Port","Lupen Port")
			--接受任务
			local point = {"Viltri",1,100,7962,41758,32}
			--Task_L_AcceptTask(0x3d10d4,1,0x2dee36,point)--这个任务没有金币，不做
		end

		local point1 = {"",4,100,7271,42000,21}
		local point2 = {"",1,100,12160,14177,-128}
		local point3 = {"",1,100,-389,40801,35}
		if Task_L_LongGetTo(0x2dee36,1,10425,3,point1,point2,point3) then
			local point = {"",1,100,-389,40801,35}
			Task_L_TalkToNpc(0x2dee36,1,point,"Rubich",0,1,1)
		end

		local point = {"",1,100,-851,40917,39}
		Task_L_TalkToNpc(0x2dee36,2,point,"Orne",0,1,1)	

		local point = {"",1,100,-389,40801,35}
		Task_L_TalkToNpc(0x2dee36,3,point,"Rubich",0,1,2)

		local point = {"",1,100,-536,41059,39}
		Task_L_Collection(0x2dee36,4,point)

		local point1 = {"",1,100,-571,39809,39}
		local point2 = {"",1,100,6894,10312,0}
		local point3 = {"",1,100,7976,41765,32}	
		if Task_L_LongGetTo(0x2dee36,5,10425,3,point1,point2,point3) then
			local point = {"",1,100,7976,41765,32}	
			Task_L_TalkToNpc(0x2dee36,5,point,"Viltri",0,1,2)
		end

		local point = {"",1,100,8080,41386,32}
		Task_L_Collection(0x2dee36,6,point)

		local point = {"",1,100,8035,42185,113}
		Task_L_Collection(0x2dee36,7,point)

		if Task_L_GetTaskIsComplete(0x2dee36) then
			local point = {"",1,100,7962,41758,32}
			Task_L_CompleteTask(0x2dee36,7,point,"Viltri",-1)

			--使用传送阵
			Task_L_UseTransmit(0x3d10d4,1,"Lupen Port","Lupen Port")
		end


		if Task_L_FindTask(0x2dee35) == 0 then	
			if Task_L_FindTask(0x2dee36) == 0 then	
			--使用传送阵
				Task_L_UseTransmit(0x3d10d4,1,"Lupen Port","Lupen Port")
			end
		end
		
	end
	---------------------------------------------------------------------------
	--第7张
	if Fun_IsInMapByMapId(10426) then
		GlobalFun(0)

		--接受任务
		local point = {"Researcher Vina",1,100,9205,91,1026}
		--Task_L_AcceptTask(0x2df1b9,1,0x2df21d,point)

		local point = {"",1,100,8984,199,1024}
		Task_L_TalkToNpc(0x2df1b9,1,point,"Regulator Heizen",0,1,1)

		local point1 = {"",1,300,5322,2680,940}
		Task_L_LoopCollectMore(0x2df21d,1,0,1,point1)

		local point1 = {"",1,300,5322,2680,940}
		Task_L_LoopCollectMore(0x2df21d,1,1,1,point1)

		local point1 = {"",0,1000,3034,3110,512}
		local point2 = {"",0,1000,1340,5312,512}
		local point3 = {"",0,1000,1767,4155,512}
		Task_L_LoopAttackMonMore(0x2df1b9,2,0,3,point1,point2,point3)

		local point = {"",1,100,4281,6001,514}
		Task_L_UseTaskItem(0x2df21d,2,point)

		local point = {"",1,100,4281,6001,514}
		Task_L_Collection(0x2df1b9,3,point)

		local point = {"",1,100,9966,8821,1024}
		Task_L_TalkToNpc(0x2df1b9,4,point,"Tilda",0,1,1)

		--开传送阵
		local point = {"Whirlpool Observatory",1,100,10039,12255,1821}
		if Task_L_OpenTranMission(0x2df1b9,5,point) == 1 then
			local point = {"",1,100,11748,12626,1898}
			Task_L_TalkToNpc(0x2df1b9,5,point,"Regulator Seto",0,1,2)
		end
		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Aldith",1,100, 11643,12178,1898}
		Task_L_BuyItem(0x2df1b9,6,50,4,"Expert Healing Potion",point)

		--1.持久  2.背包空余
		Fun_SetBackHomeInfo(80, 20,0,0)
		--修理
		if Fun_IsHaveTask(0x2df1b9,6) == 1 then
			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Riza Falls", --大地图
					"Verdantier Observatory", --小地图
					"Whirlpool Observatory", --传送阵
					{ 11886,13207,1898 }, --修理NPC坐标
					{  11643,12178,1898 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		local point = {"",0,800,16894,11572,1026}
		Task_L_LoopAttackMonMore(0x2df1b9,6,2,1,point)

		local point = {"",0,800,15226,13889,1024}
		Task_L_LoopAttackMonMore(0x2df1b9,6,3,1,point)

		local point = {"",0,800,13421,8572,1024}
		Task_L_LoopAttackMonMore(0x2df1b9,6,1,1,point)

		local point = {"",0,800,13091,3609,1024}
		Task_L_LoopAttackMonMore(0x2df1b9,6,0,1,point)

		local point1 = {"",0,800,13275,4318,1024}
		local point2 = {"",0,800,11769,4639,1024}
		local point3 = {"",0,800,12697,3300,1024}
		Task_L_LoopAttackMonMore(0x2df3ad,1,0,3,point1,point2,point3)
		
		local point = {"",1,100,11748,12626,1898}
		Task_L_TalkToNpc(0x2df1b9,7,point,"Regulator Seto",0,1,1)	

		if Task_L_GetTaskIsComplete(0x2df221) then
			local point = {"",1,100,11748,12626,1898}
			Task_L_CompleteTask(0x2df221,1,point,"Regulator Seto",-1)
		end

		if Task_L_GetTaskIsComplete(0x2df21d) then
			local point = {"",1,100,11401,12122,1898}
			Task_L_CompleteTask(0x2df21d,2,point,"Researcher Gilsia",-1)

			--接受任务
			local point = {"Researcher Gilsia",1,100,11387,12128,1898}
			--Task_L_AcceptTask(0x2df1b9,8,0x2df21e,point)
		end

		local point = {"",1,100,11435,12536,1898}
		Task_L_TalkToNpc(0x2df21e,1,point,"Insane Researcher",0,1,1)	

		local point = {"",1,100,11369,12137,1898}
		Task_L_TalkToNpc(0x2df21e,2,point,"Researcher Gilsia",0,1,1)	

		local point = {"",1,100,10748,13189,1898}
		Task_L_Collection(0x2df21e,3,point)

		local point = {"",1,100,10556,13053,1898}
		Task_L_Collection(0x2df21e,4,point)

		local point = {"",1,100,10617,12824,1898}
		Task_L_Collection(0x2df21e,5,point)

		local point = {"",1,100,11369,12137,1898}
		Task_L_TalkToNpc(0x2df21e,6,point,"Researcher Gilsia",0,1,2)	

		if Task_L_GetTaskIsComplete(0x2df21e) then
			local point = {"",1,100,11748,12626,1898}
			Task_L_CompleteTask(0x2df21e,6,point,"Regulator Seto",-1)
		end

		if Task_L_GetTaskIsComplete(0x2df1b9) then
			local point = {"",1,100,11748,12626,1898}
			Task_L_CompleteTask(0x2df1b9 ,8,point,"Regulator Seto",-1)
		else
			local point = {"",1,100,11621,13534,1898}
			Task_L_Collection(0x2df1b9,8,point)
		end

		if Fun_IsHaveTask(0x2df1ba,1) == 1 then 
			local point = {"Regulator Wensia",1,100,10773,12256,1898}
			--Task_L_AcceptTask(0x2df1ba,1,0x2df21f,point)
		end

		local point1 = {"",1,300,16090,13532,1024}
		local point2 = {"",1,300,15648,14119,1024}
		local point3 = {"",1,300,14858,13154,1024}
		Task_L_LoopAttackMonMore(0x2df21f,1,0,3,point1,point2,point3)

		Task_L_CompleteGlobalTask(0x2df21f,-1)


		if Task_L_GetTaskIsComplete(0x2df1ba) then
			--开传送阵
			local point = {"Iron Gate Entrance",1,100,14147,19555,1190}
			if Task_L_OpenTranMission(0x2df1ba,2,point) == 1 then
				local point = {"",1,100,16726,22708,1799}
				Task_L_CompleteTask(0x2df1ba ,2,point,"Regulator Jansen",-1)
			end
		else
			--进剧情副本 10436
			local point = {"",1,100,18649,14268,1151}
			Task_L_AutoGetTo(0x2df1ba,1,10426,point,2,0x28C4) 
			--进入剧情副本  10436
			local point = {"",1,100,18449,14060,1151}
			if Task_L_LongGetTo(0x2df1ba,2,10426,1,point) then
				local point = {"",1,100,18713,14328,1151}
				Task_L_AutoGetTo(0x2df1ba,2,10426,point,1,0x28C4) 
			end
		end

		if Fun_IsHaveTask(0x2df1bb,1) == 1 then
			Fun_SetBackHomeInfo(80, 20,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,3500,11625,12183,1898}
				if Fun_IsInPoint(point) == 0 then
					local point = {"",1,100,10039,12255,1821}
					Task_L_UseTransmitPoint(0x2df1bb,1,"Whirlpool Observatory",point)
				else
					local point = {"Aldith",1,300, 11625,12183,1898}
					Task_L_BuyItem(0x2df1bb,1,100,4,"Expert Healing Potion",point)
					Task_L_PushDwonDrug(0x2df1bb,1,"Expert Healing Potion")
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Riza Falls", --大地图
						"Riza Falls", --小地图
						"Whirlpool Observatory", --传送阵
						{ 11871,13210,1898 }, --修理NPC坐标
						{ 11625,12183,1898 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,2500,16503,23136,1798}
				if Fun_IsInPoint(point) == 0 then
					local point = {"",1,100,14147,19555,1190}
					Task_L_UseTransmitPoint(0x2df1bb,1,"Iron Gate Entrance",point)
				end
				--进入副本  10463
				local point = {"",1,100,16503,23136,1798}
				if Task_L_LongGetTo(0x2df1bb,1,10426,1,point) then
					local point = {"",1,100,16522,23536,1800}
					Task_L_AutoGetTo(0x2df1bb,1,10426,point,2,0x28DF) 
				end
			end
		end

		--使用传送阵
		Task_L_UseTransmit(0x2df1bb,2,"Municipal District","Municipal District")
	end
	---------------------------------------------------------------------------
	--第8张
	---------------------------------------------------------------------------
	-------------------------------贝隆北郡------------------------------------
	---------------------------------------------------------------------------
	--第1张
	if Fun_IsInMapByMapId(11111) then
		GlobalFun(0)



		local point = {"",1,100,7687,2232,-15}
		Task_L_TalkToNpc(0x10d0b1,1,point,"Quayside Merchant",0,1,1)

		local point = {"",1,100,8651,3428,-14}
		Task_L_Collection(0x10d0b1,2,point)

		local point = {"",1,100,13343,2197,1396}
		Task_L_TalkToNpc(0x10d0b1,3,point,"Port Resident",0,1,1)

		local point = {"",1,100,12074,5150,3069}
		Task_L_TalkToNpc(0x10d0b1,4,point,"Rowan",0,1,1)
  
		Task_L_LoopEquipFun()
		--买50瓶 1592的药, 并且卖东西
		local point = {"Moriarty",1,100, 11113,5461,3069}
		Task_L_BuyItem(0x10d0b1,5,50,7,"Super Healing Potion",point)

		Task_L_PushDwonDrug(0x10d0b1,5,"Super Healing Potion")

		--进入剧情副本  11116
		local point = {"",1,100,11078,5018,3069}
		if Task_L_LongGetTo(0x10d0b1,5,11111,1,point) then
			local point = {"",1,100,10576,5510,3069}
			Task_L_AutoGetTo(0x10d0b1,5,11111,point,1,0x2B6C) 
		end

		--开传送阵
		local point = {"Port Entrance",1,100,16941,21777,1615}
		if Task_L_OpenTranMission(0x10d0b2,1,point) == 1 then
			local point = {"",1,100,15641,21976,1568}
			Task_L_TalkToNpc(0x10d0b2,1,point,"Thar",0,1,5)

			local point = {"",1,100,9509,18900,1568}
			Task_L_LongGetTo(0x10d0b2,2,11111,1,point)
		end

		--开传送阵
		local point = {"Central Port",1,100,13713,13262,-110}
		if Task_L_OpenTranMission(0x10d0b2,2,point) == 1 then
			local point = {"",1,100,16941,21777,1615}
			Task_L_UseTransmitPoint(0x10d0b2,2,"Port Entrance",point)

			--开传送阵
			local point = {"Guard Post",1,100,22677,9103,2098}
			if Task_L_LongGetTo(0x10d0b2,2,11111,1,point) then
				local point = {"Guard Post",1,100,22677,9103,2098}
				if Task_L_OpenTranMission(0x10d0b2,2,point) == 1 then
					---这里去下一张图
					local point = {"",1,100,28382,9994,3076}
					Task_L_AutoGetTo(0x10d0b2,2,11111,point,0,0) 
				end
			end
		end

		local point = {"",1,100,24847,11315,2048}
		Task_L_TalkToNpc(0x10ec0e,3,point,"Rosenbury",0,1,1)

		--去第三章图
		local point = {"",1,100,28574,22804,2209}
		Task_L_AutoGetTo(0x10ec0e,4,11111,point,0,0) 
		
		local point = {"",1,100,13055,12341,-120}
		Task_L_CompleteTask(0x10ec0f,2,point,"Shipbuilder Lanchenberg",-1)

		if IsMatch == 2 or IsMatch == 50 then
			--使用传送阵 这里可以加邮寄
			Task_L_UseTransmit(0x10d0b3,1,"Crafting District","Crafting District")

			Task_L_UseTransmit(0x10d0b3,2,"Crafting District","Crafting District")
		else
			--这里要去休沙瑞  ，要用破冰船
			local point = {"",1,100,14416,11306,-117}
			--Task_L_AutoGetTo(0x10d0b3,1,11111,point,0,0) 
		end

		if IsMatch == 100 then
			if Fun_IsHaveTask(0x10d0b3,1) == 1 then
				local point = {"",1,100,14416,11306,-117}
				Task_L_AutoGetTo(0x10d0b3,1,11111,point,0,0) 
			end

			if Fun_IsHaveTask(0x10d0b3,2) == 1 then
				local point = {"",1,100,14416,11306,-117}
				Task_L_AutoGetTo(0x10d0b3,2,11111,point,0,0) 
			end
		end

		if Task_L_FindTask(0x3d0d6a) == 0 and Task_L_FindTask(0x3d0d6b) == 0 then
			if GetTaskAlreadyComplete(0x3d0d6a) == 0 and GetTaskAlreadyComplete(0x3d0d6b) == 0 then
				Task_L_UseTransmit(0x452019,2,"Plaza of Harmony","Plaza of Harmony")
			end
		end

		local point = {"",1,100,12707,12545,-121}
		Task_L_TalkToNpc(0x3d0d6a,1,point,"Experienced Old Captain",0,1,1)

		if Fun_IsHaveTask(0x3d0d6a,2) == 1 then
			MSG("Lei  准备坐船回卢特兰")
			local point = {"",1,100,13673,11826,-126}
			Fun_L_InShip(10804,11111,point)
		end

		Task_L_UseTransmit(0x3d0d6a,5,"Plaza of Harmony","Plaza of Harmony")

		if Task_L_GetTaskIsComplete(0x3d0d6b) then
			Task_L_UseTransmit(0x3d0d6b,2,"Plaza of Harmony","Plaza of Harmony")
		else
			local point = {"",1,100,14416,11306,-117}
			Task_L_AutoGetTo(0x3d0d6b,2,11111,point,0,0) 
		end

		if GetTaskAlreadyComplete(0x3d0d6a) == 1 and GetTaskAlreadyComplete(0x3d0d6b) == 1 then
			local point = {"",1,100,14416,11306,-117}
			Task_L_AutoGetTo(0x452019,2,11111,point,0,0) 
		end
	end
	---------------------------------------------------------------------------
	--第2张
	if Fun_IsInMapByMapId(11102) then
		GlobalFun(0)
		local point = {"",1,100,13764,14812,4999}
		Task_L_AutoGetTo(0x10ec09,1,11102,point,0,0) 

		--开传送阵
		local point = {"Plaza of Harmony",1,100,14355,14679,5053}
		if Task_L_OpenTranMission(0x10ec09,2,point) == 1 then
			local point = {"",1,100,13685,16408,5371}
			Task_L_TalkToNpc(0x10ec09,2,point,"Avele",0,1,6)
		end
		if Task_L_GetTaskIsComplete(0x10ec09) then
			local point = {"",1,100,5298,-28553,4147}
			Task_L_CompleteTask(0x10ec09,3,point,"Ealyn",-1)
		else
			local point1 = {"",1,100,13703,16439,5371}
			local point2 = {"",1,100,13703,16853,5404}
			local point3 = {"",1,100,5295,-31863,4077}	
			Task_L_LongGetTo(0x10ec09,3,11102,3,point1,point2,point3)
		end

		local point = {"",1,100,5298,-28553,4147}
		Task_L_TalkToNpc(0x10ec0b,1,point,"Ealyn",0,1,0x0D)

		local point = {"",1,100,5805,-29120,4077}
		Task_L_TalkToNpc(0x10ec0b,2,point,"Speaker Alberto",0,1,1)	

		local point1 = {"Collect",2,300,5914,-29430,4077}
		local point2 = {"Collect",1,300,5847,-29703,4090}
		local point3 = {"Collect",0,300,5754,-29933,4077}
		Task_L_BranchLine(0x10ec0b,3,3,point1,point2,point3)

		if Task_L_GetTaskIsComplete(0x10ec0b) then
			local point = {"",1,100,5298,-28553,4147}
			Task_L_CompleteTask(0x10ec0b,4,point,"Ealyn",-1)
		else
			local point = {"",1,100,5805,-29120,4077}
			Task_L_TalkToNpc(0x10ec0b,4,point,"Speaker Alberto",0,1,2)	
		end

		local point = {"",1,100,4896,-33044,4077}
		Task_L_TalkToNpc(0x10ec0c,1,point,"Avele",0,1,5)

		local point = {"",1,100,4896,-33044,4077}
		Task_L_Collection(0x10ec0c,2,point)

		local point = {"",1,100,4896,-33044,4077}
		Task_L_TalkToNpc(0x10ec0c,3,point,"Avele",0,1,2)

		local point1 = {"",1,100,5292,-36279,3709}
		local point2 = {"",1,100,5288,-36894,3715}
		local point3 = {"",1,100,19257,13569,4920}
		Task_L_LongGetTo(0x10ec0c,4,11102,3,point1,point2,point3)

		local point = {"",1,100,19157,13415,4913}
		Task_L_TalkToNpc(0x10ec0c,5,point,"Professor Ronatas",0,1,1)
			
		local point = {"",1,100,19127,13493,4913}
		Task_L_UseTaskItem(0x10ec0d ,1,point)

		local point = {"",1,100,19157,13415,4913}
		Task_L_TalkToNpc(0x10ec0d,2,point,"Professor Ronatas",0,1,2)

		local point = {"",1,100,22467,10614,5129}
		Task_L_TalkToNpc(0x10ec0d,3,point,"Rutaru",0,1,1)
		
		local point = {"",1,100,22574,10155,5134}
		Task_L_AutoGetTo(0x10ec0d,4,11102,point,0,0) 

		local point1 = {"",10,100,22574,10155,5134}
		local point2 = {"",1,100,22571,8074,4358}
		Task_L_LongGetTo(0x10ec0d,5,11102,2,point1,point2)

		--开传送阵
		local point = {"Business District",1,100,22494,5983,4397}
		if Task_L_OpenTranMission(0x10ec0e,1,point) == 1 then
			local point = {"",1,100,17426,5310,3589}
			if Task_L_TalkToNpc(0x10ec0e,1,point,"Avele",0,1,3) then
				Task_L_AcceptGlobalTask(0x10ec6e)
			end
		end

		local point = {"",1,100,20265,13855,4911}
		Task_L_TalkToNpc(0x10ec6e,1,point,"Seifeltz",0,1,2)

		local point = {"",1,100,20265,13855,4911}
		Task_L_UseTaskItem(0x10ec6e ,2,point)

		local point = {"",1,100,20265,13855,4911}
		Task_L_Collection(0x10ec6e,3,point)

		local point = {"",1,100,20265,13855,4911}
		Task_L_CompleteTask(0x10ec6e,3,point,"Seifeltz",-1)
		--开传送阵
		local point = {"Crafting District",1,100,5427,8032,4273}
		if Task_L_OpenTranMission(0x10ec0e,2,point) == 1 then
			local point = {"",1,100,6487,8019,4226}
			Task_L_TalkToNpc(0x10ec0e,2,point,"Kariel",0,1,1)

			--这个任务是不是可以放在一开始？
			local point = {"",1,100,14355,14679,5053}
			Task_L_UseTransmitPoint(0x10ec0e,3,"Plaza of Harmony",point)
			
			local point1 = {"",1,100,13703,16439,5371}
			local point2 = {"",1,100,13703,16853,5404}
			local point3 = {"",1,100,7981,-34295,3713}	
			if Task_L_LongGetTo(0x10ec0e,3,11102,3,point1,point2,point3) then 
				local point = {"Avele",1,100,7981,-34295,3713}	
				Task_L_AcceptTask(0x10ec0e,3,0x5b9551,point)
			end
		end


		--使用传送阵
		Task_L_UseTransmit(0x10ec0e,3,"Guard Post","Guard Post")

		if Task_L_GetTaskIsComplete(0x10ec0a) then
			local point = {"",1,100,5298,-28553,4147}
			Task_L_CompleteTask(0x10ec0a,2,point,"Ealyn",-1)
		else
			local point1 = {"",1,100,13703,16439,5371}
			local point2 = {"",1,100,13703,16853,5404}
			local point3 = {"",1,100,5295,-31863,4077}	
			Task_L_LongGetTo(0x10ec0a,2,11102,3,point1,point2,point3)
		end

		--使用传送阵
		Task_L_UseTransmit(0x10ec0f,2,"Central Port","Central Port")
		
		if IsMatch == 2 then
			MSG("Lei 50级任务完成 邮寄")		
			local point = {"",1,100,7031,7299,4226}
			Task_L_Email(0x10d0b3,1,point)

			MSG("Lei 50级任务完成 邮寄")		
			local point = {"",1,100,7031,7299,4226}
			Task_L_Email(0x10d0b3,2,point)
		end

		if IsMatch == 100 then
			if Fun_IsHaveTask(0x10d0b3,1) == 1 or Fun_IsHaveTask(0x10d0b3,2) == 1 then
				if ShoppingRevGift() == 1 then
					local point = {"",1,100,7031,7299,4226}
					if RevEmail("Vern Castle","Crafting District",point) == 1 then
						local point = {"",0,100,6690, 8260, 4226}
						if FindWay(point) == 1 then
							GlobalItemFun.Fun(0)
							LoopUseItemBox(5,"Battle Item Selection Chest")
							LoopUseItemBox(0,"Destruction Stone Selection Pouch")
							LoopUseItemBox(0,"Guardian Stone Selection Pouch")
							LoopUseItemBox(0,"Sailing Coin Selection Chest")
							LoopUseItemBox(0,"Honing Leapstone Selection Chest")
							LoopUseItemBox(0,"Honing Shard Selection Chest")
							GlobalItemFun.Fun(0)

							local point = {"",1,100,7482,8591,4285}
							if Strengthen(1,100000,10,point) ==1 then
								ChallengeThread()

								Task_L_UseTransmit(0x10d0b3,1,"Central Port","Central Port")

								Task_L_UseTransmit(0x10d0b3,2,"Central Port","Central Port")
							end
						end
					end
				end
			end
		end

		if Task_L_FindTask(0x3d0d6a) == 0 and Task_L_FindTask(0x3d0d6b) == 0 then
			if Fun_IsHaveTask(0x452019,2) == 1 then
				if GetTaskAlreadyComplete(0x3d0d6a) == 0 then
					local point = {"Plaza of Harmony",1,1000,14355,14679,5053}
					if Fun_IsInPoint(point) == 1 then
						local point = {"Portal Statue",2,100,13651,10569,4685}
						Task_L_SetBackHome(0x452019,2,point)
					else
						local point1 = {"",1,100,13703,16439,5371}
						local point2 = {"",1,100,13703,16853,5404}
						local point3 = {"",1,100,5304,-28554,4147}	
						if Task_L_LongGetTo(0x452019,2,11102,3,point1,point2,point3) then
							local point = {"Ealyn",1,100,5304,-28554,4147}
							Task_L_AcceptTask(0x452019,2,0x3d0d6a,point)
						end
					end
				end
			end
		end

		Task_L_UseTransmit(0x3d0d6a,1,"Central Port","Central Port")

		local point1 = {"",1,100,13703,16439,5371}
		local point2 = {"",1,100,13703,16853,5404}
		local point3 = {"",1,100,5304,-28554,4147}	
		if Task_L_LongGetTo(0x3d0d6a,5,11102,3,point1,point2,point3) then
			local point = {"",1,100,5298,-28553,4147}
			Task_L_CompleteTask(0x3d0d6a,5,point,"Ealyn",-1)
		end

		local point = {"",1,100,5304,-28554,4147}
		Task_L_TalkToNpc(0x3d0d6b,1,point,"Ealyn",0,1,0x28)--这个不对
		
		if Task_L_GetTaskIsComplete(0x3d0d6b) then
			local point1 = {"",1,100,13703,16439,5371}
			local point2 = {"",1,100,13703,16853,5404}
			local point3 = {"",1,100,5304,-28554,4147}	
			if Task_L_LongGetTo(0x3d0d6b,2,11102,3,point1,point2,point3) then
				local point = {"",1,100,5298,-28553,4147}
				Task_L_CompleteTask(0x3d0d6b,2,point,"Ealyn",-1)
			end
		else
			Task_L_UseTransmit(0x3d0d6b,2,"Central Port","Central Port")
		end

		if GetTaskAlreadyComplete(0x3d0d6a) == 1 and GetTaskAlreadyComplete(0x3d0d6b) == 1 then
			Task_L_UseTransmit(0x452019,2,"Central Port","Central Port")
		end

	end
	---------------------------------------------------------------------------
	--第3张
	if Fun_IsInMapByMapId(11101) then
		GlobalFun(0)

		local point = {"",1,100,3822,-3358,1386}
		Task_L_TalkToNpc(0x10ccc9,1,point,"Perth",0,1,1)

		local point = {"",1,100,6477,3268,1629}
		Task_L_TalkToNpc(0x10ccc9,2,point,"Thar",0,1,7)

		--开传送阵
		local point = {"Rania Village",1,100,7672,4707,1679}
		if Task_L_OpenTranMission(0x10ccc9,3,point) == 1 then
			local point1 = {"",1,100,8743,3291,1869}
			local point2 = {"",1,100,8635,2981,1890}
			local point3 = {"",1,100,-520,-39971,243}
			if Task_L_LongGetTo(0x10ccc9,3,11101,3,point1,point2,point3) then
				local point = {"",1,100,-520,-39971,243}
				Task_L_TalkToNpc(0x10ccc9,4,point,"Gideon",0,1,1)
			end
		end
	
		if Fun_IsHaveTask(0x10ccc9,4) == 1 then
			local point = {"",1,2000,-1516,-39069,243}
			if Fun_IsInPoint(point) == 1 then 
				local point = {"",1,100,-520,-39971,243}
				Task_L_TalkToNpc(0x10ccc9,4,point,"Gideon",0,1,1)
			end
		end
		
		local point = {"",1,100,-987,-40009,243}
		Task_L_TalkToNpc(0x10ccc9,5,point,"Thar",0,1,8)

		local point = {"",1,100,-520,-39971,243}
		Task_L_TalkToNpc(0x10ccc9,6,point,"Gideon",0,1,0x0A)

		local point = {"",1,100,-1516,-39069,243}
		Task_L_TalkToNpc(0x10ccc9,7,point,"Anabel",0,1,1)

		local point = {"",1,100,-1516,-39069,243}
		Task_L_UseTaskItem(0x10ccc9 ,8,point)

		local point = {"",1,100,-1516,-39069,243}
		Task_L_TalkToNpc(0x10ccc9,9,point,"Anabel",0,1,0x0A)

		local point = {"",1,100,-1930,-38782,243}
		Task_L_TalkToNpc(0x10ccc9,10,point,"Thar",0,1,9)

		local point = {"",1,300,-1994,-38468,243}
		Task_L_Collection(0x5b9551,2,point)

		local point = {"",1,100,-1516,-39069,243}
		Task_L_TalkToNpc(0x5b9551,3,point,"Anabel",0,1,0x12)

		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,3356,7757,336}
		if Task_L_LongGetTo(0x10ccca,1,11101,3,point1,point2,point3) then
			local point = {"Wholesaler",1,300,3297,7887,336}  
			Task_L_BranchTalkToNpc(0x10ccca,1,0,point)

			local point = {"Art Merchant",1,300,2625,8043,336}  
			Task_L_BranchTalkToNpc(0x10ccca,1,1,point)

			local point = {"Antique Merchant",1,300,2122,8243,336}  
			Task_L_BranchTalkToNpc(0x10ccca,1,2,point)
		end

		local point = {"",1,100,2467,7349,336}
		Task_L_TalkToNpc(0x10ccca,2,point,"Luigia",0,1,1)

		local point1 = {"",1,100,8743,3291,1869}
		local point2 = {"",1,100,8635,2981,1890}
		local point3 = {"",1,100,-1516,-39069,243}
		if Task_L_LongGetTo(0x10ccca,3,11101,3,point1,point2,point3) then
			local point = {"",1,100,-1516,-39069,243}
			Task_L_TalkToNpc(0x10ccca,3,point,"Anabel",0,1,2)
		end

		local point = {"",1,100,-520,-39971,243}
		Task_L_TalkToNpc(0x10ccca,4,point,"Gideon",0,1,0x0B)

		local point = {"",1,100,-945,-39983,243}
		Task_L_TalkToNpc(0x10ccca,5,point,"Thar",0,1,1)

		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,12299,10131,1616}
		Task_L_LongGetTo(0x10d8e5,1,11101,3,point1,point2,point3)--去第一个告示板的地图

		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,5925,12074,1075}
		Task_L_LongGetTo(0x10dccd,1,11101,3,point1,point2,point3)--去第二个告示板的地图


		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,6766,4584,1637}
		if Task_L_LongGetTo(0x10d4fd,1,11101,3,point1,point2,point3) then--去第三个告示板的地图
			local point = {"",1,100,6766,4584,1637}
			Task_L_TalkToNpc(0x10d4fd,1,point,"Billy",0,1,1)
		end
		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,6766,4584,1637}
		if Task_L_LongGetTo(0x10d4fd,2,11101,3,point1,point2,point3) then--去第三个告示板的地图
			local point = {"",1,100,8747,12963,1507}
			Task_L_LongGetTo(0x10d4fd,2,11101,1,point)--去第三个告示板的地图
		end

		local point1 = {"",1,100,8743,3291,1869}
		local point2 = {"",1,100,8635,2981,1890}
		local point3 = {"",1,100,-1516,-39069,243}
		if Task_L_LongGetTo(0x10cccb,1,11101,3,point1,point2,point3) then
			if Task_L_FindTask(0x10d8e5) == 0 and
			Task_L_FindTask(0x10dccd) == 0 and
			Task_L_FindTask(0x10d4fd) == 0 and
			Task_L_FindTask(0x10d8ea) == 0 
			then
				--接受任务
				local point = {"Fesnar Highland Board",1,100,-1028,-39609,243}
				Task_L_AcceptTask(0x10cccb,1,0x10d8e5,point)--第一个告示板的任务
			end
			--[[
			if Task_L_FindTask(0x10d8e5) == 0 and
			Task_L_FindTask(0x10dccd) == 0 and
			Task_L_FindTask(0x10d4fd) == 0 and
			Task_L_FindTask(0x10d8ea) == 0 
			then
				--接受任务
				local point = {"Parna Forest Board",1,100,-652,-39607,245}
				Task_L_AcceptTask(0x10cccb,1,0x10dccd,point)--第二个告示板的任务
			end

			if Task_L_FindTask(0x10d8e5) == 0 and
			Task_L_FindTask(0x10dccd) == 0 and
			Task_L_FindTask(0x10d4fd) == 0 and
			Task_L_FindTask(0x10d8ea) == 0 
			then
				--接受任务
				local point = {"Vernese Forest Board",1,100,-968,-40282,243}
				Task_L_AcceptTask(0x10cccb,1,0x10d4fd,point)--三个告示板的任务
			end
			--]]
			if Task_L_FindTask(0x10d8ea) == 0 and 
			Task_L_FindTask(0x10dccd) == 0 and
			Task_L_FindTask(0x10d4fd) == 0 and
			Task_L_FindTask(0x10d8e5) == 0 
			then
				--这里要接个任务，完成了之后才能交这个任务
				local point = {"",1,100,-520,-39971,243}
				Task_L_TalkToNpc(0x10cccb,1,point,"Gideon",0,1,4)
			end
		end


		local point1 = {"",1,100,8743,3291,1869}
		local point2 = {"",1,100,8635,2981,1890}
		local point3 = {"",1,100,-579,-39851,243}
		if Task_L_LongGetTo(0x10d8ea,10,11101,3,point1,point2,point3) then
			local point = {"",1,100,-579,-39851,243}
			Task_L_CompleteTask(0x10d8ea,10,point,"Gideon",-1)
		end

		local point = {"",1,100,-520,-39971,243}
		Task_L_TalkToNpc(0x10ccca,4,point,"Gideon",0,1,0x0B)

		local point = {"",1,100,-1022,-39937,243}
		Task_L_TalkToNpc(0x10cccb,2,point,"Thar",0,1,4)

		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,7093,2411,1630}
		if Task_L_LongGetTo(0x10cccb,3,11101,3,point1,point2,point3) then
			local point = {"",1,100,7093,2411,1630}
			Task_L_TalkToNpc(0x10cccb,3,point,"Veloa",0,1,1)
		end

		local point = {"",1,100,8542,-361,553}
		Task_L_TalkToNpc(0x10cccb,4,point,"Chief Gatekeeper Terry",0,1,1)

		--去第五张图
		local point = {"",1,100,10496,-2066,764}
		Task_L_AutoGetTo(0x10e051,1,11101,point,0,0) 

		local point1 = {"",1,100,8743,3291,1869}
		local point2 = {"",1,100,8635,2981,1890}
		local point3 = {"",1,100,-520,-39971,243}
		if Task_L_LongGetTo(0x10cccc,1,11101,3,point1,point2,point3) then
			local point = {"",1,100,-520,-39971,243}
			Task_L_TalkToNpc(0x10cccc,1,point,"Gideon",0,1,5)
		end

		local point = {"",1,100,-1022,-39937,243}
		Task_L_TalkToNpc(0x10cccc,2,point,"Thar",0,1,10)

		local point1 = {"",1,100,-2235,-38817,242}
		local point2 = {"",1,100,-2695,-38829,242}
		local point3 = {"",1,100,7130,4834,1634}
		if Task_L_LongGetTo(0x10cccc,3,11101,3,point1,point2,point3) then
			local point = {"",1,100,7130,4834,1634}
			Task_L_TalkToNpc(0x10cccc,3,point,"Avele",0,1,1)	
		end

		local point = {"",1,100,2731,6347,336}
		Task_L_TalkToNpc(0x10cccc,4,point,"Thar",0,1,5)	

		Task_L_UseTransmit(0x10ec0a,1,"Plaza of Harmony","Plaza of Harmony")
	end
	---------------------------------------------------------------------------
	--第4张
	if Fun_IsInMapByMapId(11113) then
		GlobalFun(0)
		MSG("Lei 到下个图了")
		
		local point = {"",1,100,1459,2868,4120}
		Task_L_CompleteTask(0x10d8e5,1,point,"President Baran",-1)

		if Task_L_FindTask(0x10d8e6) == 0 and
		   Task_L_FindTask(0x10d8e7) == 0 and
		   Task_L_FindTask(0x10d8e8) == 0 and 
		   Task_L_FindTask(0x10d8e9) == 0 and 
		   Task_L_FindTask(0x10d8ea) == 0 
		   then
			--接受任务
			if GetTaskAlreadyComplete(0x10d8e6) == 0 then
				local point = {"President Baran",1,100,1491,2823,4122}
				Task_L_AcceptTask(0x10cccb,1,0x10d8e6,point)
			end
		end

		local point = {"Hawker Jingyu",1,100,1390,3075,4120}
		--Task_L_AcceptTask(0x10d8e6,1,0x10d8ef,point)

		local point1 = {"",0,600,1092,5191,4498}
		local point2 = {"",0,600,-88,5395,4496}
		Task_L_LoopAttackMonMore(0x10d8ef,1,0,2,point1,point2)

		local point1 = {"",0,300,-230,5733,4491}
		local point2 = {"",0,300,86,6414,4492}
		local point3 = {"",0,300,330,6079,4492}
		Task_L_LoopCollectMore(0x10d8e6,1,0,3,point1,point2,point3)

		local point = {"",1,100,1560,5933,4495}
		Task_L_TalkToNpc(0x10d8e6,2,point,"Thar",0,1,1)

		if Task_L_GetTaskIsComplete(0x10d8ef) then
			local point = {"",1,300,3985,9719,4490}
			Task_L_CompleteTask(0x10d8ef,1,point,"Hawker Hunted",-1)
		end

		local point1 = {"",0,300,3754,8630,4490}
		local point2 = {"",0,300,3572,9579,4490}
		local point3 = {"",0,300,3524,10407,4490}
		local point4 = {"",0,300,3816,10776,4490}
		Task_L_LoopCollectMore(0x10d8e6,3,0,4,point1,point2,point3,point4)

		local point1 = {"",0,600,4513,10955,4490}
		local point2 = {"",0,600,5418,11649,4490}
		local point3 = {"",0,600,6229,10337,4490}	
		Task_L_LoopAttackMonMore(0x10d8e6,3,1,3,point1,point2,point3)

		if Task_L_GetTaskIsComplete(0x10d8e6) then
			local point = {"",1,300,7331,8307,4490}
			Task_L_CompleteTask(0x10d8e6,4,point,"Dying Trade Company Escort",-1)

			--接受任务
			local point = {"Dying Trade Company Escort",1,100,7331,8307,4490}
			Task_L_AcceptTask(0x10cccb,1,0x10d8e7,point)
		else
			local point = {"",1,100,6404,8333,4490}
			Task_L_AutoGetTo(0x10d8e6,4,11113,point,0,0) 
		end

		local point = {"",1,300,7456,8183,4490}
		Task_L_Collection(0x10d8e7,1,point)

		local point = {"",1,100,11052,7469,3976}
		Task_L_AutoGetTo(0x10d8e7,2,11113,point,0,0) 

		local point = {"",1,500,12694,6230,3976}
		Task_L_Collection(0x10d8e7,3,point)

		local point = {"",1,100,15029,5954,3973}
		Task_L_AutoGetTo(0x10d8e7,4,11113,point,0,0) 

		local point = {"",1,100,15950,5999,3978}
		Task_L_TalkToNpc(0x10d8e7,5,point,"Thar",0,1,2)

		local point = {"",1,100,17936,7549,3464}
		Task_L_AutoGetTo(0x10d8e7,6,11113,point,0,0) 	

		local point = {"",1,100,19335,8863,3466}
		Task_L_AutoGetTo(0x10d8e7,7,11113,point,0,0) 

		if Task_L_GetTaskIsComplete(0x10d8e7) then
			local point = {"",1,100,19335,8863,3466}
			Task_L_CompleteTask(0x10d8e7,7,point,"Vice President Hadnil",-1)

			--接受任务
			local point = {"Vice President Hadnil",1,100,19335,8863,3466}
			Task_L_AcceptTask(0x10cccb,1,0x10d8e8,point)
		end

		local point = {"",1,100,18202,9719,3978}
		Task_L_AutoGetTo(0x10d8e8,1,11113,point,0,0) 
		
		local point = {"",1,100,17242,9762,3978}
		Task_L_TalkToNpc(0x10d8e8,2,point,"Thar",0,1,3)

		local point = {"",1,100,17014,9826,3978}
		Task_L_TalkToNpc(0x10d8e8,3,point,"Ternark",0,1,1)

		local point1 = {"",0,800,15924,10368,3969}	
		local point2 = {"",0,800,15443,11522,3973}	
		Task_L_LoopAttackMonMore(0x10d8e8,4,0,2,point1,point2)

		local point = {"",1,100,14959,11017,3968}
		Task_L_AutoGetTo(0x10d8e8,5,11113,point,0,0) 

		--开传送阵
		local point = {"Fesnar Highland",1,100,14373,10609,4025}
		if Task_L_OpenTranMission(0x10d8e8,6,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 
			local point = {"Horatio",1,100, 14379,10139,3978}
			Task_L_BuyItem(0x10d8e8,6,50,7,"Super Healing Potion",point)

			Task_L_PushDwonDrug(0x10d8e8,6,"Super Healing Potion")
			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80,20,0,0)
			--修理
			if Fun_IsHaveTask(0x10d8e8,6) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Fesnar Highland", --大地图
						"Barrier Trail", --小地图
						"Fesnar Highland", --传送阵
						{ 13339,9749,3975 }, --修理NPC坐标
						{ 14379,10139,3978 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,300,14853,10860,3980}
			Task_L_TalkToNpc(0x10d8e8,6,point,"Talking Frog",0,1,1)
		end

		local point = {"",1,300,14853,10860,3980}
		Task_L_Collection(0x10d8e8,7,point)	

		local point1 = {"",0,800,12946,11517,3972}	
		local point2 = {"",0,800,12458,12496,3978}	
		Task_L_LoopAttackMonMore(0x10d8e8,8,0,2,point1,point2)

		local point = {"",1,300,12619,11944,3978}
		Task_L_Collection(0x10d8e8,8,point)	

		local point = {"",1,300,11413,12548,3975}
		Task_L_Collection(0x10d8e8,9,point)	

		if Task_L_GetTaskIsComplete(0x10d8e8) then
			local point1 = {"",2,100,10621,15255,3978}
			local point2 = {"",1,100,10312,15445,3467}	
			if Task_L_LongGetTo(0x10d8e8,9,11113,2,point1,point2) then
				local point = {"",1,100,10333,15442,3467}
				Task_L_CompleteTask(0x10d8e8,9,point,"Magick Scholar Hokantruba",-1)
			end
		end

		local point = {"",1,1000,10333,15442,3467}
		if Fun_IsInPoint(point) == 1 then 
			if Task_L_FindTask(0x10d8e8) == 0 then
				--接受任务
				local point = {"Magick Scholar Hokantruba",1,100,10333,15442,3467}
				Task_L_AcceptTask(0x10cccb,1,0x10d8e9,point)
			end
		end

		local point1 = {"",2,100,10501,15164,3465}
		local point2 = {"",1,100,11242,15519,3977}	
		Task_L_LongGetTo(0x10d8e9,1,11113,2,point1,point2)

		local point1 = {"",0,800,13300,14248,3975}	
		local point2 = {"",0,800,15018,13873,3978}	
		local point3 = {"",0,800,12870,12888,3978}	
		Task_L_LoopAttackMonMore(0x10d8e9,2,0,3,point1,point2,point3)

		local point1 = {"",1,500,16501,14285,3978}	
		local point2 = {"",1,500,16718,15596,3978}	
		Task_L_LoopAttackMonMore(0x10d8e9,3,1,2,point1,point2)

		local point = {"",0,800,17158,15385,3978}	
		Task_L_LoopAttackMonMore(0x10d8e9,3,0,1,point)

		if Task_L_GetTaskIsComplete(0x10d8e9) then
			local point = {"",1,100,19515,14081,3975}
			Task_L_CompleteTask(0x10d8e9,3,point,"Magick Scholar Hokantruba",-1)

			--接受任务
			local point = {"Magick Scholar Hokantruba",1,100,19515,14081,3975}
			Task_L_AcceptTask(0x10cccb,1,0x10d8ea,point)
		end

		local point = {"",1,100,20551,12101,4015}
		Task_L_AutoGetTo(0x10d8ea,1,11113,point,0,0) 

		local point = {"",1,300,21684,11422,4111}
		Task_L_TalkToNpc(0x10d8ea,2,point,"Thar",0,1,4)

		local point1 = {"",1,600,22983,8102,4234}	
		local point2 = {"",1,600,22462,7413,4234}	
		Task_L_LoopAttackMonMore(0x10d8ea,3,0,2,point1,point2)

		local point1 = {"",0,800,22983,8102,4234}	
		local point2 = {"",0,800,22462,7413,4234}	
		Task_L_LoopAttackMonMore(0x10d8ea,3,1,2,point1,point2)

		local point = {"",0,800,23830,14813,4741}
		Task_L_LoopAttackMonMore(0x10d8ea,4,0,1,point)

		local point = {"",0,800,23451,16225,4744}
		Task_L_LoopAttackMonMore(0x10d8ea,4,2,1,point)

		local point = {"",0,800,27449,14882,4724}
		Task_L_LoopAttackMonMore(0x10d8ea,4,1,1,point)

		local point1 = {"",2,100,25134,16826,4747}
		local point2 = {"",1,100,25718,17815,4490}	
		if Task_L_LongGetTo(0x10d8ea,5,11113,2,point1,point2) then
			local point = {"",1,300,25718,17815,4490}
			Task_L_TalkToNpc(0x10d8ea,5,point,"Hokantruba's Phantom",0,1,1)
		end

		local point = {"",1,300,25925,17678,4490}
		Task_L_Collection(0x10d8ea,6,point)	

		local point = {"",1,300,25643,18048,4490}
		Task_L_TalkToNpc(0x10d8ea,7,point,"Ternark",0,1,2)
		
		local point = {"",1,300,25500,17823,4490}
		Task_L_TalkToNpc(0x10d8ea,8,point,"Thar",0,1,6)

		--进入剧情副本   11118
		local point1 = {"",2,100,25022,18272,4487}
		local point2 = {"",1,100,24531,19206,4234}	
		if Task_L_LongGetTo(0x10d8ea,9,11113,2,point1,point2) then
			local point = {"",1,100,25034,19746,4234}
			Task_L_AutoGetTo(0x10d8ea,9,11113,point,1,0x2B6E) 
		end

		local point1 = {"",2,100,24657,18427,4234}
		local point2 = {"",1,100,25390,17865,4490}	
		if Task_L_LongGetTo(0x10d8ea,10,11113,2,point1,point2) then
			local point = {"",1,300,25390,17865,4490}	
			Task_L_TalkToNpc(0x10d8ea,10,point,"Thar",0,1,5)
		end

		if Task_L_GetTaskIsComplete(0x10d8ea) then
			--使用传送阵
			Task_L_UseTransmit(0x10d8ea,10,"Rania Village","Rania Village")
		end
	end
	---------------------------------------------------------------------------
	--第5张
	if Fun_IsInMapByMapId(11115) then
		GlobalFun(0)

		local point = {"",1,100,4823,21544,511}
		Task_L_CompleteTask(0x10e051,1,point,"Despairing Adventurer",-1)

		local point = {"",1,100,4823,21544,511}
		Task_L_TalkToNpc(0x10e052,1,point,"Despairing Adventurer",0,1,1)

		local point = {"",1,100,4340,20803,512}
		Task_L_TalkToNpc(0x10e052,2,point,"Thar",0,1,1)

		local point = {"",1,100,6868,19541,1038}
		Task_L_AutoGetTo(0x10e052,3,11115,point,0,0) 

		local point = {"",0,800,6240,20431,1258}	
		Task_L_LoopAttackMonMore(0x10e052,4,0,1,point)

		local point = {"",0,800,7378,20590,1258}	
		Task_L_LoopAttackMonMore(0x10e052,4,1,1,point)

		local point = {"",0,800,7541,21990,1258}	
		Task_L_LoopAttackMonMore(0x10e052,4,2,1,point)

		local point = {"",1,100,8847,21353,1259}
		Task_L_TalkToNpc(0x10e052,5,point,"Guild Scribe Rosalia",0,1,1)

		local point1 = {"",0,300,8264,19710,1022}
		local point2 = {"",0,300,8378,19303,1022}
		local point3 = {"",0,300,7709,19712,1022}
		Task_L_LoopCollectMore(0x10e053,1,0,3,point1,point2,point3)

		local point = {"",1,300,6879,18988,1015}
		Task_L_UseTaskItem(0x10e053,2,point)

		local point1 = {"",1,500,8187,17684,776}
		local point2 = {"",1,500,7207,16695,776}
		local point3 = {"",1,500,8248,14999,776}
		Task_L_LoopAttackMonMore(0x10e053,3,0,3,point1,point2,point3)

		local point1 = {"",0,800,8187,17684,776}
		local point2 = {"",0,800,7207,16695,776}
		local point3 = {"",0,800,8248,14999,776}
		Task_L_LoopAttackMonMore(0x10e053,3,1,3,point1,point2,point3)

		local point1 = {"",1,100,6684,13492,768}
		local point2 = {"",1,100,9004,10019,528}
		Task_L_LongGetTo(0x10e053,4,11115,2,point1,point2)

		if Task_L_GetTaskIsComplete(0x10e053) then
			local point = {"",1,100,9004,10019,528}
			Task_L_CompleteTask(0x10e053,4,point,"Guild Scribe Rosalia",-1)
		end

		local point = {"",1,100,9004,10019,528}
		Task_L_TalkToNpc(0x10e054,1,point,"Guild Scribe Rosalia",0,1,2)

		local point1 = {"",1,100,6111,7692,1021}
		local point2 = {"",1,100,11084,7996,1021}
		local point3 = {"",1,100,14669,7117,1023}
		local point4 = {"",1,100,13475,10098,778}	
		--Task_L_LongGetTo(0x10e054,2,11115,4,point1,point2,point3,point4)

		local point1 = {"",10,100,9548,10043,519}
		local point2 = {"",1,100,13475,10098,778}	
		Task_L_LongGetTo(0x10e054,2,11115,2,point1,point2)

		local point = {"",1,100,14079,10034,767}
		Task_L_TalkToNpc(0x10e054,3,point,"Thar",0,1,2)
		
		local point1 = {"",0,100,14443,10618,767}
		local point2 = {"",0,100,14873,10866,768}
		local point3 = {"",0,100,14386,11753,765}
		Task_L_LoopCollectMore(0x10e054,4,0,3,point1,point2,point3)

		--开传送阵
		local point = {"Lighthouse Village",1,100,13559,12167,943}
		if Task_L_OpenTranMission(0x10e054,5,point) == 1 then

			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Narieta",1,100, 14891,11148,768}
			Task_L_BuyItem(0x10e054,5,50,7,"Super Healing Potion",point)

			Task_L_PushDwonDrug(0x10e054,5,"Super Healing Potion")
			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 20,0,0)
			--修理
			if Fun_IsHaveTask(0x10e054,5) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Balankar Mountains", --大地图
						"Starkeeper's House", --小地图
						"Starkeeper's House", --传送阵
						{ 15247,9230,768 }, --修理NPC坐标
						{ 14891,11148,768 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,15072,11805,766}
			Task_L_TalkToNpc(0x10e054,5,point,"Fortress Keeper Gerrard",0,1,1)
		end

		local point = {"",1,100,15878,10178,768}
		Task_L_TalkToNpc(0x10e055,1,point,"Starkeeper Siriel",0,1,1)

		local point = {"",1,100,15715,10203,768}
		Task_L_TalkToNpc(0x10e055,2,point,"Thar",0,1,3)

		local point1 = {"",10,100,16131,10067,775}
		local point2 = {"",1,100,21322,10036,512}	
		Task_L_LongGetTo(0x10e055,3,11115,2,point1,point2)

		local point1 = {"",10,100,16131,10067,775}
		local point2 = {"",1,100,21322,10036,512}	
		if Task_L_LongGetTo(0x10e056,1,11115,2,point1,point2) then
			local point1 = {"",0,800,25137,10035,547}
			local point2 = {"",0,800,23958,10934,512}
			Task_L_LoopAttackMonMore(0x10e056,1,0,2,point1,point2)
		end

		local point = {"",1,100,28421,11784,512}
		Task_L_AutoGetTo(0x10e056,2,11115,point,0,0)

		local point = {"",1,100,29873,11680,516}
		Task_L_TalkToNpc(0x10e056,3,point,"Fortress Keeper Redford",0,1,1)

		if Task_L_FindTask(0x10e0bd) == 0 then
			--接受任务
			local point = {"Fortress Keeper Redford",1,100,29873,11680,516}
			Task_L_AcceptTask(0x10e056,4,0x10e0bd,point)
		end

		local point1 = {"",2,100,27113,12165,889}
		local point2 = {"",1,100,30898,8315,512}	
		if Task_L_LongGetTo(0x10e0bd,1,11115,2,point1,point2) then
			local point = {"",0,800,30898,8315,512}
			Task_L_LoopAttackMonMore(0x10e0bd,1,0,1,point)
		end

		if Task_L_GetTaskIsComplete(0x10e0bd) then
			local point1 = {"",1,100,29529,8085,512}
			local point2 = {"",1,100,29275,8787,635}
			local point3 = {"",1,100,28226,8753,893}
			local point4 = {"",2,100,27106,11457,898}
			local point5 = {"",1,100,30098,11942,512}	
			if Task_L_LongGetTo(0x10e0bd,1,11115,5,point1,point2,point3,point4,point5) then
				local point = {"",1,100,30098,11942,512}
				Task_L_CompleteTask(0x10e0bd,1,point,"Starkeeper Lucien",-1)
			end
		end

		if Task_L_FindTask(0x10e0bd) == 0 then
			local point = {"",1,100,30098,11942,512}
			Task_L_TalkToNpc(0x10e056,4,point,"Starkeeper Lucien",0,1,1)
		end

		local point1 = {"",2,100,27113,12165,889}
		local point2 = {"",1,100,27225,7795,512}	
		Task_L_LongGetTo(0x10e056,5,11115,2,point1,point2)

		if Fun_IsHaveTask(0x10e056,6) == 1 then
			local point = {"",0,3000,15030,12322,1002}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,16131,10067,775}
				local point2 = {"",1,100,21322,10036,512}	
				local point3 = {"",1,100,24446,9949,512}
				local point4 = {"",1,100,27910,7553,893}
				if Task_L_LongGetTo(0x10e056,6,11115,4,point1,point2,point3,point4) then
					local point1 = {"",0,800,27598,9780,1021}
					local point2 = {"",0,800,27296,8894,1021}
					Task_L_LoopAttackMonMore(0x10e056,6,1,2,point1,point2)
				end
			else
				local point1 = {"",0,800,27598,9780,1021}
				local point2 = {"",0,800,27296,8894,1021}
				Task_L_LoopAttackMonMore(0x10e056,6,1,2,point1,point2)
			end
		end

		if Fun_IsHaveTask(0x10e056,6) == 1 then
			local point = {"",0,3000,15030,12322,1002}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,16131,10067,775}
				local point2 = {"",1,100,21322,10036,512}	
				local point3 = {"",1,100,24446,9949,512}
				local point4 = {"",1,100,27910,7553,893}
				if Task_L_LongGetTo(0x10e056,6,11115,4,point1,point2,point3,point4) then
					local point = {"",1,800,27571,9967,1021}
					Task_L_LoopAttackMonMore(0x10e056,6,0,1,point)
				end
			else
				local point = {"",1,800,27571,9967,1021}
				Task_L_LoopAttackMonMore(0x10e056,6,0,1,point)
			end
		end

		if Fun_IsHaveTask(0x10e056,7) == 1 then
			local point = {"",0,3000,15030,12322,1002}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,16131,10067,775}
				local point2 = {"",1,100,21322,10036,512}	
				local point3 = {"",1,100,24446,9949,512}
				local point4 = {"",1,100,27910,7553,893}
				if Task_L_LongGetTo(0x10e056,7,11115,4,point1,point2,point3,point4) then
					local point1 = {"Collect",0,300,30791,8715,512}
					local point2 = {"Collect",1,300,30066,9161,512}
					local point3 = {"Collect",2,400,29348,9364,512}
					Task_L_BranchLine(0x10e056,7,3,point1,point2,point3)
				end
			else
				local point1 = {"Collect",0,300,30791,8715,512}
				local point2 = {"Collect",1,300,30066,9161,512}
				local point3 = {"Collect",2,400,29348,9364,512}
				Task_L_BranchLine(0x10e056,7,3,point1,point2,point3)
			end
		end


		local point = {"",1,100,30407,10047,1369}
		Task_L_AutoGetTo(0x10e056,8,11115,point,0,0)

		local point1 = {"",1,200,30486,10179,1369}	
		local point2 = {"",1,100,31794,10062,1383}
		Task_L_CarryItem(0x10e056,9,0,point1,point2)
	
		local point = {"",1,100,31491,10250,1369}
		Task_L_TalkToNpc(0x10e057,1,point,"Starkeeper Lucien",0,1,2)

		local point = {"",1,100,24911,13436,518}
		Task_L_AutoGetTo(0x10e057,2,11115,point,0,0)

		local point = {"",1,100,24911,13436,518}
		Task_L_TalkToNpc(0x10e057,3,point,"Thar",0,1,4)

		if Fun_IsHaveTask(0x10e058,1) == 1 then
			local point = {"",0,3000,15030,12322,1002}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,16131,10067,775}
				local point2 = {"",1,100,21322,10036,512}
				local point3 = {"",1,100,20115,17859,255}
				if Task_L_LongGetTo(0x10e058,1,11115,3,point1,point2,point3) then
					local point = {"",0,1000,20115,17859,255}
					Task_L_LoopAttackMonMore(0x10e058,1,0,1,point)
				end
			else
				local point = {"",0,1000,20115,17859,255}
				Task_L_LoopAttackMonMore(0x10e058,1,0,1,point)
			end
		end

		if Fun_IsHaveTask(0x10e058,2) == 1 then
			local point = {"",0,3000,15030,12322,1002}
			if Fun_IsInPoint(point) == 1 then
				local point1 = {"",10,100,16131,10067,775}
				local point2 = {"",1,100,21322,10036,512}
				local point3 = {"",1,100,20115,17859,255}
				if Task_L_LongGetTo(0x10e058,2,11115,3,point1,point2,point3) then
					local point = {"",0,1000,24448,21913,384}
					Task_L_LoopAttackMonMore(0x10e058,2,0,1,point)
				end
			else
				local point = {"",0,1000,24448,21913,384}
				Task_L_LoopAttackMonMore(0x10e058,2,0,1,point)
			end
		end

		--开传送阵
		local point = {"Hideout Entrance",1,100,22307,25063,558}
		if Task_L_OpenTranMission(0x10e058,3,point) == 1 then
			local point = {"",0,1000,16866,26579,769}
			Task_L_LoopAttackMonMore(0x10e058,3,0,1,point)
		end

		local point = {"",1,100,21963,25442,512}
		Task_L_Collection(0x10e058,4,point)

		local point = {"",0,1000,23789,27609,1024}
		Task_L_LoopAttackMonMore(0x10e058,5,0,1,point)

		local point = {"",1,300,26146,26780,1024}
		Task_L_TalkToNpc(0x10e058,6,point,"Thar",0,1,5)

		----------------------------------------------------
		if Fun_IsHaveTask(0x10e058,7) == 1 then
			Fun_SetBackHomeInfo(80, 20,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,3000,14728,10613,768}
				if Fun_IsInPoint(point) == 0 then
					local point = {"",1,100,13559,12167,943}
					Task_L_UseTransmitPoint(0x10e058,7,"Lighthouse Village",point)
				else
					Task_L_LoopEquipFun()

					local point = {"Narieta",1,100, 14891,11148,768}
					Task_L_BuyItem(0x10e058,7,50,7,"Super Healing Potion",point)
					Task_L_PushDwonDrug(0x10e058,7,"Super Healing Potion")

					local BackHomeInfo = {
						0, --1比较小地图
						"Balankar Mountains", --大地图
						"Starkeeper's House", --小地图
						"Starkeeper's House", --传送阵
						{ 15247,9230,768 }, --修理NPC坐标
						{ 14891,11148,768 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			else
				local point = {"",1,3000,14728,10613,768}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,22307,25063,558}
					Task_L_UseTransmitPoint(0x10e058,7,"Hideout Entrance",point)
				else
					--进入普通副本   11152
					local point = {"",1,100,25901,26802,1025}	
					if Task_L_LongGetTo(0x10e058,7,11115,1,point) then
						local point = {"",1,100,26400,26577,1064}
						Task_L_AutoGetTo(0x10e058,7,11115,point,2,0x2B90) 
					end
				end
			end
		end


		Task_L_UseTransmit(0x10cccc,1,"Rania Village","Rania Village")
	end
	---------------------------------------------------------------------------
	--第6张
	if Fun_IsInMapByMapId(11112) then
		GlobalFun(0)

		local point = {"Adventurer Bjorn",1,300,1531,7344,0}  
		Task_L_BranchTalkToNpc(0x10dccd,1,0,point)

		local point = {"Adventurer Selfa",1,300,1531,7344,0}  
		Task_L_BranchTalkToNpc(0x10dccd,1,1,point)

		local point = {"Adventurer Wuul",1,300,1531,7344,0}  
		Task_L_BranchTalkToNpc(0x10dccd,1,2,point)

		local point = {"",0,800,5624,8241,512}	
		Task_L_LoopAttackMonMore(0x10dccd,2,0,1,point)

		local point = {"",0,800,5624,8241,512}	
		Task_L_LoopAttackMonMore(0x10dccd,2,1,1,point)
		
		if Task_L_GetTaskIsComplete(0x10dccd) then
			local point = {"",1,300,6165,14276,256}
			Task_L_CompleteTask(0x10dccd,2,point,"Terrified Adventurer",-1)
		end

		--------------------------
		local point = {"",1,1000,6165,14276,256}
		if Fun_IsInPoint(point) == 1 then 
			if Task_L_FindTask(0x10dcce) == 0 then
				if GetTaskAlreadyComplete(0x10dcce) == 0 then
					--接受任务
					local point = {"Terrified Adventurer",1,100,6165,14276,256}
					Task_L_AcceptTask(0x10cccb,1,0x10dcce,point)
				end
			end
		end
		--------------------------
		local point1 = {"",0,800,6172,12796,256}	
		local point2 = {"",0,800,5579,11868,256}
		Task_L_LoopAttackMonMore(0x10dcce,1,0,2,point1,point2)

		local point = {"",1,300,8917,12821,-1}
		Task_L_TalkToNpc(0x10dcce,2,point,"Adventurer Bjorn",0,1,2)

		if GetTaskAlreadyComplete(0x10dcd8) == 0 then
			local point = {"Zaharanod",1,100,9221,15329,0}
			Task_L_AcceptTask(0x10dcce,3,0x10dcd8,point)
		end

		local point = {"",1,300,11762,16398,-1}
		Task_L_TalkToNpc(0x10dcce,3,point,"Jas",0,1,1)

		local point = {"",1,300,11762,16398,-1}
		Task_L_TalkToNpc(0x10dcce,4,point,"Wuul's Corpse",0,1,1)

		if Task_L_GetTaskIsComplete(0x10dcce) then
		else
			local point1 = {"",2,100,12484,14849,19}
			local point2 = {"",2,100,13970,14582,-1018}
			local point3 = {"",1,100,15562,15718,-1008}
			if Task_L_LongGetTo(0x10dcce,5,11112,3,point1,point2,point3) then
				--开传送阵
				local point = {"Parna's Sanctum",1,100,13948,16113,-970}
				if Task_L_OpenTranMission(0x10dcce,5,point) == 1 then
					local point = {"",1,300,15562,15718,-1008}
					Task_L_TalkToNpc(0x10dcce,5,point,"Adventurer Selfa",0,1,7)
				end
			end
		end

		local point1 = {"",2,100,12484,14849,19}
		local point2 = {"",2,100,13970,14582,-1018}
		local point3 = {"",1,100,15562,15718,-1008}
		local point4 = {"",1,100,15712,15978,-1008}
		Task_L_LongGetTo(0x10dcd8,1,11112,4,point1,point2,point3,point4)

		local point = {"",1,100,15712,15978,-1008}
		Task_L_UseTaskItem(0x10dcd8,2,point)

		if Task_L_GetTaskIsComplete(0x10dcd8) then
			local point = {"",1,300,15712,15978,-1008}
			Task_L_CompleteTask(0x10dcd8,2,point,"Siananod",-1)
		end

		if Task_L_GetTaskIsComplete(0x10dcce) then
			local point = {"",1,300,15328,16059,-1014}
			Task_L_CompleteTask(0x10dcce,5,point,"Elder Balu",-1)

			Fun_Sleep(2000)


		end

		--------------------------
		local point = {"",1,1000,15328,16059,-1014}
		if Fun_IsInPoint(point) == 1 then 
			if Task_L_FindTask(0x10dccf) == 0 then
				if GetTaskAlreadyComplete(0x10dccf) == 0 then
					--接受任务
					local point = {"Elder Balu",1,100,15328,16059,-1014}
					Task_L_AcceptTask(0x10cccb,1,0x10dccf,point)
				end
			end
		end
		--------------------------
		
		local point = {"",1,100,15562,15718,-1008}
		Task_L_TalkToNpc(0x10dccf,1,point,"Adventurer Selfa",0,1,6)

		local point = {"",1,100,15001,16157,-1024}
		Task_L_TalkToNpc(0x10dccf,2,point,"Jas",0,1,2)

		local point = {"",1,100,15562,15718,-1008}
		Task_L_TalkToNpc(0x10dccf,3,point,"Adventurer Selfa",0,1,5)

		if Task_L_GetTaskIsComplete(0x10dccf) then
			local point = {"",1,300,15328,16059,-1014}
			Task_L_CompleteTask(0x10dccf,3,point,"Elder Balu",-1)
		end

		if Task_L_FindTask(0x10dccd) == 0 and
		   Task_L_FindTask(0x10dcd8) == 0 and 
		   Task_L_FindTask(0x10dcce) == 0 and 
		   Task_L_FindTask(0x10dccf) == 0 
		   then
			if GetTaskAlreadyComplete(0x10dcef) == 0 then
				local point = {"Warrior Nedoru",1,100,16073,8413,-512}
				Task_L_AcceptTask(0x10cccb,1,0x10dcef,point)
			end
		end

		if Task_L_GetTaskIsComplete(0x10dcef) then
			local point1 = {"",1,100,12364,8233,-896}
			local point2 = {"",1,100,16073,8413,-512}
			if Task_L_LongGetTo(0x10dcef,1,11112,2,point1,point2) then
				local point = {"",1,300,16073,8413,-512}
				Task_L_CompleteTask(0x10dcef,1,point,"Warrior Nedoru",-1)
			end
		else
			local point = {"Rafter Nalu",1,300,14807,7783,-512}  
			Task_L_BranchTalkToNpc(0x10dcef,1,0,point)

			local point1 = {"",1,100,16073,8413,-512}
			local point2 = {"",1,100,20915,7020,-867} 
			if Task_L_LongGetTo(0x10dcef,1,11112,2,point1,point2) then
				local point = {"Rafter Shez",1,300,20915,7020,-867}  
				Task_L_BranchTalkToNpc(0x10dcef,1,2,point)
			end

			local point1 = {"",1,100,16073,8413,-512}
			local point2 = {"",1,100,12364,8233,-896}
			local point3 = {"",1,100,14331,4637,-899} 
			if Task_L_LongGetTo(0x10dcef,1,11112,3,point1,point2,point3) then
				local point = {"Rafter Duth",1,300,14331,4637,-899} 
				Task_L_BranchTalkToNpc(0x10dcef,1,1,point)
			end
		end
		if Task_L_FindTask(0x10dccd) == 0 and
		   Task_L_FindTask(0x10dcd8) == 0 and 
		   Task_L_FindTask(0x10dcce) == 0 and 
		   Task_L_FindTask(0x10dcef) == 0 and 
		   Task_L_FindTask(0x10dccf) == 0 
		   then 
			Task_L_UseTransmit(0x10cccb,1,"Rania Village","Rania Village")
		end

	end
	---------------------------------------------------------------------------
	--第7张
	if Fun_IsInMapByMapId(11114) then
		GlobalFun(0)

		local point1 = {"",0,300,5087,2060,1280}
		local point2 = {"",0,300,5508,2016,1280}
		Task_L_LoopCollectMore(0x10d4fd,3,0,2,point1,point2)

		local point = {"",0,300,5414,2215,1280}
		Task_L_Collection(0x10d4fd,4,point)

				
		if Task_L_GetTaskIsComplete(0x10d4fd) then
			local point = {"",1,300,5938,2645,1280}
			Task_L_CompleteTask(0x10d4fd,4,point,"Billy",-1)
			Fun_Sleep(2000)
			local point = {"Billy",1,100,5938,2645,1280}
			Task_L_AcceptTask(0x10cccb,1,0x10d4fe,point)--50金
		end

		--------------------------
		local point = {"",1,1000,5938,2645,1280}
		if Fun_IsInPoint(point) == 1 then 
			if Task_L_FindTask(0x10d4fe) == 0 then
				if GetTaskAlreadyComplete(0x10d4fe) == 0 then
					--接受任务
					local point = {"Billy",1,100,5938,2645,1280}
					Task_L_AcceptTask(0x10cccb,1,0x10d4fe,point)--50金
				end
			end
		end
		--------------------------

		local point = {"",1,100,6658,6844,1536}
		Task_L_LongGetTo(0x10d4fe,1,11114,1,point)

		local point = {"",1,300,6658,6844,1536}
		Task_L_TalkToNpc(0x10d4fe,2,point,"Dying Ranger",0,1,1)

		local point = {"",0,300,4991,7566,1280}
		Task_L_Collection(0x10d4fe,3,point)

		local point = {"",0,300,1868,6661,1280}
		Task_L_Collection(0x10d4fe,4,point)

		local point = {"",0,300,971,7112,1280}
		Task_L_Collection(0x10d4fe,5,point)

		local point = {"",1,100,2132,8560,1536}
		if Task_L_LongGetTo(0x10d4fe,6,11114,1,point) then
			local point = {"",0,300,-891,11759,2847}
			Task_L_Collection(0x10d4fe,6,point)
		end

		local point = {"",1,300,797,13078,2847}
		Task_L_TalkToNpc(0x10d4fe,7,point,"Payla",0,1,1)

		local point = {"",1,300,916,12872,2847}
		Task_L_TalkToNpc(0x10d4fe,8,point,"Billy",0,1,1)

		if Task_L_GetTaskIsComplete(0x10d4fe) then
			local point = {"",1,50,2823,11866,2562}
			Task_L_CompleteTask(0x10d4fe,8,point,"Guild Scribe Rotisha",-1)
			Fun_Sleep(2000)
			local point = {"Billy",1,100,916,12872,2847}
			Task_L_AcceptTask(0x10cccb,1,0x10d4ff,point)
		end

		--------------------------
		local point = {"",1,1000,916,12872,2847}
		if Fun_IsInPoint(point) == 1 then 
			if Task_L_FindTask(0x10d4ff) == 0 then
				if GetTaskAlreadyComplete(0x10d4ff) == 0 then
					--接受任务
					local point = {"Billy",1,100,916,12872,2847}
					Task_L_AcceptTask(0x10cccb,1,0x10d4ff,point)
				end
			end
		end
		--------------------------

		local point1 = {"",2,100,4954,13205,2830}
		local point2 = {"",2,100,8718,13042,2961}
		local point3 = {"",2,100,10131,14165,2835}
		local point4 = {"",1,100,8884,15993,1536}	
		if Task_L_LongGetTo(0x10d4ff,1,11114,4,point1,point2,point3,point4) then
			local point1 = {"Collect",0,500,9658,15426,1536}
			local point2 = {"Collect",1,500,8820,16158,1536}
			Task_L_BranchLine(0x10d4ff,1,2,point1,point2)
		end

		local point = {"",1,300,9920,18256,1536}
		Task_L_TalkToNpc(0x10d4ff,2,point,"Payla",0,1,2)
		
		if Task_L_GetTaskIsComplete(0x10d4ff) then
			local point = {"",1,300,18233,22866,1536}
			Task_L_CompleteTask(0x10d4ff,3,point,"Payla",-1)

			Fun_Sleep(2000)
			local point = {"Payla",1,100,18233,22866,1536}
			Task_L_AcceptTask(0x10cccb,1,0x10d500,point)--50金
		else
			local point = {"",1,100,12394,21976,1273}
			Task_L_LongGetTo(0x10d4ff,3,11114,1,point)
		end

		--------------------------
		local point = {"",1,1000,18233,22866,1536}
		if Fun_IsInPoint(point) == 1 then 
			if Task_L_FindTask(0x10d4ff) == 0 then
				if GetTaskAlreadyComplete(0x10d500) == 0 then
					--接受任务
					local point = {"Payla",1,100,18233,22866,1536}
					Task_L_AcceptTask(0x10cccb,1,0x10d500,point)--50金
				end
			end
		end
		--------------------------

		local point1 = {"",0,900,19919,25241,1280}	
		local point2 = {"",0,900,17330,25933,1280}	
		Task_L_LoopAttackMonMore(0x10d500,1,0,2,point1,point2)

		local point1 = {"",1,100,21209,25010,1280}
		local point2 = {"",1,100,25484,20090,1536}
		local point3 = {"",1,100,25921,13104,1280}
		if Task_L_LongGetTo(0x10d500,2,11114,3,point1,point2,point3) then
			local point = {"",1,300,25921,13104,1280}
			Task_L_TalkToNpc(0x10d500,2,point,"Adventurer Iryl",0,1,1)
		end

		local point1 = {"",1,100,21202,11084,1280}
		local point2 = {"",1,100,18896,12518,1280}
		Task_L_LongGetTo(0x10d500,3,11114,2,point1,point2)

		local point1 = {"",2,100,19101,12686,1280}
		local point2 = {"",1,100,14408,17677,1789}
		Task_L_LongGetTo(0x10d500,4,11114,3,point1,point2) 

		local point = {"",1,300,17784,20660,1796}
		Task_L_TalkToNpc(0x10d500,5,point,"Hurum",0,1,1)

		local point = {"",0,300,17943,20830,1792}
		Task_L_LoopCollectMore(0x10d500,6,0,1,point)

		local point1 = {"",0,300,16219,19486,1792}
		local point2 = {"",0,300,18844,20297,1792}
		Task_L_LoopCollectMore(0x10d500,6,1,2,point1,point2)

		local point = {"",1,300,17784,20660,1796}
		Task_L_TalkToNpc(0x10d500,7,point,"Hurum",0,1,2)

		if Task_L_GetTaskIsComplete(0x10d500) then
			local point1 = {"",2,100,18905,22340,1794}
			local point2 = {"",1,100,18203,22889,1536}
			if Task_L_LongGetTo(0x10d500,7,11114,2,point1,point2) then
				local point = {"",1,300,18203,22889,1536}
				Task_L_CompleteTask(0x10d500,7,point,"Payla",-1)
			end
		end
		if Task_L_FindTask(0x10d500) == 0 and
		   Task_L_FindTask(0x10d4ff) == 0 and 
		   Task_L_FindTask(0x10d4fe) == 0 and 
		   Task_L_FindTask(0x10d4fd) == 0 
		   then 
			Task_L_UseTransmit(0x10cccb,1,"Rania Village","Rania Village")
		end
	end
	---------------------------------------------------------------------------
	-------------------------------休沙瑞--------------------------------------
	---------------------------------------------------------------------------
	--第1张
	if Fun_IsInMapByMapId(10321) then
		GlobalFun(0)

		local point = {"",0,100,-12213,4460,243}
		Task_L_LoopCollectMore(0x62e09,1,1,1,point)

		local point = {"",0,100,-11730,4293,244}
		Task_L_LoopCollectMore(0x62e09,1,0,1,point)

		local point = {"Dock",0,100,-11373,4913,275}
		if Task_L_OpenTranMission(0x62e09,2,point) == 1 then
			local point = {"",0,100,-10670,5498,239}
			Task_L_LongGetTo(0x62e09,2,10321,1,point)
		end

		local point = {"",1,100,-10066,5343,241}
		Task_L_TalkToNpc(0x62e09,3,point,"Porter Cory",0,1,1)

		local point1 = {"",1,200,-9858,5328,241}	
		local point2 = {"",1,100,-8900,8652,497}		
		Task_L_CarryItem(0x62e09,4,0,point1,point2)

		local point = {"",1,100,-8864,8603,497}
		Task_L_TalkToNpc(0x62e09,5,point,"Manager Celemos",0,1,1)

		local point = {"",1,100,-9251,9178,497}
		Task_L_TalkToNpc(0x62e09,6,point,"Sidereal Shandi",0,1,1)

		local point = {"",1,100,-9037,9247,497}
		Task_L_TalkToNpc(0x62e09,7,point,"Roehn",0,1,1)

		local point = {"",0,1000,-6055,12934,493}
		Task_L_LoopAttackMonMore(0x62e0a,1,0,1,point)

		local point = {"Shadow Market",0,100,-8510,15661,915}
		if Task_L_OpenTranMission(0x62e0a,2,point) == 1 then
			local point = {"",1,100,-8394,17435,881}
			Task_L_TalkToNpc(0x62e0a,2,point,"Dyson",0,1,1)
		end

		if Fun_IsHaveTask(0x62e0a,3) == 1 then
			Task_L_LoopEquipFun()
			local point = {"Glynis",1,100, -9530,13632,497}
			Task_L_BuyItem(0x62e0a,3,50,7,"Super Healing Potion",point)

			Fun_SetBackHomeInfo(90, 30,0,0)

			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Frozen Sea", --大地图
					"Frozen Sea", --小地图
					"Shadow Market", --传送阵
					{ -7816,16198,881 }, --修理NPC坐标
					{ -9530,13632,497 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		--进入剧情副本   10334
		local point = {"",1,100,-7991,18764,881}	
		if Task_L_LongGetTo(0x62e0a,3,10321,1,point) then
			local point = {"",1,100,-8046,19343,884}
			Task_L_AutoGetTo(0x62e0a,3,10321,point,1,10334) 
		end

		local point = {"",1,100,-11511,16742,241}
		Task_L_TalkToNpc(0x62e0a,4,point,"Daybreaker Gabel",0,1,1)

		local point = {"",1,100,-10030,13374,500}
		Task_L_TalkToNpc(0x62e0a,5,point,"Dyson",0,1,1)

		local point = {"",1,100,-16131,18833,-15}
		Task_L_TalkToNpc(0x62e0b,1,point,"Daybreaker Ness",0,1,1)

		local point = {"Sea Ranch",0,100,-22797,19415,33}
		if Task_L_OpenTranMission(0x62e0b,2,point) == 1 then
			local point = {"",1,100,-22008,19974,-4}
			Task_L_TalkToNpc(0x62e0b,2,point,"Daybreaker Roehn",0,1,1)
		end

		local point1 = {"",0,1000,-22376,23410,-5}
		local point2 = {"",0,1000,-22223,24791,-7}
		local point3 = {"",0,1000,-22887,26700,-3}
		Task_L_LoopAttackMonMore(0x62e0b,3,0,3,point1,point2,point3)

		local point = {"",0,300,-23922,25672,-3}
		Task_L_Collection(0x62e0b,4,point)

		local point = {"",1,100,-23922,25672,-3}
		Task_L_TalkToNpc(0x62e0b,5,point,"Rancher Jude",0,1,1)

		local point = {"",1,100,-28606,27939,-7}	
		Task_L_LongGetTo(0x631f1,1,10321,1,point)

		if Fun_IsHaveTask(0x452019,2) == 1 then
			MSG("Lei  准备坐船回贝隆")
			local point = {"",1,100,-12052,2429,240}
			Fun_L_InShip(11111,10321,point)
		end

	end
	---------------------------------------------------------------------------
	--第2张
	if Fun_IsInMapByMapId(10301) then
		GlobalFun(0)

		local point = {"",1,100,11440,5057,770}
		Task_L_TalkToNpc(0x631f1,1,point,"Daybreaker Liben",0,1,1)

		local point = {"",1,100,10987,6186,768}
		Task_L_TalkToNpc(0x631f1,2,point,"Merchant Treadwich",0,1,1)

		local point = {"",0,300,9145,6168,1029}
		Task_L_LoopCollectMore(0x631f1,3,0,1,point)

		local point = {"",0,100,6792,6893,1216}
		Task_L_LoopCollectMore(0x631f1,3,1,1,point)

		local point = {"Rigens Village",0,100,7139,4980,1252}
		if Task_L_OpenTranMission(0x631f1,4,point) == 1 then
			local point = {"",0,300,6868,5336,1216}
			Task_L_Collection(0x631f1,4,point)
		end

		local point = {"",0,100,6868,5336,1216}
		Task_L_TalkToNpc(0x631f1,5,point,"Ramis",0,1,1)

		local point = {"",0,100,6132,6420,1216}
		Task_L_TalkToNpc(0x631f2,1,point,"Daybreaker Javern",0,1,1)

		--进入剧情副本
		local point = {"",0,100,6753,6428,1216}
		Task_L_TalkToNpc(0x631f2,2,point,"Madnick",0,1,1)

		--异常情况
		--进入剧情副本   10333
		local point = {"",1,100,8062,8748,1216}	
		if Task_L_LongGetTo(0x631f2,3,10301,1,point) then
			local point = {"",1,100,8605,8885,1204}
			Task_L_AutoGetTo(0x631f2,3,10301,point,1,10333) 
		end

		local point = {"",0,300,5298,5752,1216}
		Task_L_LoopCollectMore(0x631f3,1,0,1,point)

		local point = {"",0,300,4676,2842,1024}
		Task_L_LoopCollectMore(0x631f3,1,2,1,point)

		local point = {"",0,300,6530,1884,960}
		Task_L_LoopCollectMore(0x631f3,1,1,1,point)

		local point = {"",0,100,6132,6420,1216}
		Task_L_TalkToNpc(0x631f3,2,point,"Daybreaker Javern",0,1,2)

		local point = {"",1,100,808,5196,768}	
		Task_L_LongGetTo(0x635d9,1,10301,1,point)

		local point = {"",0,100,6771,6352,1216}
		Task_L_TalkToNpc(0x631f4,1,point,"Madnick",0,1,2)

		local point = {"",0,100,6132,6420,1216}
		Task_L_TalkToNpc(0x631f4,2,point,"Daybreaker Javern",0,1,3)

		local point = {"",0,100,6210,6442,1216}
		Task_L_UseTaskItem(0x631f4,3,point)

		local point = {"",0,100,6210,6442,1216}
		Task_L_UseExpression(0x631f4,4,"Ask",point)

		local point = {"",0,100,6210,6442,1216}
		Task_L_TalkToNpc(0x631f4,5,point,"Daybreaker Javern",0,1,4)

		
		local point = {"Daybreaker Trevis",2,100,5285,5797,1216}
		Task_L_BranchTalkToNpc(0x631f4,6,2,point)

		local point = {"Daybreaker Roehn",1,100,4184,3736,1024}
		Task_L_BranchTalkToNpc(0x631f4,6,0,point)

		local point = {"Daybreaker Liben",1,100,9689,2287,1029}
		Task_L_BranchTalkToNpc(0x631f4,6,1,point)

		if Fun_IsHaveTask(0x631f6,1) == 1 then
			local point = {"",1,1000,9689,2287,1029}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",0,100,7139,4980,1252}
				Task_L_UseTransmitPoint(0x631f6,1,"Rigens Village",point)
			end

			local point = {"",0,100,6844,5335,1216}
			Task_L_TalkToNpc(0x631f6,1,point,"Ramis",0,1,3)
		end

		local point = {"",0,100,6210,6442,1216}
		Task_L_TalkToNpc(0x631f6,2,point,"Daybreaker Javern",0,1,5)

		Task_L_UseTransmit(0x631f6,3,"Abandoned Outpost","Bitterwind Hill")

		local point = {"Priest Lordrim",1,100,5892,4622,1216}  
		Task_L_BranchTalkToNpc(0x631f5,1,1,point)

		local point = {"Daybreaker Trevis",1,100,5283,5741,1216}  
		Task_L_BranchTalkToNpc(0x631f5,1,0,point)

		local point = {"",0,100,6844,5335,1216}
		Task_L_TalkToNpc(0x631f5,2,point,"Ramis",0,1,2)

		--进入剧情副本   10337
		local point = {"",1,100,8062,8748,1216}	
		if Task_L_LongGetTo(0x631f5,3,10301,1,point) then
			local point = {"",1,100,8605,8885,1204}
			Task_L_AutoGetTo(0x631f5,3,10301,point,1,10337) 
		end

		local point = {"",0,100,1955,4871,768}
		Task_L_TalkToNpc(0x631f7,1,point,"Sidereal Shandi",0,1,1)

		if Task_L_GetTaskIsComplete(0x631f7) then
			local point = {"",0,100,1955,4871,768}
			Task_L_CompleteTask(0x631f7,2,point,"Sidereal Shandi",-1)
		end
		---这里全部任务做完 自动添加了一个冒险任务
		Task_L_UseTransmit(0x452019,2,"Dock","Frozen Sea")
	end
	---------------------------------------------------------------------------
	--第3张
	if Fun_IsInMapByMapId(10322) then
		GlobalFun(0)

		local point = {"Abandoned Outpost",0,100,24500,14368,3184}
		if Task_L_OpenTranMission(0x635d9,1,point) == 1 then
			local point = {"",1,100,24589,13957,3139}
			Task_L_TalkToNpc(0x635d9,1,point,"Daybreaker Ness",0,1,1)
		end

		local point = {"",1,100,22081,13100,3276}
		Task_L_TalkToNpc(0x635d9,2,point,"Daybreaker Joniah",0,1,1)

		local point = {"",1,100,17240,9487,3792}
		Task_L_TalkToNpc(0x635d9,3,point,"Daybreaker Trevis",0,1,3)

		local point = {"",1,100,17240,9487,3792}
		Task_L_TalkToNpc(0x635da,1,point,"Daybreaker Trevis",0,1,1)

		local point = {"",1,100,17594,9774,3792}
		Task_L_TalkToNpc(0x635da,2,point,"Vrad's Supplier",0,1,4)

		local point1 = {"",1,500,17893,9999,3791}
		local point2 = {"",1,500,17831,9438,3793}
		Task_L_LoopAttackMonMore(0x635da,3,0,2,point1,point2)

		local point = {"",1,100,17594,9774,3792}
		Task_L_TalkToNpc(0x635da,4,point,"Vrad's Supplier",0,1,2)

		local point1 = {"",1,500,17592,10110,3791}
		local point2 = {"",1,500,18088,9687,3793}
		Task_L_LoopAttackMonMore(0x635da,5,0,2,point1,point2)

		local point = {"",1,100,17594,9774,3792}
		Task_L_TalkToNpc(0x635da,6,point,"Vrad's Supplier",0,1,3)

		local point = {"",1,100,17240,9487,3792}
		Task_L_TalkToNpc(0x635da,7,point,"Daybreaker Trevis",0,1,2)

		local point1 = {"",1,200,16633,7064,3791}	
		local point2 = {"",1,100,17379,4535,3931}		
		Task_L_CarryItem(0x635da,8,0,point1,point2)

		local point = {"",1,100,17331,4620,3929}
		Task_L_TalkToNpc(0x635da,9,point,"Wilbur",0,1,1)

		local point = {"Bitterwind Hill Post",0,100,15931,5332,3960}
		if Task_L_OpenTranMission(0x635da,10,point) == 1 then
			local point = {"",0,300,15362,5411,3924}
			Task_L_Collection(0x635da,10,point)
		end

		local point = {"",1,100,15362,5411,3924}
		Task_L_TalkToNpc(0x635db,1,point,"Imprisoned Gladiator Liben",0,1,1)

		local point1 = {"",1,200,15948,4582,3928}	
		local point2 = {"",1,100,17395,4572,3929}		
		Task_L_CarryItem(0x635db,2,0,point1,point2)

		local point = {"",1,100,17331,4620,3929}
		Task_L_TalkToNpc(0x635db,3,point,"Wilbur",0,1,2)

		local point = {"",1,100,15362,5411,3924}
		Task_L_TalkToNpc(0x635db,4,point,"Imprisoned Gladiator Liben",0,1,2)

		local point = {"",1,100,17417,4503,3929}
		Task_L_Collection(0x635db,5,point)

		if Fun_IsHaveTask(0x635dc,1) == 1 then
			Task_L_LoopEquipFun()
			local point = {"Jaina",1,100, 17416,5345,3930}
			Task_L_BuyItem(0x635dc,1,50,7,"Super Healing Potion",point)

			Fun_SetBackHomeInfo(90, 30,0,0)

			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Bitterwind Hill", --大地图
					"Bitterwind Hill", --小地图
					"Bitterwind Hill Post", --传送阵
					{ 17172,5499,3929 }, --修理NPC坐标
					{ 17416,5345,3930 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		--这里需要玩家手动了。
		--进入剧情副本   10331
		local point = {"",1,100,17300,4547,3931}	
		if Task_L_LongGetTo(0x635dc,1,10322,1,point) then
			local point = {"",1,100,17355,4120,3945}
			Task_L_AutoGetTo(0x635dc,1,10322,point,1,10331) 
		end

		local point = {"",1,100,16890,5498,3922}
		Task_L_TalkToNpc(0x635dd,1,point,"Daybreaker Javern",0,1,1)

		local point = {"",1,100,17388,4899,3928}
		Task_L_TalkToNpc(0x635dd,2,point,"Madnick",0,1,1)

		local point = {"",1,300,16030,8041,3790}
		Task_L_TalkToNpc(0x635dd,3,point,"Daybreaker Trevis",0,1,1)
		
		local point = {"",1,300,13480,10332,3791}
		Task_L_TalkToNpc(0x635dd,4,point,"Priest Lordrim",0,1,1)

		--进入剧情副本   10338
		local point = {"",1,100,13280,12078,3797}	
		if Task_L_LongGetTo(0x635dd,5,10322,1,point) then
			local point = {"",1,100,13613,12463,3793}
			Task_L_AutoGetTo(0x635dd,5,10322,point,1,10338) 
		end

		local point = {"",1,300,13480,10332,3791}
		Task_L_TalkToNpc(0x635de,1,point,"Priest Lordrim",0,1,2)

		local point = {"",1,300,14401,8215,3790}
		Task_L_TalkToNpc(0x635de,2,point,"Daybreaker Trevis",0,1,1)

		local point = {"",1,300,12792,6721,3727}
		Task_L_Collection(0x635de,3,point)

		local point = {"",1,300,12223,6529,3696}
		Task_L_Collection(0x635de,4,point)

		local point = {"",1,300,11317,6756,3574}
		Task_L_Collection(0x635de,5,point)

		local point = {"",1,300,10672,6609,3495}
		Task_L_Collection(0x635de,6,point)

		local point = {"",1,100,9880,6364,3434}	
		Task_L_LongGetTo(0x635de,7,10322,1,point)

		local point = {"",1,300,9880,6364,3434}	
		Task_L_Collection(0x635de,8,point)

		local point = {"",1,300,9529,6435,3418}
		Task_L_Collection(0x635df,1,point)

		local point = {"",1,300,9880,6364,3434}	
		Task_L_Collection(0x635df,2,point)

		local point = {"",1,300,9880,6364,3434}	
		Task_L_TalkToNpc(0x635df,3,point,"Unconscious Woman",0,1,4)

		local point = {"",1,300,9880,6364,3434}	
		Task_L_Collection(0x635df,4,point)

		local point = {"",1,300,9880,6364,3434}	
		Task_L_TalkToNpc(0x635df,5,point,"Conscious Sarah",0,1,2)

		local point = {"Bitterwind Hill Post",0,100,7117,11236,3166}
		if Task_L_OpenTranMission(0x639c1,1,point) == 1 then
			local point = {"",0,100,5863,7477,3183}
			Task_L_Collection(0x639c1,1,point)
		end

		local point = {"",1,100,16634,4479,3924}
		Task_L_TalkToNpc(0x635e0,1,point,"Daybreaker Javern",0,1,1)


		if Fun_IsHaveTask(0x635e0,2) == 1 then
			Task_L_LoopEquipFun()
			local point = {"Jaina",1,100, 17416,5345,3930}
			Task_L_BuyItem(0x635e0,2,50,7,"Super Healing Potion",point)

			Fun_SetBackHomeInfo(90, 30,0,0)

			if Fun_IsNeedBackHome() == 1 then
				MSG("LYlua 进入了修理函数")
				local BackHomeInfo = {
					0, --1比较小地图
					"Bitterwind Hill", --大地图
					"Bitterwind Hill", --小地图
					"Bitterwind Hill Post", --传送阵
					{ 17172,5499,3929 }, --修理NPC坐标
					{ 17416,5345,3930 } --买卖NPC坐标
				}
				Fun_BackHome(BackHomeInfo)
			end
		end

		--进入剧情副本   10332
		local point = {"",1,100,16822,4381,3931}	
		if Task_L_LongGetTo(0x635e0,2,10322,1,point) then
			local point = {"",1,100,16660,4100,3931}
			Task_L_AutoGetTo(0x635e0,2,10322,point,1,10332) 
		end

		Task_L_UseTransmit(0x631f4,1,"Rigens Village","Rigens Village")

		local point = {"",1,100,24052,17863,3493}
		Task_L_TalkToNpc(0x631f6,3,point,"Graymoon Dietrich",0,1,1)

		local point = {"",1,100,24052,17863,3493}
		Task_L_TalkToNpc(0x631f6,4,point,"Daybreaker Joniah",0,1,1)

		local point = {"",1,100,27785,16570,3114}	
		Task_L_LongGetTo(0x63da9,1,10322,1,point)
	end
	---------------------------------------------------------------------------
	--第4张
	if Fun_IsInMapByMapId(10324) then
		GlobalFun(0)

		local point = {"",1,300,22890,5519,384}	
		Task_L_TalkToNpc(0x639c1,2,point,"Lumberjack Volbeck",0,1,1)

		local point = {"",1,300,19086,8948,222}	
		Task_L_TalkToNpc(0x639c1,3,point,"Shandi",0,1,1)
		
		local point = {"",1,300,19086,8948,222}	
		Task_L_UseExpression(0x639c1,4,"Sorry",point)

		local point = {"",0,300,19086,8948,222}	
		Task_L_Collection(0x639c1,5,point)

		local point = {"",1,300,19086,8948,222}	
		Task_L_TalkToNpc(0x639c1,6,point,"Shandi",0,1,2)

		local point = {"Lakeside Fishing Spot",0,100,19111,5281,421}
		if Task_L_OpenTranMission(0x639c2,1,point) == 1 then
			local point = {"",1,100,17066,2262,384}	
			Task_L_TalkToNpc(0x639c2,1,point,"Lumberjack Fahr",0,1,1)
		end

		local point = {"",1,100,17066,2262,384}	
		Task_L_TalkToNpc(0x639c2,2,point,"Lumberjack Fahr",0,1,2)

		local point = {"",0,100,16211,3185,512}	
		Task_L_Collection(0x639c2,3,point)

		local point = {"",0,300,15462,4965,512}	
		Task_L_Collection(0x639c2,4,point)

		local point = {"",1,300,15462,4965,512}	
		Task_L_TalkToNpc(0x639c2,5,point,"Zinnervale",0,1,1)

		if Fun_IsHaveTaskBranch(0x639c3,1,1) == 1 then
			local point1 = {"",2,100,14740,6584,510}
			local point2 = {"",2,100,14690,7128,1026}
			local point3 = {"",2,100,14472,7899,1544}
			if Task_L_LongGetTo(0x639c3,1,10324,3,point1,point2,point3) then
				local point = {"Watcher Dorfman",1,100,14472,7899,1544} 
				Task_L_BranchTalkToNpc(0x639c3,1,1,point)
			end
		else
			local point = {"Guard Nadal",1,300,11263,5737,2051} 
			Task_L_BranchTalkToNpc(0x639c3,1,0,point)
		end

		--进入剧情副本   10335
		local point = {"",1,100,9558,3661,2304}	
		if Task_L_LongGetTo(0x639c3,2,10324,1,point) then
			local point = {"",1,100,9548,3143,2354}
			Task_L_AutoGetTo(0x639c3,2,10324,point,1,10335) 
		end

		local point = {"",1,300,10614,10617,3841}	
		Task_L_TalkToNpc(0x639c3,3,point,"Nadal",0,1,1)

		local point = {"",0,100,10663,10823,3841}	
		Task_L_Collection(0x639c3,4,point)

		local point = {"",1,300,9194,11385,3841}	
		Task_L_TalkToNpc(0x639c3,5,point,"Nadal",0,1,2)

		local point = {"",0,100,9415,11390,3845}	
		Task_L_Collection(0x639c3,6,point)

		local point = {"",1,300,9194,11385,3841}	
		Task_L_TalkToNpc(0x639c3,7,point,"Nadal",0,1,3)

		local point = {"",1,100,7838,11882,3461}	
		Task_L_LongGetTo(0x639c3,8,10324,1,point)

		if Fun_IsHaveTask(0x639c4,1) == 1 then
			local point = {"",1,2000,11794,15333,1664}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,300,11794,15333,1664}
				Task_L_TalkToNpc(0x639c4,1,point,"Daybreaker Peterson",0,1,1)
			else
				local point1 = {"",2,100,7830,11857,3461}
				local point2 = {"",1,100,11794,15333,1664}
				Task_L_LongGetTo(0x639c4,1,10324,2,point1,point2)
			end
		end

		local point = {"Nest Hill",0,100,10930,18090,1569}
		if Task_L_OpenTranMission(0x639c4,2,point) == 1 then
			local point1 = {"",0,1000,10292,17460,1531}
			local point2 = {"",0,1000,9186,17742,1527}
			Task_L_LoopAttackMonMore(0x639c4,2,0,2,point1,point2)
		end

		--进入普通副本   10362
		local point = {"",1,100,2521,21815,1931}	
		if Task_L_LongGetTo(0x639c4,3,10324,1,point) then
			local point = {"",1,100,2134,22157,2169}
			Task_L_AutoGetTo(0x639c4,3,10324,point,2,10362) 
		end

		local point = {"",1,300,3678,20727,1667}
		Task_L_TalkToNpc(0x639c4,4,point,"Daybreaker Denath",0,1,1)

		Task_L_UseTransmit(0x635e0,1,"Bitterwind Hill Post","Bitterwind Hill")
	end
	---------------------------------------------------------------------------
	--第5张
	if Fun_IsInMapByMapId(10323) then
		GlobalFun(0)

		local point = {"",1,100,10421,14005,4768}
		Task_L_TalkToNpc(0x63da9,1,point,"Dr. Orson",0,1,1)

		local point = {"",1,300,10421,14161,4768}
		Task_L_LoopCollectMore(0x63da9,2,0,1,point)

		local point = {"",1,300,10731,16781,4818}
		Task_L_LoopCollectMore(0x63da9,2,1,1,point)

		local point = {"",1,300,11048,18356,4814}
		Task_L_LoopCollectMore(0x63da9,2,2,1,point)

		local point = {"",1,100,11042,19849,5125}
		Task_L_TalkToNpc(0x63da9,3,point,"Graymoon Dath",0,1,3)

		local point = {"Graymoon Camp",0,100,10378,21462,5163}
		if Task_L_OpenTranMission(0x63da9,4,point) == 1 then
			local point = {"",1,100,10919,20193,5125}
			Task_L_TalkToNpc(0x63da9,4,point,"Madnick",0,1,1)
		end

		local point = {"",1,300,6171,28926,3786}
		Task_L_TalkToNpc(0x63da9,5,point,"Daybreaker Trevis",0,1,1)

		local point = {"",1,300,6171,28926,3786}
		Task_L_TalkToNpc(0x63da9,6,point,"Graymoon Dietrich",0,1,1)

		local point1 = {"",0,1500,7596,29129,3776}
		local point2 = {"",0,1500,9158,28938,3776}
		Task_L_LoopAttackMonMore(0x63da9,7,0,2,point1,point2)
		
		local point = {"",1,300,10005,31409,4809}
		Task_L_TalkToNpc(0x63da9,8,point,"Graymoon Liseto",0,1,2)

		local point = {"",1,300,11396,33369,4810}
		Task_L_TalkToNpc(0x63daa,1,point,"Graymoon Mineson",0,1,1)

		local point = {"",0,100,11565,33522,4810}	
		Task_L_Collection(0x63daa,2,point)

		local point = {"",1,300,16840,33074,5088}
		Task_L_TalkToNpc(0x63daa,3,point,"Graymoon Luka",0,1,1)

		local point1 = {"Reanimated Plague Dead",1,1000,18655,27341,5080}
		local point2 = {"Reanimated Plague Dead",1,1000,19578,26102,5078}	
		Task_L_LoopUseTaskItemForMon(0x63daa,4,0,2,point1,point2)
		
		local point = {"",1,300,24603,25392,4750}
		Task_L_TalkToNpc(0x63daa,5,point,"Father Mervin",0,1,1)

		local point = {"",0,300,24383,25377,4753}	
		Task_L_Collection(0x63daa,6,point)

		local point = {"",1,300,24603,25392,4750}
		Task_L_TalkToNpc(0x63daa,7,point,"Father Mervin",0,1,2)

		local point = {"",0,300,25880,28725,4750}	
		Task_L_Collection(0x63daa,8,point)

		local point = {"Frostpeak Temple Entrance",0,100,22251,32098,4990}
		if Task_L_OpenTranMission(0x63daa,9,point) == 1 then
			local point = {"",0,300,22645,32020,4959}	
			Task_L_Collection(0x63daa,9,point)
		end

		local point = {"",1,300,23005,32721,4954}
		Task_L_TalkToNpc(0x63daa,10,point,"Father Lordrim",0,1,1)

		if Fun_IsHaveTask(0x63daa,11) == 1 then
			Fun_SetBackHomeInfo(80, 30,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",0,3000,23939,34073,5320}
				if Fun_IsInPoint(point) == 0 then
					Task_L_LoopEquipFun()
					local point = {"Emil",1,100, 11075,22051,5125}
					Task_L_BuyItem(0x63daa,11,100,7,"Super Healing Potion",point)

					local BackHomeInfo = {
						0, --1比较小地图
						"Iceblood Plateau", --大地图
						"Iceblood Plateau", --小地图
						"Graymoon Camp", --传送阵
						{ 10283,20400,5126 }, --修理NPC坐标
						{ 11075,22051,5125 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				else
					MSG("LYLUa 需要传送回城")
					local point = {"",1,100,10378,21462,5163}
					Task_L_UseTransmitPoint(0x63daa,11,"Graymoon Camp",point)
				end
			else
				local point = {"",0,2000,10283,20400,5126}
				if Fun_IsInPoint(point) == 1 then
					MSG("LYLUa 需要传送副本")
					local point = {"",1,100,22251,32098,4990}
					Task_L_UseTransmitPoint(0x63daa,11,"Frostpeak Temple Entrance",point)
				else
					--进入普通副本   10361
					local point = {"",1,100,24436,35056,5312}	
					if Task_L_LongGetTo(0x63daa,11,10323,1,point) then
						local point = {"",1,100,24695,35515,5317}
						Task_L_AutoGetTo(0x63daa,11,10323,point,2,10361) 
					end
				end
			end
		end

		local point = {"",1,300,23963,34011,5318}
		Task_L_TalkToNpc(0x63daa,12,point,"Sidereal Shandi",0,1,1)

		local point = {"",1,300,24638,31320,4730}
		Task_L_TalkToNpc(0x63daa,13,point,"Graymoon Dietrich",0,1,1)

		local point = {"",0,300,24908,31081,4731}
		Task_L_Collection(0x63dab,1,point)

		local point = {"",1,300,8762,22448,4820}
		Task_L_TalkToNpc(0x63dab,2,point,"Graymoon Dietrich",0,1,1)

		if Task_L_GetTaskIsComplete(0x63dab) then
			local point = {"",1,100,11020,19861,5125}
			Task_L_CompleteTask(0x63dab,3,point,"Graymoon Dath",-1)
		else
			local point = {"",1,300,10913,20203,5125}
			Task_L_TalkToNpc(0x63dab,3,point,"Madnick",0,1,2)
		end

		if Fun_IsHaveTask(0x64191,1) == 1 then
			Task_L_UseItemBook("Mount: Frost Wolf")

			local point = {"",1,100,4937,29330,3786}	
			Task_L_LongGetTo(0x64191,1,10323,1,point)
		end

	end
	---------------------------------------------------------------------------
	--第6张
	if Fun_IsInMapByMapId(10325) then
		GlobalFun(0)

		local point = {"",1,500,21844,6097,514}
		Task_L_TalkToNpc(0x64191,1,point,"Apprentice Doctor Ishurin",0,1,1)

		local point1 = {"",0,1500,20400,8643,512}
		local point2 = {"",0,1500,19561,7980,512}
		Task_L_LoopAttackMonMore(0x64191,2,0,2,point1,point2)

		local point = {"Gray Wolves Camp",0,100,14545,9932,546}
		if Task_L_OpenTranMission(0x64191,3,point) == 1 then
			local point = {"",1,100,15533,10651,514}
			Task_L_TalkToNpc(0x64191,3,point,"Father Bowen",0,1,1)
		end

		local point = {"",1,100,15134,11747,522}	
		Task_L_LongGetTo(0x64191,4,10325,1,point)

		local point1 = {"",2,100,15134,11747,522}
		local point2 = {"",1,100,15252,13926,-507}	
		if Task_L_LongGetTo(0x64191,5,10325,2,point1,point2) then
			local point = {"",1,100,15252,13926,-507}	
			Task_L_TalkToNpc(0x64191,5,point,"Graymoon Brock",0,1,1)
		end

		local point1 = {"",2,100,14595,16164,-512}
		local point2 = {"",2,100,16702,18263,0}
		local point3 = {"",1,100,20958,17534,514}
		Task_L_LongGetTo(0x64191,6,10325,3,point1,point2,point3)

		local point = {"",1,100,20958,17534,514}
		Task_L_TalkToNpc(0x64192,1,point,"Dr. Orson",0,1,1)

		local point = {"",0,300,20549,17450,518}
		Task_L_Collection(0x64192,2,point)

		local point = {"Frostbreath Gorge",0,100,18900,18134,553}
		if Task_L_OpenTranMission(0x64192,3,point) == 1 then
			local point = {"",1,100,20549,17450,518}
			Task_L_TalkToNpc(0x64192,3,point,"Runaway Prisoner Liliana",0,1,1)
		end

		local point = {"",1,100,20958,17534,514}
		Task_L_TalkToNpc(0x64192,4,point,"Dr. Orson",0,1,2)

		local point1 = {"",2,100,22602,18603,531}
		local point2 = {"",1,100,23241,21094,-500}
		if Task_L_LongGetTo(0x64192,5,10325,2,point1,point2) then
			local point = {"",0,300,23241,21094,-500}
			Task_L_Collection(0x64192,5,point)
		end

		local point = {"",1,100,23241,21094,-500}
		Task_L_TalkToNpc(0x64193,1,point,"Graymoon Dietrich",0,1,1)

		--进入剧情副本   10336
		local point = {"",1,100,22513,22877,-503}	
		if Task_L_LongGetTo(0x64193,2,10325,1,point) then
			local point = {"",1,100,22545,23339,-498}
			Task_L_AutoGetTo(0x64193,2,10325,point,1,10336) 
		end

		local point = {"",1,100,23314,20968,-500}
		Task_L_TalkToNpc(0x64193,3,point,"Dr. Orson",0,1,1)

		local point = {"",1,100,23321,21222,-500}
		Task_L_TalkToNpc(0x64193,4,point,"Poppy",0,1,1)

		local point = {"",1,100,23321,21222,-500}
		Task_L_UseExpression(0x64193,5,"Sad",point)

		local point = {"",1,100,23314,20968,-500}
		Task_L_TalkToNpc(0x64193,6,point,"Dr. Orson",0,1,2)

		local point = {"",1,100,23314,20968,-500}
		Task_L_Collection(0x64193,7,point)

		local point = {"",1,100,23321,21222,-500}
		Task_L_Collection(0x64193,8,point)

		local point = {"",1,100,23314,20968,-500}
		Task_L_TalkToNpc(0x64193,9,point,"Dr. Orson",0,1,3)


		if Fun_IsHaveTask(0x64194,1) == 1 then
			if FindTransmit("Forgotten Maze") == 0 then
				local point1 = {"",1,100,16177,20953,0}
				local point2 = {"",1,100,10998,19099,1}
				if Task_L_LongGetTo(0x64194,1,10325,2,point1,point2) then
					local point = {"Forgotten Maze",0,100,6666,20430,35}
					Task_L_OpenTranMission(0x64194,1,point)
				end
			else
				local point = {"",1,100,7131,21425,-5}
				Task_L_TalkToNpc(0x64194,1,point,"Sidereal Shandi",0,1,1)
			end
		end

		local point = {"",1,100,7131,21425,-5}
		Task_L_TalkToNpc(0x64194,2,point,"Sian",0,1,1)

		if Fun_IsHaveTask(0x64194,3) == 1 then
			Fun_SetBackHomeInfo(80, 30,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",0,3000,7113,21241,-5}
				if Fun_IsInPoint(point) == 0 then
					Task_L_LoopEquipFun()
					local point = {"Mogen",1,100, 15250,9398,512}
					Task_L_BuyItem(0x64194,3,100,7,"Super Healing Potion",point)

					local BackHomeInfo = {
						0, --1比较小地图
						"Icewing Heights", --大地图
						"Icewing Heights", --小地图
						"Graymoon Camp", --传送阵
						{ 14605,10792,516 }, --修理NPC坐标
						{ 15250,9398,512 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				else
					local point = {"",1,100,14545,9932,546}
					Task_L_UseTransmitPoint(0x64194,3,"Gray Wolves Camp",point)
				end
			else
				local point = {"",0,2000,14545,9932,546}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,6666,20430,35}
					Task_L_UseTransmitPoint(0x64194,3,"Forgotten Maze",point)
				else
					--进入普通副本   10363
					local point = {"",1,100,7138,21783,-1}	
					if Task_L_LongGetTo(0x64194,3,10325,1,point) then
						local point = {"",1,100,7124,22210,21}
						Task_L_AutoGetTo(0x64194,3,10325,point,2,10363) 
					end
				end
			end
		end

		Task_L_UseTransmit(0x631f5,1,"Rigens Village","Rigens Village")
	end
	---------------------------------------------------------------------------
	-------------------------------罗亨达尔------------------------------------
	---------------------------------------------------------------------------
	--第1张
	if Fun_IsInMapByMapId(10121) then
		GlobalFun(0)

		Task_L_CompleteGlobalTask(0x452019,-1)

		local point1 = {"Collect",0,100,2391,17937,1029}
		local point2 = {"Collect",1,100,3967,18385,1216}
		local point3 = {"Collect",2,100,6574,18077,1216}
		Task_L_BranchLine(0x19a29,1,3,point1,point2,point3)
		
		--开传送阵
		local point = {"Dock",1,100,5271,17901,1283}
		if Task_L_OpenTranMission(0x19a29,2,point) == 1 then
			local point = {"",1,100,7863,17831,1344}
			Task_L_AutoGetTo(0x19a29,2,10121,point,0,0) 
		end
		
		local point = {"",1,100,7840,17763,1344}
		Task_L_TalkToNpc(0x19a29,3,point,"Port Guard Meriett",0,1,1)

		if Task_L_GetTaskIsComplete(0x19a29) then
			local point = {"",1,100,13301,17836,1509}
			Task_L_CompleteTask(0x19a29 ,4,point,"Flamekeeper Gherdia",-1)
		else
			local point = {"",1,100,13301,17836,1509}
			Task_L_TalkToNpc(0x19a29,4,point,"Flamekeeper Gherdia",0,1,1)
		end
		
		local point1 = {"Collect",0,100,14667,15985,1490}
		local point2 = {"Collect",1,100,14683,12880,1107}
		local point3 = {"Collect",2,100,14799,11459,1108}
		Task_L_BranchLine(0x19a2a,1,3,point1,point2,point3)

		local point = {"",1,100,12516,11374,1230}
		Task_L_TalkToNpc(0x19a2a,2,point,"Bambiri Elder Botambo",0,1,1)

		local point = {"",1,100,12736,11611,1236}
		Task_L_Collection(0x19a2a ,3,point)
		
		--开传送阵
		local point = {"Bambiri Settlement",1,100,11768,11743,1337}
		if Task_L_OpenTranMission(0x19a2a,4,point) == 1 then
			local point = {"",1,100,12516,11374,1230}
			Task_L_TalkToNpc(0x19a2a,4,point,"Bambiri Elder Botambo",0,1,2)
		end

		local point = {"",1,100,12741,11234,1230}
		Task_L_TalkToNpc(0x19a2a,5,point,"Turan",0,1,1)

		--开传送阵
		local point = {"Sylvain Settlement",1,100,14958,25853,1585}
		if Task_L_OpenTranMission(0x19a2a,6,point) == 1 then
			local point = {"",1,100,13790,25992,1676}
			Task_L_AutoGetTo(0x19a2a,6,10121,point,0,0) 
		end

		local point = {"",1,100,12867,25880,1542}
		Task_L_TalkToNpc(0x19a2b,1,point,"Turan",0,1,1)

		local point1 = {"",4,100,12923,27094,1599}
		local point2 = {"",1,100,13167,29758,-1034}
		Task_L_LongGetTo(0x19a2b,2,10121,2,point1,point2)

		local point = {"Runaway Box",1,2000,13199,29761,-1028}
		Task_L_LoopTalkNpc(0x19a2b,3,0,point)

		local point1 = {"",1,100,13452,30529,-747}
		local point2 = {"",1,100,12646,38465,-795}
		if Task_L_LongGetTo(0x19a2b,4,10121,2,point1,point2) then
			local point = {"",1,100,12646,38465,-795}
			Task_L_TalkToNpc(0x19a2b,4,point,"Turan",0,1,2)	
		end

		local point1 = {"Collect",0,100,13317,38432,-795}
		local point2 = {"Collect",1,100,12967,38469,-795}
		Task_L_BranchLine(0x19a2b,5,3,point1,point2)

		local point = {"",1,100,12463,38472,-795}
		Task_L_Collection(0x19a2b ,6,point)

		local point = {"",1,100,12463,38472,-795}
		Task_L_TalkToNpc(0x19a2b,7,point,"Exhausted Toady",0,1,1)	

		local point = {"",1,100,12172,38490,-795}
		Task_L_Collection(0x19a2b ,8,point)

		local point = {"",1,100,12646,38465,-795}
		Task_L_TalkToNpc(0x19a2c,1,point,"Turan",0,1,3)	

		local point = {"",1,100,13530,38437,-795}
		Task_L_Collection(0x19a2c ,2,point)

		local point = {"",1,100,12463,38472,-795}
		Task_L_TalkToNpc(0x19a2c,3,point,"Exhausted Toady",0,1,2)
		
		local point = {"",1,100,12513,38516,-795}
		Task_L_TalkToNpc(0x19a2d,1,point,"Aven",0,1,1)	

		local point = {"",1,100,12513,38516,-795}
		Task_L_TalkToNpc(0x19a2d,2,point,"Aven",0,1,2)	

		local point = {"",1,100,12646,38465,-795}
		Task_L_TalkToNpc(0x19a2d,3,point,"Turan",0,1,4)	

		--使用传送阵
		local point = {"",1,100,14958,25853,1585}
		Task_L_UseTransmitPoint(0x19a2d,4,"Sylvain Settlement",point)

		local point1 = {"Collect",0,100,12160,25963,1542}
		local point2 = {"Collect",1,100,17180,26879,1922}
		local point3 = {"Collect",2,100,19214,26105,2176}
		Task_L_BranchLine(0x19a2d,4,3,point1,point2,point3)

		local point = {"",1,100,21304,24359,2958}
		Task_L_UseTaskItem(0x19a2d,5,point)

		local point = {"",1,100,21537,21669,2944}
		Task_L_TalkToNpc(0x19a2d,6,point,"Aven",0,1,1)	

		local point = {"",1,100,21537,21669,2944}
		Task_L_UseTaskItem(0x19a2d,7,point)

		local point = {"",1,100,21537,21669,2944}
		Task_L_BranchUseExpression(0x19a2d,8,0,"Fury",point)

		local point = {"",1,100,21537,21669,2944}
		Task_L_BranchUseExpression(0x19a2d,8,1,"Interrogate",point)

		local point = {"",1,100,21537,21669,2944}
		Task_L_BranchUseExpression(0x19a2d,8,2,"Ask",point)

		local point = {"",1,100,21537,21669,2944}
		Task_L_UseTaskItem(0x19a2d,9,point)

		local point1 = {"",1,100,21433,20924,3023}
		local point2 = {"",1,100,21430,20144,3017}
		local point3 = {"",1,100,21379,19384,3017}
		local point4 = {"",1,100,21295,18472,3023}
		local point5 = {"",1,100,20961,18064,2944}
		if Task_L_LongGetTo(0x19a2e,1,10121,5,point1,point2,point3,point4,point5) then
			local point = {"",1,100,20643,18030,2944}
			Task_L_Collection(0x19a2e ,1,point)
		end

		local point1 = {"",1,100,20391,17319,2943}
		local point2 = {"",1,100,20363,16667,2944}
		if Task_L_LongGetTo(0x19a2e,2,10121,2,point1,point2) then
			local point = {"",1,100,20765,16081,2944}
			Task_L_Collection(0x19a2e ,2,point)
		end

		local point1 = {"",2,100,20999,16229,2943}
		local point2 = {"",1,100,21264,16853,2692}
		if Task_L_LongGetTo(0x19a2e,3,10121,2,point1,point2) then
			local point = {"",1,100,21264,16853,2692}
			Task_L_Collection(0x19a2e ,3,point)
		end

		local point1 = {"",2,100,21519,17393,2691}
		local point2 = {"",1,100,21937,17971,2944}
		if Task_L_LongGetTo(0x19a2e,4,10121,2,point1,point2) then
			local point = {"",1,100,21937,17971,2944}
			Task_L_Collection(0x19a2e ,4,point)
		end

		local point = {"",1,100,22002,17927,2944}
		Task_L_TalkToNpc(0x19a2e,5,point,"Sylvain Guard Serkin",0,1,1)

		if Task_L_GetTaskIsComplete(0x19a2e) then
			local point = {"",1,100,21537,21669,2944}
			Task_L_CompleteTask(0x19a2e ,6,point,"Aven",-1)
		else
			local point = {"",1,100,22002,17927,2944}
			Task_L_TalkToNpc(0x19a2e,6,point,"Sylvain Guard Serkin",0,1,2)	
		end

		--进入剧情副本 10131
		local point = {"",1,100,21394,15976,2944}
		if Task_L_LongGetTo(0x19a2f,1,10121,1,point) then
			local point = {"",1,100,21428,15427,3022}
			Task_L_AutoGetTo(0x19a2f,1,10121,point,1,0x2793) 
		end

		local point = {"",1,100,22396,16468,2944}
		Task_L_TalkToNpc(0x19a2f,2,point,"Aven",0,1,1)
		
		local point = {"",1,100,22531,16299,2944}
		Task_L_TalkToNpc(0x19a2f,3,point,"Turan",0,1,1)	

		--开传送阵
		local point = {"Fairy Settlement",1,100,28147,16952,3906}
		if Task_L_OpenTranMission(0x19a2f,4,point) == 1 then
			local point = {"",1,100,34758,17923,4252}
			Task_L_AutoGetTo(0x19a2f,4,10121,point,0,0) 
		end

		--这个大陆的神器任务完成，回港口
		if Task_Task_GetArtifactTaskNum(0x44aa21,1,0,5) then
			local point = {"",1,100,-808,17877,917}
			Task_L_AutoGetTo(0x44aa21,1,10121,point,0,0) 
		end

	end
	---------------------------------------------------------------------------
	--第2张
	if Fun_IsInMapByMapId(10101) then
		GlobalFun(0)

		local point = {"",1,100,512,6239,-0}
		Task_L_TalkToNpc(0x19e11,1,point,"Rothun Guard Embrin",0,1,1)

		local point = {"",1,100,504,6182,-0}
		Task_L_TalkToNpc(0x19e11,2,point,"Aven",0,1,1)

		--开传送阵
		local point = {"Empyrean Plaza",1,100,6170,5984,779}
		if Task_L_OpenTranMission(0x19e11,3,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Paylene",1,100, 7346,7135,721}
			Task_L_BuyItem(0x19e11,3,50,6,"Super Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50, 50,0,0)
			--修理
			if Fun_IsHaveTask(0x19e11,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Rothun", --大地图
						"Empyrean Plaza", --小地图
						"Empyrean Plaza", --传送阵
						{ 7174,6790,721 }, --修理NPC坐标
						{  7346,7135,721 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point1 = {"",4,100,8249,6160,865}
			local point2 = {"",1,100,-12566,4757,-453}
			Task_L_LongGetTo(0x19e11,3,10101,2,point1,point2)
		end

		local point = {"",1,100,-12509,4752,-453}
		Task_L_TalkToNpc(0x19e11,4,point,"Aberuth",0,1,1)

		local point1 = {"",1,100,-11402,4756,-245}
		local point2 = {"",1,100,-23290,-22090,-428}
		Task_L_LongGetTo(0x19e11,5,10101,2,point1,point2)

		local point = {"",1,100,-22218,-22123,-357}
		Task_L_TalkToNpc(0x19e12,1,point,"Azena",0,1,1)

		local point = {"",1,100,-22218,-22123,-357}
		Task_L_TalkToNpc(0x19e12,2,point,"Azena",0,1,2)

		local point = {"",1,100,-22514,-22067,-364}
		Task_L_UseTaskItem(0x19e12,3,point)

		local point = {"",1,100,-22218,-22123,-357}
		Task_L_TalkToNpc(0x19e12,4,point,"Azena",0,1,3)

		local point = {"",1,100,-22499,-21975,-364}
		Task_L_TalkToNpc(0x19e12,5,point,"Aven",0,1,1)


		if Task_L_GetTaskIsComplete(0x19e13) then
			--开传送阵
			local point = {"Dawnkeep",1,100,6094,11575,446}
			if Task_L_OpenTranMission(0x19e13,1,point) == 1 then
				local point1 = {"",1,100,6517,12074,411}
				local point2 = {"",1,100,6891,12424,411}
				local point3 = {"",1,100,-25220,8922,-455}
				if Task_L_LongGetTo(0x19e13,1,10101,3,point1,point2,point3) then
					local point = {"",1,100,-25220,8922,-455}
					Task_L_CompleteTask(0x19e13 ,1,point,"Aberuth",-1)
				end
			end
		else
			--使用传送阵
			local point = {"",1,100,6170,5984,779}
			Task_L_UseTransmitPoint(0x19e13,1,"Empyrean Plaza",point)

			local point1 = {"Collect",0,100,6760,6828,721}
			local point2 = {"Collect",1,100,6348,8885,410}
			local point3 = {"Collect",2,100,7045,10705,447}
			local point4 = {"Collect",3,100,7063,11852,411}
			Task_L_BranchLine(0x19e13,1,4,point1,point2,point3,point4)
		end

		if Fun_IsHaveTask(0x1a1f9,1) == 1 then
			local point = {"",1,1500,-25220,8922,-455}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,100,6170,5984,779}
				Task_L_UseTransmitPoint(0x1a1f9,1,"Empyrean Plaza",point)
			end
		end

		--开传送阵
		local point = {"Artisan's Forest",1,100,6498,-381,51}
		if Task_L_OpenTranMission(0x1a1f9,1,point) == 1 then

			if Fun_IsHaveTask(0x1a1f9,1) == 1 then  
				local point = {"Belleper",1,100,9658,1025,131}
				Task_L_StoneUnseal(0x1a1f9 ,1,"Outstanding Stone of Birth",point)

				Task_L_UseItemStone("Outstanding Stone of Birth")
			end

			local point = {"",1,100,10066,2621,720}
			Task_L_AutoGetTo(0x1a1f9,1,10101,point,0,0) 
		end
		------------------第4张图回来----------------------
		local point1 = {"",4,100,8249,6160,865}
		local point2 = {"",1,100,-11402,4756,-245}
		local point3 = {"",1,100,-22218,-22123,-357}
		if Task_L_LongGetTo(0x19e14,2,10101,3,point1,point2,point3) then
			local point = {"",1,100,-22218,-22123,-357}
			Task_L_TalkToNpc(0x19e14,2,point,"Azena",0,1,4)
		end

		local point = {"",1,100,6094,11575,446}
		Task_L_UseTransmitPoint(0x19e14,3,"Dawnkeep",point)

		local point = {"",1,100,6373,11916,411}
		Task_L_TalkToNpc(0x19e14,3,point,"Aberuth",0,1,1)

		local point = {"",1,100,1583,7336,-0}
		Task_L_TalkToNpc(0x19e14,4,point,"Dream Walker Lenora",0,1,1)

		local point = {"",1,100,1469,7290,-0}
		Task_L_TalkToNpc(0x19e14,5,point,"Aven",0,1,1)

		local point = {"",1,100,1583,7336,-0}
		Task_L_TalkToNpc(0x19e15,1,point,"Dream Walker Lenora",0,1,2)

		local point = {"",1,100,4190,8349,408}
		Task_L_Collection(0x19e15,2,point)

		local point = {"",1,100,6812,2965,410}
		Task_L_TalkToNpc(0x19e15,3,point,"Village Merchant",0,1,1)

		--使用传送阵
		Task_L_UseTransmit(0x19e16,1,"Breezesome Brae","Breezesome Brae")
			
		------------------第5张图回来----------------------
		local point1 = {"",4,100,8249,6160,865}
		local point2 = {"",1,100,-11402,4756,-245}
		local point3 = {"",1,100,-22218,-22123,-357}
		if Task_L_LongGetTo(0x19e17,1,10101,3,point1,point2,point3) then
			local point = {"",1,100,-22218,-22123,-357}
			Task_L_Collection(0x19e17,1,point)
		end

		local point = {"",1,100,-22779,-22031,-364}
		Task_L_TalkToNpc(0x19e17,2,point,"Aven",0,1,1)

		local point = {"",1,100,-22375,-22273,-357}
		Task_L_TalkToNpc(0x19e17,3,point,"Aberuth",0,1,1)

		local point = {"",1,100,-22668,-22252,-364}
		Task_L_TalkToNpc(0x19e17,4,point,"Lenora",0,1,1)

		local point = {"",1,100,-22779,-22031,-364}
		Task_L_TalkToNpc(0x19e17,5,point,"Aven",0,1,2)

		local point1 = {"",1,100,-24715,-22087,-428}
		local point2 = {"",1,100,-12349,3955,-455}
		local point3 = {"",1,100,-24280,3148,-453}
		Task_L_LongGetTo(0x19e18,1,10101,3,point1,point2,point3)

		--进入剧情副本   10133
		local point = {"",1,100,-24440,3478,-454}
		if Task_L_LongGetTo(0x19e18,2,10101,1,point) then
			local point = {"",1,100,-24887,3615,-440}
			Task_L_AutoGetTo(0x19e18,2,10101,point,1,0x2795)
		end

		local point1 = {"",1,100,-25171,2929,-213}
		local point2 = {"",1,100,-12318,5099,-453}
		if Task_L_LongGetTo(0x19e19,1,10101,2,point1,point2) then
			local point = {"",1,100,-12318,5099,-453}
			Task_L_TalkToNpc(0x19e19,1,point,"Turan",0,1,1)
		end

		if Task_L_GetTaskIsComplete(0x19e19) then
			local point = {"",1,100,-22337,-22098,-357}
			Task_L_CompleteTask(0x19e19,2,point,"Azena",-1)
		else
			local point1 = {"",1,100,-11402,4756,-245}
			local point2 = {"",1,100,-22337,-22098,-357}
			Task_L_LongGetTo(0x19e19,2,10101,2,point1,point2)
		end

		local point1 = {"",1,100,-24715,-22087,-428}
		local point2 = {"",1,100,-12349,3955,-455}
		local point3 = {"",1,100,-24686,3565,-446}
		Task_L_LongGetTo(0x1adb1,1,10101,3,point1,point2,point3)
		------------------第6张图回来----------------------

		local point1 = {"",4,100,8249,6160,865}
		local point2 = {"",1,100,-11402,4756,-245}
		local point3 = {"",1,100,-22516,-22068,-364}
		if Task_L_LongGetTo(0x19e1a,1,10101,3,point1,point2,point3) then
			local point = {"",1,100,-22516,-22068,-364}
			Task_L_TalkToNpc(0x19e1a,1,point,"Inanna",0,1,1)
		end

		local point = {"",1,100,-22516,-22068,-364}
		Task_L_UseMusic(0x19e1a,2,"Song of Trixion",point)

		local point = {"",1,100,-22347,-22120,-357}
		Task_L_TalkToNpc(0x19e1a,3,point,"Azena",0,1,2)	

		if Task_L_GetTaskIsComplete(0x19e1a) then
			local point = {"",1,100,-22228,-22094,-357}
			Task_L_CompleteTask(0x19e1a,4,point,"Azena",-1)
			--这个地图最后一个任务完成 需要强化到600然后去约拿
		else
			local point = {"",1,100,-23694,-21493,-428}
			Task_L_Collection(0x19e1a,4,point)
		end

	end
	---------------------------------------------------------------------------
	--第3张
	if Fun_IsInMapByMapId(10122) then
		GlobalFun(0)

		--开传送阵
		local point = {"Flowstream Village",1,100,4636,10965,300}
		if Task_L_OpenTranMission(0x1a1f9,2,point) == 1 then
			local point = {"",1,100,8375,10165,399}
			Task_L_AutoGetTo(0x1a1f9,2,10122,point,0,0) 
		end

		local point = {"",1,100,8614,10301,399}
		Task_L_TalkToNpc(0x1a1f9,3,point,"Rito",0,1,1)

		local point = {"",1,100,10199,14160,256}
		Task_L_TalkToNpc(0x1a1f9,4,point,"Orelda",0,1,1)

		local point = {"",1,300,10199,14160,256}
		Task_L_Collection(0x1a1f9,5,point)
		
		local point = {"",1,100,10199,14160,256}
		Task_L_TalkToNpc(0x1a1fa,1,point,"Orelda",0,1,2)

		local point1 = {"",0,600,9108,14258,234}
		local point2 = {"",0,600,7515,15412,234}
		local point3 = {"",0,600,8905,16219,234}
		local point4 = {"",0,600,7462,15811,234}
		local point5 = {"",0,600,6124,14709,225}
		Task_L_LoopAttackMonMore(0x1a1fa,2,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,8416,10081,399}
		Task_L_TalkToNpc(0x1a1fa,3,point,"Orelda",0,1,1)

		local point = {"",1,100,5834,17483,512}
		Task_L_AutoGetTo(0x1a1fa,4,10122,point,0,0) 

		local point = {"",1,100,5834,17483,512}
		Task_L_TalkToNpc(0x1a1fa,5,point,"Guard Seomer",0,1,1)

		local point = {"",1,100,6703,20760,265}
		Task_L_TalkToNpc(0x1a1fb,1,point,"Dream Walker Lenora",0,1,1)

		local point1 = {"",0,300,6269,20880,266}
		local point2 = {"",0,300,6945,20990,265}
		local point3 = {"",0,300,6607,21297,265}
		local point4 = {"",0,300,6439,21479,269}
		local point5 = {"",0,300,6202,21511,264}
		Task_L_LoopCollectMore(0x1a1fb,2,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,6100,22036,269}
		Task_L_TalkToNpc(0x1a1fb,3,point,"Lenora",0,1,1)

		local point = {"",1,100,6100,22036,269}
		Task_L_TalkToNpc(0x1a1fb,4,point,"Lenora",0,1,2)

		local point = {"",1,300,6325,22140,270}
		Task_L_Collection(0x1a1fb,5,point)

		local point = {"",1,400,4359,22763,270}
		Task_L_Collection(0x1a1fb,6,point)

		local point = {"",1,400,5580,23761,270}
		Task_L_Collection(0x1a1fb,7,point)

		local point = {"",1,400,6650,25086,266}
		Task_L_Collection(0x1a1fb,8,point)

		local point = {"",1,100,7913,23930,270}
		Task_L_TalkToNpc(0x1a1fb,9,point,"Digne",0,1,1)

		local point = {"",1,100,7966,23809,270}
		Task_L_TalkToNpc(0x1a1fc,1,point,"Lenora",0,1,1)

		local point = {"",1,100,7913,23930,270}
		Task_L_TalkToNpc(0x1a1fc,2,point,"Digne",0,1,2)

		local point1 = {"",0,600,7461,22245,270}
		local point2 = {"",0,600,7123,23031,268}
		local point3 = {"",0,600,6388,23856,270}
		local point4 = {"",0,600,4946,23805,270}
		local point5 = {"",0,600,5797,24451,270}
		Task_L_LoopAttackMonMore(0x1a1fc,3,0,5,point1,point2,point3,point4,point5)

		local point1 = {"",0,300,7926,26507,268}
		local point2 = {"",0,300,7349,26593,268}
		local point3 = {"",0,300,7006,26748,268}
		Task_L_LoopCollectMore(0x1a1fc,4,0,3,point1,point2,point3)

		--开传送阵
		local point = {"Nightshade Forest",1,100,9706,28867,302}
		if Task_L_OpenTranMission(0x1a1fd,1,point) == 1 then
			local point1 = {"",1,100,11114,28504,377}
			local point2 = {"",1,100,10987,28875,373}
			local point3 = {"",1,100,7808,39206,5}
			Task_L_LongGetTo(0x1a1fd,1,10122,3,point1,point2,point3)
		end

		local point = {"",1,100,8136,39534,4}
		Task_L_TalkToNpc(0x1a1fd,2,point,"Lenora",0,1,1)

		local point = {"",1,100,8049,39687,4}
		Task_L_TalkToNpc(0x1a1fd,3,point,"Digne",0,1,1)

		local point = {"",1,100,7943,39566,4}
		Task_L_UseTaskItem(0x1a1fd,4,point)
		
		local point = {"",1,100,8049,39687,4}
		Task_L_Collection(0x1a1fd,5,point)

		if Task_L_GetTaskIsComplete(0x1a1fd) then
			--使用传送阵
			local point = {"",1,100,4636,10965,300}
			Task_L_UseTransmitPoint(0x1a1fd,6,"Flowstream Village",point)

			local point = {"",1,100,8402,10014,399}
			Task_L_CompleteTask(0x1a1fd ,6,point,"Orelda",-1)
		else
			local point = {"",1,100,8049,39687,4}
			Task_L_TalkToNpc(0x1a1fd,6,point,"Digne",0,1,2)
		end

		local point = {"",1,100,4819,5853,475}
		Task_L_AutoGetTo(0x1a1fe,1,10122,point,0,0) 

		local point = {"",1,100,4819,5853,475}
		Task_L_TalkToNpc(0x1a1fe,2,point,"Runaway Fairy",0,1,1)

		local point1 = {"Collect",0,100,4468,5442,512}
		local point2 = {"Collect",1,100,4374,4197,510}
		local point3 = {"Collect",2,100,3051,3358,768}
		local point4 = {"Collect",3,100,4650,2111,1017}
		Task_L_BranchLine(0x1a1fe,3,4,point1,point2,point3,point4)

		local point = {"",1,100,5065,1282,1017}
		Task_L_AutoGetTo(0x1a1fe,4,10122,point,0,0) 
	end
	---------------------------------------------------------------------------
	--第4张
	if Fun_IsInMapByMapId(10123) then
		GlobalFun(0)

		local point = {"",1,100,22576,23646,1856}
		Task_L_TalkToNpc(0x1a5e1,1,point,"Turan",0,1,1)

		--开传送阵
		local point = {"Petal Glen",1,100,21507,24575,1902}
		if Task_L_OpenTranMission(0x1a5e1,2,point) == 1 then
			local point1 = {"",1,300,21988,24749,1844}
			local point2 = {"",1,300,21754,23853,1851}
			local point3 = {"",1,300,21479,23323,1855}
			local point4 = {"",1,300,21785,22734,1856}
			local point5 = {"",1,300,22426,23047,1856}
			Task_L_LoopAttackMonMore(0x1a5e1,2,0,5,point1,point2,point3,point4,point5)
		end

		local point = {"",1,100,20325,21995,1839}
		Task_L_TalkToNpc(0x1a5e1,3,point,"Turan",0,1,2)

		local point = {"",1,100,18018,22105,1545}
		Task_L_AutoGetTo(0x1a5e1,4,10123,point,0,0)

		local point = {"",1,100,18018,22105,1545}
		Task_L_UseExpression(0x1a5e2,1,"Talk",point) 
		
		local point = {"",1,100,18018,22105,1545}
		Task_L_TalkToNpc(0x1a5e2,2,point,"Fairy Tasilla",0,1,1)

		local point1 = {"",0,300,14788,23108,1546}
		local point2 = {"",0,300,14797,23531,1546}
		local point3 = {"",0,300,14044,23754,1546}
		local point4 = {"",0,300,13627,23667,1546}
		local point5 = {"",0,300,13444,23513,1546}
		Task_L_LoopCollectMore(0x1a5e2,3,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,12982,20793,1889}
		Task_L_AutoGetTo(0x1a5e2,4,10123,point,0,0)

		local point = {"",1,100,14033,18901,1809}
		Task_L_Collection(0x1a5e2,5,point)

		local point = {"",1,100,13920,18959,1810}
		Task_L_TalkToNpc(0x1a5e3,1,point,"Mien",0,1,1)

		--开传送阵
		local point = {"Fairy Village",1,100,12488,17778,2099}
		if Task_L_OpenTranMission(0x1a5e3,2,point) == 1 then
			local point1 = {"",2,100,12042,16139,2076}
			local point2 = {"",1,100,12067,13629,2860}
			Task_L_LongGetTo(0x1a5e3,2,10123,2,point1,point2)
		end

		local point = {"",1,100,11591,13282,2854}
		Task_L_Collection(0x1a5e3,3,point)

		local point1 = {"",2,100,11590,12484,2880}
		local point2 = {"",1,100,12243,12433,3905}
		if Task_L_LongGetTo(0x1a5e3,4,10123,2,point1,point2) then
			local point = {"",1,100,12243,12433,3905}
			Task_L_Collection(0x1a5e3,4,point)
		end

		local point1 = {"",2,100,13264,12526,3921}
		local point2 = {"",1,100,14623,12697,3911}
		Task_L_LongGetTo(0x1a5e3,5,10123,2,point1,point2)

		local point = {"",1,100,14623,12697,3911}
		Task_L_TalkToNpc(0x1a5e3,6,point,"Cesilla",0,1,1)

		local point = {"",1,100,14741,12569,3911}
		Task_L_TalkToNpc(0x1a5e3,7,point,"Aven",0,1,1)

		local point1 = {"",2,100,13955,12572,3918}
		local point2 = {"",2,100,11701,12477,3918}
		local point3 = {"",1,100,10160,12330,2863}
		Task_L_LongGetTo(0x1a5e3,8,10123,3,point1,point2,point3)

		local point = {"",1,100,10160,12330,2863}
		Task_L_TalkToNpc(0x1a5e3,9,point,"Aven",0,1,2)

		local point1 = {"",2,100,9802,12063,2863}
		local point2 = {"",1,100,8828,12589,1025}
		Task_L_LongGetTo(0x1a5e3,10,10123,2,point1,point2)

		if Task_L_GetTaskIsComplete(0x1a5e3) then
			local point = {"",1,100,7377,11356,1024}
			Task_L_CompleteTask(0x1a5e3 ,11,point,"Digne",-1)
		else
			local point = {"",1,100,7377,11356,1024}
			Task_L_AutoGetTo(0x1a5e3,11,10123,point,0,0)
		end

		local point = {"",1,100,7377,11356,1024}
		Task_L_TalkToNpc(0x1a5e4,1,point,"Digne",0,1,1)	

		local point = {"",1,100,7464,11437,1024}
		Task_L_TalkToNpc(0x1a5e4,2,point,"Aven",0,1,1)	

		local point1 = {"",0,800,7806,10439,1024}
		local point2 = {"",0,800,6503,9902,1024}
		local point3 = {"",0,800,5950,11229,1024}
		local point4 = {"",0,800,7625,10599,1024}
		local point5 = {"",0,800,8655,9829,1024}
		Task_L_LoopAttackMonMore(0x1a5e4,3,0,5,point1,point2,point3,point4,point5)

		--开传送阵
		local point = {"Breezesome Brae",1,100,8175,2587,1070}
		if Task_L_OpenTranMission(0x1a5e4,4,point) == 1 then
			local point = {"",1,100,7792,1421,1155}
			Task_L_TalkToNpc(0x1a5e4,4,point,"Forte",0,1,1)	
		end

		local point = {"",1,100,7792,1421,1155}
		Task_L_UseExpression(0x1a5e4,5,"Ask",point) 
		
		local point = {"",1,100,7792,1421,1155}
		Task_L_Collection(0x1a5e4,6,point)

		local point = {"",1,100,7792,1421,1155}
		Task_L_UseExpression(0x1a5e4,7,"Talk",point)

		local point = {"",1,100,7792,1421,1155}
		Task_L_TalkToNpc(0x1a5e4,8,point,"Forte",0,1,2)
		
		local point = {"",1,100,1500,-1122,674}
		Task_L_TalkToNpc(0x1a5e4,9,point,"Aven",0,1,1)

		--进入剧情副本   10132
		local point = {"",1,100,1423,-991,691}
		if Task_L_LongGetTo(0x1a5e5,1,10123,1,point) then
			local point = {"",1,100,1364,-1389,686}
			Task_L_AutoGetTo(0x1a5e5,1,10123,point,1,0x2794)
		end

		if Task_L_GetTaskIsComplete(0x1a5e5) then
			local point = {"",1,100,1540,-350,811}
			Task_L_CompleteTask(0x1a5e5,2,point,"Digne",-1)
		else
			local point = {"",1,100,1696,-354,832}
			Task_L_TalkToNpc(0x1a5e5,2,point,"Orelda",0,1,1)
		end

		--使用传送阵
		Task_L_UseTransmit(0x19e14,1,"Empyrean Plaza","Empyrean Plaza")

		local point = {"",1,100,8436,231,1022}
		Task_L_TalkToNpc(0x19e16,1,point,"Aven",0,1,2)

		local point = {"",1,100,8436,231,1022}
		Task_L_UseTaskItem(0x19e16,2,point)

		local point = {"",1,100,8436,231,1022}
		Task_L_TalkToNpc(0x19e16,3,point,"Aven",0,1,1)

		local point = {"",1,100,8939,40,1020}
		Task_L_AutoGetTo(0x19e16,4,10123,point,0,0)

		local point = {"",1,100,11755,328,1291}
		Task_L_AutoGetTo(0x1a9c9,1,10123,point,0,0)	
		
	end
	---------------------------------------------------------------------------
	--第5张
	if Fun_IsInMapByMapId(10124) then
		GlobalFun(0)

		local point = {"",1,300,5762,21440,512}
		Task_L_TalkToNpc(0x1a9c9,2,point,"Aven",0,1,1)

		local point = {"",1,300,5860,21300,512}
		Task_L_TalkToNpc(0x1a9c9,3,point,"Escaped Bambiri Taru",0,1,1)

		local point = {"",1,300,5762,21440,512}
		Task_L_TalkToNpc(0x1a9c9,4,point,"Aven",0,1,2)

		local point1 = {"",1,100,4368,17697,512}
		local point2 = {"",1,100,8104,14300,503}
		Task_L_LongGetTo(0x1a9c9,5,10124,2,point1,point2)

		local point = {"",1,100,10158,14564,384}
		Task_L_TalkToNpc(0x1a9ca,1,point,"Bambiri Chief Batum",0,1,1)

		local point = {"",1,100,9995,14464,384}
		Task_L_TalkToNpc(0x1a9ca,2,point,"Aven",0,1,1)

		--开传送阵
		local point = {"Moonkeep Hill",1,100,13873,10859,801}
		if Task_L_OpenTranMission(0x1a9ca,3,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Ellare",1,100, 12665,12740,512}
			Task_L_BuyItem(0x1a9ca,3,50,6,"Super Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50, 50,0,0)
			--修理
			if Fun_IsHaveTask(0x1a9ca,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Xeneela Ruins", --大地图
						"Moonkeep Hill", --小地图
						"Moonkeep Hill", --传送阵
						{ 13982,11846,768 }, --修理NPC坐标
						{ 12665,12740,512 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point1 = {"",1,100,14398,12005,768}
			local point2 = {"",1,100,14576,12416,804}
			local point3 = {"",1,100,24356,30602,2583}
			Task_L_LongGetTo(0x1a9ca,3,10124,3,point1,point2,point3)
		end

		local point = {"",1,100,24356,30602,2583}
		Task_L_TalkToNpc(0x1a9ca,4,point,"Aven",0,1,2)

		local point1 = {"",10,100,25594,30989,2585}
		local point2 = {"",1,100,25846,29943,24}
		Task_L_LongGetTo(0x1a9ca,5,10124,2,point1,point2)

		local point = {"",1,100,25846,29943,24}
		Task_L_TalkToNpc(0x1a9ca,6,point,"Prait",0,1,1)

		local point = {"",1,100,25846,29943,24}
		Task_L_UseExpression(0x1a9ca,7,"Talk",point) 

		local point = {"",1,100,25893,29847,24}
		Task_L_TalkToNpc(0x1a9ca,8,point,"Lenora",0,1,1)
		
		local point1 = {"",10,100,25619,30343,23}
		local point2 = {"",1,100,24356,30602,2583}
		if Task_L_LongGetTo(0x1a9cb,1,10124,2,point1,point2) then
			local point = {"",1,100,24356,30602,2583}
			Task_L_TalkToNpc(0x1a9cb,1,point,"Aven",0,1,1)
		end

		local point = {"",1,100,24201,30583,2580}
		Task_L_Collection(0x1a9cb,2,point)

		--使用传送阵
		local point = {"",1,100,13873,10859,801}
		Task_L_UseTransmitPoint(0x1a9cb,4,"Moonkeep Hill",point)

		local point1 = {"",0,600,14832,9164,512}
		local point2 = {"",0,600,13800,9308,512}
		local point3 = {"",0,600,12933,9713,512}
		local point4 = {"",0,600,14318,6756,512}
		local point5 = {"",0,1500,11033,2747,512}
		Task_L_LoopAttackMonMore(0x1a9cb,3,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,300,13538,4876,512}
		Task_L_TalkToNpc(0x1a9cb,4,point,"Lenora",0,1,1)

		local point = {"",1,100,13609,4643,512}
		Task_L_Collection(0x1a9cb,5,point)

		local point = {"",1,300,13538,4876,512}
		Task_L_TalkToNpc(0x1a9cb,6,point,"Lenora",0,1,2)

		local point = {"",1,300,13401,4767,512}
		Task_L_TalkToNpc(0x1a9cb,7,point,"Turan",0,1,1)

		local point = {"",1,100,13538,4876,512}
		Task_L_Collection(0x1a9cc,1,point)

		local point = {"",1,300,13538,4876,512}
		Task_L_TalkToNpc(0x1a9cc,2,point,"Lenora",0,1,3)

		local point = {"",1,100,13609,4643,512}
		Task_L_Collection(0x1a9cc,3,point)

		local point = {"",1,100,13609,4643,512}
		Task_L_Collection(0x1a9cd,1,point)

		local point = {"",1,100,14348,3094,512}
		Task_L_Collection(0x1a9cd,2,point)

		local point = {"",1,300,17976,2797,-0}
		Task_L_Collection(0x1a9cd,3,point)

		local point = {"",1,100,21222,2552,-0}
		Task_L_AutoGetTo(0x1a9cd,4,10124,point,0,0)

		local point = {"",1,300,21222,2552,-0}
		Task_L_Collection(0x1a9cd,5,point)

		local point = {"",1,100,21040,2426,-0}
		Task_L_TalkToNpc(0x1a9cd,6,point,"Aven",0,1,1)

		local point = {"",1,300,20968,2588,-0}
		Task_L_TalkToNpc(0x1a9cd,7,point,"Lenora",0,1,1)

		local point1 = {"",0,300,22005,3186,-0}
		local point2 = {"",0,300,23112,2620,-0}
		local point3 = {"",0,300,23946,2942,-0}
		Task_L_LoopCollectMore(0x1a9cd,8,0,3,point1,point2,point3)

		local point = {"",1,100,25251,7140,-0}
		Task_L_AutoGetTo(0x1a9cd,9,10124,point,0,0)

		local point = {"",1,100,25961,11619,7}
		Task_L_AutoGetTo(0x1a9cd,10,10124,point,0,0)
		
		local point1 = {"",10,100,25961,11619,7}
		local point2 = {"",1,100,24599,13899,-1024}
		Task_L_LongGetTo(0x1a9cd,11,10124,2,point1,point2)

		--开传送阵
		local point = {"Contaminated Village",1,100,23487,14758,-975}
		if Task_L_OpenTranMission(0x1a9d1,1,point) == 1 then
			local point = {"",1,100,23812,15410,-1022}
			Task_L_TalkToNpc(0x1a9d1,1,point,"Lenora",0,1,2)
		end
		
		local point = {"",1,100,23794,15544,-1022}
		Task_L_UseExpression(0x1a9d1,2,"Greet",point) 

		local point = {"",1,100,23794,15544,-1022}
		Task_L_TalkToNpc(0x1a9d1,3,point,"Elico",0,1,1)	

		local point = {"",1,100,23812,15410,-1022}
		Task_L_TalkToNpc(0x1a9d1,4,point,"Lenora",0,1,3)

		local point = {"",1,100,20754,7489,-1024}
		Task_L_AutoGetTo(0x1a9d1,5,10124,point,0,0)

		local point = {"",1,100,20754,7489,-1024}
		Task_L_TalkToNpc(0x1a9ce,1,point,"Aven",0,1,1)

		local point = {"",1,100,20699,7848,-1024}
		Task_L_TalkToNpc(0x1a9ce,2,point,"Lenora",0,1,1)

		local point = {"",1,300,20608,7930,-1024}
		Task_L_Collection(0x1a9ce,3,point)

		local point = {"",1,100,20699,7848,-1024}
		Task_L_TalkToNpc(0x1a9ce,4,point,"Lenora",0,1,2)

		local point1 = {"",10,100,19173,9713,-1017}
		local point2 = {"",1,100,20830,12863,-2048}
		if Task_L_LongGetTo(0x1a9ce,5,10124,2,point1,point2) then
			local point = {"",1,300,20830,12863,-2048}
			Task_L_Collection(0x1a9ce,5,point)
		end

		local point = {"",1,100,20830,12863,-2048}
		Task_L_UseExpression(0x1a9ce,6,"Applause",point) 

		local point = {"",1,100,20830,12863,-2048}
		Task_L_TalkToNpc(0x1a9ce,7,point,"Zepira",0,1,1)

		local point = {"",1,100,20830,12863,-2048}
		Task_L_TalkToNpc(0x1a9ce,8,point,"Lenora",0,1,1)

		if Task_L_GetTaskIsComplete(0x1a9ce) then
			local point = {"",1,100,25686,29664,24}
			Task_L_CompleteTask(0x1a9ce,9,point,"Azena",-1)
		else
			local point1 = {"",1,100,16636,13155,-1927}
			local point2 = {"",1,100,25686,29664,24}
			Task_L_LongGetTo(0x1a9ce,9,10124,2,point1,point2)
		end

		local point = {"",1,100,25686,29664,24}
		Task_L_TalkToNpc(0x1a9d2,1,point,"Azena",0,1,1)
		
		local point = {"",1,100,25170,29508,24}
		Task_L_TalkToNpc(0x1a9d2,2,point,"Aven",0,1,1)

		local point1 = {"Collect",0,300,24989,29925,20}
		local point2 = {"Collect",1,300,26180,30270,23}
		local point3 = {"Collect",2,300,25683,29980,24}
		local point4 = {"Collect",3,300,25766,29280,24}
		local point5 = {"Collect",4,300,26097,29580,22}
		Task_L_BranchLine(0x1a9d2,3,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,25170,29508,24}
		Task_L_TalkToNpc(0x1a9d2,4,point,"Aven",0,1,2)

		local point = {"",1,100,25686,29664,24}
		Task_L_TalkToNpc(0x1a9d2,5,point,"Azena",0,1,2)

		local point = {"",1,100,25686,29664,24}
		Task_L_Collection(0x1a9d2,6,point)

		local point = {"",1,100,25170,29508,24}
		Task_L_TalkToNpc(0x1a9d2,7,point,"Aven",0,1,3)

		local point = {"",1,100,25170,29508,24}
		Task_L_Collection(0x1a9d2,8,point)

		local point = {"",1,100,25170,29508,24}
		Task_L_TalkToNpc(0x1a9d2,10,point,"Aven",0,1,4)

		if Task_L_GetTaskIsComplete(0x1a9d2) then
			
			local point1 = {"",1,100,27460,29695,95}
			local point2 = {"",1,100,17396,13154,-1951}
			if Task_L_LongGetTo(0x1a9d2,11,10124,2,point1,point2) then
				local point = {"",1,100,17396,13154,-1951}
				Task_L_CompleteTask(0x1a9d2,11,point,"Digne",-1)
			end
		else
			local point = {"",1,100,25686,29664,24}
			Task_L_TalkToNpc(0x1a9d2,11,point,"Azena",0,1,5)
		end

		local point = {"",1,100,17409,13129,-1951}
		Task_L_UseTaskItem(0x1a9cf,1,point)

		local point = {"",1,100,17762,17137,-1841}
		Task_L_AutoGetTo(0x1a9cf,2,10124,point,0,0)
		
		local point = {"",1,300,17285,17776,-1620}
		Task_L_Collection(0x1a9cf,3,point)

		local point = {"",1,100,13601,21804,-763}
		Task_L_AutoGetTo(0x1a9cf,4,10124,point,0,0)

		--开传送阵
		local point = {"Forgotten Grave",1,100,13694,22093,-740}
		if Task_L_OpenTranMission(0x1a9cf,5,point) == 1 then
			local point = {"",1,100,12459,19574,-500}
			Task_L_TalkToNpc(0x1a9cf,5,point,"Azena",0,1,4)
		end

		if Fun_IsHaveTask(0x1a9d0,1) == 1 then
			Fun_SetBackHomeInfo(80, 30,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,3000,12146,19117,-411}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,13873,10859,801}
					Task_L_UseTransmitPoint(0x1a9d0,1,"Moonkeep Hill",point)
				else
					Task_L_LoopEquipFun()
					local point = {"Ellare",1,100, 12665,12740,512}
					Task_L_BuyItem(0x1a9d0,1,50,6,"Super Healing Potion",point)

					local BackHomeInfo = {
						0, --1比较小地图
						"Xeneela Ruins", --大地图
						"Moonkeep Hill", --小地图
						"Moonkeep Hill", --传送阵
						{ 13982,11846,768 }, --修理NPC坐标
						{ 12665,12740,512 } --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
	
			else
				local point = {"",1,3000,13982,11846,768}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,13694,22093,-740}
					Task_L_UseTransmitPoint(0x1a9d0,1,"Forgotten Grave",point)
				else
					--进入普通副本  10161
					local point = {"",1,100,12459,19574,-498}
					if Task_L_LongGetTo(0x1a9d0,1,10124,1,point) then
						local point = {"",1,100,12242,19034,-411}
						Task_L_AutoGetTo(0x1a9d0,1,10124,point,2,0x27B1)
					end
				end
			end
		end
		

		--使用传送阵
		Task_L_UseTransmit(0x19e17,1,"Empyrean Plaza","Empyrean Plaza")
	end
	---------------------------------------------------------------------------
	--第6张
	if Fun_IsInMapByMapId(10125) then
		GlobalFun(0)

		--开传送阵
		local point = {"Shadowed Earth",1,100,4626,2543,2208}
		if Task_L_OpenTranMission(0x1adb1,1,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Poshan",1,100, 5926,3070,2158}
			Task_L_BuyItem(0x1adb1,1,50,6,"Super Healing Potion",point)

			Task_L_PushDwonDrug(0x1adb1,1,"Super Healing Potion")
			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(80, 30,0,0)
			--修理
			if Fun_IsHaveTask(0x1adb1,1) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Elzowin's Shade", --大地图
						"Elzowin's Shade", --小地图
						"Shadowed Earth", --传送阵
						{ 5286,3541,2162 }, --修理NPC坐标
						{ 5926,3070,2158} --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,5201,2550,2161}
			Task_L_TalkToNpc(0x1adb1,1,point,"Orelda",0,1,1)
		end

		local point1 = {"Collect",1,100,5091,2232,2161}
		local point2 = {"Collect",0,100,5484,2717,2162}
		local point3 = {"Collect",2,100,5785,3387,2159}
		Task_L_BranchLine(0x1adb1,2,3,point1,point2,point3)

		local point = {"",1,100,5742,2342,2161}
		Task_L_TalkToNpc(0x1adb1,3,point,"Surmeel",0,1,1)

		local point = {"",1,100,5201,2550,2161}
		Task_L_TalkToNpc(0x1adb1,4,point,"Orelda",0,1,2)

		local point = {"",1,100,4735,3426,2161}
		Task_L_Collection(0x1adb1,5,point)

		local point = {"",1,100,4735,3426,2161}
		Task_L_TalkToNpc(0x1adb1,6,point,"Undart",0,1,2)

		local point = {"",1,100,2689,5044,2048}
		Task_L_AutoGetTo(0x1adb2,1,10125,point,0,0)
		
		local point = {"",1,300,2689,5044,2048}
		Task_L_TalkToNpc(0x1adb2,2,point,"Adjutant Felix",0,1,1)

		local point1 = {"",0,800,3140,6965,2048}
		local point2 = {"",0,800,2884,7697,2048}
		local point3 = {"",0,800,3364,8425,2048}
		local point4 = {"",0,800,4106,8735,2048}
		local point5 = {"",0,800,3672,7541,2065}
		Task_L_LoopAttackMonMore(0x1adb2,3,0,5,point1,point2,point3,point4,point5)
		
		local point = {"",1,300,3055,10181,2048}
		Task_L_TalkToNpc(0x1adb2,4,point,"Adjutant Felix",0,1,2)

		local point = {"",1,100,2515,15170,2197}
		Task_L_AutoGetTo(0x1adb2,5,10125,point,0,0)

		local point = {"",1,300,4090,15742,2304}
		Task_L_TalkToNpc(0x1adb2,6,point,"Digne",0,1,1)

		local point = {"",1,300,4090,15742,2304}
		Task_L_TalkToNpc(0x1adb3,1,point,"Digne",0,1,2)

		local point = {"",1,100,4020,15829,2305}
		Task_L_UseTaskItem(0x1adb3,2,point)

		local point = {"",1,300,4130,15949,2310}
		Task_L_TalkToNpc(0x1adb3,3,point,"Injured Alifer",0,1,1)

		local point = {"",1,300,2970,16672,2048}
		Task_L_TalkToNpc(0x1adb3,4,point,"Giant Dream Demon's Corpse",0,1,1)

		local point1 = {"",2,100,1259,17821,2050}
		local point2 = {"",1,100,1328,18666,1536}
		if Task_L_LongGetTo(0x1adb3,5,10125,2,point1,point2) then
			local point = {"",1,100,1328,18666,1536}
			Task_L_Collection(0x1adb3,5,point)
		end

		if Task_L_GetTaskIsComplete(0x1adb3) then
			local point = {"",1,100,2499,21074,1024}
			Task_L_CompleteTask(0x1adb3,6,point,"Elimarso",-1)
		else
			local point1 = {"",2,100,1548,19667,1654}
			local point2 = {"",1,100,2499,21074,1024}
			Task_L_LongGetTo(0x1adb3,6,10125,2,point1,point2)
		end

		local point = {"",1,100,2499,21074,1024}
		Task_L_TalkToNpc(0x1adb4,1,point,"Elimarso",0,1,1)

		local point1 = {"",2,100,1571,22500,1025}
		local point2 = {"",1,100,3327,25030,512}
		Task_L_LongGetTo(0x1adb4,2,10125,2,point1,point2)

		local point = {"",1,100,3327,25030,512}
		Task_L_Collection(0x1adb4,3,point)

		local point = {"",1,100,3135,24873,512}
		Task_L_TalkToNpc(0x1adb4,4,point,"Lenora",0,1,1)

		local point = {"",1,100,3227,24904,512}
		Task_L_UseTaskItem(0x1adb4,5,point)

		local point = {"",1,100,3135,24873,512}
		Task_L_TalkToNpc(0x1adb4,6,point,"Lenora",0,1,2)

		--开传送阵
		local point = {"East Knurlroot Forest",1,100,2274,23803,559}
		if Task_L_OpenTranMission(0x1adb5,1,point) == 1 then
			local point1 = {"",0,800,8840,25191,576}
			local point2 = {"",0,800,9633,25974,645}
			local point3 = {"",1,800,10625,25457,703}
			local point4 = {"",1,800,11280,24715,575}
			local point5 = {"",1,800,10930,24128,570}
			Task_L_LoopAttackMonMore(0x1adb5,1,0,5,point1,point2,point3,point4,point5)
			
			local point1 = {"",1,300,10625,25457,703}
			local point2 = {"",1,300,11280,24715,575}
			local point3 = {"",1,300,10930,24128,570}
			Task_L_LoopAttackMonMore(0x1adb5,1,1,3,point1,point2,point3)
		end

		local point = {"",1,100,15621,24684,563}
		Task_L_TalkToNpc(0x1adb5,2,point,"Forte",0,1,1)

		local point = {"",1,100,15600,24868,563}
		Task_L_UseTaskItem(0x1adb5,3,point)

		local point = {"",1,100,15621,24684,563}
		Task_L_TalkToNpc(0x1adb5,4,point,"Forte",0,1,2)

		--开传送阵
		local point = {"East Stardust Forest",1,100,16612,24925,596}
		if Task_L_OpenTranMission(0x1adb6,1,point) == 1 then
			local point1 = {"",0,800,14354,19454,1167}
			local point2 = {"",0,800,13668,18655,1143}
			local point3 = {"",0,800,14138,17571,1144}
			local point4 = {"",0,800,13395,17263,1133}
			local point5 = {"",0,800,13954,16134,1163}
			Task_L_LoopAttackMonMore(0x1adb6,1,0,5,point1,point2,point3,point4,point5)
		end

		local point = {"",1,100,16870,18741,1256}
		Task_L_AutoGetTo(0x1adb6,2,10125,point,0,0)

		local point = {"",1,100,16870,18741,1256}
		Task_L_UseTaskItem(0x1adb6,3,point)

		local point = {"",1,100,16870,18741,1256}
		Task_L_TalkToNpc(0x1adb6,4,point,"Injured Soltaris",0,1,1)

		local point = {"",1,100,16870,18741,1256}
		Task_L_TalkToNpc(0x1adb6,5,point,"Soltaris",0,1,1)

		local point1 = {"",9,100,18617,13194,958}
		local point2 = {"",1,100,22453,11517,1024}
		if Task_L_LongGetTo(0x1adb6,6,10125,2,point1,point2) then
			--开传送阵
			local point = {"Forgotten Beach",1,100,22399,10987,1067}
			if Task_L_OpenTranMission(0x1adb6,6,point) == 1 then
				local point = {"",1,100,22453,11517,1024}
				Task_L_TalkToNpc(0x1adb6,6,point,"Gherdia",0,1,1)
			end
		end

		if Fun_IsHaveTask(0x1adb7,1) == 1 then
			Fun_SetBackHomeInfo(80, 30,0,0)
			if Fun_IsNeedBackHome() == 1 then
				local point = {"",1,3000,26472,10475,1032}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,4626,2543,2208}
					Task_L_UseTransmitPoint(0x1adb7,1,"Shadowed Earthl",point)
				else
					Task_L_LoopEquipFun()
					local point = {"Poshan",1,100, 5926,3070,2158}
					Task_L_BuyItem(0x1adb7,1,50,6,"Super Healing Potion",point)
					Task_L_PushDwonDrug(0x1adb7,1,"Super Healing Potion")
					if Fun_IsNeedBackHome() == 1 then
						local BackHomeInfo = {
							0, --1比较小地图
							"Elzowin's Shade", --大地图
							"Elzowin's Shade", --小地图
							"Shadowed Earth", --传送阵
							{ 5286,3541,2162 }, --修理NPC坐标
							{ 5926,3070,2158} --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				end
	
			else
				local point = {"",1,3000,4626,2543,2208}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,100,22399,10987,1067}
					Task_L_UseTransmitPoint(0x1adb7,1,"Forgotten Beach",point)
				else
					--进入团队副本  10191
					local point1 = {"",2,100,23664,10947,1025}
					local point2 = {"",2,100,24337,10564,1029}
					local point3 = {"",2,100,24767,10765,1280}
					local point4 = {"",2,100,25271,10409,1028}	
					local point5 = {"",1,100,26472,10475,1032}
					if Task_L_LongGetTo(0x1adb7,1,10125,5,point1,point2,point3,point4,point5) then
						local point = {"",1,100,27066,10479,1081}
						Task_L_AutoGetTo(0x1adb7,1,10125,point,3,0x27CF)
					end
				end
			end
		end
		--使用传送阵
		Task_L_UseTransmit(0x19e1a,1,"Empyrean Plaza","Empyrean Plaza")
	end
	---------------------------------------------------------------------------------
	----------------------------------------约拿-50级之后任务------------------------
	---------------------------------------------------------------------------------
	----------------------------------------第1章地图--------------------------------
	if Fun_IsInMapByMapId(11311) then
		GlobalFun(0)
		--接解封石头任务

		--开传送阵
		local point = {"Старая пристань",1,100,-20823,15391,1084}
		if Task_L_OpenTranMission(0x140119,1,point) == 1 then
			--放药到F1
			Task_L_PushDwonDrug(0x140119,1,"Super Healing Potion")

			local point = {"",1,100,-23149,13969,950}
			Task_L_TalkToNpc(0x140119,1,point,"Лютерийский рыцарь",0,1,1)
		end
		local point = {"",0,100,-23048,15420,1069}
		Task_L_Collection(0x140119 ,2,point)
		
		local point = {"",0,100,-23649,16209,1069}
		Task_L_Collection(0x140119 ,3,point)
		
		local point = {"",1,100,-24321,17161,1069}
		Task_L_TalkToNpc(0x140119,4,point,"Химлер, старший докер",0,1,1)

		local point = {"",1,100,-24957,18797,1068}
		Task_L_AutoGetTo(0x140119 ,5,11311,point,0,0) 
	
		local point = {"",1,100,-25196,19142,1069}
		Task_L_TalkToNpc(0x140119,6,point,"Zinnervale",0,1,1)

		local point1 = {"Старая пристань",1,100,-25329,19474,1072}
		local point2 = {"Зал приемов",1,100,-45368,41111,792}
		if Task_L_StageGoto(0x140119,7,2,point1,point2) then
			local point = {"",1,100,-45368,41111,792}
			Task_L_TalkToNpc(0x140119,7,point,"Шанди",0,1,1) 
		end

		local point = {"",0,100,-44652,41512,792}
		Task_L_Collection(0x140119 ,8,point)
	
		local point = {"",0,100,-44652,41512,792}
		Task_L_TalkToNpc(0x140119,9,point,"Советник Брондальф",0,1,1) 

		local point = {"",0,100,-44652,41512,792}
		Task_L_TalkToNpc(0x14011a,1,point,"Советник Брондальф",0,1,2) 

		local point = {"",0,100,-44910,42968,668}
		Task_L_Collection(0x14011a ,2,point)

		local point = {"",0,100,-45002,43064,668}
		Task_L_Collection(0x14011a ,3,point)

		local point = {"",0,100,-45111,43176,668}
		Task_L_Collection(0x14011a ,4,point)

		local point = {"",0,100,-45210,43280,668}
		Task_L_Collection(0x14011a ,5,point)

		local point = {"",0,100,-44453,42527,796}
		Task_L_Collection(0x14011a ,6,point)

		local point = {"",0,100,-44652,41512,792}
		Task_L_TalkToNpc(0x14011a,7,point,"Советник Брондальф",0,1,5) 

		local point = {"",0,100,-45064,41633,815}
		Task_L_Collection(0x14011a ,8,point)

		local point = {"",1,100,-44761,41321,792}
		Task_L_AutoGetTo(0x14011a ,9,11311,point,0,0) 
	
		local point = {"",1,100,-44652,41512,792}
		Task_L_TalkToNpc(0x14011b,1,point,"Советник Брондальф",0,1,3) 

		local point = {"",1,100,-47812,43593,673}
		Task_L_Collection(0x14011b ,2,point)

		local point = {"",1,100,-47812,43593,673}
		Task_L_TalkToNpc(0x14011b,3,point,"Швартовщик Адрик",0,1,1)
		
		--之后就进入了剧情副本 11316
		local point = {"",1,100,-47812,43593,673}
		Task_L_UseTaskItem(0x14011b,4,point)
		-------------------------------------------------
		if Task_L_GetTaskIsComplete(0x14011b) then
			local point = {"",1,100,-47776,43665,673}
			Task_L_CompleteTask(0x14011b ,5,point,"Швартовщик Адрик",-1)
		else
			local point = {"",1,100,-47767,43362,673}	
			if Task_L_LongGetTo(0x14011b,5,11311,1,point) then
				local point = {"",1,100,-47670,43865,673}
				Task_L_AutoGetTo(0x14011b,5,11311,point,1,0x2C34) 	
			end
		end

		local point = {"",1,100,-44652,41512,792}
		Task_L_TalkToNpc(0x14011c,1,point,"Советник Брондальф",0,1,4) 

		local point1 = {"Зал приемов",1,100,-46594,40090,668}
		local point2 = {"Старая пристань",1,100,-25350,19088,1068}
		if Task_L_StageGoto(0x14011c,2,2,point1,point2) then
			local point = {"",1,100,-18724,18794,1217}
			Task_L_TalkToNpc(0x14011c,2,point,"Ульфгар, командир Железного Дозора",0,1,1) 
		end

		local point = {"",1,100,-15483,22893,771}
		Task_L_UseTaskItem(0x14011c,3,point)
		
		local point = {"",1,100,-13692,26032,776}
		Task_L_UseTaskItem(0x14011c,4,point)
		
		local point = {"",1,100,-13912,25686,776}
		if Task_L_LongGetTo(0x14011c,5,11311,1,point) then
			local point = {"",1,100,-10545,23050,775}
			Task_L_UseTaskItem(0x14011c,5,point)
		end
		
		local point = {"",1,100,-13828,17012,-308}
		Task_L_TalkToNpc(0x14011c,6,point,"Хель, гробовщик",0,1,1)
		
		local point1 = {"",1,200,-14962,14777,-497}	
		local point2 = {"",1,100,-17497,13431,-505}		
		Task_L_CarryItem(0x14011c,7,0,point1,point2)

		local point = {"",1,100,-17511,13325,-505}
		Task_L_TalkToNpc(0x14011c,8,point,"Советник Брондальф",0,1,1)
		
		local point = {"",1,100,-17511,13325,-505}
		Task_L_TalkToNpc(0x14011d,1,point,"Советник Брондальф",0,1,2) 
		
		local point = {"",1,100,-10022,11415,-483}
		Task_L_AutoGetTo(0x14011d ,2,11311,point,0,0) 
		
		--开传送阵
		local point = {"Журчащее подземелье",1,100,-10122,12269,-487}
		if Task_L_OpenTranMission(0x14011d,3,point) == 1 then
			--买200瓶 7312的药
			local point = {"Мейдар",1,100,-9196,11677,-504}
			Task_L_BuyItem(0x14011d,3,100,2,"Super Healing Potion",point)

			local point = {"",1,100,-9961,10939,-490}
			Task_L_TalkToNpc(0x14011d,3,point,"Sylvain Guard Serkin Лорни",0,1,1)
		end

		local point1 = {"",0,600,-7175,5778,-1432}
		local point2 = {"",0,600,-8029,5274,-1432}
		local point3 = {"",0,600,-7270,4339,-1432} 
		Task_L_LoopAttackMonMore(0x14011d,4,0,3,point1,point2,point3)
		
		if Task_L_GetTaskIsComplete(0x14011d) then
			local point = {"",1,100,-9961,10939,-490}
			Task_L_CompleteTask(0x14011d ,5,point,"Sylvain Guard Serkin Лорни",-1)
		else
			local point = {"",1,100,-10073,11406,-483}
			Task_L_UseTaskItem(0x14011d,5,point)
		end
		
		local point = {"",1,100,-1224,17352,-217}
		Task_L_AutoGetTo(0x14011e ,1,11311,point,0,0)
	end
	----------------------------------------第2章地图--------------------------------
	if Fun_IsInMapByMapId(11301) then
		GlobalFun(0)
		local point = {"",1,100,5994,6275,3772}
		Task_L_TalkToNpc(0x13da09,1,point,"Норин, Sylvain Guard Serkin Железного Дозора",0,1,1)

		local point = {"",1,100,5928,6226,3772}
		Task_L_UseExpression(0x13da09,2,"Тост",point) 
		
		local point = {"",1,100,5994,6275,3772}
		Task_L_TalkToNpc(0x13da09,3,point,"Норин, Sylvain Guard Serkin Железного Дозора",0,1,2)  

		local point = {"",0,100,8323,8478,3889}
		Task_L_Collection(0x13da09 ,4,point)

		local point = {"",0,100,11564,10804,4016}
		Task_L_Collection(0x13da09 ,5,point)
	
		--开传送阵
		local point = {"Свет Арктуса",1,100,10346,15999,4164}
		if Task_L_OpenTranMission(0x13da09,6,point) == 1 then
			local point = {"",1,100,15529,10988,4219}
			Task_L_TalkToNpc(0x13da09,6,point,"Советник Франдар",0,1,1)  
		end

		local point = {"",1,100,15441,10975,4219}
		Task_L_UseExpression(0x13da09,7,"Тост",point) 

		local point = {"",1,100,15529,10988,4219}
		Task_L_TalkToNpc(0x13da0a,1,point,"Советник Франдар",0,1,2)
		
		local point = {"",1,100,11522,11141,4027}
		Task_L_AutoGetTo(0x13da0a ,2,11301,point,0,0)  
	
		local point = {"",1,100,10563,11893,4027}
		Task_L_TalkToNpc(0x13da0a,3,point,"Механик Бральге",0,1,1) 

		
		local point1 = {"",10,100,7178,15968,4260}
		local point2 = {"",0,100,6261,16018,3065}
		if Task_L_LongGetTo(0x13da0a,4,11301,2,point1,point2) then
			local point1 = {"",1,300,6534,16428,3062}
			local point2 = {"",1,100,5646,15888,3076}		
			Task_L_CarryItem(0x13da0a,4,0,point1,point2)
		end

		local point = {"",0,100,5712,15924,3076}
		Task_L_Collection(0x13da0a ,5,point) 

		local point1 = {"",10,100,6580,15906,3065}
		local point2 = {"",0,100,10563,11893,4027}
		if Task_L_LongGetTo(0x13da0a,6,11301,2,point1,point2) then
			local point = {"",1,100,10563,11893,4027}
			Task_L_TalkToNpc(0x13da0a,6,point,"Механик Бральге",0,1,2) 
		end

		local point = {"",0,100,8267,11095,3897}
		Task_L_Collection(0x13da0b ,1,point) 

		local point = {"",0,100,7212,11207,3902}
		Task_L_Collection(0x13da0b ,2,point) 

		local point = {"",1,100,6295,13140,3992}
		Task_L_AutoGetTo(0x13da0b ,3,11301,point,0,0)  
		
		local point = {"",0,100,19659,19973,181}
		Task_L_Collection(0x13da0b ,4,point) 

		local point = {"",0,100,19400,20455,181}
		Task_L_Collection(0x13da0b ,5,point) 

		local point = {"",1,100,19281,23185,376}
		Task_L_AutoGetTo(0x13da0b ,6,11301,point,0,0)  
	
		local point = {"",1,100,19183,22383,565}
		Task_L_TalkToNpc(0x13da0b,7,point,"Вахантур",0,1,1) 

		local point = {"",1,100,19375,22522,561}
		Task_L_TalkToNpc(0x13da0b,8,point,"Шанди",0,1,1) 

		local point = {"",0,100,19183,22383,565}
		Task_L_Collection(0x13da0b ,9,point) 

		local point = {"",1,100,19375,22522,561}
		Task_L_TalkToNpc(0x13da0b,10,point,"Шанди",0,1,2)
		
		local point = {"",1,100,21365,20654,184}
		Task_L_TalkToNpc(0x13da0b,11,point,"Мадам Дейдра",0,1,0x0A)
		
		local point1 = {"Золотая пинта",1,100,20247,19011,52}
		local point2 = {"Айзендельф",1,100,6204,11967,3889}
		if Task_L_StageGoto(0x13da0c,1,2,point1,point2) then
			local point = {"",1,100,6384,11606,3889}
			Task_L_TalkToNpc(0x13da0c,1,point,"Изобретательница Тилл",0,1,1) 
		end

		if Task_L_GetTaskIsComplete(0x13da0c) then
			local point = {"",1,100,15538,10990,4219}
			Task_L_CompleteTask(0x13da0c ,2,point,"Советник Франдар",-1)
		else
			local point = {"",1,100,15043,11141,4183}
			Task_L_AutoGetTo(0x13da0c ,2,11301,point,0,0)  
		end

		local point = {"",1,100,15452,11254,4219}
		Task_L_UseExpression(0x13da0d,1,"Аплодисменты",point) 

		local point = {"",1,100,15452,11254,4219}
		Task_L_UseMusic(0x13da0d,2,"Song of Valor",point)
		
		local point = {"",1,100,15529,10988,4219}
		Task_L_TalkToNpc(0x13da0d,3,point,"Советник Франдар",0,1,5)

		local point = {"",1,100,15452,11254,4219}
		Task_L_UseTaskItem(0x13da0d,4,point)

		local point = {"",1,100,15452,11254,4219}
		Task_L_TalkToNpc(0x13da0d,5,point,"Вахантур",0,1,1)

		local point = {"",1,100,15529,10988,4219}
		Task_L_TalkToNpc(0x13da0e,1,point,"Советник Франдар",0,1,4)  

		local point = {"",1,100,15452,11254,4219}
		Task_L_TalkToNpc(0x13da0e,2,point,"Вахантур",0,1,2)   
		--开传送阵
		local point = {"Большой базар",1,100,10560,5503,4070}
		if Task_L_OpenTranMission(0x13da0e,3,point) == 1 then
			local point = {"",1,100,11692,5330,4032}
			Task_L_AutoGetTo(0x13da0e ,3,11301,point,0,0) 
		end

		local point = {"",1,100,11839,5182,4032}
		Task_L_TalkToNpc(0x13da0e,4,point,"Шанди",0,1,3) 
		
		--过地图
		local point = {"",1,100,13607,5294,3892}
		Task_L_AutoGetTo(0x13da0e ,5,11301,point,0,0)
		
		if Task_L_GetTaskIsComplete(0x140506) then
			local point = {"",1,100,15523,10987,4219}
			Task_L_CompleteTask(0x140506 ,4,point,"Советник Франдар",-1)
		end
		local point = {"",1,100,15590,11149,4219}
		Task_L_TalkToNpc(0x1408e9,1,point,"Король Квейсар",0,1,1) 
		
		local point = {"",1,100,15452,11254,4219}
		Task_L_TalkToNpc(0x1408e9,2,point,"Вахантур",0,1,3)
		
		local point = {"",1,100,15590,11149,4219}
		Task_L_TalkToNpc(0x1408e9,3,point,"Король Квейсар",0,1,2) 


		local point1 = {"Мраморный мост",1,100,17510,11175,4128}
		local point2 = {"Королевский чертог",1,100,19476,34453,1988}
		if Task_L_StageGoto(0x1408e9,4,2,point1,point2) then
			local point = {"",0,100,19476,34453,1988}
			Task_L_Collection(0x1408e9 ,4,point) 
		end

		local point = {"",0,100,19420,34641,1988}
		Task_L_Collection(0x1408e9 ,5,point) 

		local point = {"",0,100,19103,34425,1988}
		Task_L_Collection(0x1408e9 ,6,point) 
	
		local point = {"",0,100,19117,34634,1988}
		Task_L_Collection(0x1408e9 ,7,point) 
		
		if Task_L_GetTaskIsComplete(0x1408e9) then
			local point = {"",1,100,10670,17588,4455}
			Task_L_CompleteTask(0x1408e9 ,8,point,"Вахантур",-1)
		else
			--使用传送阵
			Task_L_UseTransmit(0x1408e9,8,"Свет Арктуса","Кузня Калатура")

			local point = {"",1,100,10670,17588,4455}
			Task_L_AutoGetTo(0x1408e9 ,8,11301,point,0,0)  
		end

		local point = {"",1,100,10670,17588,4457}
		Task_L_Collection(0x1408ea ,1,point)

		local point = {"",1,100,10670,17588,4457}
		Task_L_TalkToNpc(0x1408ea,2,point,"Вахантур",0,1,2) 

		local point = {"",1,100,6345,13121,3992}
		Task_L_AutoGetTo(0x1408eb ,1,11301,point,0,0)   

		local point = {"",1,100,21444,20264,184}
		Task_L_TalkToNpc(0x1408eb,2,point,"Гервальд",0,1,1) 

		local point = {"",1,100,21301,20260,184}
		Task_L_UseTaskItem(0x1408eb,3,point)
		
		local point = {"",1,100,21444,20264,184}
		Task_L_TalkToNpc(0x1408eb,4,point,"Гервальд",0,1,2) 

		local point = {"",1,100,21274,20316,184}
		Task_L_TalkToNpc(0x1408eb,5,point,"Вахантур",0,1,1) 

		local point = {"",1,100,21383,20263,184}
		Task_L_UseExpression(0x1408eb,6,"Тост",point)

		local point1 = {"",1,100,20247,19011,52}
		local point2 = {"",10,100,7155,15931,4283}
		local point3 = {"",1,100,5372,21299,2893}
		Task_L_LongGetTo(0x1408eb,7,11301,3,point1,point2,point3)

		---------------大陆地图任务一圈回来---------------

		if Task_L_GetTaskIsComplete(0x1410bd) then
			local point = {"",1,100,15431,11198,4219}
			Task_L_CompleteTask(0x1410bd ,2,point,"Вахантур",-1)
		else
			local point = {"",1,100,15577,11150,4219}
			Task_L_TalkToNpc(0x1410bd,2,point,"Король Квейсар",0,1,3) 
		end

		---------------------------任务结束-------------------------需要领箱子强化

		if Task_Task_GetArtifactTaskNum(0x44aa21,1,0,5) then
			if Task_L_GetEquipLev() == 600 then
				--领取系统送的强化币箱子  第三次强化
				if Task_L_GetEventCompelete(1,3) then
					Task_L_LoopEquipFun()
					Fun_SetBackHomeInfo(50, 50,0,0)
					if Fun_IsHaveTask(0x44aa21,1) == 1 then
						if Fun_IsNeedBackHome() == 1 then
							MSG("LYlua 进入了修理函数")
							local BackHomeInfo = {
								0, --1比较小地图
								"Айзендельф", --大地图
								"Кузня Калатура", --小地图
								"Свет Арктуса", --传送阵
								{ 11947,17772,4298 }, --修理NPC坐标
								{ 12481,14352,4337} --买卖NPC坐标
							}
							Fun_BackHome(BackHomeInfo)
						end
					end
					--开箱子
					if Task_L_UseEquipBox("Сундук с жетонами Акрасия Экспресс") then
						Task_L_UseEquipBox("Шкатулка с украшениями фантастических приключений")
						Task_L_LoopEquipFun()
						--使用传送阵
						Task_L_UseTransmit(0x44aa21,1,"Свет Арктуса","Кузня Калатура")
						--强化
						local point = {"Дайсар",1,100,10668,18283,4450}
						Task_L_ItemStrengthen(7,825,point)
					end
				end
			end	
		end

		Task_L_UseEquipBox("Шкатулка с украшениями фантастических приключений")

		if Task_Task_GetArtifactTaskNum(0x44aa21,1,0,5) then
			if Task_L_GetEquipLev() == 825 then
				Task_L_LoopEquipFun()
				Fun_SetBackHomeInfo(50, 50,0,0)
				if Fun_IsHaveTask(0x44aa21,1) == 1 then
					if Fun_IsNeedBackHome() == 1 then
						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Айзендельф", --大地图
							"Кузня Калатура", --小地图
							"Свет Арктуса", --传送阵
							{ 11947,17772,4298 }, --修理NPC坐标
							{ 12481,14352,4337} --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				end
				--领取系统送的强化币箱子  第三次强化
				if Task_L_GetEventCompelete(2,3) then
					--开箱子
					if Task_L_UseEquipBox("Сундук с жетонами Акрасия Экспресс") then
						--强化
						local point = {"Дайсар",1,100,10668,18283,4450}
						Task_L_ItemStrengthen(8,850,point)
					end
				end
			end	
		end

		if Task_Task_GetArtifactTaskNum(0x44aa21,1,0,5) then
			if Task_L_GetEquipLev() >= 825 then
				Task_L_LoopEquipFun()
				local point = {"Допель",1,100,12481,14352,4337}
				Task_L_BuyItem(0x44aa21,1,100,6,"Super Healing Potion",point)			
				Fun_SetBackHomeInfo(50, 50,0,0)
				if Fun_IsHaveTask(0x44aa21,1) == 1 then
					if Fun_IsNeedBackHome() == 1 then
						MSG("LYlua 进入了修理函数")
						local BackHomeInfo = {
							0, --1比较小地图
							"Айзендельф", --大地图
							"Кузня Калатура", --小地图
							"Свет Арктуса", --传送阵
							{ 11947,17772,4298 }, --修理NPC坐标
							{ 12481,14352,4337} --买卖NPC坐标
						}
						Fun_BackHome(BackHomeInfo)
					end
				end
				--领取系统送的强化币箱子  第三次强化
				if Task_L_GetEventCompelete(3,3) then
					--开箱子
					Task_L_UseEquipBox("Сундук со снаряжением пламени Кайшура")
					--领完这个就完毕了
					Task_L_LoopEquipFun()
					Task_L_LoopEquipFun()
				end
			end	
		end

		---------------大地1阶
		if Task_Task_GetArtifactTaskNum(0x44aa21,1,0,5) then
			if Task_L_GetEquipLev() == 825 then
				if Fun_GetChaosNum() >= 50 then
					local DungeonInfo = {
						0, -- 0.比较大地图  1.比较小地图
						"Айзендельф", --大地图名称
						"Айзендельф", --小地图名称
						"Свет Арктуса", --传送阵名称
						1, --进副本类弄 0普通副本 1混沌副本
						16, --进副本需要的ID   
						0, --弃用
						0, --难度等级
						0, --是否匹配
						{ 12743,13910,4343 }, --进副本的坐标
						{ 12743,13910,4343 }  --如果没有成功,则移动到这个坐标 再返回进副本的坐标
					}
					Fun_GoToDungeonsEx(DungeonInfo)
				else
					MSG("Lei_:  大地1阶,没有混沌次数了，需要换号!")
					return 2
				end
			end
		end

		---------------时间1阶
		if Task_Task_GetArtifactTaskNum(0x44aa21,1,0,5) then
			if Task_L_GetEquipLev() == 850 then
				if Fun_GetChaosNum() >= 50 then
					local DungeonInfo = {
						0, -- 0.比较大地图  1.比较小地图
						"Айзендельф", --大地图名称
						"Айзендельф", --小地图名称
						"Свет Арктуса", --传送阵名称
						1, --进副本类弄 0普通副本 1混沌副本
						18, --进副本需要的ID
						0, --弃用
						0, --难度等级
						0, --是否匹配
						{ 12743,13910,4343 }, --进副本的坐标
						{ 12743,13910,4343 }  --如果没有成功,则移动到这个坐标 再返回进副本的坐标
					}
					Fun_GoToDungeonsEx(DungeonInfo)
				else
					MSG("Lei_:  时间1阶,没有混沌次数了，需要换号!")
					return 2
				end
			end
		end
	end
	----------------------------------------第3章地图--------------------------------
	if Fun_IsInMapByMapId(11312) then
		GlobalFun(0)
		local point = {"",1,100,-20398,627,1595}
		Task_L_TalkToNpc(0x140501,1,point,"Вахантур",0,1,1)

		local point = {"",1,100,-20220,3972,1442}
		Task_L_TalkToNpc(0x140501,2,point,"Унар, дежурный слесарь",0,1,1)

		local point = {"",0,300,-19598,4046,1442}
		Task_L_Collection(0x140501 ,3,point) 
		
		local point = {"",0,300,-18094,3874,1452}
		Task_L_Collection(0x140501 ,4,point) 
	
		local point = {"",0,300,-16851,3979,1442}
		Task_L_Collection(0x140501 ,5,point)   
		--开传送阵
		local point = {"Йонский водопровод",1,100,-15912,2975,1472}
		if Task_L_OpenTranMission(0x140501,6,point) == 1 then	
			local point = {"",0,300,-14965,3091,1439}
			Task_L_Collection(0x140501 ,6,point)
		end
		
		local point = {"",1,100,-15356,4211,1451}
		Task_L_TalkToNpc(0x140501,7,point,"Унар, дежурный слесарь",0,1,1)

		local point = {"",1,100,-15356,4211,1451}
		Task_L_Collection(0x140501 ,8,point)

		local point = {"",1,100,-15356,4211,1451}
		Task_L_TalkToNpc(0x140501,9,point,"Унар, дежурный слесарь",0,1,2)

		local point = {"",1,100,-15356,4211,1451}
		Task_L_TalkToNpc(0x140502,1,point,"Унар, дежурный слесарь",0,1,3)

		local point1 = {"",0,600,-15233,9351,1534}
		local point2 = {"",0,600,-15132,10988,1534}
		Task_L_LoopAttackMonMore(0x140502,2,0,2,point1,point2)

		local point = {"",1,300,-16231,9888,1552}
		Task_L_Collection(0x140502 ,3,point) 
		
		local point = {"",1,100,-15893,10071,1547}
		Task_L_TalkToNpc(0x140502,4,point,"Унар",0,1,1)

		local point = {"",1,100,-8458,7917,2034}
		Task_L_TalkToNpc(0x140502,5,point,"Унар",0,1,1)

		local point1 = {"",0,300,-8017,8114,2025}
		local point2 = {"",0,300,-8006,7536,2024}
		Task_L_LoopCollectMore(0x140502,6,0,2,point1,point2)

		local point1 = {"",0,600,-7649,6934,2024}
		local point2 = {"",0,600,-7718,8732,2024}
		Task_L_LoopAttackMonMore(0x140502,6,1,2,point1,point2)
		--开传送阵
		local point = {"Подземный сад",1,100,-2863,9792,2050}
		if Task_L_OpenTranMission(0x140502,7,point) == 1 then
			local point = {"",1,100,-9256,12013,1934}
			Task_L_TalkToNpc(0x140502,7,point,"Унар",0,1,1)
		end

		local point = {"",1,100,-8787,12466,1932}
		Task_L_UseTaskItem(0x140503,1,point)

		local point = {"",1,100,-9256,12013,1934}
		Task_L_TalkToNpc(0x140503,2,point,"Унар",0,1,2)

		local point1 = {"Collect",0,100,-8807,12256,1932}
		local point2 = {"Collect",1,100,-8722,12781,1932}
		local point3 = {"Collect",2,100,-8779,12531,1932}
		Task_L_BranchLine(0x140503,3,3,point1,point2,point3)
		
		local point = {"",1,100,-9256,12013,1934}
		Task_L_TalkToNpc(0x140503,4,point,"Унар",0,1,3)


		local point1 = {"",10,100,-10463,12638,1926}
		local point2 = {"",0,100,-14645,16134,121}
		if Task_L_LongGetTo(0x140503,5,11312,2,point1,point2) then
			--开传送阵
			local point = {"Изумрудная",1,100,-15307,15983,150}
			if Task_L_OpenTranMission(0x140503,5,point) == 1 then
				local point = {"",1,100,-14485,17150,134}
				Task_L_TalkToNpc(0x140503,5,point,"Кнуд, Sylvain Guard Serkin Железного Дозора",0,1,1)   
			end
		end

		if Task_L_GetTaskIsComplete(0x140503) then
			local point = {"",1,100,-14485,17150,134}
			Task_L_CompleteTask(0x140503 ,6,point,"Кнуд, Sylvain Guard Serkin Железного Дозора",-1)
		else
			local point = {"",1,300,-14470,17055,133}
			Task_L_Collection(0x140503 ,6,point) 
		end

		local point1 = {"",0,600,-15487,22229,6}
		local point2 = {"",0,600,-15868,23345,6}
		local point3 = {"",0,600,-16564,22313,6}
		Task_L_LoopAttackMonMore(0x140505,1,0,3,point1,point2,point3) 
		
		local point = {"",1,100,-18015,18823,6}
		Task_L_TalkToNpc(0x140505,2,point,"Фроди, смотритель резервуара",0,1,1)     

		local point = {"",1,500,-19374,15985,6}
		Task_L_UseTaskItem(0x140505,3,point)
		
		local point = {"",1,500,-20168,15324,6}
		Task_L_UseTaskItem(0x140505,4,point)
		
		local point = {"",1,500,-21049,14846,3}
		Task_L_UseTaskItem(0x140505,5,point)   
	
		local point = {"",1,100,-22354,14758,6}
		Task_L_TalkToNpc(0x140505,6,point,"Кнуд, Sylvain Guard Serkin Железного Дозора",0,1,1) 
		
		local point = {"",1,100,-22542,14769,3}
		Task_L_TalkToNpc(0x140505,7,point,"Вахантур",0,1,1)

		--进入场景副本 11317
		local point = {"",1,100,-22436,15085,5}	
		if Task_L_LongGetTo(0x140506,1,11312,1,point) then
			local point = {"",1,100,-22947,14743,5}
			Task_L_AutoGetTo(0x140506,1,11312,point,1,0x2C35) 	
		end

		local point = {"",1,100,-22363,14770,6}
		Task_L_TalkToNpc(0x140506,2,point,"Кнуд, Sylvain Guard Serkin Железного Дозора",0,1,2)
		
		local point = {"",1,100,-22542,14769,3}
		Task_L_TalkToNpc(0x140506,3,point,"Вахантур",0,1,2)
		
		--使用传送阵
		Task_L_UseTransmit(0x140506,4,"Свет Арктуса","Айзендельф")
	end
	----------------------------------------第4章地图--------------------------------
	if Fun_IsInMapByMapId(11313) then
		GlobalFun(0)
		local point = {"",1,100,23548,3418,-0}
		Task_L_Collection(0x1408ec ,1,point) 

		local point = {"",1,100,23434,3308,-0}
		Task_L_TalkToNpc(0x1408ec,2,point,"Вахантур",0,1,3)

		local point = {"",1,100,23554,5508,139}
		Task_L_TalkToNpc(0x1408ec,3,point,"Бригадир Грумб",0,1,1)

		--开传送阵
		local point = {"Горняцкий дом",1,100,23297,8427,25}
		if Task_L_OpenTranMission(0x1408ec,4,point) == 1 then
			local point = {"",1,100,21897,6300,118}
			Task_L_TalkToNpc(0x1408ec,4,point,"Шахтёр Больгер",0,1,1)	
		end

		local point = {"",1,100,22056,6223,118}
		Task_L_TalkToNpc(0x1408ec,5,point,"Вахантур",0,1,1)

		local point1 = {"",1,300,21016,4797,-0}
		local point2 = {"",1,300,21262,4552,-0}
		local point3 = {"",1,300,20864,4249,-0}
		Task_L_LoopAttackMonMore(0x1408ec,6,0,3,point1,point2,point3) 
		
		local point = {"",1,100,19438,4347,-1}
		Task_L_TalkToNpc(0x1408ec,7,point,"Шахтёр Больгер",0,1,2) 

		local point = {"",1,100,10564,1675,1420}
		Task_L_AutoGetTo(0x1408ed,1,11313,point,0,0) 
	
		local point = {"",1,100,10698,1882,1420}
		Task_L_TalkToNpc(0x1408ed,2,point,"Вахантур",0,1,2)

		--进入场景副本 11318
		local point = {"",1,100,10720,1634,1420}	
		if Task_L_LongGetTo(0x1408ed,3,11313,1,point) then
			local point = {"",1,100,10169,2207,1543}
			Task_L_AutoGetTo(0x1408ed,3,11313,point,1,0x2C36) 	
		end

		local point = {"",1,100,13533,12199,-1024}
		Task_L_TalkToNpc(0x1408ee,1,point,"Бомбур Пламегор",0,1,1)
		
		local point1 = {"",2,100,14002,12386,-1024}
		local point2 = {"",1,100,14017,12754,-515}	
		if Task_L_LongGetTo(0x1408ee,2,11313,2,point1,point2) then
			local point1 = {"",0,800,15454,12708,-512}
			local point2 = {"",0,800,14951,13670,-512}
			Task_L_LoopAttackMonMore(0x1408ee,2,0,2,point1,point2) 
		end
		--开传送阵
		local point = {"Шахтерский Amethyst Fog",1,100,17814,19037,-471}
		if Task_L_OpenTranMission(0x1408ee,3,point) == 1 then
			Task_L_LoopEquipFun()
			--买50瓶 1592的药, 并且卖东西
			local point = {"Порбель",1,100, 16838,17611,-511}
			Task_L_BuyItem(0x1408ee,3,50,6,"Super Healing Potion",point)

			--1.持久  2.背包空余
			Fun_SetBackHomeInfo(50, 50,0,0)
			--修理
			if Fun_IsHaveTask(0x1408ee,3) == 1 then
				if Fun_IsNeedBackHome() == 1 then
					MSG("LYlua 进入了修理函数")
					local BackHomeInfo = {
						0, --1比较小地图
						"Огненные копи", --大地图
						"Шахтёрский Amethyst Fog", --小地图
						"Шахтерский Amethyst Fog", --传送阵
						{ 17330,18030,-512 }, --修理NPC坐标
						{ 16838,17611,-511} --买卖NPC坐标
					}
					Fun_BackHome(BackHomeInfo)
				end
			end

			local point = {"",1,100,17453,18298,-512}
			Task_L_TalkToNpc(0x1408ee,3,point,"Бомбур Пламегор",0,1,2)
		end

		local point = {"",1,100,17874,17187,-512}
		Task_L_UseExpression(0x1408ee,4,"Talk",point) 
		
		local point = {"",1,100,18481,17734,-509}
		Task_L_UseExpression(0x1408ee,5,"Encourage",point) 

		if Task_L_GetTaskIsComplete(0x1408ee) then
			local point = {"",1,100,17453,18298,-512}
			Task_L_CompleteTask(0x1408ee ,6,point,"Бомбур Пламегор",-1)
		else
			local point = {"",1,100,18365,18524,-507}  
			Task_L_UseMusic(0x1408ee,6,"Song of Valor",point)
		end
		
		local point = {"",1,100,19604,21280,-768}
		Task_L_AutoGetTo(0x1408ef,1,11313,point,0,0) 
		
		local point = {"",1,100,19347,21391,-768}
		Task_L_TalkToNpc(0x1408ef,2,point,"Бомбур Пламегор",0,1,7) 

		local point = {"",1,100,19309,23783,-1280}
		Task_L_AutoGetTo(0x1408ef,3,11313,point,0,0) 
	
		local point = {"",1,100,18990,24394,-1269}
		Task_L_Collection(0x1408ef ,4,point) 

		local point = {"",1,100,19079,24353,-1269}
		Task_L_TalkToNpc(0x1408ef,5,point,"Бомбур Пламегор",0,1,4) 

		local point = {"",1,100,16922,24452,-1407}
		Task_L_TalkToNpc(0x1408ef,6,point,"Вахантур",0,1,1)

		local point = {"",1,100,16922,24452,-1407}
		Task_L_TalkToNpc(0x1408ef,8,point,"Вахантур",0,1,1) 
		
		local point = {"",1,500,15050,22436,-1663}
		Task_L_Collection(0x1408f2 ,1,point)  
		
		local point = {"",0,1000,13954,24305,-1664}
		Task_L_LoopAttackMonMore(0x1408f2,2,0,1,point) 
		
		local point1 = {"",2,500,15085,24836,-1680}
		local point2 = {"",2,100,14894,25497,-1657}	
		local point3 = {"",1,100,14242,27021,-1837}	   
		if Task_L_LongGetTo(0x1408f2,3,11313,3,point1,point2,point3) then
			local point = {"",1,100,13911,27138,-1837}
			Task_L_Collection(0x1408f2 ,3,point)  
		end

		local point = {"",1,100,13947,27265,-1836}
		Task_L_TalkToNpc(0x1408f2,4,point,"Вахантур",0,1,1) 
		
		local point = {"",1,100,14121,27181,-1836}
		Task_L_TalkToNpc(0x1408f2,5,point,"Бомбур Пламегор",0,1,8) 

		local point = {"",1,100,13947,27265,-1836}
		Task_L_TalkToNpc(0x1408f2,6,point,"Вахантур",0,1,2)
		
		local point1 = {"",0,800,15207,26879,-1838}
		local point2 = {"",0,800,15648,27440,-1838}
		Task_L_LoopAttackMonMore(0x1408f3,1,0,2,point1,point2)  
		
		local point = {"",1,100,14331,29688,-1836}
		Task_L_AutoGetTo(0x1408f3,2,11313,point,0,0)  
		
		local point1 = {"Collect",0,100,14105,30267,-1831}
		local point2 = {"Collect",1,100,14952,29567,-1834}
		local point3 = {"Collect",2,100,13576,30111,-1834}
		Task_L_BranchLine(0x1408f3,3,3,point1,point2,point3)
		
		local point = {"",1,100,13515,29469,-1834}
		Task_L_Collection(0x1408f3 ,4,point) 
		
		local point = {"",1,100,13515,29469,-1834}
		Task_L_Collection(0x1408f3 ,5,point)  

		local point = {"",1,100,13515,29469,-1834}
		Task_L_Collection(0x1408f3 ,6,point) 
	
		local point = {"",1,100,17529,29578,-1977}
		Task_L_AutoGetTo(0x1408f3,7,11313,point,0,0) 
		
		local point1 = {"",1,200,18152,29584,-1978}	
		local point2 = {"",1,100,16742,29390,-1978}
		Task_L_CarryItem(0x1408f3,8,0,point1,point2)
		
		local point1 = {"",1,200,18152,29584,-1978}	
		local point2 = {"",1,100,16750,29729,-1978}
		Task_L_CarryItem(0x1408f3,9,0,point1,point2)
		
		local point = {"",1,100,16894,28947,-1980}
		Task_L_Collection(0x1408f3 ,10,point) 

		local point = {"",1,100,19987,26660,-2030}
		Task_L_AutoGetTo(0x1408f3,11,11313,point,0,0) 
		
		local point = {"",1,100,20152,26681,-2026}
		Task_L_TalkToNpc(0x1408f3,12,point,"Вахантур",0,1,1)
	
		if Task_L_GetTaskIsComplete(0x1408f3) then
			local point = {"",1,100,20152,26681,-2026}
			Task_L_CompleteTask(0x1408f3 ,13,point,"Вахантур",-1)
		else
			local point = {"",1,100,21463,26435,-2037}
			Task_L_Collection(0x1408f3 ,13,point) 
		end

		local point = {"",1,100,20083,26874,-2026}
		Task_L_TalkToNpc(0x1408f4,1,point,"Бомбур Пламегор",0,1,9) 

		local point1 = {"",2,100,14069,26718,-1838}
		local point2 = {"",2,100,13175,25847,-2352}	
		local point3 = {"",1,100,7773,28998,-1563}	   
		Task_L_LongGetTo(0x1408f4,2,11313,3,point1,point2,point3)

		--开传送阵
		local point = {"Грейтенская хмелеварня",1,100,7153,29069,-1537}
		if Task_L_OpenTranMission(0x1408f0,1,point) == 1 then
			local point = {"",1,100,7757,29667,-1550}
			Task_L_TalkToNpc(0x1408f0,1,point,"Вахантур",0,1,1)
		end

		local point = {"",1,100,7868,29553,-1562}
		Task_L_TalkToNpc(0x1408f0,2,point,"Бомбур Пламегор",0,1,2) 

		local point = {"",1,100,7757,29667,-1550}
		Task_L_TalkToNpc(0x1408f0,3,point,"Вахантур",0,1,2)

		local point = {"",1,100,7868,29553,-1562}
		Task_L_TalkToNpc(0x1408f0,4,point,"Бомбур Пламегор",0,1,3)

		--进入场景副本 11318
		local point = {"",1,100,7679,29354,-1557}	
		if Task_L_LongGetTo(0x1408f0,5,11313,1,point) then
			local point = {"",1,100,7217,30319,-1441}
			Task_L_AutoGetTo(0x1408f0,5,11313,point,2,0x2C57) 	
		end
		--Fun_GoToDungeons("Огненные копи","Грейтенская хмелеварня",0x2C57,0,FBpoint,0,ErrorPoint)

		--酒厂副本
		if Fun_IsHaveTask(0x1408f0,5) == 1 then  
			while 1 do
				if Fun_IsThreadExit()==1 then
					MSG("LYLUA 退出线程")
					break
				end
				if fun.Fb() == 1 then
					break
				end
			end
		end
			
		if Task_L_GetTaskIsComplete(0x1408f1) then
			local point = {"",1,100,7757,29667,-1550}
			Task_L_CompleteTask(0x1408f1 ,1,point,"Вахантур",-1)
		else
			local point = {"",1,100,7868,29553,-1562}
			Task_L_TalkToNpc(0x1408f1,1,point,"Бомбур Пламегор",0,1,1)
		end

		
		local point1 = {"",1,100,7511,26075,-2563}
		local point2 = {"",1,100,2819,23235,-2562}
		local point3 = {"",1,100,2548,30156,-1984}
		Task_L_LongGetTo(0x140cd1,1,11313,3,point1,point2,point3)
	end
	--酒厂副本
	if Fun_IsInMapByMapId(11351) then
		--酒厂副本
		if Fun_IsHaveTask(0x1408f0,5) == 1 then  
			while 1 do
				if Fun_IsThreadExit()==1 then
					MSG("LYLUA 退出线程")
					break
				end
				if JiuChangFun.Fb() == 1 then
					break
				end
			end
		end
	end
	----------------------------------------第5章地图--------------------------------
	if Fun_IsInMapByMapId(11314) then
		GlobalFun(0)
		local point = {"",1,100,-7229,-28613,3942}
		Task_L_TalkToNpc(0x140cd1,1,point,"Бригадир Видар",0,1,1)

		local point = {"",1,100,-7264,-28883,3940}
		Task_L_TalkToNpc(0x140cd1,2,point,"Вахантур",0,1,1)

		local point1 = {"",1,200,-6738,-26294,3428}	
		local point2 = {"",1,100,-6835,-29029,3940}		
		Task_L_CarryItem(0x140cd1,3,1,point1,point2)
		
		local point = {"",1,100,-7229,-28613,3942}
		Task_L_TalkToNpc(0x140cd1,4,point,"Бригадир Видар",0,1,2)

		local point1 = {"",0,800,-9879,-29084,3940}
		local point2 = {"",0,800,-10149,-29978,3940}
		Task_L_LoopAttackMonMore(0x140cd1,5,0,2,point1,point2) 
		
		local point = {"",1,100,-11390,-30033,4024}
		Task_L_TalkToNpc(0x140cd1,6,point,"Горняк Гобель",0,1,1)

		--开传送阵
		local point = {"Вагонеточный разъезд",1,100,-13429,-27376,3955}
		if Task_L_OpenTranMission(0x140cd1,7,point) == 1 then
			local point = {"",1,100,-14411,-26983,3946}
			Task_L_AutoGetTo(0x140cd1,7,11314,point,0,0) 
		end
		
		local point = {"",1,100,-14522,-26759,3940}
		Task_L_TalkToNpc(0x140cd2,1,point,"Пьер",0,1,1) 
		
		local point = {"",1,100,-14596,-26515,3940}
		Task_L_TalkToNpc(0x140cd2,2,point,"Вахантур",0,1,1)

		local point = {"",1,100,-14651,-26682,3940}
		Task_L_UseExpression(0x140cd2,3,"Talk",point) 
		
		local point = {"",1,100,-14651,-26682,3940}
		Task_L_UseTaskItem(0x140cd2,4,point)
		
		local point = {"",1,100,-14596,-26515,3940}
		Task_L_TalkToNpc(0x140cd2,5,point,"Вахантур",0,1,2)

		local point = {"",1,100,-14522,-26759,3940}
		Task_L_TalkToNpc(0x140cd2,6,point,"Пьер",0,1,2) 

		local point = {"",1,100,-14690,-26910,3940}
		Task_L_Collection(0x140cd2 ,7,point) 

		local point = {"",1,100,-14522,-26759,3940}
		Task_L_TalkToNpc(0x140cd3,1,point,"Пьер",0,1,3)

		local point = {"",1,100,-25142,-30338,3428}
		Task_L_AutoGetTo(0x140cd3,2,11314,point,0,0)
		
		local point = {"",1,100,-27330,-29820,2904}
		Task_L_TalkToNpc(0x140cd3,3,point,"Пьер",0,1,1)
	
		local point1 = {"",0,800,-30681,-30854,2904}
		local point2 = {"",0,1000,-32156,-31298,2904}
		local point3 = {"",0,1000,-33131,-29142,3100}
		Task_L_LoopAttackMonMore(0x140cd3,4,0,3,point1,point2,point3) 

		local point = {"",1,100,-30658,-25482,2904}
		Task_L_AutoGetTo(0x140cd4,1,11314,point,0,0)

		local point1 = {"",2,100,-30658,-25482,2904}
		local point2 = {"",1,100,-30132,-25756,3416}	
		if Task_L_LongGetTo(0x140cd4,2,11314,2,point1,point2) then
			local point = {"",1,100,-29706,-25794,3416}
			Task_L_TalkToNpc(0x140cd4,2,point,"Пьер",0,1,1)
		end

		local point = {"",1,100,-29987,-26494,3416}
		Task_L_AutoGetTo(0x140cd4,3,11314,point,0,0)

		local point = {"",1,100,-29706,-25794,3416}
		Task_L_TalkToNpc(0x140cd4,4,point,"Пьер",0,1,2)

		local point = {"",1,100,-29946,-26062,3416}
		Task_L_UseTaskItem(0x140cd4,5,point)
		
		local point = {"",1,100,-30074,-25444,3416}
		Task_L_TalkToNpc(0x140cd4,6,point,"Пьер",0,1,1)
		
		local point1 = {"",2,100,-30489,-25506,3417}
		local point2 = {"",1,100,-28350,-21014,2904}	
		Task_L_LongGetTo(0x140cd5,1,11314,2,point1,point2)

		local point = {"",1,100,-24804,-22708,2920}
		Task_L_AutoGetTo(0x140cd5,2,11314,point,0,0)

		local point = {"",1,300,-24804,-22708,2920}
		Task_L_Collection(0x140cd5 ,3,point)
		
		local point = {"",1,300,-23879,-22446,2916}
		Task_L_Collection(0x140cd5 ,4,point) 

		local point = {"",1,300,-24978,-20432,2916}
		Task_L_Collection(0x140cd5 ,5,point)
		
		local point = {"",1,100,-24726,-20390,2916}
		Task_L_TalkToNpc(0x140cd6,1,point,"Пьер",0,1,2)

		local point = {"",1,100,-24989,-20495,2916}
		Task_L_TalkToNpc(0x140cd6,2,point,"Вахантур",0,1,1)

		local point = {"",1,100,-23468,-17183,2918}
		Task_L_AutoGetTo(0x140cd6,3,11314,point,0,0)
		
		local point = {"",1,100,-23777,-17178,2923}
		Task_L_TalkToNpc(0x140cd6,4,point,"Пьер",0,1,3)
	
		local point = {"",1,100,-25659,-17263,2916}
		Task_L_AutoGetTo(0x140cd6,5,11314,point,0,0)

		local point = {"",1,100,-25548,-17549,2916}
		Task_L_TalkToNpc(0x140cd6,6,point,"Вахантур",0,1,1)

		local point = {"",1,100,-25456,-17172,2916}
		Task_L_TalkToNpc(0x140cd6,7,point,"Пьер",0,1,1)

		--进入场景副本 11319
		local point = {"",1,100,-25008,-17255,2922}	
		if Task_L_LongGetTo(0x140cd6,8,11314,1,point) then
			local point = {"",1,100,-25724,-17263,2911}
			Task_L_AutoGetTo(0x140cd6,8,11314,point,1,0x2C37) 	
		end

		local point = {"",1,100,-25448,-17146,2916}
		Task_L_TalkToNpc(0x140cd6,9,point,"Пьер",0,1,3)  

		local point = {"",1,300,-25203,-17760,2916}
		Task_L_Collection(0x140cd6 ,10,point)

		local point = {"",1,100,-25448,-17146,2916}
		Task_L_TalkToNpc(0x140cd7,1,point,"Пьер",0,1,2)
		
		local point = {"",1,100,-25504,-17523,2916}
		Task_L_TalkToNpc(0x140cd7,2,point,"Вахантур",0,1,2)
		--开传送阵
		local point = {"Колыбель Аддакора",1,100,-22313,-12440,2932}
		if Task_L_OpenTranMission(0x140cd7,3,point) == 1 then
			local point1 = {"",2,100,-23066,-11965,2847}
			local point2 = {"",1,100,-20786,-3774,2340}	
			Task_L_LongGetTo(0x140cd7,3,11314,2,point1,point2)
		end

		if Task_L_GetTaskIsComplete(0x140cd7) then
			local point = {"",1,100,-20760,-3474,2340}
			Task_L_CompleteTask(0x140cd7 ,4,point,"Дозорный Дунхилд",-1)
		else
			local point = {"",1,100,-20790,-3431,2353}
			Task_L_UseTaskItem(0x140cd7,4,point)

		end

		local point = {"",1,100,-20989,-1016,2088}
		Task_L_AutoGetTo(0x140cd8,1,11314,point,0,0)
	end
	----------------------------------------第6章地图--------------------------------
	if Fun_IsInMapByMapId(11315) then
		GlobalFun(0)
		local point = {"",1,100,5654,1921,257}
		Task_L_TalkToNpc(0x1410b9,1,point,"Вахантур",0,1,1)

		--开传送阵
		local point = {"Старая крепость",1,100,580,2580,172}
		if Task_L_OpenTranMission(0x1410b9,2,point) == 1 then	
			local point = {"",1,100,8557,3329,183}
			Task_L_AutoGetTo(0x1410b9,2,11315,point,0,0)
		end

		local point = {"",1,100,9114,3396,134}
		Task_L_Collection(0x1410b9 ,3,point)

		local point = {"",1,100,9932,2549,129}
		Task_L_Collection(0x1410b9 ,4,point)

		local point = {"",1,100,9157,3360,134}
		Task_L_UseTaskItem(0x1410b9,5,point)  

		local point = {"",1,100, 9113,3402,134}
		Task_L_TalkToNpc(0x1410b9,6,point,"Шатур",0,1,4) 

		local point = {"",1,100,9112,3156,134}
		Task_L_TalkToNpc(0x1410b9,7,point,"Вахантур",0,1,1)

		local point = {"",1,100, 9113,3402,134}
		Task_L_TalkToNpc(0x1410b9,8,point,"Шатур",0,1,1) 

		local point = {"",1,100, 9113,3402,134}
		Task_L_TalkToNpc(0x1410b9,9,point,"Шатур",0,1,5) 

		local point = {"",1,100,10078,3731,143}
		Task_L_Collection(0x1410b9 ,10,point)

		local point = {"",1,100,9112,3156,134}
		Task_L_TalkToNpc(0x1410b9,11,point,"Вахантур",0,1,2)

		local point = {"",1,100,6783,7557,524}
		Task_L_AutoGetTo(0x1410ba,1,11315,point,0,0)
	
		local point = {"",1,100,4949,9149,517}
		Task_L_AutoGetTo(0x1410ba,2,11315,point,0,0)

		local point = {"",1,100,4139,9103,417}
		Task_L_Collection(0x1410ba ,3,point)  

		local point = {"",1,100, 3618,9190,497}
		Task_L_TalkToNpc(0x1410ba,4,point,"Троин",0,1,1)
		
		local point1 = {"",0,600,9153,12313,645}
		local point2 = {"",0,600,10081,12526,645}
		local point3 = {"",0,600,10214,11278,644}
		local point4 = {"",0,600,9289,11068,640}
		Task_L_LoopAttackMonMore(0x1410ba,5,0,4,point1,point2,point3,point4) 
		
		local point1 = {"",2,300,10984,15370,670}
		local point2 = {"",2,300,13678,16792,-329}	
		local point3 = {"",1,100,16280,17449,245}	
		Task_L_LongGetTo(0x1410ba,6,11315,3,point1,point2,point3)

		local point = {"",1,100, 16773,17288,245}
		Task_L_TalkToNpc(0x1410ba,7,point,"Троин",0,1,1)
		
		local point1 = {"",2,300,13828,16777,177}
		local point2 = {"",1,100,13385,16773,-374}	
		if Task_L_LongGetTo(0x1410ba,8,11315,2,point1,point2) then
			local point1 = {"",0,600,11533,19010,-124}
			local point2 = {"",0,600,9643,19750,-122}
			local point3 = {"",0,600,11086,19864,-120}
			Task_L_LoopAttackMonMore(0x1410ba,8,0,3,point1,point2,point3)  
		end

		if Task_L_GetTaskIsComplete(0x1410ba) then
			local point = {"",1,100,10090,22043,-110}
			Task_L_CompleteTask(0x1410ba ,9,point,"Троин",-1)
		else
			local point1 = {"",2,300,9772,20868,-123}
			local point2 = {"",1,100,9963,22003,-112}	
			Task_L_LongGetTo(0x1410ba,9,11315,2,point1,point2)
		end

		if Task_L_GetTaskIsComplete(0x1410be) then
			--开传送阵
			local point = {"Заброшенный тракт",1,100,22388,10043,1293}
			if Task_L_OpenTranMission(0x1410be,1,point) == 1 then
				local point = {"",1,100,24327,8171,1278}
				Task_L_CompleteTask(0x1410be ,1,point,"Троин",-1)
			end
		else
			local point1 = {"",2,100,9946,22194,-110}
			local point2 = {"",2,100,11204,23570,128}
			local point3 = {"",1,100,11236,23897,1149}  	
			if Task_L_LongGetTo(0x1410be,1,11315,3,point1,point2,point3) then
				--进入剧情副本 11320
				local point = {"",1,100,11519,24345,1146}	
				if Task_L_LongGetTo(0x1410be,1,11315,1,point) then
					local point = {"",1,100,11236,23897,1149}
					Task_L_AutoGetTo(0x1410be,1,11315,point,1,0x2C38) 	
				end
			end
		end

		local point = {"",1,100,24298,8191,1278}
		Task_L_TalkToNpc(0x1410bb,1,point,"Троин",0,1,1) 

		local point = {"",1,100,24388,8507,1278}
		Task_L_TalkToNpc(0x1410bb,2,point,"Шатур",0,1,1) 

		local point = {"",1,100,24088,8130,1277}
		Task_L_TalkToNpc(0x1410bb,3,point,"Вахантур",0,1,1) 

		local point = {"",1,100,21881,7674,1152}
		Task_L_AutoGetTo(0x1410bb,4,11315,point,0,0) 

		local point = {"",1,100,24458,4195,626}
		Task_L_AutoGetTo(0x1410bb,5,11315,point,0,0) 

		local point = {"",1,100,25362,3932,626}
		Task_L_TalkToNpc(0x1410bc,1,point,"Троин",0,1,1) 
		
		local point = {"",1,100,25274,4405,626}
		Task_L_TalkToNpc(0x1410bc,2,point,"Вахантур",0,1,1) 

		--进入副本 11352
		local point = {"",1,100,24900,4174,626}	
		if Task_L_LongGetTo(0x1410bc,3,11315,1,point) then
			local point = {"",1,100,25657,4167,626}
			Task_L_AutoGetTo(0x1410bc,3,11315,point,2,0x2C58) 	
		end

		local point = {"",1,100,25305,4406,626}
		Task_L_TalkToNpc(0x1410bc,4,point,"Вахантур",0,1,3) 

		local point = {"",1,100,25400,4324,626}
		Task_L_TalkToNpc(0x1410bc,5,point,"Гроин",0,1,1) 

		local point = {"",1,100,25391,3953,626}
		Task_L_TalkToNpc(0x1410bc,6,point,"Троин",0,1,2) 

		local point = {"",1,100,25305,4406,626}
		Task_L_TalkToNpc(0x1410bc,7,point,"Вахантур",0,1,2) 
		
		--使用传送阵
		Task_L_UseTransmit(0x1410bd,1,"Свет Арктуса","Айзендельф")
	end
	---------------------------------------------------------------------------
	-------------------------------航海--------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(30703) or Fun_IsInMapByMapId(30704) then

		--卢兰大陆任务完成出海	

		Task_H_LoadBoater(0x3d10d1,1,"Eshu")

		if Fun_IsHaveTask(0x3d10d1,2) == 1 then
			MSG("Lei 装载船员")
			Task_H_LoadBoater(0x3d10d1,2,"Eshu")
		end

		local point = {"",1,100,-28978,34993,1}
		Task_L_AutoGetTo(0x3d10d1,3,30703,point,0,0)

		local point = {"",1,100,-28660,37957,1}
		Task_L_AutoGetTo(0x3d10d1,4,30703,point,0,0)
		
		local point1 = {"",0,100,-28583,38535,1}
		local point2 = {"",0,100,-28274,38732,1}
		local point3 = {"",0,100,-28001,38504,1}
		local point4 = {"",0,100,-27869,38712,1}
		local point5 = {"",0,100,-27686,38994,1}
		Task_L_LoopCollectMore(0x3d10d1,5,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,-20759,42999,1}
		Task_L_AutoGetTo(0x3d10d1,6,30703,point,0,0)
		
		local point = {"",1,100,-17941,46547,3}
		Task_L_TalkToNpc(0x3d10d1,7,point,"Tea and Libra Guild Vessel",0,1,1)

		local point = {"",1,100,-17273,45464,1}
		Task_L_AutoGetTo(0x3d10d1,8,30703,point,0,0)

		local point = {"",1,100,-17273,45464,1}
		Task_H_GetInDockAndBackLand(0x3d10d1,9,point)
		----------------------托托克岛完成出海-----------------------
		local arr = {"Eshu","Mokamoka"}
		Task_H_MemsetBoaterAndLoad(0x3d10d2,3,arr)

		local point = {"",1,100,1793,58672,1}
		Task_H_GetInDockAndBackLand(0x3d10d2,3,point)

		-----------------------安忆谷出海----------------------------
		Task_H_LeavePort(0x3d10d3,2)

		local point = {"",1,100,26115,52901,1}
		Task_L_AutoGetTo(0x3d10d3,2,30703,point,0,0)

		local point = {"",1,100,39129,52659,1}
		Task_H_GetInDockAndBackLand(0x3d10d3,3,point)
		------------------------阿尔因泰出海--------------------------
		Task_H_LeavePort(0x3d10d4,4)

		local point = {"",1,100,30406,36647,1}
		Task_L_AutoGetTo(0x3d10d4,4,30703,point,0,0)

		local point = {"",2,100,30406,36647,1}
		Task_L_LongGetTo(0x3d10d4,5,30703,1,point)

		local point = {"",1,100,24975,36471,1}
		Task_L_AutoGetTo(0x3d10d4,6,30703,point,0,0)

		local point = {"",1,100,19739,37086,1}
		Task_L_AutoGetTo(0x3d10d4,7,30703,point,0,0)
		
		local point = {"",1,100,19739,37086,1}
		Task_L_Collection(0x3d10d4,8,point)

		local point = {"",1,100,19359,36696,1}
		Task_L_Collection(0x3d10d4,9,point)	

		local point = {"",1,100,12779,16778,1}
		Task_H_GetInDockAndBackLand(0x3d10d5,5,point)
		------------------------------------------------------------
		if Fun_IsHaveTask(0x3d0d6a,2) == 1 then
			Fun_Sleep(10000)
			if Task_H_LoadBoater(0x3d0d6a,2,"Eshu") then
				local point = {"",1,100,-45933,34020,1}
				Task_L_Collection(0x3d0d6a,2,point)	
			end
		end
		------------------------------------------------------------
		if Task_L_GetTaskIsComplete(0x3d0d6b) then
		else
			Task_H_LevUpBoat(0x3d0d6b,2)
		end
		--------------------------------------------------------------
		--贝隆任务做完出海
		if Fun_IsHaveTask(0x10d0b3,2) == 1 then
			local arr = {"Eshu","Mokamoka"}
			if H_SelectBoatAndLoad(2,arr) == 1 then
				local point1 = {"",1,100,59029,-4144,1}
				local point2 = {"",1,100,60596,-3124,1}
				local point3 = {"",1,100,64028,360,1}
				Task_L_LongGetTo(0x10d0b3,2,30703,3,point1,point2,point3)
			end
		end
		--------------------------------------------------------------
		if GetTaskAlreadyComplete(0x3d0d6a) == 1 and GetTaskAlreadyComplete(0x3d0d6b) == 1 then
			MSG("Lei 贝隆和修沙瑞任务做完，航海去罗亨达尔")
			local point = {"",1,100,-2406,-74998,1}
			Task_H_GetInDockAndBackLand(0x452019,2,point)
		end
		--------------------------------------------------------------

		-------------------------------------------------------------
	end
	---------------------------------------------------------------------------
	-------------------------------大教堂--------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(50048) then
		local point1 = {"",1,100,4025,4844,2}
		local point2 = {"",1,100,4481,5033,111}
		local point3 = {"",1,100,4151,4855,-14210}
		if Task_L_LongGetTo(0x3d0d6a,3,50048,3,point1,point2,point3) then
			local point = {"",1,100,4151,4855,-14210}
			Task_L_TalkToNpc(0x3d0d6a,3,point,"Minerva",0,1,6)
		end

		local point = {"",1,100,5816,2671,-14209}
		Task_L_Collection(0x3d0d6a,4,point)	

		if Task_L_GetTaskIsComplete(0x3d0d6a) then
			local point = {"",10,100,4151,4855,-14210}
			Task_L_UseMusic(0x3d0d6a,5,"Song of Return",point)
		else
			local point = {"",1,100,4151,4855,-14210}
			Task_L_TalkToNpc(0x3d0d6a,5,point,"Minerva",0,1,4)
		end
		
	end
	---------------------------------------------------------------------------
	-------------------------------歌唱岛--------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(50003) then
		local point = {"",1,300,6845,14375,14}
		Task_L_TalkToNpc(0x3d0ced,6,point,"Старейшина Тото",0,1,5)

		local point = {"",1,300,6845,14375,14}
		Task_L_Collection(0x3d0ced,7,point)

		local point = {"",1,300,6845,14375,14}
		Task_L_TalkToNpc(0x3d0ced,8,point,"Старейшина Тото",0,1,7)

		local point = {"",1,100,7175,11376,16}
		Task_L_AutoGetTo(0x3d0ced,9,50003,point,0,0) 	

		local point = {"",1,100,7175,11376,16}
		Task_L_Collection(0x3d0ced,10,point)

		local point = {"",1,100,7098,11373,16}
		Task_L_TalkToNpc(0x3d0ced,11,point,"Барри",0,1,1)

		local point = {"",1,100,7270,11384,16}
		Task_L_TalkToNpc(0x3d0ced,12,point,"Фило",0,1,5)

		local point = {"",1,100,7270,11384,16}
		Task_L_Collection(0x3d0ced,13,point)

		local point = {"",1,100,7098,11373,16}
		Task_L_Collection(0x3d0ced,14,point)

		local point = {"",1,100,7098,11373,16}
		Task_L_UseMusic(0x3d0ced,15,"Песнь возвращения",point)
	end
	---------------------------------------------------------------------------
	-------------------------------熊猫岛--------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(50064) then

		local point = {"",1,100,10662,11518,1124}
		Task_L_AutoGetTo(0x3d0cef,2,50064,point,0,0)
		
		local point = {"",1,100,10759,11475,1124}
		Task_L_Collection(0x3d0cef,3,point)

		local point = {"",1,100,10759,11475,1124}
		Task_L_UseTaskItem(0x3d0cef,4,point)

		local point = {"",1,100,10759,11475,1124}
		Task_L_UseMusic(0x3d0cef,5,"Песнь возвращения",point)
	end
	---------------------------------------------------------------------------
	-------------------------------女神岛--------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(50032) then
		local point = {"",1,100,9682,6676,5}
		Task_L_TalkToNpc(0x3d10d5,1,point,"Grandpa Opher",0,1,0x0E)

		if Fun_IsHaveTask(0x3d10d5,2) == 1 then
			Fun_Sleep(2000)
			local point = {"",1,100,9577,7428,12}
			Task_L_Collection(0x3d10d5,2,point)
		end

		local point = {"",1,100,9682,6676,5}
		Task_L_TalkToNpc(0x3d10d5,3,point,"Grandpa Opher",0,1,0x0F)

		Task_L_AcceptGlobalTask(0x451fcb)

		local point = {"Grandpa Opher",1,100,9682,6676,5}
		Task_L_AcceptTask(0x3d10d5,4,0x4cc8a7,point)

		if Task_L_GetTaskIsComplete(0x4cc8a7) then
			local point = {"",1,300,9682,6676,5}
			Task_L_CompleteTask(0x4cc8a7 ,1,point,"Grandpa Opher",-1)
		else
			local point = {"",1,300,9682,6676,5}
			Task_L_TalkToNpc(0x4cc8a7,1,point,"Grandpa Opher",0,1,1)
		end

		if Task_L_GetTaskIsComplete(0x451fcb) then
			local point = {"",1,300,10875,6374,32}
			Task_L_CompleteTask(0x451fcb ,1,point,"Haberk",-1)
		else
			local point = {"",1,300,10875,6374,32}
			Task_L_TalkToNpc(0x451fcb,1,point,"Haberk",0,1,1)
		end

		if Task_L_FindTask(0x4cc8a7) == 0 and Task_L_FindTask(0x451fcb) == 0 then 
			local point = {"",1,100,10919,5495,-3}
			Task_L_LongGetTo(0x3d10d5,5,50032,1,point)
		end
		
		if Task_L_FindTask(0x4cc8a7) == 0 and Task_L_FindTask(0x451fcb) == 0 then 
			local point = {"",1,100,10919,5495,-3}
			Task_L_Collection(0x3d10d5,4,point)
			Fun_Sleep(10000)
		end
	end
	-------------------------------日常任务冲突--------------------------------

	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	-------------------------------航海场景副本--------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(30724) then

		local point = {"",1,500,-70,-1119,477}
		Task_L_Collection(0x3d1261,1,point)

		local AllTaskId = {0x3d1261,0}
		local point = {"",1,500,-70,-1119,477}
		Task_L_CheckTaskOver(30724,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(30725) then
		local point = {"",1,100,300,-1047,470}
		Task_L_Collection(0x3d0e79,1,point)
		
		local point = {"",1,100,333,-38,262}
		Task_L_TalkToNpc(0x3d0e79,2,point,"Рыбачка Таша",0,1,2)

		local AllTaskId = {0x3d0e79,0}
		local point = {"",1,100,333,-38,262}
		Task_L_CheckTaskOver(30725,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	--------------------------------场景副本-----------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10337) then
		Task_L_SetMapId(10337,2)

		local point = {"",1,100,10324,8755,896}
		Task_L_TalkToNpc(0x63382,1,point,"Daybreaker Javern",0,1,1)

		local point = {"",1,100,10913,8964,896}
		Task_L_TalkToNpc(0x63382,2,point,"Madnick",0,1,1)

		local point1 = {"",2,100,11355,8889,961}
		local point2 = {"",1,100,11531,8875,1477}
		if Task_L_LongGetTo(0x63382,3,10337,2,point1,point2) then
			local point = {"",1,100,11531,8875,1477}
			Task_L_Collection(0x63382,3,point)
		end

		local point1 = {"",2,100,11531,8875,1477}
		local point2 = {"",1,100,10913,8964,896}
		if Task_L_LongGetTo(0x63382,4,10337,2,point1,point2) then
			local point = {"",1,100,10913,8964,896}
			Task_L_TalkToNpc(0x63382,4,point,"Madnick",0,1,2)
		end

		local point = {"",1,100,10324,8755,896}
		Task_L_LoopCollectMore(0x63382,5,2,1,point)

		local point = {"",1,100,9039,9024,1032}
		Task_L_LoopCollectMore(0x63382,5,1,1,point)

		local point = {"",1,100,7602,9147,1216}
		Task_L_LoopCollectMore(0x63382,5,3,1,point)

		local point = {"",1,100,7862,11233,1057}
		Task_L_LoopCollectMore(0x63382,5,0,1,point)	
		
		local point = {"",1,100,10240,11994,768}
		Task_L_LongGetTo(0x63382,6,10337,1,point)

		local point = {"",1,100,9300,12191,802}
		Task_L_TalkToNpc(0x63382,7,point,"Madnick",4,1,3)

		local AllTaskId = {0x63382,0}
		local point = {"",1,100,9300,12191,802}
		Task_L_CheckTaskOver(10337,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10336) then
		Task_L_SetMapId(10336,2)
		
		local point = {"",1,100,24446,24897,182}
		Task_L_LongGetTo(0x64321,1,10336,1,point)	

		local point = {"",0,2000,24850,24839,180}
		Task_L_LoopAttackMonMore(0x64321,2,0,1,point)

		local point = {"",1,100,24850,24839,180}
		Task_L_TalkToNpc(0x64321,3,point,"Madnick",0,1,1)

		local AllTaskId = {0x64321,0}
		local point = {"",1,100,24850,24839,180}
		Task_L_CheckTaskOver(10336,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10332) then
		Task_L_SetMapId(10332,2)

		local point = {"",1,100,16075,7975,4685}
		Task_L_LongGetTo(0x6376b,1,10332,1,point)	

		local point = {"",0,2000,17112,7967,4686}
		Task_L_LoopAttackMonMore(0x6376b,2,0,1,point)

		local point = {"",1,100,17288,7954,4686}
		Task_L_Collection(0x6376b,3,point)

		local point = {"",1,100,17391,7697,4686}
		Task_L_TalkToNpc(0x6376b,4,point,"Madnick",0,1,1)

		local AllTaskId = {0x6376b,0}
		local point = {"",1,100,17391,7697,4686}
		Task_L_CheckTaskOver(10332,AllTaskId,point)	

	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10335) then
		Task_L_SetMapId(10335,2)

		local point = {"",1,100,7041,5907,2690}
		Task_L_LongGetTo(0x63b51,1,10335,1,point)

		local point = {"",1,100,7044,5991,2690}
		Task_L_TalkToNpc(0x63b51,2,point,"Guard Lawson",0,1,1)

		local point = {"",0,2000,7032,5750,2690}
		Task_L_LoopAttackMonMore(0x63b51,3,0,1,point)

		local point = {"",0,2000,7032,5750,2690}
		Task_L_LoopAttackMonMore(0x63b51,4,0,1,point)

		local point = {"",0,2000,7032,5750,2690}
		Task_L_LoopAttackMonMore(0x63b51,5,0,1,point)

		local point = {"",1,100,7044,5991,2690}
		Task_L_TalkToNpc(0x63b51,6,point,"Guard Lawson",6,1,2)

		local point = {"",1,100,7041,8104,3080}
		Task_L_TalkToNpc(0x63b51,7,point,"Belmon",6,1,1)

		local point = {"",1,100,7441,10861,3464}
		Task_L_LongGetTo(0x63b51,8,10335,1,point)

		local point = {"",0,1500,7441,10861,3464}
		Task_L_LoopAttackMonMore(0x63b51,9,0,1,point)

		local point = {"",0,1500,7441,10861,3464}
		Task_L_LoopAttackMonMore(0x63b51,9,1,1,point)
		
		local point = {"",1,100,7218,10402,3456}
		Task_L_TalkToNpc(0x63b51,10,point,"Guard Nadal",0,1,1)

		if Task_L_FindTask(0x63b51) == 0 then
			local point = {"",1,100,8059,10743,3459}
			Task_L_LongGetTo(0x639c3,3,10335,1,point)
		end
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10338) then
		Task_L_SetMapId(10338,2)
		local point = {"",0,3000,14159,13024,3791}
		Task_L_LoopAttackMonMore(0x6376a,1,0,1,point)

		if Task_L_FindTask(0x6376a) == 0 then
			local point = {"",1,100,13613,12463,3793}
			Task_L_LongGetTo(0x635de,1,10338,1,point)
		end
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10331) then--这个副本需要手动
		Task_L_SetMapId(10331,2)

		local point = {"",1,100,3594,8247,4334}
		Task_L_Collection(0x63769,1,point)

		local point1 = {"",1,100,4187,8231,4334}
		local point2 = {"",1,100,5216,7327,4339}
		if Task_L_LongGetTo(0x63769,2,10331,2,point1,point2) then
			local point = {"",1,100,5216,7327,4339}
			Task_L_Collection(0x63769,2,point)
		end

		local point = {"",0,100,9388,8304,4080}
		Task_L_LoopCollectMore(0x6376c,1,1,1,point)

		local point = {"",0,100,9882,7506,4078}
		Task_L_LoopCollectMore(0x6376c,1,0,1,point)

		local point = {"",1,100,10656,8096,4082}
		Task_L_TalkToNpc(0x6376c,2,point,"Arena Guard",0,1,1)

		local point1 = {"",1,100,13416,7985,4079}
		local point2 = {"",1,100,15939,7987,4682}
		Task_L_LongGetTo(0x6376c,3,10331,2,point1,point2)

		local point = {"",1,2000,17194,8183,4686}	
		Task_L_AttackByName(0x6376c ,4,point,"Agherun",1)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10333) then
		Task_L_SetMapId(10333,2)

		local point = {"",1,100,10521,8263,896}
		Task_L_TalkToNpc(0x63381,1,point,"Daybreaker Javern",4,1,1)


		if Task_L_FindTask(0x63381) == 0 then
			local point = {"",1,100,8542,8839,1230}
			Task_L_LongGetTo(0x631f3,1,10333,1,point)
		end
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10334) then
		Task_L_SetMapId(10334,2)

		local point = {"",1,100,-8080,20662,497}
		Task_L_Collection(0x62f99,1,point)

		local point = {"",0,100,-8069,21716,294}
		Task_L_LoopCollectMore(0x62f99,2,0,1,point)

		local point = {"",0,100,-8299,23001,309}
		Task_L_LoopCollectMore(0x62f99,2,2,1,point)

		local point = {"",0,100,-8113,23829,299}
		Task_L_LoopCollectMore(0x62f99,2,1,1,point)

		local point = {"",1,100,-8157,23601,298}
		Task_L_TalkToNpc(0x62f99,3,point,"Bounty Hunter Pidge",6,1,2)--这里有BUG

		local point1 = {"",1,100,-8726,23443,294}
		local point2 = {"",1,100,-9101,23445,294}
		Task_L_LongGetTo(0x62f99,4,10334,2,point1,point2)

		local point = {"",1,100,-9215,23475,298}
		Task_L_TalkToNpc(0x62f99,5,point,"Bounty Hunter Pidge",0,1,1)

		local point = {"Bounty Hunter Pidge",1,800,-9215,23475,298}
		Task_L_AcctackNpc(0x62f99,6,point) 

		local point = {"",1,100,-9059,23586,294}
		Task_L_Collection(0x62f99,7,point)

		local point = {"",1,100,-9028,24084,294}
		Task_L_TalkToNpc(0x62f99,8,point,"Fahr",0,1,1)

		local point = {"",1,100,-6278,22365,490}
		Task_L_LongGetTo(0x62f99,9,10334,1,point)

		local point = {"",1,100,-6278,22365,490}
		Task_L_TalkToNpc(0x62f99,10,point,"Fahr",0,1,2)

		if Fun_IsHaveTask(0x62f99,11) == 1 then
			local point = {"",1,100,-7155,22284,490}
			if Task_L_LongGetTo(0x62f99,11,10334,1,point) then
				local point = {"",1,600,-7155,22284,490}
				if Fun_IsInPoint(point) == 1 then
					local point = {"",1,400,-7155,22284,490}
					Task_L_AttackPoint(0x62f99,11,point)
				end

				local point = {"",1,100,-6145,21715,490}
				Task_L_LongGetTo(0x62f99,11,10334,1,point)
			end
		end

		local point = {"",0,1000,-6145,21715,490}
		Task_L_LoopAttackMonMore(0x62f99,12,0,1,point)

		local point = {"",0,100,-5933,21455,490}
		Task_L_LoopCollectMore(0x62f99,13,2,1,point)

		local point = {"",0,100,-5916,21292,497}
		Task_L_LoopCollectMore(0x62f99,13,1,1,point)

		local point = {"",0,100,-5916,21292,497}
		Task_L_LoopCollectMore(0x62f99,13,0,1,point)

		local point = {"",1,100,-6083,21459,490}
		Task_L_TalkToNpc(0x62f99,14,point,"Fahr",0,1,1)

		local point = {"",1,100,-8570,22728,294}
		Task_L_LongGetTo(0x62f99,15,10334,1,point)

		local point = {"",1,1000,-10305,23365,-79}
		Task_L_Collection(0x62f99,16,point)

		local point = {"",0,1000,-10237,23723,-73}
		Task_L_LoopAttackMonMore(0x62f99,17,0,1,point)

		local point = {"",1,500,-10037,24281,-73}
		Task_L_LoopAttackMonMore(0x62f99,18,0,1,point)

		local point = {"",1,100,-9943,24241,-76}
		Task_L_TalkToNpc(0x62f99,19,point,"Imprisoned Gabel",0,1,1)


		local point1 = {"",0,1200,-10413,22932,-79}
		local point2 = {"",0,1200,-10784,21996,-81}
		local point3 = {"",0,1200,-11332,21225,-79}
		local point4 = {"",0,1200,-11296,20084,-80}
		local point5 = {"",0,1200,-12065,19642,241}
		Task_L_LoopAttackMonMore(0x62f99,20,0,5,point1,point2,point3,point4,point5)

		local point = {"",1,100,-12065,19642,241}
		Task_L_LongGetTo(0x62f99,21,10334,1,point)

		local point = {"",1,100,-11916,19533,252}
		Task_L_TalkToNpc(0x62f99,22,point,"Imprisoned Gabel",0,1,2)

		local AllTaskId ={0x62f99,0x00}
		local point = {"",1,100,-11916,19533,252}
		Task_L_CheckTaskOver(10334,AllTaskId,point) 
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11118) then
		Task_L_SetMapId(11118,3)
		local point = {"",1,100,24179,22567,2485}
		Task_L_AutoGetTo(0x10da11,1,11118,point,0,0)

		local point = {"",1,100,24211,22436,2483}
		Task_L_Collection(0x10da11,2,point)

		local point1 = {"",0,1000,24152,22604,2486}
		local point2 = {"",0,1000,24200,21844,2473}
		Task_L_LoopAttackMonMore(0x10da11,3,0,2,point1,point2) 

		local point = {"",1,300,24109,22205,2483}
		Task_L_LoopAttackMonMore(0x10da11,4,0,1,point) 

		local point = {"",17,1500,22444,22360,2442}
		Task_L_LoopAttackMonMore(0x10da11,5,0,1,point)
		
		local AllTaskId ={0x10da11,0x00}
		local point = {"",1,100,24130,22191,2483}
		Task_L_CheckTaskOver(11118,AllTaskId,point) 
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11116) then
		Task_L_SetMapId(11116,3)
		local point = {"",1,100,7655,8969,3073}
		Task_L_AutoGetTo(0x10d241,1,11116,point,0,0)

		local point = {"",1,100,6073,10459,2329}
		Task_L_AutoGetTo(0x10d241,2,11116,point,0,0)
	
		local point = {"",1,100,4740,10356,1822}
		Task_L_AutoGetTo(0x10d241,3,11116,point,0,0)

		local point = {"",1,100,3915,10839,1822}
		Task_L_TalkToNpc(0x10d241,4,point,"Immoral Adventurer",0,1,1)

		local point = {"",1,100,4089,11070,1822}
		Task_L_Collection(0x10d241,5,point)

		local point = {"",1,100,5206,14161,1822}
		Task_L_AutoGetTo(0x10d241,6,11116,point,0,0)

		local point = {"",1,500,5206,14161,1822}
		Task_L_TalkToNpc(0x10d241,7,point,"Tirhill",0,1,1)

		local point = {"",1,300,5351,14979,1822}
		Task_L_TalkToNpc(0x10d241,8,point,"Guard Dita",0,1,1)		

		local point = {"",0,800,4978,15007,1822}
		Task_L_LoopAttackMonMore(0x10d241,9,0,1,point) 
		
		local point = {"",1,100,4823,15475,1822}
		Task_L_Collection(0x10d241,10,point)

		local point = {"",1,100,5031,16620,1566}
		Task_L_AutoGetTo(0x10d241,11,11116,point,0,0)

		local point1 = {"",0,1500,5857,17836,1568}
		local point2 = {"",0,1500,5139,16885,1568}
		Task_L_LoopAttackMonMore(0x10d241,12,0,2,point1,point2)
		
		local point1 = {"",1,300,6423,17971,1568}
		local point2 = {"",0,500,8335,18521,1568}
		local point3 = {"",0,800,7895,20699,1568}
		local point4 = {"",0,600,6718,21153,1568}
		Task_L_LoopAttackMonMore(0x10d241,13,0,4,point1,point2,point3,point4)

		local point1 = {"",0,800,6718,21153,1568}
		local point2 = {"",1,300,6018,21610,1568}
		local point3 = {"",0,800,6641,23228,1568}
		local point4 = {"",0,800,8044,23764,1568}
		Task_L_LoopAttackMonMore(0x10d241,14,0,4,point1,point2,point3,point4) 

		local point1 = {"",1,300,6132,21655,1568}
		local point2 = {"",1,300,5772,22634,1568}
		Task_L_LoopAttackMonMore(0x10d241,15,0,2,point1,point2)

		local point = {"",1,300,6976,24126,1564}
		Task_L_LoopAttackMonMore(0x10d241,15,1,1,point)

		local point = {"",1,300,8749,24896,1564}
		Task_L_LoopAttackMonMore(0x10d241,15,2,1,point)

		local point = {"",1,300,9967,24521,1568}
		Task_L_LoopAttackMonMore(0x10d241,15,3,1,point)

		local point1 = {"",1,300,10309,23126,1568}
		local point2 = {"",0,300,10820,22465,1568}
		Task_L_LoopAttackMonMore(0x10d241,16,0,2,point1,point2)

		local point = {"",0,2000,10820,22465,1568}
		Task_L_AttackByName(0x10d241 ,17,point,"Incomplete Garum",1)

		local point = {"",1,300, 10098,21811,1567}
		Task_L_TalkToNpc(0x10d241,18,point,"Thar",0,1,4)
		
		local point = {"",0,300,14154,22685,1567}
		Task_L_LoopCollectMore(0x10d241,19,1,1,point)

		local point = {"",1,300,14634,22462,1565}
		Task_L_LoopCollectMore(0x10d241,19,0,1,point)	
		
		local point = {"",1,300,14634,22462,1565}
		Task_L_TalkToNpc(0x10d241,20,point,"Thar",0,1,3)

		local point = {"",1,100,15246,22103,1565}
		Task_L_AutoGetTo(0x10d0b1,6,11116,point,0,0)
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11320) then
		Task_L_SetMapId(11320,3)
		local point = {"",0,1000,11532,25667,1167}
		Task_L_LoopAttackMonMore(0x141249,1,0,1,point)  

		local point = {"",1,100,14261,25846,1163}
		Task_L_AutoGetTo(0x141249,2,11320,point,0,0)

		local point = {"",1,100,14712,25865,1158}
		Task_L_Collection(0x141249 ,3,point) 
		
		local point = {"",1,100,17206,25991,1043}
		Task_L_AutoGetTo(0x141249,4,11320,point,0,0) 
		
		local point = {"",0,800,17206,25991,1043}
		Task_L_LoopAttackMonMore(0x141249,5,0,1,point) 
		
		local point = {"",1,100,17305,25997,1043}
		Task_L_Collection(0x141249 ,6,point) 

		local point = {"",1,100, 17262,26143,1043}
		Task_L_TalkToNpc(0x141249,7,point,"Гроин",0,1,1)
		
		local point = {"",1,100,17006,22517,1146}
		Task_L_AutoGetTo(0x141249,8,11320,point,0,0) 
		
		local point1 = {"",2,100,17056,22282,1148}
		local point2 = {"",1,100,18848,19526,256}	
		if Task_L_LongGetTo(0x141249,9,11320,2,point1,point2) then
			local point = {"",0,1200,19259,19135,256}
			Task_L_LoopAttackMonMore(0x141249,9,0,1,point)   
		end
	
		local point = {"",1,600,20033,18041,256}
		Task_L_LoopAttackMonMore(0x141249,10,0,1,point) 
	
		local point = {"",0,1500,20329,16732,263}
		Task_L_LoopAttackMonMore(0x141249,11,0,1,point) 

		local point1 = {"",1,300,21285,17085,365}
		local point2 = {"",0,1000,22539,17527,718}
		local point3 = {"",0,1500,23903,17802,768}
		Task_L_LoopAttackMonMore(0x141249,12,0,3,point1,point2,point3)
		
		local point = {"",1,600,24385,16801,768}
		Task_L_LoopAttackMonMore(0x141249,13,0,1,point)  
	
		local point = {"",0,2000,25096,15748,780}
		Task_L_LoopAttackMonMore(0x141249,14,0,1,point) 

		local point = {"",1,100, 24524,15159,768}
		Task_L_TalkToNpc(0x141249,15,point,"Троин",0,1,1)
		
		local AllTaskId ={0x141249,0x00}
		local point = {"",1,100,23858,14662,885}
		Task_L_CheckTaskOver(11320,AllTaskId,point) 
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11319) then
		Task_L_SetMapId(11319,3)
		local point = {"",1,100,-26121,-16997,2404}
		Task_L_Collection(0x140e61 ,1,point)

		local point1 = {"",1,100,-26121,-16997,2404}
		local point2 = {"",11,100,-26343,-16818,2404}		
		Task_L_CarryItem(0x140e61,2,0,point1,point2)
		
		local point1 = {"",1,100,-26121,-16997,2404}
		local point2 = {"",1,100,-27713,-14797,2405}		
		Task_L_CarryItem(0x140e61,3,0,point1,point2)

		local point = {"",1,100,-27809,-15424,2405}
		Task_L_AutoGetTo(0x140e61,4,11319,point,0,0) 
		
		local point1 = {"",2,100,-27809,-15424,2405}
		local point2 = {"",2,100,-28393,-15852,2151}
		local point3 = {"",1,100,-29074,-15707,2151}  
		Task_L_LongGetTo(0x140e61,5,11319,3,point1,point2,point3)

		local point = {"",1,100,-29161,-15567,2149}
		Task_L_Collection(0x140e61 ,6,point) 

		local point1 = {"",2,100,-29551,-15873,2149}
		local point2 = {"",1,100,-30232,-14256,2404}
		Task_L_LongGetTo(0x140e61,7,11319,2,point1,point2)

		local point1 = {"",10,400,-30690,-14403,2405}
		local point2 = {"",10,400,-31048,-14020,2409}
		local point3 = {"",10,400,-30550,-13672,2405}
		local point4 = {"",10,300,-29821,-13510,2404}
		local point5 = {"",10,300,-30002,-12909,2405}
		local point6 = {"",10,400,-30662,-12980,2404}
		Task_L_LoopUseTaskItem(0x140e61,7,0,6,point1,point2,point3,point4,point5,point6)

		local point1 = {"",2,100,-29533,-11021,2405}
		local point2 = {"",1,100,-28487,-10040,2405}
		Task_L_LongGetTo(0x140e61,8,11319,2,point1,point2)
		

		local point = {"",1,800,-28039,-9622,2406}	
		Task_L_LongAttackByName(0x140e61 ,9,point,"Аддакор, ужас из недр",1)
		
		local point = {"",1,100,-28704,-10161,2405}
		Task_L_TalkToNpc(0x140e61,10,point,"Пьер",0,1,1) 
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11318) then
		Task_L_SetMapId(11318,3)
		local point = {"",1,100,9405,2970,1553}
		Task_L_Collection(0x140a79 ,1,point) 

		local point = {"",0,1000,8025,2450,1532}
		Task_L_LoopAttackMonMore(0x140a79,2,0,1,point) 
		
		local point = {"",1,500,6911,2704,1532}
		Task_L_Collection(0x140a79 ,3,point) 
		
		local point = {"",0,1000,5251,4074,1530}
		Task_L_LoopAttackMonMore(0x140a79,4,0,1,point) 
		
		local point = {"",1,300,5722,4633,1532}
		Task_L_LoopAttackMonMore(0x140a79,5,0,1,point) 

		local point = {"",0,1000,5214,6360,1530}
		Task_L_LoopAttackMonMore(0x140a79,6,0,1,point) 
		
		local point = {"",1,500,5830,6121,1532}
		Task_L_Collection(0x140a79 ,7,point)
		
		local point = {"",1,100,8057,5600,1150}
		Task_L_AutoGetTo(0x140a79,8,11318,point,0,0)    
	
		local point = {"",0,1000,8057,5600,1150}
		Task_L_LoopAttackMonMore(0x140a79,9,0,1,point)
		
		local point = {"",1,500,8345,5152,1151}
		Task_L_LoopAttackMonMore(0x140a79,10,0,1,point)
		
		local point1 = {"",1,600,8960,5471,1150}
		local point2 = {"",1,600,9161,5540,1153}
		local point3 = {"",1,600,10299,6616,1806}
		Task_L_LoopAttackMonMore(0x140a79,11,0,3,point1,point2,point3)
		
		local point1 = {"",2,500,10299,6616,1806}
		local point2 = {"",1,100,10966,9937,0}	
		if Task_L_LongGetTo(0x140a79,12,11318,2,point1,point2) then
			local point = {"",1,500,10890,10396,-0}
			Task_L_LoopAttackMonMore(0x140a79,12,0,1,point)
		end

		local point = {"",1,500,9697,11686,135}
		Task_L_Collection(0x140a79 ,13,point)

		local point1 = {"",2,500,9925,12681,86}
		local point2 = {"",1,100,9740,13479,86}	
		if Task_L_LongGetTo(0x140a79,14,11318,2,point1,point2) then
			local point = {"",0,1000,9018,15370,215}
			Task_L_LoopAttackMonMore(0x140a79,14,0,1,point)
		end 
		
		local point = {"",1,500,8789,15880,227}
		Task_L_Collection(0x140a79 ,15,point)
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11317) then
		Task_L_SetMapId(11317,3)
		local point = {"",1,500,-24319,14925,6}
		Task_L_Collection(0x140691 ,1,point) 
	
		local point = {"",1,500,-24684,13730,8}
		Task_L_Collection(0x140691 ,2,point) 
	
		local point = {"",1,500,-25555,12496,11}
		Task_L_Collection(0x140691 ,3,point) 
		
		local point = {"",1,900,-24644,12535,123}
		Task_L_Collection(0x140691 ,4,point) 
		
		local point = {"",1,100,-24017,12268,133}
		Task_L_TalkToNpc(0x140691,6,point,"Румз, охранник резервуара",0,1,1)

		local point = {"",11,100,-24203,12913,895}
		Task_L_LongGetTo(0x140691,7,11317,1,point)
		
		local point1 = {"",1,500,-23608,12910,2183}
		local point2 = {"",1,500,-23098,12669,2183}
		local point3 = {"",1,500,-23087,12069,2183}
		local point4 = {"",1,500,-23611,11907,2183}
		local point5 = {"",1,500,-24017,12336,2183}
		Task_L_LoopAttackMonMore(0x140691,8,1,5,point1,point2,point3,point4,point5) 
		
		local point1 = {"",1,500,-23608,12910,2183}
		local point2 = {"",1,500,-23098,12669,2183}
		local point3 = {"",1,500,-23087,12069,2183}
		local point4 = {"",1,500,-23611,11907,2183}
		local point5 = {"",1,500,-24017,12336,2183}
		Task_L_LoopAttackMonMore(0x140691,8,0,5,point1,point2,point3,point4,point5) 

		local point = {"",1,100,-22116,8272,2196}
		Task_L_AutoGetTo(0x140691,9,11317,point,0,0) 
		
		local point = {"",0,900,-21955,7693,2195}
		Task_L_LoopAttackMonMore(0x140691,10,0,1,point) 

		local point = {"",1,100,-22247,8629,2197}
		Task_L_AutoGetTo(0x140506,2,11317,point,0,0)
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11316) then
		Task_L_SetMapId(11316,3)
		local point = {"",1,100,-61277,57804,417}
		Task_L_AutoGetTo(0x1402a9,1,11316,point,0,0) 
		
		local point = {"",0,100,-61435,57471,417}
		Task_L_Collection(0x1402a9 ,2,point)

		local point = {"",0,100,-61320,56810,417}
		Task_L_Collection(0x1402a9 ,3,point)  
		
		local point = {"",0,100,-60914,56451,417}
		Task_L_Collection(0x1402a9 ,4,point)   
		
		local point = {"",0,100,-58141,56740,-374}
		Task_L_AutoGetTo(0x1402a9,5,11316,point,0,0) 
		
		local point = {"",0,100,-58141,56740,-374}
		Task_L_Collection(0x1402a9 ,6,point) 
		
		local point = {"",0,100,-58489,56721,-374}
		Task_L_Collection(0x1402a9 ,7,point)  
		
		local point = {"",1,100,-58324,56481,-374}
		Task_L_AutoGetTo(0x1402a9,8,11316,point,15,0) 
		
		local point = {"",2,100,-56724,54217,-374}
		if Task_L_LongGetTo(0x1402a9,9,11316,1,point) then
			local point = {"",1,100,-56220,54117,-374}
			Task_L_AutoGetTo(0x1402a9,9,11316,point,0,0) 
		end

		local point = {"",1,100,-54676,53505,-374}
		Task_L_AutoGetTo(0x1402a9,10,11316,point,0,0)    
	
		local point = {"",0,100,-55017,53710,-374}
		Task_L_Collection(0x1402a9 ,11,point)  

		local point = {"",1,100,-54723,53517,-374}
		Task_L_AutoGetTo(0x1402a9,12,11316,point,15,0) 
		
		local point = {"",1,100,-53373,53578,-374}
		Task_L_AutoGetTo(0x1402a9,13,11316,point,0,0)   
		
		local point = {"",0,100,-52265,53907,-374}
		Task_L_Collection(0x1402a9 ,14,point)  
		
	end
	---------------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10133) then
		Task_L_SetMapId(10133,3)
		local point = {"",1,100,8968,12591,1536}
		Task_L_Collection(0x1af41,1,point)

		local point = {"",1,100,8968,12591,1536}
		Task_L_TalkToNpc(0x1af41,2,point,"Soltaris",0,1,1)
		
		local point1 = {"",2,100,9781,11416,1536}
		local point2 = {"",0,100,9012,9875,1024}
		Task_L_LongGetTo(0x1af41,3,10133,2,point1,point2)

		local point = {"",1,100,8848,9032,1026}
		Task_L_TalkToNpc(0x1af41,4,point,"Alifer",0,1,1)

		local point = {"",1,100,8993,9089,1024}
		Task_L_TalkToNpc(0x1af41,5,point,"Aven",0,1,1)

		local point = {"",1,100,8901,9059,1024}
		Task_L_UseMusic(0x1af41,6,"Song of Valor",point)

		local point = {"",1,100,8848,9032,1026}
		Task_L_TalkToNpc(0x1af42,1,point,"Alifer",0,1,2)

		local point1 = {"",0,100,8901,10119,1024}
		local point2 = {"",0,100,8319,10150,1024}
		local point3 = {"",0,100,7704,10114,1024}
		Task_L_LoopCollectMore(0x1af42,2,0,3,point1,point2,point3)

		local point = {"",1,100,8843,8922,1024}
		Task_L_Collection(0x1af42,3,point)

		local point = {"",1,100,8848,9032,1026}
		Task_L_TalkToNpc(0x1af42,4,point,"Alifer",0,1,3)

		local point = {"",1,100,8993,9089,1024}
		Task_L_TalkToNpc(0x1af42,5,point,"Aven",0,1,2)

		local point = {"",1,500,8731,8684,1024}
		Task_L_AttackPoint(0x1af42,6,point)

		local point1 = {"",0,100,10871,7500,1022}
		local point2 = {"",0,100,10681,6946,1022}
		local point3 = {"",0,100,11399,6801,1023}
		local point4 = {"",0,100,10983,6090,1021}
		local point5 = {"",0,100,10915,5527,1022}
		local point6 = {"",0,100,11909,6035,1024}
		local point7 = {"",0,100,11793,4409,1024}
		local point8 = {"",0,100,12732,4203,1024}
		local point9 = {"",0,100,11207,3604,1023}
		Task_L_LoopCollectMore(0x1af42,6,0,9,point1,point2,point3,point4,point5,point6,point7,point8,point9)

		local point = {"",1,100,16257,6021,1023}
		Task_L_Collection(0x1af42,7,point)

		local point1 = {"",0,1500,15568,5774,1023}
		local point2 = {"",0,2000,13990,5479,1023}
		local point3 = {"",0,2000,12614,5676,1023}
		Task_L_LoopAttackMonMore(0x1af43,1,0,3,point1,point2,point3)

		local point = {"",1,100,11837,4908,1024}
		Task_L_AutoGetTo(0x1af43,2,10133,point,0,0) 

		local point1 = {"",1,600,12033,3956,1018}
		local point2 = {"",1,600,11151,4301,1023}
		local point3 = {"",1,600,10675,3881,1024}
		local point4 = {"",1,600,9986,5207,1021}
		local point5 = {"",1,600,10514,5710,1022}
		Task_L_LoopAttackMonMore(0x1af43,3,0,5,point1,point2,point3,point4,point5)

		local point1 = {"",0,2000,11635,3923,1024}
		local point2 = {"",0,2000,10634,4744,1022}
		Task_L_LoopAttackMonMore(0x1af43,3,1,2,point1,point2)

		local point = {"",1,100,8921,8085,1042}
		Task_L_AutoGetTo(0x1af43,4,10133,point,0,0) 

		local point = {"",0,2000,9273,6666,1023}
		Task_L_LoopAttackMonMore(0x1af43,5,0,1,point)

		local point1 = {"",1,500,8952,8118,1042}
		local point2 = {"",0,100,9006,9815,1024}
		Task_L_LoopAttackMonMore(0x1af43,6,0,2,point1,point2)

		Fun_Sleep(3000)
		Task_L_PlotSelect(0x19e19,1)

		local AllTaskId = {0x1af41,0x1af42,0x1af43,0}
		local point = {"",1,300,9006,9815,1024}
		Task_L_CheckTaskOver(10133,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10132) then
		Task_L_SetMapId(10132,3)
		local point = {"",1,100,-685,3693,2106}
		Task_L_AutoGetTo(0x1a771,1,10132,point,0,0) 

		local point1 = {"",2,100,-1077,2464,2093}
		local point2 = {"",0,400,178,1138,3117}
		Task_L_LongGetTo(0x1a771,2,10132,2,point1,point2)

		
		local point1 = {"",0,2000,178,1138,3117}
		local point2 = {"",0,1000,391,-211,3123}
		Task_L_LoopAttackMonMore(0x1a771,3,0,2,point1,point2)

		local point = {"",0,100,296,465,3117}
		if Task_L_LongGetTo(0x1a771,4,10132,1,point) then
			local point = {"",1,100,178,1138,3117}
			Task_L_TalkToNpc(0x1a771,4,point,"Azena",0,1,1)
		end

		local point = {"",1,100,1213,-809,3117}
		Task_L_AutoGetTo(0x1a771,5,10132,point,0,0) 

		local point1 = {"",0,2000,3417,-568,3636}
		local point2 = {"",0,2000,6088,-1131,3650}
		local point3 = {"",0,2000,6686,-1146,3638}
		Task_L_LoopAttackMonMore(0x1a771,6,0,3,point1,point2,point3)

		local point = {"",1,100,6189,-1156,3650}
		Task_L_Collection(0x1a771,7,point)

		local point = {"",1,100,8632,-2373,3636}
		Task_L_AutoGetTo(0x1a771,8,10132,point,0,0) 

		local point = {"",0,2000,8632,-2373,3636}
		Task_L_LoopAttackMonMore(0x1a771,9,0,1,point)
		
		local point = {"",1,100,8824,-2390,3646}
		Task_L_Collection(0x1a771,10,point)

		local point1 = {"",0,1500,10078,-395,3626}
		local point2 = {"",0,2000,9416,1866,3636}
		local point3 = {"",0,2000,9428,2569,3629}
		Task_L_LoopAttackMonMore(0x1a771,11,0,3,point1,point2,point3)

		local point = {"",1,100,9381,2079,3646}
		Task_L_Collection(0x1a771,12,point)

		local point = {"",1,100,7703,2913,3643}
		Task_L_AutoGetTo(0x1a772,1,10132,point,0,0) 

		local point = {"",0,2000,7171,2912,3646}
		Task_L_LoopAttackMonMore(0x1a772,2,0,1,point)

		local point = {"",1,100,7740,4762,3956}
		Task_L_AutoGetTo(0x1a772,3,10132,point,0,0) 
		
		local point = {"",0,2000,7371,6107,4150}
		Task_L_LoopAttackMonMore(0x1a772,4,0,1,point)

		local point1 = {"",10,100,7774,6907,4144}
		local point2 = {"",0,100,9109,8181,5165}
		Task_L_LongGetTo(0x1a772,5,10132,2,point1,point2)
		
		local point = {"",0,2000,9503,8576,5163}
		Task_L_LoopAttackMonMore(0x1a772,6,0,1,point)

		local point1 = {"",0,1500,7985,10642,5165}
		local point2 = {"",0,2000,5769,10990,5165}
		Task_L_LoopAttackMonMore(0x1a772,7,0,2,point1,point2)

		local point = {"",0,2000,3632,9115,5187}
		Task_L_LoopAttackMonMore(0x1a772,8,0,1,point)

		local point = {"",1,100,3659,5643,6018}
		Task_L_AutoGetTo(0x1a772,9,10132,point,0,0) 

		local point = {"",1,2000,3638,4879,6030}	
		Task_L_AttackByName(0x1a772 ,10,point,"Cereon",1)

		local point = {"",1,100,3617,4377,6030}
		Task_L_TalkToNpc(0x1a772,11,point,"Ancient Elemental Sylperion",0,1,1)

		local AllTaskId = {0x1a771,0x1a772,0}
		local point = {"",1,300,3617,4377,6030}
		Task_L_CheckTaskOver(10132,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10131) then
		Task_L_SetMapId(10131,3)
		local point = {"",1,100,21368,9801,2950}
		Task_L_AutoGetTo(0x19bb9,1,10131,point,0,0) 

		local point1 = {"",0,100,20613,9620,3021}
		local point2 = {"",0,100,20889,9208,2950}
		local point3 = {"",0,100,21738,9397,2950}
		local point4 = {"",0,100,22065,9504,2950}
		local point5 = {"",0,100,20946,7836,2950}
		local point6 = {"",0,100,21802,7614,2952}
		local point7 = {"",0,100,20771,7156,2817}
		local point8 = {"",0,100,21223,6646,2820}
		local point9 = {"",0,100,20413,6142,2822}
		local point10 = {"",0,100,20817,5478,2818}
		Task_L_LoopCollectMore(0x19bb9,2,0,10,point1,point2,point3,point4,point5,point6,point7,point8,point9,point10)
		
		local point1 = {"",1,400,20043,5633,2819}
		local point2 = {"",1,400,21057,6041,2821}
		local point3 = {"",1,400,20432,6428,2823}
		local point4 = {"",1,400,20894,8258,2950}
		local point5 = {"",1,500,22531,8201,3005}
		Task_L_LoopAttackMonMore(0x19bb9,2,1,5,point1,point2,point3,point4,point5)
		
		local point = {"",1,100,20268,5432,2817}
		Task_L_Collection(0x19bb9 ,3,point)

		local point = {"",0,1000,20513,5711,2819}
		Task_L_LoopAttackMonMore(0x19bb9,4,0,1,point)

		local point1 = {"",1,400,20323,5394,2817}
		local point2 = {"",1,400,20156,5217,2823}
		local point3 = {"",1,400,19990,5036,2819}
		local point4 = {"",1,400,18830,3646,2587}
		local point5 = {"",1,500,18830,3646,2587}
		Task_L_LoopAttackMonMore(0x19bb9,5,0,5,point1,point2,point3,point4,point5)

		local point = {"",0,1000,18841,3688,2587}
		Task_L_LoopAttackMonMore(0x19bba,1,0,1,point)

		local point = {"",1,100,17345,4272,2635}
		Task_L_Collection(0x19bba ,2,point)

		local point1 = {"",1,400,18869,2804,2577}
		local point2 = {"",0,400,19470,2215,2457}
		Task_L_LoopAttackMonMore(0x19bba,3,0,2,point1,point2)

		local point = {"",0,1000,19470,2215,2457}
		Task_L_LoopAttackMonMore(0x19bba,4,0,1,point)

		local point = {"",1,500,20808,1877,2455}
		Task_L_LoopAttackMonMore(0x19bba,5,0,1,point)

		local point1 = {"",2,100,21148,1920,2473}
		local point2 = {"",1,500,21743,1835,2199}
		local point3 = {"",2,100,22123,1510,2198}
		local point4 = {"",1,500,22241,971,1943}
		local point5 = {"",2,100,22418,736,1948}
		local point6 = {"",0,100,22594,-417,1949}
		Task_L_LoopAttackMonMore(0x19bba,6,0,6,point1,point2,point3,point4,point5,point6)

		local point1 = {"",2,100,22660,-590,1947}
		local point2 = {"",1,100,22949,-2220,1699}
		if Task_L_LongGetTo(0x19bba,7,10131,2,point1,point2) then
			local point = {"",1,100,22949,-2220,1699}
			Task_L_TalkToNpc(0x19bba,7,point,"Aven",0,1,1)
		end

		local point = {"",17,1500,22783,-2446,1687}
		Task_L_LoopAttackMonMore(0x19bba,8,0,1,point)

		local point = {"",1,500,22876,-2514,1687}
		Task_L_LoopAttackMonMore(0x19bba,9,0,1,point)

		local point = {"",1,100,23200,-3147,1702}
		Task_L_TalkToNpc(0x19bba,10,point,"Inanna",0,1,1)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10436) then
		Task_L_SetMapId(10436,3)
		local point1 = {"",0,800,21896,14421,1413}
		local point2 = {"",0,500,22396,14439,1413}
		local point3 = {"",10,300,22689,14431,1413}
		Task_L_LoopAttackMonMore(0x2df349,1,0,3,point1,point2,point3)

		local point1 = {"",1,300,21910,15400,1689}
		local point2 = {"",0,800,21731,16480,1694}
		local point3 = {"",0,1000,20989,18046,1690}
		local point4 = {"",10,300,20906,18875,1691}
		local point5 = {"",0,300,21304,17965,1691}
		Task_L_LoopAttackMonMore(0x2df349,2,0,5,point1,point2,point3,point4,point5)

		local point1 = {"",1,300,21159,18515,1691}
		local point2 = {"",0,200,21951,19512,1413}
		Task_L_LoopAttackMonMore(0x2df349,3,0,2,point1,point2)

		local point = {"",1,2000,21970,19743,1413}	
		Task_L_AttackByName(0x2df349 ,4,point,"Specialist Anton",1)

		local point = {"",1,100,21895,20131,1413}
		Task_L_TalkToNpc(0x2df349,5,point,"Regulator Messenger",0,1,1)		
		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10434) then
		Task_L_SetMapId(10434,3)
		local point1 = {"",0,800,17656,7588,-632}
		local point2 = {"",0,800,20913,7864,-640}
		Task_L_LoopAttackMonMore(0x4b899,1,0,2,point1,point2)
		
		local point = {"",1,100,20821,9182,-635}
		Task_L_AutoGetTo(0x4b899,2,10434,point,0,0) 
		
		local point = {"",0,1500,20879,8366,-635}
		Task_L_LoopAttackMonMore(0x4b899,3,0,1,point)

		local point = {"",0,1500,20879,8366,-635}
		Task_L_LoopAttackMonMore(0x4b899,4,0,1,point)

		local point1 = {"",0,1000,19157,9510,-9}
		local point2 = {"",0,1500,18019,8707,-9}
		Task_L_LoopAttackMonMore(0x4b899,5,0,2,point1,point2)

		local point = {"",1,100,17302,8666,-9}
		Task_L_Collection(0x4b899,6,point)

		local point = {"",1,100,16686,10425,356}
		Task_L_AutoGetTo(0x4b899,7,10434,point,0,0) 

		local point = {"",1,2000,16710,10321,356}	
		Task_L_AttackByName(0x4b899 ,8,point,"Commander Sol",1)

		local AllTaskId = {0x4b899,0}
		local point = {"",1,300,16710,10321,356}
		Task_L_CheckTaskOver(10434,AllTaskId,point)	

		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10433) then
		Task_L_SetMapId(10433,3)
		local point = {"",1,100,-22843,10297,3079}
		Task_L_TalkToNpc(0x4b4b1,1,point,"Krause",0,1,2)

		local point = {"Ganarok",15,1500,-22470,10560,3079}
		Task_L_LoopAttackMonMore(0x4b4b1,2,0,1,point)

		local point = {"",1,100,-22540,10479,3081}
		Task_L_TalkToNpc(0x4b4b1,3,point,"Krause",0,1,1)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10432) then
		Task_L_SetMapId(10432,3)
		local point1 = {"",1,800,25012,4226,1553}
		local point2 = {"",1,800,24395,3967,1555}
		Task_L_LoopAttackMonMore(0x4b0c9,1,0,2,point1,point2)
		
		local point1 = {"",0,2000,21803,5415,1545}
		local point2 = {"",0,1500,24361,5440,1545}
		local point3 = {"",0,2000,24654,7070,1545}
		Task_L_LoopAttackMonMore(0x4b0c9,1,1,3,point1,point2,point3)
		
		local point = {"",1,100,25814,8196,1545}
		Task_L_Collection(0x4b0c9,2,point)

		local point = {"",1,100,27565,7807,1545}
		Task_L_AutoGetTo(0x4b0c9,3,10432,point,0,0) 
		
		local point = {"",10,2000,27742,7784,1545}	
		Task_L_AttackByName(0x4b0c9 ,4,point,"Chemist Seville",1)
		
		local AllTaskId = {0x4b0c9,0}
		local point = {"",1,300,28373,7894,1545}
		Task_L_CheckTaskOver(10432,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10431) then
		Task_L_SetMapId(10431,3)
		local point1 = {"",1,100,-6406,10646,2997}
		local point2 = {"",1,100,-6310,11001,2998}	
		if Task_L_LongGetTo(0x4ace1,1,10431,2,point1,point2) then
			local point1 = {"",0,600,-6359,11355,2998}
			local point2 = {"",0,800,-5804,11922,2999}
			local point3 = {"",0,800,-6120,12456,2997}
			local point4 = {"",0,800,-6850,12264,2997}
			local point5 = {"",0,800,-6506,11832,2997}	
			Task_L_LoopAttackMonMore(0x4ace1,1,0,5,point1,point2,point3,point4,point5)
		end

		local point = {"",1,300,-5074,12742,2997}
		Task_L_Collection(0x4ace1,2,point)

		local point = {"",1,2000,-4262,12738,2997}
		Task_L_LoopAttackMonMore(0x4ace1,3,0,1,point)

		local point = {"",1,300,-3474,12562,2997}
		Task_L_Collection(0x4ace1,4,point)

		local point = {"",1,100,-2634,11764,2997}
		Task_L_AutoGetTo(0x4ace1,5,10431,point,0,0)
		
		local point = {"",1,100,-2634,11764,2997}
		Task_L_UseTaskItem(0x4ace1,6,point)

		local point1 = {"",2,100,-2826,11565,3085}
		local point2 = {"",1,100,-2579,11354,3119}	
		Task_L_LongGetTo(0x4ace1,7,10431,2,point1,point2)
		
		local point = {"",1,100,-2579,11354,3119}
		Task_L_Collection(0x4ace1,8,point)

		local point1 = {"",3,100,-2592,11338,3117}
		local point2 = {"",1,100,-5031,12097,2997}	
		if Task_L_LongGetTo(0x4ace1,9,10431,2,point1,point2) then
			local point = {"",1,100,-5031,12097,2997}	
			Task_L_TalkToNpc(0x4ace1,9,point,"Communicator",0,1,1)
		end
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10766) then

		Task_L_SetMapId(10766,3)

		local point1 = {"",0,1000,-2094,689,-0}
		local point2 = {"",0,1000,-2602,-419,-0}
		local point3 = {"",0,1500,-1940,-1592,-0}
		local point4 = {"",0,1000,-919,-1677,2}
		Task_L_LoopAttackMonMore(0xad701,1,0,4,point1,point2,point3,point4)

		local point = {"",1,300,-346,-1675,258}
		Task_L_LoopAttackMonMore(0xad701,2,0,1,point)

		local point = {"",0,2000,1199,-1648,226}
		Task_L_LoopAttackMonMore(0xad701,3,0,1,point)

		local point = {"",1,300,2582,-1659,495}
		Task_L_LoopAttackMonMore(0xad701,4,0,1,point)

		local point1 = {"",0,800,3575,-1634,514}
		local point2 = {"",0,600,4443,-1660,514}
		local point3 = {"",1,300,5146,-1713,514}
		local point4 = {"",0,1000,5665,-1636,513}
		local point5 = {"",0,800,5643,-2493,513}	
		local point6 = {"",0,800,5606,-1027,513}
		Task_L_LoopAttackMonMore(0xad701,5,0,6,point1,point2,point3,point4,point5,point6)

		local point = {"",1,300,5610,-444,520}
		Task_L_LoopAttackMonMore(0xad701,6,0,1,point)

		local point = {"",1,1000,5614,210,515}
		if Fun_IsInPoint(point) == 1 then
			local point = {"",1,300,5614,210,515}
			Task_L_GotoAttackMore(0xad701,7,0,1,point)
		end
		
		local point1 = {"",2,100,5604,376,514}
		local point2 = {"",1,100,6989,2720,-512}
		if Task_L_LongGetTo(0xad701,7,10766,2,point1,point2) then
		
			local point = {"",0,1500,7208,2516,-512}
			Task_L_LoopAttackMonMore(0xad701,7,0,1,point)

			local point = {"",0,1500,8191,6933,-512}
			Task_L_LoopAttackMonMore(0xad701,7,1,1,point)

			local point1 = {"",1,300,8708,5012,-512}
			local point2 = {"",0,800,9958,4708,-378}
			Task_L_LoopAttackMonMore(0xad701,7,2,2,point1,point2)

			local point = {"",0,1500,10354,3887,-379}
			Task_L_LoopAttackMonMore(0xad701,7,3,1,point)

			local point = {"",1,500,11143,4701,-387}
			Task_L_GotoAttackMore(0xad701,8,0,1,point)
		end


		local point1 = {"",2,100,11143,4701,-387}
		local point2 = {"",1,100,12722,5539,-384}
		if Task_L_LongGetTo(0xad701,8,10766,2,point1,point2) then

			local point = {"",1,300,13247,4958,-384}
			Task_L_GotoAttackMore(0xad701,8,0,1,point)

			local point1 = {"",1,300,13644,1785,-640}
			local point2 = {"",0,500,13915,1351,-544}
			Task_L_LoopAttackMonMore(0xad701,8,0,2,point1,point2)

			local point = {"",0,600,13830,444,-511}
			--Task_L_LoopAttackMonMore(0xad701,8,1,1,point)
			
			local point = {"",0,800,10792,2320,-640}
			--Task_L_LoopAttackMonMore(0xad701,8,2,1,point)
			
			local point1 = {"",0,800,10792,2320,-640}
			local point2 = {"",1,300,10593,-363,-439}
			local point3 = {"",0,500,10209,-1342,-446}
			local point4 = {"",0,300,10130,-1585,-446}
			Task_L_LoopAttackMonMore(0xad701,8,1,4,point1,point2,point3,point4)
		end

		local point1 = {"",1,300,10595,-399,-439}
		local point2 = {"",1,300,9765,-2004,-446}
		Task_L_GotoAttackMore(0xad701,9,0,2,point1,point2)

		local point = {"",17,1200,9496,-3315,-446}	
		Task_L_LoopAttackMonMore(0xad701 ,9,0,1,point)
		
		local point = {"",0,800,9170,-3160,-446}
		Task_L_LoopAttackMonMore(0xad701,10,0,1,point)
		
		local AllTaskId = {0xad701,0}
		local point = {"",1,300,9454,-2905,-446}
		Task_L_CheckTaskOver(10766,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10726) then
		--第1次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1ea,2,0xac379,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac379,2,0,1,point)
		
		--第2次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1ef,2,0xac37b,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac37b,2,0,1,point)

		--第3次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1f1,2,0xac37d,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac37d,2,0,1,point)

		--第4次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1f2,2,0xac37e,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac37e,2,0,1,point)

		--第5次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1f3,2,0xac37f,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac37f,2,0,1,point)

		--第6次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1f5,2,0xac381,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac381,2,0,1,point)

		--第7次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1f7,2,0xac384,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac384,2,0,1,point)

		--第8次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1f8,2,0xac385,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac385,2,0,1,point)

		--第9次挑战
		local point = {"Marshal Danuul",1,100,-12951,10185,389}
		Task_L_AcceptTask(0xac1fa,2,0xac387,point)
		
		local point = {"",0,1200,-10567,10159,-4}
		Task_L_LoopAttackMonMore(0xac387,2,0,1,point)

	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11021) then
		Task_L_SetMapId(11021,3)
		local point = {"",1,100,7066,8406,-2532}
		Task_L_AutoGetTo(0xf5759,1,11021,point,0,0) 	
		
		local point = {"",1,100,6281,8445,-2532}
		Task_L_Collection(0xf5759,2,point)
		
		local point = {"",0,500,6510,8998,-2532}
		Task_L_LoopAttackMonMore(0xf5759,3,0,1,point)

		local point = {"",1,100,5902,9369,-2532}
		Task_L_AutoGetTo(0xf5759,4,11021,point,0,0) 

		local point = {"",1,100,5507,9134,-2532}
		Task_L_Collection(0xf5759,5,point)

		local point1 = {"",1,100,5289,9292,-2532}
		local point2 = {"",1,100,4925,8988,-2533}	
		local point3 = {"",1,100,4899,8561,-2532}	
		local point4 = {"",1,100,5435,8185,-2532}	
		if Task_L_LongGetTo(0xf5759,6,11021,4,point1,point2,point3,point4) then
			local point = {"",2,100,5435,8185,-2532}	
			Task_L_LongGetTo(0xf5759,6,11021,1,point)
		end

		local point = {"",1,100,5770,7993,-2532}
		Task_L_Collection(0xf5759,7,point)

		local point = {"",1,100,5854,7630,-2532}
		Task_L_Collection(0xf5759,8,point)

		local point = {"",1,100,3983,7433,-3044}
		Task_L_Collection(0xf5759,9,point)

		local point = {"",1,100,3939,7744,-3044}
		Task_L_Collection(0xf5759,10,point)

		local point = {"",1,100,3414,7479,-3044}
		Task_L_Collection(0xf5759,11,point)

		local point = {"",1,100,3590,7002,-3044}
		Task_L_Collection(0xf5759,12,point)

		local point = {"",1,100,3177,7071,-3044}
		Task_L_AutoGetTo(0xf5759,13,11021,point,0,0) 

		local point = {"",1,100,3018,7291,-3044}
		Task_L_TalkToNpc(0xf5759,14,point,"Pebbling",0,1,1)

		local point = {"",1,100,3018,7291,-3044}
		Task_L_Collection(0xf5759,15,point)

		local point = {"",0,1000,3018,7291,-3044}
		Task_L_LoopAttackMonMore(0xf5759,16,0,1,point)

		local point = {"",1,100,2619,6570,-3040}
		Task_L_AutoGetTo(0xf5759,17,11021,point,0,0) 

		local point = {"",15,1000,2032,6573,-3044}
		Task_L_AttackByName(0xf5759 ,18,point,"Ed the Red",1)

		local point1 = {"",0,800,1941,6889,-3044}
		local point2 = {"",0,800,1744,6986,-3044}
		local point3 = {"",0,800,1449,6902,-3044}
		Task_L_LoopCollectMore(0xf5759,19,0,3,point1,point2,point3)

		local point = {"",1,100,1649,6750,-3044}
		Task_L_TalkToNpc(0xf5759,20,point,"Pastata",0,1,1)

		local AllTaskId = {0xf5759,0}
		local point = {"",1,100,1649,6750,-3044}
		Task_L_CheckTaskOver(11021,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11020) then
		Task_L_SetMapId(11020,3)
		local point = {"",1,300,25939,19440,3067}
		Task_L_TalkToNpc(0xf5372,1,point,"Mokamoka",0,1,1)

		local point1 = {"",2,100,26191,19371,3069}
		local point2 = {"",1,100,27837,19162,3072}	
		if Task_L_LongGetTo(0xf5372,2,11020,2,point1,point2) then

			local point = {"",1,500,27940,19196,3072}
			Task_L_Collection(0xf5372,2,point)
		end

		local point = {"",1,1500,27940,19196,3072}
		Task_L_LoopAttackMonMore(0xf5372,3,0,1,point)

		local point = {"",1,100,27940,19196,3072}
		Task_L_UseTaskItem(0xf5372,4,point)

		local point = {"",1,300,27569,18955,3072}
		Task_L_TalkToNpc(0xf5372,5,point,"Mokamoka",0,1,2)

		local AllTaskId = {0xf5372,0}
		local point = {"",1,300,27569,18955,3072}
		Task_L_CheckTaskOver(11020,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11019) then
		Task_L_SetMapId(11019,3)
		local point = {"",1,300,18111,13570,3584}
		Task_L_LoopAttackMonMore(0xf5371,1,0,1,point)
		
		local point1 = {"",1,300,18111,13570,3584}
		local point2 = {"",0,1500,19092,13950,3584}
		local point3 = {"",10,600,18403,14985,3584}
		local point4 = {"",1,1000,19485,13474,3584}
		local point5 = {"",10,600,19331,13047,3584}
		local point6 = {"",1,1000,19485,13474,3584}
		local point7 = {"",10,600,20722,13459,3584}
		local point8 = {"",1,1000,20579,13945,3584}
		local point9 = {"",1,1000,20474,14461,3584}	
		Task_L_LoopAttackMonMore(0xf5371,2,1,9,point1,point2,point3,point4,point5,point6,point7,point8,point9)

		local point = {"",17,1500,20474,14461,3584}
		Task_L_LoopAttackMonMore(0xf5371,3,0,1,point)

		local point = {"",1,100,20510,14898,3584}
		Task_L_Collection(0xf5371,4,point)

		local point = {"",1,100,20510,14898,3584}
		Task_L_UseTaskItem(0xf5371,5,point)

		local point = {"",1,100,18062,14784,3585}
		Task_L_TalkToNpc(0xf5371,6,point,"Mokamoka",0,1,1)

		local AllTaskId = {0xf5371,0}
		local point = {"",1,100,18062,14784,3585}
		Task_L_CheckTaskOver(11019,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11018) then
		Task_L_SetMapId(11018,3)
		local point = {"",1,100,6028,22515,414}
		Task_L_Collection(0xf4f89,1,point)

		local point = {"",0,1500,3849,23005,454}
		Task_L_LoopAttackMonMore(0xf4f89,2,0,1,point)

		local point = {"",1,100,3485,23213,454}
		Task_L_TalkToNpc(0xf4f89,3,point,"Mokamoka",0,1,1)

		local point = {"",1,100,3355,23309,454}
		Task_L_Collection(0xf4f89,4,point)

		local AllTaskId = {0xf4f89,0}
		local point = {"",1,100,3355,23309,454}
		Task_L_CheckTaskOver(11018,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11016) then
		Task_L_SetMapId(11016,3)
		local point = {"",1,100,8890,5752,-5106}
		Task_L_AutoGetTo(0xf47ba,1,11016,point,0,0) 

		local point = {"",1,100,8854,5795,-5106}
		Task_L_TalkToNpc(0xf47ba,2,point,"Totoma",0,1,1)

		local point = {"",1,100,8767,5670,-5106}
		Task_L_UseExpression(0xf47ba,3,"Agree",point) 
		
		local AllTaskId = {0xf47ba,0}
		local point = {"",1,100,8795,5669,-5106}
		Task_L_CheckTaskOver(11016,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11015) then
		Task_L_SetMapId(11015,3)
		local point = {"",0,800,5340,573,256}
		Task_L_LoopAttackMonMore(0xf47b9,1,0,1,point)

		local point = {"",1,100,4801,398,256}
		Task_L_Collection(0xf47b9,2,point)

		local point = {"",1,100,6420,1079,256}
		Task_L_AutoGetTo(0xf462a,1,11015,point,0,0)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(11017) then
		Task_L_SetMapId(11017,3)
		local point = {"",1,100,12929,9694,760}
		Task_L_UseTaskItem(0xf4ba1,1,point)

		local point1 = {"",2,100,12992,9838,759}
		local point2 = {"",1,100,13424,10335,509}
		if Task_L_LongGetTo(0xf4ba1,2,11017,2,point1,point2) then
			local point1 = {"",1,300,13424,10335,509}
			local point2 = {"",1,400,13891,10593,512}
			local point3 = {"",1,300,14182,10393,512}
			local point4 = {"",1,300,14103,10877,512}
			Task_L_LoopAttackMonMore(0xf4ba1,2,0,4,point1,point2,point3,point4)
		end

		local point1 = {"",1,300,14662,10520,512}
		local point2 = {"",0,300,16472,10723,512}
		Task_L_LoopAttackMonMore(0xf4ba1,3,0,2,point1,point2)

		local point = {"",0,800,16440,10092,512}
		Task_L_LoopAttackMonMore(0xf4ba1,4,0,1,point)
		
		local point = {"",1,300,16747,10417,512}
		Task_L_Collection(0xf4ba1,5,point)

		local point = {"",1,300,16747,10417,512}
		Task_L_Collection(0xf4ba1,6,point)

		local point = {"",1,300,16747,10417,512}
		Task_L_Collection(0xf4ba1,7,point)

		local AllTaskId = {0xf4ba1,0}
		local point = {"",1,300,16747,10417,512}
		Task_L_CheckTaskOver(11017,AllTaskId,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10837) then
		Task_L_SetMapId(10837,3)
		local point1 = {"",0,1000,5039,46578,1200}
		local point2 = {"",0,1000,3993,47160,1200}
		Task_L_LoopAttackMonMore(0xc80ca,1,0,2,point1,point2)

		if Task_L_GetBranchCount(0xc80ca,2,0) == 0 then
			local point = {"",0,500,4053,49260,1103}
			Task_L_AttackPoint(0xc80ca,2,point)

			local point = {"",1,500,3698,49183,1027}
			AttackTower(0xc80ca,2,0,1,point)
		end

		if Task_L_GetBranchCount(0xc80ca,2,0) == 1 then
			local point = {"",0,500,2878,48472,800}
			Task_L_AttackPoint(0xc80ca,2,point)

			local point = {"",1,500,2684,48176,800}
			AttackTower(0xc80ca,2,0,2,point)
		end

		local point = {"",17,1000,1750,47073,800}
		Task_L_LoopAttackMonMore(0xc80ca,3,0,1,point)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10836) then
		Task_L_SetMapId(10836,3)
		local point = {"",1,100,2250,24543,776}
		Task_L_AutoGetTo(0xc80c9,1,10836,point,0,0) 	

		local point = {"",1,800,2250,24543,776}
		Task_L_LoopAttackMonMore(0xc80c9,2,0,1,point)

		local point = {"",1,100,2330,25131,776}
		Task_L_TalkToNpc(0xc80c9,3,point,"Blackfang",0,1,1)

		local point = {"",1,100,2441,25023,776}
		Task_L_TalkToNpc(0xc80c9,4,point,"Thirain",0,1,2)

		local point = {"",1,100,2441,25023,776}
		Task_L_Collection(0xc80c9,5,point)

		local point = {"",1,100,2441,25023,776}
		Task_L_TalkToNpc(0xc80c9,6,point,"Thirain",0,1,1)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10839) then
		Task_L_SetMapId(10839,3)
		local point = {"",0,600,7785,-10067,518}
		Task_L_LoopAttackMonMore(0xc7ce1,1,0,1,point)
		
		local point = {"",1,100,8112,-10699,518}
		Task_L_Collection(0xc7ce1,2,point)

		local point = {"",1,100,7411,-9949,532}
		Task_L_AutoGetTo(0xc7b54,2,10839,point,0,0) 	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10853) then
		Task_L_SetMapId(10853,3)
		local point = {"",1,100,3282,855,1152}
		Task_L_AutoGetTo(0xc78f9,1,10853,point,0,0) 
		
		local point = {"",1,100,2996,2489,1151}
		Task_L_AutoGetTo(0xc78f9,2,10853,point,11,0) 

		local point = {"",1,100,3739,3407,1148}
		Task_L_AutoGetTo(0xc78f9,3,10853,point,11,0) 
		
		local point = {"",1,100,2655,6305,1136}
		Task_L_AutoGetTo(0xc78f9,4,10853,point,11,0) 

		local point = {"",1,100,2655,6305,1136}
		Task_L_AutoGetTo(0xc78f9,4,10853,point,11,0) 	
		
		local point = {"",1,100,4651,8675,1472}
		Task_L_AutoGetTo(0xc78f9,5,10853,point,13,0) 	
		
		local point = {"",1,100,4421,11476,1728}
		Task_L_AutoGetTo(0xc78f9,6,10853,point,0,0) 
		
		local point1 = {"",0,1200,4390,11417,1728}
		local point2 = {"",0,1200,4483,9062,1470}
		local point3 = {"",0,1200,4459,6912,1307}
		local point4 = {"",0,1200,2808,6397,1135}
		local point5 = {"",0,1200,2654,4667,1146}
		local point6 = {"",0,300,3494,3277,1150}
		local point7 = {"",0,2500,3494,3277,1150}
		local point8 = {"",0,300,3494,3277,1150}
		Task_L_LoopAttackMonMore(0xc78f9,7,0,8,point1,point2,point3,point4,point5,point6,point7,point8) 

		local point = {"",1,100,3269,3198,1151}
		Task_L_TalkToNpc(0xc78f9,8,point,"Thirain",0,1,1)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10896) then
		Task_L_SetMapId(10896,3)

		local point = {"",1,100,-19712,-10649,512}
		Task_L_AutoGetTo(0xc7511,1,10896,point,0,0) 

		local point = {"",1,100,-19712,-10649,512}
		Task_L_TalkToNpc(0xc7511,2,point,"Convoy Soldier",0,1,1)

		local point = {"",1,100,-21955,-13103,512}
		Task_L_AutoGetTo(0xc7511,3,10896,point,0,0) 
		
		local point = {"",0,1200,-21955,-13103,512}
		Task_L_LoopAttackMonMore(0xc7511,4,0,1,point)

		local point1 = {"",0,800,-23772,-15259,1437}
		local point2 = {"",0,800,-23727,-16068,1435}
		local point3 = {"",0,800,-23730,-16956,1437}
		Task_L_LoopAttackMonMore(0xc7511,5,0,3,point1,point2,point3)

		local point = {"",0,1200,-23964,-18764,1160}
		Task_L_LoopAttackMonMore(0xc7511,6,0,1,point)
		
		local point = {"Brook",0,100,-25024,-21458,1337}
		Task_L_UseBigGunFire(0xc7511,7,0,point)

		local point = {"Kranterus",1,100,-23555,-20272,1331}
		Task_L_UseBigGunFire(0xc7511,8,0,point)

		local point = {"Agarus",0,100,-23555,-20272,1331}
		Task_L_UseBigGunFire(0xc7511,8,1,point)

		local point = {"",0,800,-24544,-17043,768}
		Task_L_LoopAttackMonMore(0xc7511,9,4,1,point)

		local point = {"",0,800,-25002,-18150,768}
		Task_L_LoopAttackMonMore(0xc7511,9,0,1,point)

		local point = {"",0,1000,-25383,-17133,768}
		Task_L_LoopAttackMonMore(0xc7511,9,2,1,point)

		local point= {"",0,800,-25638,-16606,768}
		Task_L_LoopAttackMonMore(0xc7511,9,3,1,point)
		
		local point = {"",0,1000,-26015,-17328,768}
		Task_L_LoopAttackMonMore(0xc7511,9,1,1,point)

		local point = {"",0,1000,-27646,-17343,768}
		Task_L_LoopAttackMonMore(0xc7511,10,0,1,point)	

		local point = {"",1,100,-29200,-18395,896}
		Task_L_AutoGetTo(0xc7511,11,10896,point,0,0) 

		local point = {"",0,1500,-29200,-18395,896}
		Task_L_LoopAttackMonMore(0xc7511,12,0,1,point)

		local point1 = {"",0,1000,-28956,-18475,896}
		local point2 = {"",0,800,-27627,-17591,768}
		local point3 = {"",0,800,-26352,-17602,768}	
		local point4 = {"",0,800,-25508,-17060,768}	
		local point5 = {"",0,800,-25281,-16012,772}
		local point6 = {"",0,800,-25572,-15024,768}
		local point7 = {"",0,800,-25727,-14227,768}
		local point8 = {"",0,900,-26759,-13977,768}
		local point9 = {"",0,800,-25727,-14227,768}
		Task_L_LoopAttackMonMore(0xc7511,13,0,9,point1,point2,point3,point4,point5,point6,point7,point8,point9)

		local point = {"",0,100,-27286,-13433,772}	
		if Task_L_RideHorse(0xc7511,14,point) then
			local point = {"",0,500,-24177,-6073,512}
			Task_L_RideAttackMon(0xc7511,14,1,point)
		end

		local point1 = {"",0,100,-34948,-2540,1171}
		local point2 = {"",0,1800,-28527,1877,1530}
		Task_L_RideAttackMon(0xc7511,15,2,point1,point2)

		
		local point1 = {"",1,100,-23691,-6230,512}
		local point2 = {"",1,100,-17441,-11038,512}
		Task_L_RideAttackMon(0xc7511,16,2,point1,point2) 	
		

		local point = {"",1,2000,-14081,-15516,512}	
		Task_L_AttackByName(0xc7511 ,17,point,"Mayhem Legion Commander Kakul-Saydon",1)
		--Ку-Сатот, владыка БезуPokura

	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10835) then
		Task_L_SetMapId(10835,3)
		local point = {"",0,900,-19546,-8195,489}
		Task_L_LoopAttackMonMore(0xc712a,1,0,1,point)

		local point = {"",1,100,-19084,-8205,491}
		Task_L_TalkToNpc(0xc712a,2,point,"Injured Armen",0,1,2)

		local point = {"",1,100,-20814,-8101,513}
		Task_L_AutoGetTo(0xc7381,1,10835,point,0,0) 
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10834) then
		Task_L_SetMapId(10834,3)
		local point = {"",0,900,-11545,-5347,755}
		Task_L_LoopAttackMonMore(0xc7129,1,0,1,point)
		
		local point = {"",0,900,-11545,-5347,755}
		Task_L_LoopAttackMonMore(0xc7129,2,0,1,point)

		local point = {"",1,100,-11385,-5033,757}
		Task_L_Collection(0xc7129,3,point)

		local point = {"",1,100,-11678,-5212,758}
		Task_L_TalkToNpc(0xc7129,4,point,"Jahia",0,1,1)

		local point = {"",1,100,-11757,-5482,766}
		Task_L_TalkToNpc(0xc7129,5,point,"Seria",0,1,5)

		local point = {"",1,100,-12324,-6206,764}
		Task_L_AutoGetTo(0xc6f9d,1,10834,point,0,0) 	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10833) then
		Task_L_SetMapId(10833,3)
		local point = {"",1,100,19639,11881,128}
		Task_L_TalkToNpc(0xc6959,1,point,"Heretic Gatekeeper",0,1,1)

		local point = {"",1,100,27547,11653,19}
		Task_L_AutoGetTo(0xc6959,2,10833,point,0,0) 

		local point = {"",1,100,28343,11685,14}
		if Task_L_LongGetTo(0xc6959,3,10833,1,point)  then
			local point = {"",2,100,28568,11380,-0}
			Task_L_AutoGetTo(0xc6959,3,10833,point,11,0) --到目的点按Q	
		end
		
		local point = {"",1,100,28568,11380,-0}
		Task_L_AutoGetTo(0xc6959,4,10833,point,12,0) 	--到目的点按W	

		local point = {"",1,100,28568,11380,-0}
		Task_L_AutoGetTo(0xc6959,5,10833,point,11,0) 	--到目的点按Q

		local point = {"",1,100,28568,11380,-0}
		Task_L_AutoGetTo(0xc6959,6,10833,point,12,0) 	

		local point1 = {"",0,1200,29237,11666,14}
		local point2 = {"",0,1200,27754,11718,14}
		Task_L_LoopAttackMonMore(0xc6959,7,0,2,point1,point2)

		local point1 = {"",0,1200,29237,11666,14}
		local point2 = {"",0,1200,27754,11718,14}
		Task_L_LoopAttackMonMore(0xc6959,7,1,2,point1,point2)

		local point = {"",1,100,24151,7052,128}
		Task_L_AutoGetTo(0xc6959,8,10833,point,0,0) 		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10832) then
		Task_L_SetMapId(10832,3)

		local point = {"",1,100,13981,-17231,1915}
		Task_L_TalkToNpc(0xc6571,1,point,"Armen",0,1,3)

		local point1 = {"",0,100,14080,-16938,1915}
		local point2 = {"",0,100,13858,-17070,1915}
		local point3 = {"",0,100,13872,-17359,1915}
		Task_L_LoopCollectMore(0xc6571,2,0,3,point1,point2,point3)

		local point = {"",1,100,13965,-17635,1915}
		Task_L_TalkToNpc(0xc6571,3,point,"Seria",0,1,1)

		--走过去触发剧情，然后按G或者H，然后在走到另一个点对话 判断2次动画
		local point = {"",1,200,13226,-17561,1823}
		if Task_L_LongGetTo(0xc6571,4,10832,1,point)  then

			local point = {"",1,100,13212,-17434,1824}
			Task_L_TalkToNpc(0xc6571,4,point,"Shandi",3,1,1)
		end

		local point = {"",1,100,13390,-17928,1824}
		Task_L_AutoGetTo(0xc63e4,1,10832,point,0,0) 

		local AllTaskId = {0xc6571,0x00}
		Task_CheckTaskOver(AllTaskId,13212,-17434,1824)
	end
	---------------------------------------------------------------------------
	--神殿
	if Fun_IsInMapByMapId(10002) then

		local point = {"",1,100,11096,149,26}
		Task_L_TalkToNpc(0xc6572,1,point,"Beatrice",0,1,1)

		if Fun_IsHaveTask(0xc6572,1) == 0 then  
			local point = {"",2,100,12929,16,233}	
			Task_L_LongGetTo(0xc63e3,1,10002,1,point)
		end

		local point = {"",1,100,11109,85,26}	
		Task_L_Collection(0x44abb1,1,point)	

		if Fun_IsHaveTask(0x44abb1,1) == 0 then 
			local point = {"",2,100,12929,16,233}	
			Task_L_LongGetTo(0xf55d1,3,10002,1,point)
		end

		local point = {"",1,100,11109,85,26}	
		Task_L_Collection(0x44abb3,1,point)	
		
		if Fun_IsHaveTask(0x44abb3,1) == 0 then  
			
			local point = {"",2,100,12929,16,233}	
			Task_L_LongGetTo(0x4a770,6,10002,1,point)
		end

		local point = {"",1,100,11109,85,26}	
		Task_L_Collection(0x44abb2,1,point)	

		if Fun_IsHaveTask(0x44abb2,1) == 0 then  
			local point = {"",2,100,12929,16,233}	
			Task_L_LongGetTo(0x631f7,2,10002,1,point)
		end
		---------------罗亨达尔------------
		local point = {"",1,100,11068,121,26}
		Task_L_LongGetTo(0x19e1a,2,10002,1,point)

		local point = {"",1,100,11068,121,26}
		Task_L_Collection(0x44abb4,1,point)
		
		if Fun_IsHaveTask(0x44abb4,1) == 0 then  
			local point = {"",1,100,12896,35,233}	
			Task_L_Collection(0x19e1a,3,point)	
		end
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10831) then
		Task_L_SetMapId(10831,3)
		local point = {"",1,100,-11055,-12972,768}
		Task_L_TalkToNpc(0xc5da1,1,point,"Bard Allegro",0,1,3)	

		local point1 = {"",0,800,-10989,-13006,768}
		local point2 = {"",0,800,-10511,-13420,766}
		Task_L_LoopAttackMonMore(0xc5da1,2,0,2,point1,point2)

		local point = {"",1,100,-11055,-12972,768}
		Task_L_TalkToNpc(0xc5da1,3,point,"Bard Allegro",0,1,5)
		
		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10830) then
		Task_L_SetMapId(10830,3)
		local point1 = {"",0,600,7313,19326,1024}
		local point2 = {"",0,600,7713,19891,1024}
		local point3 = {"",0,600,7213,20128,1024}
		local point4 = {"",0,1200,6873,20849,1023}	
		Task_L_LoopAttackMonMore(0xc582f,1,0,4,point1,point2,point3,point4)
		
		local point = {"",0,800, 8037,20437,1024}
		Task_L_LoopCollectMore(0xc582f,2,0,1,point)

		local point2 = {"Collect",0,900,7236,20433,1024}
		local point4 = {"Collect",1,900,8011,19456,1023}
		local point1 = {"Collect",2,900,6731,21624,1024}
		local point3 = {"Collect",3,900,6531,19069,1036}
		Task_L_BranchLine(0xc582f,3,4,point1,point2,point3,point4)

		local point = {"",1,900,7483,19480,1024}	
		Task_L_Collection(0xc582f,4,point)

		MSG("Lei 传送阵Market District")
		--使用传送阵
		Task_L_UseTransmit(0xc5830,1,"Market District","Luterra Castle")

		Task_L_UseTransmit(0xc5830,1,"Palace Entrance","Luterra Castle")	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10894) then
		Task_L_SetMapId(10894,3)
		local point = {"",1,100,-19757,-15354,-256}
		Task_L_TalkToNpc(0xc5441,1,point,"Camelun",0,1,1)
		
		local point = {"",1,100,-19443,-15812,-256}	
		Task_L_Collection(0xc5441,2,point)

		local point = {"",2,300,-19181,-15772,782}
		Task_L_TransmitCollection(0xc5441,3,point)--敲鼓

		
		local point = {"",1,100,-15597,-9968,919}
		Task_L_AutoGetTo(0xc5441,4,10894,point,0,0)
		
		local point1 = {"",0,1200,-15660,-9824,917}
		local point2 = {"",0,1200,-16197,-9415,925}
		Task_L_LoopAttackMonMore(0xc5441,5,0,2,point1,point2)

		local point1 = {"",0,600,-15660,-9824,917}
		local point2 = {"",0,600,-16197,-9415,925}
		Task_L_GotoAttackMore(0xc5441 ,6,0,2,point1,point2)

		local point1 = {"",0,150,-15876,-8997,925}
		local point2 = {"",0,150,-15653,-7799,916}
		local point3 = {"",0,150,-15668,-7189,916}
		local point4 = {"",0,150,-15608,-7109,916}
		local point5 = {"",2,50,-14943,-6976,423}
		local point6 = {"",0,150,-15081,-6650,939}
		local point7 = {"",0,100,-15889,-4406,1309}
		if Task_L_LongGetTo(0xc5441,6,10894,7,point1,point2,point3,point4,point5,point6,point7) then
			local point1 = {"",0,900,-15960,-4038,1309}
			local point2 = {"",0,900,-15965,-3435,1309}
			Task_L_LoopAttackMonMore(0xc5441,6,0,2,point1,point2)
		end

		local point = {"",1,300,-14795,-2953,1426}	
		Task_L_Collection(0xc5441,7,point)

		local point = {"",1,100,-14454,-3692,1301}
		Task_L_AutoGetTo(0xc5441,8,10894,point,0,0) 
		
		local point1 = {"",0,400,-11991,-931,914}
		local point2 = {"",0,800,-11492,26,789}
		local point3 = {"",0,400,-12091,853,913}
		Task_L_LoopAttackMonMore(0xc5441,9,0,3,point1,point2,point3)

		local point = {"",1,100,-10757,-809,786}	
		Task_L_Collection(0xc5441,10,point)	

		local point = {"",0,800,-9660,10,-255}
		Task_L_LoopAttackMonMore(0xc5441,11,0,1,point)

		local point = {"",0,1000,-8688,-37,-255}
		Task_L_LoopAttackMonMore(0xc5441,12,0,1,point)
		
		local point = {"",1,100,8924,-81,769}
		Task_L_AutoGetTo(0xc5441,13,10894,point,0,0) 

		local point = {"",0,1000,9509,35,770}
		Task_L_LoopAttackMonMore(0xc5441,14,0,1,point)
		
		local point = {"",1,100,14806,113,1536}
		Task_L_AutoGetTo(0xc5441,15,10894,point,0,0) 

	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10895) then
		Task_L_SetMapId(10895,3)
		local point = {"",1,100,15833,2,-14332}
		Task_L_AutoGetTo(0xc5442,1,10895,point,0,0) 
		
		Task_L_TaskSelect(0xc5442 ,2)

		local point = {"",1,1000,15833,2,-14332}	
		Task_L_AttackByName(0xc5442 ,3,point,"Valtan",1)

		local point = {"",1,100,11496,-53,-14561}
		Task_L_AutoGetTo(0xc5442,4,10895,point,0,0) 

		local point1 = {"",1,200,5227,309,770}	
		local point2 = {"",1,100,5679,217,771}		
		Task_L_CarryItem(0xc5442,5,1,point1,point2)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10829) then
		Task_L_SetMapId(10829,3)
		local point = {"",1,100,9590,11572,1536}	
		Task_L_LongGetTo(0xc505a,1,10829,1,point)

		local point1 = {"",0,1200,9418,11895,1536}
		local point2 = {"",0,1200,9026,12841,1536}
		local point3 = {"",0,1200,10833,12651,1536}
		local point4 = {"",0,1200,11398,13497,1536}
		local point5 = {"",0,1200,13811,13509,1536}
		local point6 = {"",0,1200,15810,13784,1536}
		local point7 = {"",0,1200,17152,13370,1023}
		local point8 = {"",0,600,17988,14113,1024}
		Task_L_LoopAttackMonMore(0xc505a,2,0,8,point1,point2,point3,point4,point5,point6,point7,point8)	
		
		local point = {"",1,100,18692,16251,815}
		Task_L_AutoGetTo(0xc505a,3,10829,point,0,0)

		local point = {"",0,1500,17039,18082,511}
		Task_L_LoopAttackMonMore(0xc505b,1,0,1,point)	

		local point = {"",1,100,12361,19748,512}
		Task_L_AutoGetTo(0xc505C,1,10829,point,0,0)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10828) then
		Task_L_SetMapId(10828,3)
		local point = {"",1,100,23515,24213,1781}
		Task_L_TalkToNpc(0xc4c75,1,point,"Thirain",0,1,1)

		local point = {"",10,100,24658,23345,1791}
		Task_L_UseTaskItem(0xc4c75,2,point)

		local point1 = {"",0,900,25088,23431,1789}
		local point2 = {"",1,300,25383,24136,1789}
		Task_L_LoopAttackMonMore(0xc4c75,3,0,2,point1,point2)

		local point1 = {"",0,1000,25007,22578,1791}
		local point2 = {"",0,900,25007,22578,1791}
		local point3 = {"",0,900,24374,22222,1791}
		local point4 = {"",0,900,26110,22152,1791}
		Task_L_LoopAttackMonMore(0xc4c75,4,0,4,point1,point2,point3,point4)

		local point1 = {"",0,1200,24497,22274,1791}
		local point2 = {"",0,900,25219,22466,1791}
		local point3 = {"",0,1200,25093,23655,1791}
		local point4 = {"",0,900,26060,22151,1791}
		local point5 = {"",0,500,26490,22523,1789}
		local point6 = {"",10,500,26490,22523,1789}
		Task_L_LoopAttackMonMore(0xc4c75,5,0,6,point1,point2,point3,point4,point5,point6)

		local point1 = {"",0,800,25090,23759,1791}
		local point2 = {"",0,800,25026,22496,1791}
		local point3 = {"",0,800,24327,22204,1791}
		local point4 = {"",0,600,26152,22309,1791}
		local point5 = {"",1,300,25934,21482,1791}
		local point6 = {"",0,800,25541,19848,1791}
		local point7 = {"",0,500,26388,19280,1791}
		local point8 = {"",10,500,26388,19280,1791}
		Task_L_LoopAttackMonMore(0xc4c75,5,1,8,point1,point2,point3,point4,point5,point6,point7,point8)

		local point1 = {"",0,900,25467,19263,1789}
		local point2 = {"",0,1000,24242,19012,1789}
		local point3 = {"",10,500,23738,18731,1791}
		Task_L_LoopAttackMonMore(0xc4c75,5,2,3,point1,point2,point3)
		
		local point1 = {"",0,1200,25621,19370,1791}
		local point2 = {"",0,1200,23672,18705,1791}
		local point3 = {"",0,900,22910,17592,1791}
		local point4 = {"",1,400,22569,17628,1791}
		local point5 = {"",0,1000,21556,17549,1791}
		Task_L_LoopAttackMonMore(0xc4c75,6,0,5,point1,point2,point3,point4,point5)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10827) then
		Task_L_SetMapId(10827,3)
		local point = {"",1,100,8818,13095,2129}
		Task_L_AutoGetTo(0xc488a,1,10827,point,0,0) 

		local point = {"",1,100,9482,13124,2129}
		Task_L_TalkToNpc(0xc488a,2,point,"Armen",0,1,0x13)
		
		local point = {"",1,100,9324,13451,2166}
		Task_L_TalkToNpc(0xc488a,3,point,"Meehan",0,1,3)

		local point = {"",1,100,9482,13124,2129}
		Task_L_TalkToNpc(0xc488a,4,point,"Armen",0,1,0x14)

		local point = {"",1,100,9645,13114,2129}
		Task_L_UseMusic(0xc488a,5,"Song of Valor",point)

		local point = {"",1,100,9715,13173,2129}
		Task_L_TalkToNpc(0xc488a,6,point,"Thirain",0,1,0x17)
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10851) then
		Task_L_SetMapId(10851,3)
		local point = {"",0,100,8484,13008,512}
		Task_L_AutoGetTo(0xc44a1,1,10851,point,0,0) 

		local point1 = {"",0,1200,9086,10681,-0}
		local point2 = {"",0,1200,14260,11296,-512}
		local point3 = {"",0,1200,14741,14086,-768}
		local point4 = {"",0,1200,17764,12199,-256}	
		local point5 = {"",0,1200,19049,16044,-0}	
		local point6 = {"",0,1200,17380,17329,79}	
		Task_L_GotoAttackMore(0xc44a1 ,2,0,6,point1,point2,point3,point4,point5,point6)

		local point1 = {"",0,1000,15384,17304,513}
		local point2 = {"",0,1000,14676,18023,512}	
		Task_L_GotoAttackMore(0xc44a1 ,3,0,6,point1,point2,point3,point4,point5,point6)

		local point = {"",1,100,13402,20399,512}
		Task_L_AutoGetTo(0xc44a1,4,10851,point,0,0) 

		--local point = {"",1,1000,13402,20399,512}	
		--Task_L_Attack(0xc44a1 ,5,point,0,0)	
		local point = {"",17,1000,13402,20399,512}	
		Task_L_LoopAttackMonMore(0xc44a1 ,5,0,1,point)	

		local point = {"",1,100,18035,21163,1530}
		Task_L_AutoGetTo(0xc44a1,6,10851,point,0,0) 
		
		local point = {"",1,300,17853,21689,1536}
		Task_L_Collection(0xc44a1 ,7,point)

		local point = {"",1,100,18799,21987,1542}
		Task_L_AutoGetTo(0xc44a1,8,10851,point,0,0) 

		local point = {"",1,100,18650,21766,1541}
		Task_L_TalkToNpc(0xc44a1,9,point,"Thirain",0,1,1)
		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10826) then
		Task_L_SetMapId(10826,3)
		local point = {"",1,100,12731,15002,1024}
		Task_L_AutoGetTo(0xc40ba,1,10826,point,0,0)
	
		local point = {"",1,100,11957,15300,1024}
		Task_L_TalkToNpc(0xc40ba,2,point,"Anton",0,1,1) 

		local point = {"",1,100,12357,17430,1012}
		Task_L_AutoGetTo(0xc40ba,3,10826,point,0,0)

		local point = {"",1,100,12578,17821,1007}
		Task_L_UseExpression(0xc40ba,4,"Encourage",point) 
		
		local point = {"",1,100,11746,16201,1022}
		Task_L_AutoGetTo(0xc40ba,5,10826,point,0,0)	
		
		local point = {"",1,1000,10945,13330,1021}	
		Task_L_LoopAttackMonMore(0xc40ba ,6,0,1,point)	
		
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10825) then
		Task_L_SetMapId(10825,3)
		local point = {"",1,100,16020,13625,2050}
		Task_L_TalkToNpc(0xc3cd4,1,point,"Armen",0,1,12)

		local point = {"",1,1500,15779,13021,2053}	
		Task_L_LoopAttackMonMore(0xc3cd4 ,2,0,1,point)	
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10616) then
		Task_L_SetMapId(10616,3)
		local point = {"",1,100,24297,33297,776}
		Task_L_TalkToNpc(0x93121,1,point,"Thunder",0,1,1)

		local point1 = {"",0,1000,24086,33214,780}	
		local point2 = {"",0,1000,24093,32694,776}	
		local point3 = {"",0,1000,23427,32716,776}	
		local point4 = {"",0,2000,23059,32972,776}
		local point5 = {"",0,1000,23484,33274,776}	
		Task_L_LoopAttackMonMore(0x93121 ,2,0,5,point1,point2,point3,point4,point5)
		--选择救援被虫子咬住的人，然后打死虫子
		Task_L_TaskSelect(0x93121 ,3)

		local point = {"",1,100,24190,32939,776}
		Task_L_TalkToNpc(0x93121,4,point,"Armen",0,1,1)
	end
	--进入场景副本
	if Fun_IsInMapByMapId(10228) then
		Task_L_SetMapId(10228,3)
		local point = {"",1,100,15765,6756,512}
		Task_L_TalkToNpc(0x324b5,1,point,"Captain Hamilmor",0,1,2) 

		local point = {"",1,900,14815,6689,512}	
		Task_L_LoopAttackMonMore(0x324b5 ,2,0,1,point)	

		local point = {"",1,900,14815,6689,512}	
		Task_L_LoopAttackMonMore(0x324b5 ,3,0,1,point)	
			
		local point = {"",1,100,15765,6756,512}
		Task_L_TalkToNpc(0x324b5,4,point,"Captain Hamilmor",0,1,1) 	
	end
	---------------------------------------------------------------------------
	--进入场景副本
	if Fun_IsInMapByMapId(10213) then
		Task_L_SetMapId(10213,3)
		local point = {"",1,1500,5952,34207,1006}
		Task_L_Attack(0x318fa,1,point,0,0)
		
		local point = {"",1,100,6120,33887,1006}
		Task_L_TalkToNpc(0x318fa,2,point,"Guard Ryth",0,1,1)
		
		local point = {"",0,100,6316,32924,1007}
		Task_L_AutoGetTo(0x318fd ,2,10213,point,0,0)
	end
	---------------------------------------------------------------------------
	--进入场景副本
	if Fun_IsInMapByMapId(10217) then
		Task_L_SetMapId(10217,3)
		local point = {"",1,100,18502,16097,1024}
		Task_L_AutoGetTo(0x318fc ,1,10217,point,0,0) 
		
		local point = {"",1,900,18975,18618,1270}	
		Task_L_Attack(0x318fc ,2,point,0,0)
		
		local point = {"",1,100,15871,16507,698}
		Task_L_AutoGetTo(0x318fe ,2,10217,point,0,0) 
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10227) then
		Task_L_SetMapId(10227,3)
		local point = {"",1,300,18511,58346,512}
		Task_L_Collection(0x320cb ,1,point)
		
		local point = {"",1,900,17878,57696,519}	
		Task_L_Attack(0x320cb ,2,point,0,0)

		local point = {"",1,100,17206,56556,512}
		Task_L_AutoGetTo(0x320ca,3,10227,point,0,0) 
	end
	---------------------------------------------------------------------------
	if Fun_IsInMapByMapId(10214) then
		Task_L_SetMapId(10214,3)
		if Fun_IsHaveTask(0x31517,1) == 1 then
			
			if Task_L_GetBranchCount(0x31517,1,0) < 2 then
				local point1 = {"",1,300,5464,7811,5}	
				local point2 = {"",1,300,4721,4899,-259}	
				local point3 = {"",1,300,5672,3946,-259}	
				local point4 = {"",1,300,5701,3375,-259}
				local point5 = {"",3,300,5920,3326,-259}
				Task_L_RescueNPC(0x31517 ,1,0,5,point1,point2,point3,point4,point5)
			end

			if Task_L_GetBranchCount(0x31517,1,1) < 2 then
				local point1 = {"",1,300,5743,4332,-259}	
				local point2 = {"",1,100,5858,4649,-183}
				local point3 = {"",1,100,6143,4591,-67}		
				local point4 = {"",1,300,6053,4742,-42}	
				local point5 = {"",1,300,6299,4993,5}	
				local point6 = {"",1,300,5778,5369,5}	
				local point7 = {"",1,300,5780,5723,5}
				local point8 = {"",3,300,5636,6023,5}
				Task_L_RescueNPC(0x31517 ,1,1,8,point1,point2,point3,point4,point5,point6,point7,point8)
			end
		end

		if Fun_IsHaveTask(0x31517,2) == 1 then

			if Task_L_GetBranchCount(0x31517,2,1) < 3  then
				
				local point1 = {"",1,300,6388,5071,5}	
				local point2 = {"",1,100,6784,5244,104}	
				local point3 = {"",1,100,6719,5521,190}	
				local point4 = {"",1,100,6964,5500,279}	
				local point5 = {"",1,300,6951,5739,255}
				Task_L_RescueNPC(0x31517 ,2,1,5,point1,point2,point3,point4,point5)

				local point1 = {"",1,300,6951,5739,255}
				local point2 = {"",0,500,7536,5733,261}	
				local point3 = {"",0,500,8144,6533,259}	
				local point4 = {"",0,500,8465,7636,257}
				local point5 = {"",0,500,8687,8042,257}
				local point6 = {"",0,300,8856,6893,257}
				Task_L_RescueNPC(0x31517 ,2,1,6,point1,point2,point3,point4,point5,point6)

				local point1 = {"",1,300,8330,6422,255}
				local point2 = {"",1,300,8455,6181,264}	
				local point3 = {"",3,400,8688,6199,256}	
				local point4 = {"",1,400,9047,8377,256}	
				Task_L_RescueNPC(0x31517 ,2,1,4,point1,point2,point3,point4)
			end

			if Task_L_GetBranchCount(0x31517,2,2) < 1  or Task_L_GetBranchCount(0x31517,2,3) < 2 then

				local point1 = {"",1,80,9052,8527,256}
				local point2 = {"",1,80,9349,8986,-15359}
				if Task_L_LongGetTo(0x31517,2,10214,2,point1,point2) then
					local point1 = {"",1,500,9349,8986,-15359}
					local point2 = {"",3,200,10153,9055,-15039}
					local point3 = {"",1,600,10216,9294,-15039}
					local point4 = {"",3,200,9091,9390,-15359}
					Task_L_RescueNPC(0x31517 ,2,2,4,point1,point2,point3,point4)
		
					local point1 = {"",1,100,9229,8836,-15355}
					local point2 = {"",1,100,9062,8338,-15355}
					local point3 = {"",1,100,8959,8179,255}	
					Task_L_LongGetTo(0x31517,2,10214,3,point1,point2,point3)
				end

			end

			if Task_L_GetBranchCount(0x31517,2,3) >= 2 and Task_L_GetBranchCount(0x31517,1,1) < 4 then

				local point1 = {"",1,80,9229,8836,-15355}
				local point2 = {"",1,80,9062,8338,-15355}
				local point3 = {"",1,80,8959,8179,255}	
				Task_L_LongGetTo(0x31517,2,10214,3,point1,point2,point3)

				local point1 = {"",1,50,8134,8538,256}
				local point2 = {"",1,50,7831,9349,-18014}
				if Task_L_LongGetTo(0x31517,2,10214,2,point1,point2) then
					local point1 = {"",1,800,7831,9349,-18014}
					local point2 = {"",3,200,8101,9146,-18014}
					local point3 = {"",3,200,7167,9725,-18014}
					Task_L_RescueNPC(0x31517 ,2,3,3,point1,point2,point3)
		
					local point1 = {"",0,50,7750,9225,-18014}
					local point2 = {"",0,50,7617,8775,-18011}
					local point3 = {"",0,100,8287,8200,255}	
					Task_L_LongGetTo(0x31517,3,10214,3,point1,point2,point3)
				end
			end
		end
			

		local point1 = {"",0,50,7750,9225,-18014}
		local point2 = {"",0,50,7617,8775,-18011}
		local point3 = {"",0,50,8287,8200,255}	
		Task_L_LongGetTo(0x31517,3,10214,3,point1,point2,point3)

		local point1 = {"",0,400,9850,7416,262}
		local point2 = {"",1,240,9713,7054,261}
		local point3 = {"",1,240,9883,6858,259}
		local point4 = {"",1,240,9878,6612,315}
		local point5 = {"",1,240,9864,6113,517}	
		local point6 = {"",17,600,9905,3977,517}	
		if Task_L_LoopAttackMonMore(0x31517 ,3,0,6,point1,point2,point3,point4,point5,point6) then
			local point = {"",1,300,9968,3923,517}
			Task_L_AttackPoint(0x31517,3,point)
		end


		local point1 = {"",1,100,9968,3923,517}
		local point2 = {"",1,100,10346,3867,570}
		local point3 = {"",1,100,10488,4087,648}
		local point4 = {"",1,100,10632,3842,727}
		local point5 = {"",1,100,10724,4087,765}
		local point6 = {"",1,100,10933,3928,773}
		local point7 = {"",1,100,13120,3923,-15328}
		Task_L_LongGetTo(0x31517,4,10214,7,point1,point2,point3,point4,point5,point6,point7)
		--Task_L_GotoAttackMore(0x31517 ,3,0,7,point1,point2,point3,point4,point5,point6,point7)

		--local point = {"",1,100,17541,47694,269}
		--Task_L_UseTransmitPoint(0x31517,4,"Traveler's Nook",point)

		local point = {"",1,100,13120,3923,-15328}
		Task_L_TalkToNpc(0x31517,5,point,"Varut",0,1,1)
		
		local point = {"",1,100,13046,3926,-15353}
		Task_L_TalkToNpc(0x31517,6,point,"Armen",0,1,2)
		
		local point = {"",1,100,6415,4249,-15342}
		Task_L_AutoGetTo(0x31514,1,10214,point,0,0) 
	
	end
	---------------------------------------------------------------------------
	--------------------------------正常副本-----------------------------------
	---------------------------------------------------------------------------

	--卢兰西部第2张图的副本
	if Fun_IsInMapByMapId(10253) then
		Task_L_SetMapId(10253,5)

		local point = {"",2,100,15662,11222,1539}
		if Task_L_LongGetTo(0x31ce2,1,10253,1,point) then
			local point = {"",0,400,16327,11324,1279}
			Task_L_LoopAttackMonMore(0x31ce2,1,0,1,point) 
		end

		
		local point1 = {"",2,100,16702,11450,1280}	
		local point2 = {"",1,100,17280,11859,1023}	
		Task_L_LongGetTo(0x31ce2,2,10253,2,point1,point2)

		local point1 = {"",0,900,17309,13858,1024}
		local point2 = {"",1,300,17594,13975,1024}
		local point3 = {"",0,900,18080,14877,1024}
		local point4 = {"",1,300,18146,15227,1024}	
		local point5 = {"",0,900,19125,14486,1024}
		local point6 = {"",1,300,19181,14262,1024}
		local point7 = {"",1,300,19599,14441,1023}
		Task_L_LoopAttackMonMore(0x31ce2,3,0,7,point1,point2,point3,point4,point5,point6,point7) 
		
		local point = {"",1,300,19599,14441,1023}--爬梯子
		Task_L_Collection(0x31ce2 ,4,point)

		local point1 = {"",1,600,20678,15300,1535}
		local point2 = {"",1,600,21122,16077,1535}
		local point3 = {"",1,900,21844,16754,1535}
		local point4 = {"",1,500,21687,17281,1536}
		Task_L_LoopAttackMonMore(0x31ce2 ,5,0,4,point1,point2,point3,point4)
		
		local point1 = {"",0,600,21537,16840,1536}
		local point2 = {"",1,300,21536,17339,1536}
		local point3 = {"",1,600,21780,17775,1535}
		Task_L_LoopAttackMonMore(0x31ce2 ,6,0,3,point1,point2,point3)

		local point1 = {"",1,600,21664,18201,1536}
		local point2 = {"",1,600,21465,19174,1535}
		Task_L_LoopAttackMonMore(0x31ce2 ,7,0,2,point1,point2)

		local point1 = {"",1,600,21664,18201,1536}
		local point2 = {"",1,900,21465,19174,1535}
		local point3 = {"",1,300,21326,19642,1535}
		Task_L_LoopAttackMonMore(0x31ce2 ,7,1,3,point1,point2,point3)

		local point = {"",1,300,21326,19642,1535}
		Task_L_Collection(0x31ce2 ,8,point)


		local point = {"",10,300,19263,21858,1536}	
		Task_L_AttackByName(0x31ce2 ,9,point,"Ugo",1)

		local AllTaskId = {0x31ce2,0x00}
		Task_CheckTaskOver(AllTaskId,19100,21833,1536)
	end
	---------------------------------------------------------------------------
	--卢兰西部第3张图的副本  
	if Fun_IsInMapByMapId(10251) then
		Task_L_SetMapId(10251,5)
		local point = {"",1,100,-2032,9388,-0}
		Task_L_TalkToNpc(0x3289a,1,point,"Командир Фозер",0,1,1) 

		
		local point1 = {"",1,800,-1666,7914,0}
		local point2 = {"",1,800,-803,7525,-0}
		local point3 = {"",1,800,-549,6607,-0}
		local point4 = {"",1,800,-470,6006,-0}
		local point5 = {"",1,800,-628,5858,-0}
		Task_L_LoopAttackMonMore(0x3289a ,2,0,5,point1,point2,point3,point4,point5)

		
		local point = {"",1,100,-639,5103,1}
		Task_L_AutoGetTo(0x3289a ,3,10251,point,0,0) 	
		
		local point1 = {"",1,500,-633,4756,-3}
		local point2 = {"",1,500,30,4418,-0}
		local point3 = {"",1,500,-360,4012,0}
		local point4 = {"",1,500,746,3372,-0}
		local point5 = {"",1,500,844,4029,0}
		local point6 = {"",1,500,200,3712,-0}
		local point7 = {"",1,500,-167,3310,-0}
		Task_L_LoopAttackMonMore(0x3289a ,4,0,7,point1,point2,point3,point4,point5,point6,point7)
		
		local point = {"",1,100,-825,-831,-2}
		Task_L_AutoGetTo(0x3289a ,5,10251,point,0,0) 	
		
		local point1 = {"",1,500,-527,-2940,-0}
		local point2 = {"",1,1000,-480,-3867,-3}
		Task_L_LoopAttackMonMore(0x3289a ,6,0,2,point1,point2)
		
		local point = {"",1,100,-661,-5801,-1}
		Task_L_AutoGetTo(0x3289a ,7,10251,point,0,0) 	
		
		local point1 = {"",1,500,-527,-6484,-3}
		local point2 = {"",1,1000,-653,-7574,-1}
		Task_L_LoopAttackMonMore(0x3289a ,8,0,2,point1,point2)
		
		local point1 = {"",1,1000,2605,-7658,268}
		local point2 = {"",1,1000,3482,-7188,267}
		Task_L_LoopAttackMonMore(0x3289a ,9,0,2,point1,point2)
		
		local point = {"",1,100,2984,-5825,257}
		Task_L_Collection(0x3289a ,10,point)	
		
		local point1 = {"",1,1000,3189,-4445,-0}
		local point2 = {"",1,1000,2743,-4347,-0}
		Task_L_LoopAttackMonMore(0x3289a ,11,0,2,point1,point2)
		
		local point1 = {"",1,500,4473,-4507,-0}
		local point2 = {"",1,600,5297,-3691,-0}
		local point3 = {"",1,600,6029,-4481,-0}
		local point4 = {"",1,600,7202,-3556,-0}
		local point5 = {"",1,600,8057,-2405,2}
		local point6 = {"",1,600,7368,-1888,-0}
		local point7 = {"",1,600,7201,-652,-10}
		local point8 = {"",1,600,7784,-563,-3}
		Task_L_LoopAttackMonMore(0x3289a,12,0,8,point1,point2,point3,point4,point5,point6,point7,point8)
		
		local point1 = {"",1,500,7811,742,-4}
		local point2 = {"",1,500,7648,1608,-7}
		local point3 = {"",1,500,6795,1127,-218}
		Task_L_LoopAttackMonMore(0x3289a ,13,0,3,point1,point2,point3)	
		
		local point = {"",1,100,5286,2030,-337}
		Task_L_AutoGetTo(0x3289a ,14,10251,point,0,0) 	
		
		local point1 = {"",1,500,5143,2488,-337}
		local point2 = {"",1,500,5999,3321,-340}
		local point3 = {"",0,500,5006,5271,-343}
		local point4 = {"",1,500,4542,5385,-342}
		local point5 = {"",0,400,4956,6475,-344}
		local point6 = {"",1,400,5485,6624,-346}
		local point7 = {"",1,500,6386,7321,-344}
		Task_L_LoopAttackMonMore(0x3289a ,15,0,7,point1,point2,point3,point4,point5,point6,point7)	
		
		local point1 = {"",1,600,2036,9284,-541}
		local point2 = {"",1,500,1535,11956,-526}
		Task_L_LoopAttackMonMore(0x3289a ,16,0,2,point1,point2)	
		
		local point = {"",10,300,1584,13157,-521}	
		Task_L_AttackByName(0x3289a ,17,point,"Верховный антраксарий Ул'зар",1)
		
		local AllTaskId = {0x3289a,0x00}
		Task_CheckTaskOver(AllTaskId,1584,13157,-521)
		
	end
	---------------------------------------------------------------------------
	--卢兰西部第4张图的副本  
	if Fun_IsInMapByMapId(10252) then
		Task_L_SetMapId(10252,5)
		MSG("Lei 卢兰西部第4")
		local point = {"",2,100,8256,-864,482}
		Task_L_LongGetTo(0x33069,1,10252,1,point)
		-----
		local point1 = {"",1,600,9395,-1169,479}
		local point2 = {"",1,1000,10061,-1084,481}
		Task_L_LoopAttackMonMore(0x33069 ,2,0,2,point1,point2)

		local point1 = {"",0,800,12636,-1175,476}
		local point2 = {"",1,300,12988,-1297,476}
		local point3 = {"",0,800,13150,40,474}
		local point4 = {"",1,300,13348,46,474}
		local point5 = {"",0,800,12737,18,474}
		local point6 = {"",1,300,12590,107,474}
		Task_L_LoopAttackMonMore(0x33069 ,3,0,6,point1,point2,point3,point4,point5,point6)
		
		local point1 = {"",1,500,12533,1891,473}
		local point2 = {"",1,800,12647,3041,473}
		local point3 = {"",1,800,12685,4017,470}
		local point4 = {"",1,800,12384,5196,470}
		Task_L_LoopAttackMonMore(0x33069 ,4,0,4,point1,point2,point3,point4)	

		local point1 =  {"",0,100,12178,6181,467}
		local point2 =  {"",0,1000,12426,7702,467}	
		Task_L_LoopAttackMonMore(0x33069 ,5,0,2,point1,point2)	

		local point1 =  {"",1,300,12665,8449,467}
		local point2 =  {"",1,100,12874,8798,467}
		local point3 =  {"",0,300,15449,11711,-2}	
		Task_L_LoopAttackMonMore(0x33069 ,6,0,3,point1,point2,point3)	
	
		local point = {"",10,300,15449,11711,-2}
		Task_L_AttackByName(0x33069 ,7,point,"Harzal",1)

		local point = {"",1,500,16612,11743,145}
		Task_L_Collection(0x33069 ,8,point)

		if (Task_L_FindTask(0x33069) == 0) then

			Fun_Sleep(3000)
			--使用传送阵
			--Task_L_UseTransmit(0xc38eb,1,"Regria Monastery","Regria Monastery")
			Task_L_UseTransmit(0x32c85,1,"Regria Monastery","Regria Monastery")
		end
		--local AllTaskId = {0x33069,0x00}
		--Task_CheckTaskOver(AllTaskId,16612,11743,145)
		
	end
	---------------------------------------------------------------------------
	--卢兰中部第1张图的副本
	if Fun_IsInMapByMapId(10691) then
		Task_L_SetMapId(10691,5)
		LightInTheDarkFun.FB(0)
	end
	---------------------------------------------------------------------------
	--卢兰东部第5张图的副本
	if Fun_IsInMapByMapId(10852) then
		Task_L_SetMapId(10852,5)

		local point = {"",1,100,-3995,-31959,-6430}
		Task_L_AutoGetTo(0xc6d41,1,10852,point,0,0) 

		local point1 = {"",0,800,-3995,-31959,-6430}
		local point2 = {"",0,800,-5324,-32698,-6430}
		local point3 = {"",0,500,-6252,-30751,-7078}
		Task_L_LoopAttackMonMore(0xc6d41 ,2,0,3,point1,point2,point3)

		local point1 = {"",0,500,-6310,-30761,-7085}
		local point2 = {"",0,800,-4697,-32376,-6430}
		local point3 = {"",0,800,-4884,-29988,-6430}
		local point4 = {"",0,900,-6710,-29883,-6174}
		local point5 = {"",0,500,-5880,-29433,-6174}
		Task_L_LoopAttackMonMore(0xc6d41 ,3,0,5,point1,point2,point3,point4,point5)
		
		local point = {"",1,300,-4898,-29799,-6430}
		Task_L_Collection(0xc6d41 ,4,point)

		local point1 = {"",0,500,-4823,-29120,-6432}
		local point2 = {"",0,500,-4815,-28388,-6432}
		local point3 = {"",0,500,-5311,-27970,-6432}
		local point4 = {"",0,500,-5987,-27997,-6432}
		local point5 = {"",0,500,-6639,-27976,-6432}
		local point6 = {"",0,500,-6660,-26535,-6432}
		Task_L_LoopAttackMonMore(0xc6d41 ,5,0,6,point1,point2,point3,point4,point5,point6)

		local point = {"",0,800,-6660,-26535,-6432}
		Task_L_LoopAttackMonMore(0xc6d41 ,6,0,1,point)

		local point = {"",1,100,-1724,-25725,-6944}
		Task_L_AutoGetTo(0xc6d41,7,10852,point,0,0) 

		local point1 = {"",0,500,-1724,-25725,-6944}
		local point2 = {"",0,600,-1663,-27247,-7456}
		Task_L_LoopAttackMonMore(0xc6d41 ,8,0,2,point1,point2)

		local point1 = {"",0,600,575,-22519,-6942}
		local point2 = {"",0,1000,941,-23563,-6942}
		Task_L_LoopAttackMonMore(0xc6d41 ,9,0,2,point1,point2)

		local point = {"",1,300,2171,-22319,-6942}
		Task_L_Collection(0xc6d41 ,10,point)

		local point = {"",0,900,3281,-22336,-6942}
		Task_L_LoopAttackMonMore(0xc6d41 ,11,0,1,point)
		
		local point = {"",1,100,-1911,-18532,-7958}
		Task_L_AutoGetTo(0xc6d41,12,10852,point,0,0) 
		
		local point1 = {"",0,300,-603,-18180,-8107}
		local point2 = {"",0,600,-1066,-18484,-8105}
		local point3 = {"",0,500,-799,-19552,-8107}
		local point4 = {"",0,300,342,-18826,-7825}
		local point5 = {"",0,700,494,-19493,-7829}
		local point6 = {"",0,800,846,-18271,-7825}
		local point7 = {"",0,300,256,-18015,-7825}
		Task_L_LoopAttackMonMore(0xc6d41 ,13,0,7,point1,point2,point3,point4,point5,point6,point7)

		local point1 = {"",0,800,-1808,-16563,-7829}
		local point2 = {"",0,800,-2641,-16590,-7829}
		Task_L_LoopAttackMonMore(0xc6d41 ,14,0,2,point1,point2)
		
		local point = {"",0,1000,-5933,-16585,-8188}
		Task_L_AttackPoint(0xc6d41,15,point)

		local point = {"",0,1500,-5984,-15402,-8258}
		Task_L_AttackPoint(0xc6d41,16,point)

		local point1 = {"",2,100,-7237,-13840,-8019}
		local point2 = {"",1,100,-7278,-13006,-8019}
		if Task_L_LongGetTo(0xc6d41,16,10852,2,point1,point2) then
			local point = {"",10,900,-8662,-11219,-8531}	
			Task_L_AttackByName(0xc6d41 ,16,point,"Heretic High Priest",1)
		end
		local AllTaskId = {0xc6d41,0x00}
		local point = {"",1,100,-8662,-11219,-8531}	
		Task_L_CheckTaskOver(10852,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--卢兰东部第3张图的副本
	if Fun_IsInMapByMapId(10892) or Fun_IsInMapByMapId(10893) then
		KingLutlandBasefun.FB(0)
	end
	---------------------------------------------------------------------------
	--卢兰东部第9张图的副本
	if Fun_IsInMapByMapId(10854) then
		Task_L_SetMapId(10854,5)
		local point = {"",1,100,15284,-2340,256}
		Task_L_TalkToNpc(0xc8899,1,point,"Cals",0,1,1)

		local point = {"",0,1000,15405,2080,-0}
		Task_L_LoopAttackMonMore(0xc8899,2,0,1,point)

		local point = {"",1,100,15217,3679,3}
		Task_L_AutoGetTo(0xc8899,3,10854,point,0,0) 

		local point = {"",1,100,4860,-148,-0}
		Task_L_AutoGetTo(0xc8899,4,10854,point,0,0) 
		
		local point1 = {"",0,1000,4270,-513,-0}
		local point2 = {"",0,1000,3772,-990,-0}
		Task_L_LoopAttackMonMore(0xc8899,5,0,2,point1,point2)
		
		local point1 = {"",0,1000,-997,-381,-256}
		local point2 = {"",0,1000,-1575,322,-256}
		local point3 = {"",0,1000,-785,639,-256}	
		Task_L_LoopAttackMonMore(0xc8899,6,0,3,point1,point2,point3)
		
		local point1 = {"",0,1000,-997,-381,-256}
		local point2 = {"",0,1000,-1575,322,-256}
		local point3 = {"",0,1000,-785,639,-256}	
		Task_L_LoopAttackMonMore(0xc8899,6,1,3,point1,point2,point3)	

		local point = {"",0,1500,-103,7077,-768}
		Task_L_LoopAttackMonMore(0xc8899,7,0,1,point)--这是走路?

		local point1 = {"",0,1500,-103,7077,-768}
		local point2 = {"",0,1500,945,7935,-768}
		Task_L_LoopAttackMonMore(0xc8899,8,0,2,point1,point2)	
		
		local point = {"",1,100,-26,14130,-1280}
		Task_L_AutoGetTo(0xc8899,9,10854,point,0,0) 

		local point = {"",0,1000,-479,15264,-1280}
		Task_L_LoopAttackMonMore(0xc8899,10,0,1,point)
		
		local point1 = {"",1,300,-164,16042,-1280}
		local point2 = {"",1,300,2729,19071,-1280}
		Task_L_LoopAttackMonMore(0xc8899,11,0,2,point1,point2)	

		local point1 = {"",0,1000,2190,21850,-1280}
		local point2 = {"",1,300,1513,21156,-1280}
		local point3 = {"",1,300,1015,21574,-1282}
		local point4 = {"",1,300,1832,22939,-1280}
		local point5 = {"",1,300,2087,22642,-1280}
		local point6 = {"",1,300,3054,22374,-1280}	
		local point7 = {"",1,300,3009,20744,-1280}	
		Task_L_LoopAttackMonMore(0xc8899,12,0,7,point1,point2,point3,point4,point5,point6,point7)
		
		local point1 = {"",2,100,5473,20247,-1526}
		local point2 = {"",1,100,8307,17861,-2247}
		Task_L_LongGetTo(0xc8899,13,10854,2,point1,point2)
		
		local point = {"",1,100,8307,17861,-2247}
		Task_L_TalkToNpc(0xc8899,14,point,"Cals",0,1,1)

		local point = {"",0,1000,11895,16474,-2428}
		Task_L_LoopAttackMonMore(0xc8899,15,0,1,point)

		local point = {"",0,700,12387,11336,-2679}
		Task_L_Collection(0xc8899 ,16,point)
		
		local point1 = {"",0,1200,15799,11588,-2680}
		local point2 = {"",0,1200,18202,12405,-2487}
		local point3 = {"",0,1200,20251,13688,-2489}	
		Task_L_LoopAttackMonMore(0xc8899,17,0,3,point1,point2,point3)

		local point = {"",0,600,20561,17766,-2903}
		Task_L_Collection(0xc8899 ,18,point)
		
		local point1 = {"",2,100,20786,17597,-2903}
		local point2 = {"",1,100,21655,20169,-2577}
		Task_L_LongGetTo(0xc8899,19,10854,2,point1,point2)
		
		local point = {"",17,1000,21742,20307,-2577}	
		Task_L_LoopAttackMonMore(0xc8899,20,0,1,point)

		local AllTaskId = {0xc8899,0x00}
		local point = {"",1,100,21742,20307,-2577}	
		Task_L_CheckTaskOver(10854,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--托托克第3张地图 海盗巢穴
	if Fun_IsInMapByMapId(11051) then
		Task_L_SetMapId(11051,5)
		PirateLairFun.FB(0)
	end
	---------------------------------------------------------------------------
	--托托克第5张地图 托托克的心
	if Fun_IsInMapByMapId(11052) then
		Task_L_SetMapId(11052,5)
		ToToHeart.FB(0)
	end
	---------------------------------------------------------------------------
	--安忆谷第3张图的副本   
	if Fun_IsInMapByMapId(10762) then
		Task_L_SetMapId(10762,5)
		YanZhiEnchantmentNormalFun.FB(0)
	end
	---------------------------------------------------------------------------
	--安忆谷第5张图的副本  
	if Fun_IsInMapByMapId(10764) then
		Task_L_SetMapId(10764,3)
		CaveOfDeadFun.FB(0)
	end
	---------------------------------------------------------------------------
	--安忆谷第5张图的副本 
	if Fun_IsInMapByMapId(10765) then
		Task_L_SetMapId(10765,3)
		LifeAndDeathFun.FB(0)
	end
	---------------------------------------------------------------------------
	--阿尔斯泰第4张图的副本 克拉克的心脏
	if Fun_IsInMapByMapId(10491) then

		Task_L_SetMapId(10491,5)

		local point = {"",1,100,-28246,-21158,6877}
		Task_L_AutoGetTo(0x4b4b2,1,10491,point,0,0) 

		local point = {"",1,100,-28246,-21158,6877}
		Task_L_TalkToNpc(0x4b4b2,2,point,"Sasha",0,1,1)
		
		local point1 = {"",2,100,-30103,-17204,6593}
		local point2 = {"",1,100,-32464,-17232,6716}
		Task_L_LongGetTo(0x4b4b2,3,10491,2,point1,point2)
		
		local point1 = {"",0,800,-32480,-16371,6713}
		local point2 = {"",0,800,-32455,-15252,6716}
		local point3 = {"",0,800,-32452,-14260,6607} 
		local point4 = {"",0,1000,-31472,-14274,6605} 
		Task_L_LoopAttackMonMore(0x4b4b2,4,0,4,point1,point2,point3,point4)
		
		local point = {"",0,100,-30813,-14039,6605}
		Task_L_Collection(0x4b4b2 ,5,point)
		
		local point = {"",1,100,-28840,-13156,6523}
		Task_L_AutoGetTo(0x4b4b2,6,10491,point,0,0)

		local point1 = {"",10,100,-28840,-13156,6523}
		local point2 = {"",1,100,-28545,-12296,1401}
		Task_L_LongGetTo(0x4b4b2,7,10491,2,point1,point2)
		
		local point1 = {"",0,800,-29304,-10249,1665}
		local point2 = {"",0,800,-30985,-9658,1666}
		local point3 = {"",0,800,-31988,-8612,1477} 
		local point4 = {"",0,800,-32053,-6025,1488} 
		local point5 = {"",0,800,-32714,-4310,1330} 
		local point6 = {"",0,800,-32164,-3844,1339} 
		Task_L_LoopAttackMonMore(0x4b4b3,1,0,6,point1,point2,point3,point4,point5,point6)
		
		local point = {"",0,1000,-32164,-3844,1339} 
		Task_L_LoopAttackMonMore(0x4b4b3,2,0,1,point)
		
		local point = {"",0,100,-31883,-2921,1337}
		Task_L_Collection(0x4b4b3 ,3,point)

		local point1 = {"",10,100,-32031,-2587,1336}
		local point2 = {"",1,100,-28826,-2268,3901}
		Task_L_LongGetTo(0x4b4b3,4,10491,2,point1,point2)
		
		local point = {"",0,1000,-28024,-2421,3914} 
		Task_L_LoopAttackMonMore(0x4b4b3,5,0,1,point)

		local point = {"",0,100,-27214,-1966,3914}
		Task_L_Collection(0x4b4b3 ,6,point)
		
		local point1 = {"",2,100,-26067,-3423,4274}
		local point2 = {"",2,100,-26258,-5733,3250}
		local point3 = {"",2,100,-25923,-5961,3775}
		local point4 = {"",1,100,-24244,-6612,3250}
		Task_L_LongGetTo(0x4b4b4,1,10491,4,point1,point2,point3,point4)

		local point = {"",0,100,-23213,-5535,3080}
		if Task_L_Collection(0x4b4b4 ,2,point) then
			Fun_Sleep(5000)
		end

		local point = {"",2,100,-22259,-5843,3080}
		if Task_L_RideHorse(0x4b4b4,3,point) then

			local point1 = {"",21,100,-18090,-5860,3112}
			local point2 = {"",21,100,-15903,-8055,3112}
			local point3 = {"",21,100,-10705,-8161,3112}
			local point4 = {"",21,100,-7928,-5304,3112}
			local point5 = {"",21,100,-2204,-5343,3051}
			local point6 = {"",1,100,-1977,-5350,3051}
			Task_L_LongGetTo(0x4b4b4,3,10491,6,point1,point2,point3,point4,point5,point6)
		end

		local point1 = {"",2,100,-1986,-4609,3053}
		local point2 = {"",2,100,-1785,-4351,3565}
		local point3 = {"",2,100,-1135,-4497,3309}
		local point4 = {"",10,100,2064,-6524,3069}
		local point5 = {"",1,100,6205,-15811,3300}
		Task_L_LongGetTo(0x4b4b4,4,10491,5,point1,point2,point3,point4,point5)

		local point = {"",2,100,11347,-16517,3379}
		if Task_L_RideHorse(0x4b4b5,1,point) then
			local point = {"",20,600,17380,-7977,3594}
			Task_L_RideAttackMon(0x4b4b5,1,1,point)
		end

		local point = {"",22,300,17364,-7415,3589}
		Task_L_LongGetTo(0x4b4b5,2,10491,1,point)

		local point1 = {"",20,300,10776,-16417,3359}
		local point2 = {"",20,600,11741,-15780,3359}
		Task_L_RideAttackMon(0x4b4b5,3,2,point1,point2)

		local point1 = {"",20,600,13543,-15674,3354}
		local point2 = {"",20,600,15161,-15661,3354}
		local point3 = {"",20,600,15023,-11647,3594}
		local point4 = {"",20,600,17442,-8228,3594}
		Task_L_RideAttackMon(0x4b4b5,4,4,point1,point2,point3,point4)

		local point = {"",20,600,17418,-8020,3594}
		Task_L_RideAttackMon(0x4b4b5,5,1,point)
	
		local point1 = {"",2,500,17375,-7416,3588}
		local point2 = {"",1,500,17356,-2204,2564}
		Task_L_LongGetTo(0x4b4b5,6,10491,2,point1,point2)

		local point1 = {"",20,800,17334,-961,2562}
		local point2 = {"",20,800,17200,-323,2565}
		local point3 = {"",20,800,17613,434,2685}
		local point4 = {"",20,1000,20379,1410,2558}
		local point5 = {"",20,800,22720,4480,2554} 
		local point6 = {"",20,800,25575,7524,2949} 
		local point7 = {"",20,800,26312,7498,2949} 
		local point8 = {"",20,800,28403,5330,2949} 
		local point9 = {"",20,800,28274,2206,2683} 
		Task_L_RideAttackMon(0x4b4b5,7,9,point1,point2,point3,point4,point5,point6,point7,point8,point9)

		local point = {"",20,600,28375,2194,2682}
		Task_L_RideAttackMon(0x4b4b5,8,1,point)

		local point1 = {"",2,500,29172,2218,2682}
		local point2 = {"",1,500,34190,2231,1657}
		Task_L_LongGetTo(0x4b4b5,9,10491,2,point1,point2)

		local point1 = {"",20,600,35140,4381,1657}
		local point2 = {"",20,600,36593,4967,1657}
		local point3 = {"",20,600,40210,4927,1662} 
		Task_L_RideAttackMon(0x4b4b6,1,3,point1,point2,point3)

		local point = {"",20,100,40950,4848,1674}
		Task_L_LongGetTo(0x4b4b6,2,10491,1,point)
		
		local point = {"",20,600,41734,4636,1674}
		Task_L_RideAttackMon(0x4b4b6,3,1,point)

		local point = {"",1,100,43619,3558,1277}
		Task_L_AutoGetTo(0x4b4b6,4,10491,point,0,0)
		
		local point = {"",1,100,44468,3474,1205}
		Task_L_AutoGetTo(0x4b4b6,5,10491,point,0,0)
		
		local point = {"",0,800,49966,-36996,3927}
		Task_L_LoopAttackMonMore(0x4b4b7,1,0,1,point)
		
		local point1 = {"",2,100,50318,-37004,3927}
		local point2 = {"",1,100,51442,-36955,3881}
		Task_L_LongGetTo(0x4b4b7,2,10491,2,point1,point2)

		local point1 = {"",0,400,51008,-36996,3881}
		local point2 = {"",0,400,51278,-36664,3881}
		local point3 = {"",0,400,51459,-37078,3881}
		local point4 = {"",0,400,51462,-37445,3915}
		local point5 = {"",0,800,51435,-37884,3966}
		local point6 = {"",0,800,51451,-36431,3881}
		Task_L_LoopAttackMonMore(0x4b4b7,3,0,6,point1,point2,point3,point4,point5,point6)

		local point1 = {"",1,300,51191,-36077,3961}
		local point2 = {"",1,300,51736,-36102,3961}	
		Task_L_LoopAttackMonMore(0x4b4b7,4,0,2,point1,point2)

		local point1 = {"",2,100,50975,-37011,3881}
		local point2 = {"",1,100,49966,-36996,3927}
		Task_L_LongGetTo(0x4b4b7,5,10491,2,point1,point2)

		local point = {"",1,100,31512,-16526,4668}
		Task_L_AutoGetTo(0x4b4b8,1,10491,point,0,0)
		
		local point1 = {"",16,2000,32702,-16786,4672}
		local point2 = {"",17,2000,32741,-6072,4689}
		Task_L_LoopAttackMonMore(0x4b4b8,2,0,2,point1,point2)

		--local point = {"",1,1500,-3613,22191,-474}	
		--Task_L_AttackByName(0x14a2d3 ,13,point,"Белькруз",1)
		
		local point = {"",1,100,32772,-4607,4676}
		Task_L_TalkToNpc(0x4b4b8,3,point,"Sasha",0,1,1)
		
		local point = {"",0,100,32821,-5758,4695}
		Task_L_Collection(0x4b4b8 ,4,point)

		local AllTaskId = {0x4b4b2,0x4b4b3,0x4b4b4,0x4b4b5,0x4b4b6,0x4b4b7,0x4b4b8,0x00}
		local point = {"",0,100,32821,-5758,4695}
		Task_L_CheckTaskOver(10491,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--阿尔斯泰第6张图的副本
	if Fun_IsInMapByMapId(10462) then
		Task_L_SetMapId(10462,5)
		AiXiManFun.FB(0)
	end
	---------------------------------------------------------------------------
	--阿尔斯泰第7张图的副本
	if Fun_IsInMapByMapId(10463) then
		Task_L_SetMapId(10463,5)
		AierGaiciFun.FB(0)
	end
	---------------------------------------------------------------------------
	--贝隆 第5张图的副本
	if Fun_IsInMapByMapId(11152) then
		Task_L_SetMapId(11152,5)
		local point1 = {"",2,100,1693,7692,2048}
		local point2 = {"",2,100,1611,6113,2024}
		local point3 = {"",1,100,2491,4848,2048}	
		if Task_L_LongGetTo(0x10e9b1,1,11152,3,point1,point2,point3) then
			local point = {"",1,100,2491,4848,2048}
			Task_L_TalkToNpc(0x10e9b1,1,point,"Thar",0,1,1)
		end

		local point1 = {"",1,300,2887,4544,2106}	
		local point2 = {"",0,300,5703,5014,2560}				
		Task_L_LoopAttackMonMore(0x10e9b1,2,0,2,point1,point2)

		local point1 = {"",0,1000,5599,5056,2560}
		local point2 = {"",0,1000,5812,4242,2560}
		local point3 = {"",0,1000,6230,5591,2581}
		Task_L_LoopAttackMonMore(0x10e9b1,3,1,3,point1,point2,point3)
		
		local point1 = {"",1,300,6222,5394,2581}	
		local point2 = {"",1,300,6152,4115,2561}	
		Task_L_LoopAttackMonMore(0x10e9b1,3,0,2,point1,point2)

		local point1 = {"",1,300,6424,4079,2617}	
		local point2 = {"",0,300,7106,3696,2840}				
		Task_L_LoopAttackMonMore(0x10e9b1,4,0,2,point1,point2)

		local point = {"",1,100,8195,3050,3071}
		Task_L_AutoGetTo(0x10e9b1,5,11152,point,0,0)

		local point = {"",1,500,14669,6991,5128}
		if Task_L_AttackPoint(0x10e9b1,6,point) then
			local point1 = {"",2,100,14358,7364,5118}
			local point2 = {"",1,100,12759,10721,5204}
			Task_L_LongGetTo(0x10e9b1,6,11152,2,point1,point2)
		end

		local point1 = {"",0,1000,9337,9687,5134}	
		local point2 = {"",0,1000,9443,9570,5134}	
		Task_L_LoopAttackMonMore(0x10e9b1,7,0,2,point1,point2)

		local point = {"",1,100,11028,11196,5252}
		Task_L_AutoGetTo(0x10e9b1,8,11152,point,0,0)

		local point = {"",0,800,10243,13108,5390}	
		Task_L_GotoAttackMore(0x10e9b1 ,9,0,1,point)

		local point1 = {"",2,300,9574,13119,5395}
		local point2 = {"",0,800,8599,13255,5347}	
		if Task_L_LongGetTo(0x10e9b1,9,11152,2,point1,point2) then
			local point1 = {"",0,800,8599,13255,5347}	
			local point2 = {"",1,300,9020,13520,5345}
			local point3 = {"",1,300,8268,13486,5340}	
			Task_L_LoopAttackMonMore(0x10e9b1,9,0,3,point1,point2,point3)
		end

		local point = {"",0,1500,8663,13306,5347}	
		Task_L_LoopAttackMonMore(0x10e9b1,9,1,1,point)

		local point1 = {"",1,500,11031,13209,5393}	
		local point2 = {"",0,300,13245,15743,5392}				
		Task_L_LoopAttackMonMore(0x10e9b1,10,0,2,point1,point2)

		local point = {"",0,1500,13541,16730,5347}	
		Task_L_LoopAttackMonMore(0x10e9b1,11,0,1,point)

		local point1 = {"",0,300,13069,16909,5340}
		local point2 = {"",0,300,13372,17059,5342}
		local point3 = {"",0,300,13870,16852,5342}
		Task_L_LoopCollectMore(0x10e9b1,12,0,3,point1,point2,point3)

		local point = {"",1,100,16638,14195,5567}
		Task_L_AutoGetTo(0x10e9b1,13,11152,point,0,0)

		local point1 = {"",2,100,17060,15202,5621}	
		local point2 = {"",0,100,16996,16171,5631}	
		if Task_L_LongGetTo(0x10e9b1,14,11152,2,point1,point2) then 
			Fun_Sleep(6000)
		end

		local point1 = {"",0,900,19442,17683,5823}	
		local point2 = {"",0,1500,21205,18584,6004}	
		Task_L_LoopAttackMonMore(0x10e9b3,1,0,2,point1,point2)
		
		local point = {"",1,100,21126,20345,6155}
		Task_L_AutoGetTo(0x10e9b3,2,11152,point,0,0)

		local point1 = {"",10,100,21126,20345,6155}	
		local point2 = {"",0,100,22360,23766,6976}	
		Task_L_LongGetTo(0x10e9b3,3,11152,2,point1,point2)
		
		local point1 = {"",0,1500,22500,24368,6985}	
		local point2 = {"",0,1500,23139,26277,6979}	
		Task_L_LoopAttackMonMore(0x10e9b3,4,0,2,point1,point2)

		local point = {"",1,100,23447,27552,6974}
		Task_L_AutoGetTo(0x10e9b3,5,11152,point,0,0)
		
		local point = {"",0,1500,24314,29482,7237}
		Task_L_LoopAttackMonMore(0x10e9b3,6,0,1,point)
		
		local point = {"",1,1500,24314,29482,7237}
		Task_L_AttackByName(0x10e9b3,7,point,"Sigmund",1)

		local AllTaskId = {0x10e9b1,0x10e9b3,0x00}
		local point = {"",0,100,24314,29482,7237}
		Task_L_CheckTaskOver(11152,AllTaskId,point)
	end

	---------------------------------------------------------------------------
	--休沙瑞 第4张图的副本
	if Fun_IsInMapByMapId(10362) then
		Task_L_SetMapId(10362,5)

		local point = {"",1,100,-4589,-465,289}
		Task_L_AutoGetTo(0x63b52,1,10362,point,0,0)	

		local point = {"",0,1500,-4589,-465,289}
		Task_L_LoopAttackMonMore(0x63b52,2,0,1,point)
		
		if Fun_IsHaveTask(0x63b52,3) == 1 then
			local point = {"",0,1500,-4589,-465,289}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,100,-6136,1398,289}
				Task_L_LongGetTo(0x63b52,3,10362,1,point)
			end

			local point = {"",0,1500,-6136,1398,289}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",0,1200,-6136,1398,289}
				if Task_L_AttackPoint(0x63b52,3,point) then
					local point = {"",1,100,-6150,2395,289}
					Task_L_LongGetTo(0x63b52,3,10362,1,point)
				end
			end

			local point = {"",0,500,-6150,2395,289}
			if Fun_IsInPoint(point) == 1 then
				MSG("Lei 开门")
				local point1 = {"",2,100,-6150,2395,289}
				local point2 = {"",1,100,-5866,3090,289}
				Task_L_LongGetTo(0x63b52,3,10362,2,point1,point2)
			end

			
			local point = {"",0,1000,-5866,3090,289}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",0,1000,-5866,3090,289}
				if Task_L_AttackPoint(0x63b52,3,point) then
					local point = {"",1,100,-4550,3063,289}
					Task_L_LongGetTo(0x63b52,3,10362,1,point)
				end
			end

			local point = {"",0,800,-4550,3063,289}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",0,800,-4550,3063,289}
				if Task_L_AttackPoint(0x63b52,3,point) then
					local point1 = {"",0,100,-2660,1527, 409}
					local point2 = {"",0,100,-1938,1373, 289}
					local point3 = {"",0,100,-815,-357, 289}
					Task_L_LongGetTo(0x63b52,3,10362,3,point1,point2,point3)
				end
			end
		end

		local point1 = {"",0,1500,-1205,-316, 289}
		local point2 = {"",0,1500,-270,-364, 289}
		local point2 = {"",0,2000,-303,-1819, 433}
		Task_L_LoopAttackMonMore(0x63b52,4,0,3,point1,point2,point3)

		local point = {"",1,100,-282,-3376,433}
		Task_L_LongGetTo(0x63b52,5,10362,1,point)
	
		local point1 = {"",0,1500,-282,-3376,433}
		local point2 = {"",0,2000,-281,-4406,433}
		Task_L_LoopAttackMonMore(0x63b52,6,0,2,point1,point2)

		local point = {"",0,1500,64,-345,289}
		Task_L_LoopAttackMonMore(0x63b52,7,0,1,point)

		local point = {"",0,300,322,-298,289}	
		Task_L_Collection(0x63b52,8,point)

		local point1 = {"",0,1000,1235,-285,57}
		local point2 = {"",0,2000,2658,-337,-207}
		Task_L_LoopAttackMonMore(0x63b52,9,0,2,point1,point2)

		local point = {"",1,100,2540,-3260,-327}
		Task_L_LongGetTo(0x63b52,10,10362,1,point)

		local point = {"",0,2000,2592,-4796,-327}
		Task_L_LoopAttackMonMore(0x63b52,11,0,1,point)

		local point = {"",0,300,2796,-3807,-327}	
		Task_L_Collection(0x63b52,12,point)

		local point1 = {"",2,100,-242,1529,433}
		local point2 = {"",1,100,-278,2607,433}
		Task_L_LongGetTo(0x63b52,13,10362,2,point1,point2)

		local point1 = {"",0,2000,-278,2607,433}
		local point2 = {"",0,2000,-216,4491,433}
		Task_L_LoopAttackMonMore(0x63b52,14,0,2,point1,point2)

		local point1 = {"",2,100,-52,5536,561}
		local point2 = {"",1,100,296,5533,561}
		Task_L_LongGetTo(0x63b52,15,10362,2,point1,point2)

		local point = {"",0,1000,882,5689,561}
		Task_L_LoopAttackMonMore(0x63b52,16,0,1,point)

		if Fun_IsHaveTask(0x63b52,17) == 1 then
			local point = {"",0,1000,882,5689,561}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",1,100,2211,5495,821}
				Task_L_LongGetTo(0x63b52,17,10362,1,point)
			end

			local point = {"",1,100,2211,5495,821}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",0,1000,2211,5495,821}
				if Task_L_AttackPoint(0x63b52,17,point) then
					local point = {"",1,100,3320,5551,1077}
					Task_L_LongGetTo(0x63b52,17,10362,1,point)
				end
			end
		end

		local point = {"",17,3000,3343,5523,1077}
		Task_L_LoopAttackMonMore(0x63b52,18,0,1,point)

		local AllTaskId = {0x63b52,0x00}
		local point = {"",0,100,3343,5523,1077}
		Task_L_CheckTaskOver(10362,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--休沙瑞 第5张图的副本
	if Fun_IsInMapByMapId(10361) then
		Task_L_SetMapId(10361,5)

		local point = {"",1,100,2085,4048,-950}
		Task_L_TalkToNpc(0x63f39,1,point,"Geerbos",0,1,2)

		local point1 = {"",1,300,2188,4385,-950}	
		local point2 = {"",0,1000,2551,5384,-950}		
		local point3 = {"",0,600,3298,5328,-765}
		local point4 = {"",0,1500,3452,4101,-505}
		local point5 = {"",0,1000,4473,4102,-505}	
		local point6 = {"",0,600,5256,4122,-505}
		local point7 = {"",0,1500,3452,4101,-505}		
		Task_L_LoopAttackMonMore(0x63f39,2,0,7,point1,point2,point3,point4,point5,point6,point7)
		

		local point = {"",2,100,5310,3950,-505}
		if Task_L_LongGetTo(0x63f39,3,10361,1,point) then
			local point1 = {"",0,1200,6375,4086,-505}	
			local point2 = {"",0,1500,7861,4114,-505}		
			local point3 = {"",0,600,7983,5271,-247}	
			Task_L_LoopAttackMonMore(0x63f39,3,0,3,point1,point2,point3)
		end

		local point = {"",1,100,7983,5271,-247}
		Task_L_LongGetTo(0x63f39,4,10361,1,point)

		local point = {"",0,1500,9591,5333,5}	
		Task_L_LoopAttackMonMore(0x63f39,5,0,1,point)

		local point = {"",1,500,10183,5331,32}
		Task_L_TalkToNpc(0x63f39,6,point,"Graymoon Huson",0,1,1)

		local point1 = {"",0,800,12030,3033,9}	
		local point2 = {"",1,300,12393,3038,3}		
		local point3 = {"",0,600,15188,4473,6}	
		Task_L_LoopAttackMonMore(0x63f39,7,0,3,point1,point2,point3)

		local point = {"",0,800,15106,9728,-16}	
		Task_L_LoopAttackMonMore(0x63f39,8,0,1,point)

		local point = {"",0,800,15104,11914,-16}	
		Task_L_LoopAttackMonMore(0x63f39,9,0,1,point)

		local point = {"",1,2000,15003,16587,-15}	
		Task_L_AttackByName(0x63f39 ,10,point,"Plague Demon Priest",0)

		local point = {"",0,300,15335,17626,9}	
		Task_L_Collection(0x63f39,11,point)

		local point1 = {"",0,600,18020,19295,453}	
		local point2 = {"",1,300,18057,20100,453}		
		local point3 = {"",0,500,18227,20572,453}
		Task_L_LoopAttackMonMore(0x63f39,12,0,3,point1,point2,point3)

		local point = {"",1,100,21012,22198,1029}
		Task_L_LongGetTo(0x63f39,13,10361,1,point)

		local point1 = {"",0,1500,23598,22288,532}	
		local point2 = {"",0,1500,25038,22362,534}		
		local point3 = {"",0,1500,24996,21368,649}
		local point4 = {"",0,1500,26352,21640,897}	
		local point5 = {"",0,1500,26491,24126,901}
		Task_L_LoopAttackMonMore(0x63f39,14,0,5,point1,point2,point3,point4,point5) 

		local point = {"",1,100,26540,26851,1259}
		Task_L_LongGetTo(0x63f39,15,10361,1,point)

		local point = {"",17,3000,26606,27432,1263}	
		Task_L_LoopAttackMonMore(0x63f39,16,0,1,point)

		local point = {"",1,100,26599,27286,1263}
		Task_L_TalkToNpc(0x63f39,17,point,"Sian",0,1,1)

		local AllTaskId = {0x63f39,0x00}
		local point = {"",0,100,26615,27523,1263}	
		Task_L_CheckTaskOver(10361,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--休沙瑞 第6张图的副本
	if Fun_IsInMapByMapId(10363) then
		Task_L_SetMapId(10363,5)

		local point = {"",0,1500,-6348,-9858,522}	
		Task_L_LoopAttackMonMore(0x64322,1,0,1,point)

		local point1 = {"",1,500,-6582,-9593,522}
		local point2 = {"",0,500,-6396,-4502,258}
		local point3 = {"",0,500,-6431,-3933,258}	
		Task_L_LoopAttackMonMore(0x64322,2,0,3,point1,point2,point3)

		local point = {"",0,500,-6431,-3933,258}	
		Task_L_Collection(0x64322,3,point)

		local point1 = {"",1,500,-6062,-6479,527}
		local point2 = {"",0,800,-3545,-8191,527}
		local point3 = {"",1,500,-3545,-8191,527}
		local point4 = {"",0,500,-697,-8093,268}	
		local point5 = {"",0,500,-231,-8093,268}
		Task_L_LoopAttackMonMore(0x64322,4,0,5,point1,point2,point3,point4,point5)

		local point = {"",0,500,-697,-8093,268}	
		Task_L_LoopAttackMonMore(0x64322,5,0,1,point)

		local point = {"",0,500,-604,-7717,268}	
		Task_L_Collection(0x64322,6,point)

		local point1 = {"",0,100,-697,-8093,268}	
		local point2 = {"",1,100,-521,-7596,268}
		Task_L_LongGetTo(0x64322,7,10363,2,point1,point2)

		local point1 = {"",1,500,1942,-922,553}
		local point2 = {"",0,1200,1032,-368,556}
		local point3 = {"",0,1200,289,-361,556}
		local point4 = {"",1,500,-51,-780,556}	
		local point5 = {"",1,500,-1633,-794,553}
		Task_L_LoopAttackMonMore(0x64322,8,0,5,point1,point2,point3,point4,point5)

		local point1 = {"",1,500,-1633,-794,553}
		local point2 = {"",0,1500,-2502,-532,563}
		local point3 = {"",0,1500,-2465,631,548}
		Task_L_LoopAttackMonMore(0x64322,9,0,3,point1,point2,point3)
	
		local point = {"",0,500,-2462,1473,548}	
		Task_L_Collection(0x64322,10,point)
	
		local point1 = {"",0,100,-2441,1291,548}	
		local point2 = {"",1,100,-2416,1600,548}
		Task_L_LongGetTo(0x64322,11,10363,2,point1,point2)
		
		local point = {"",1,100,-524,5258,189}
		Task_L_LongGetTo(0x64322,12,10363,2,point)

		local point = {"",0,2000,-126,5151,189}	
		Task_L_LoopAttackMonMore(0x64322,13,0,1,point)

		local point1 = {"",1,300,801,5103,189}
		local point2 = {"",0,1500,2918,6148,718}
		local point3 = {"",0,500,2760,5222,718}
		local point4 = {"",0,2000,2918,6148,718}
		Task_L_LoopAttackMonMore(0x64322,14,0,4,point1,point2,point3,point4)

		local point = {"",1,100,6500,6500,1462}
		Task_L_LongGetTo(0x64322,15,10363,2,point)

		local point = {"",17,3000,6500,6500,1462}	
    	Task_L_AttackByName(0x64322,16,point,"Plague Legion Commander Akkan",1)   

		local point = {"",1,100,7421,6177,1462}
		Task_L_LongGetTo(0x64322,17,10363,2,point)

		local point = {"",1,100,7142,6259,1462}
		Task_L_TalkToNpc(0x64322,18,point,"Madnick",0,1,1)

		local point = {"",1,100,7142,6259,1462}
		Task_L_TalkToNpc(0x64322,19,point,"Sian",0,1,1)

		local AllTaskId = {0x64322,0x00}
		local point = {"",0,100,7292,6270,1462}
		Task_L_CheckTaskOver(10363,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--罗亨达尔第5张地图的副本
	if Fun_IsInMapByMapId(10161) then
		Task_L_SetMapId(10161,5)
		local point = {"",1,100,9604,5410,418}
		Task_L_AutoGetTo(0x1ab59,1,10161,point,0,0)	

		local point = {"",0,1500,9571,6252,492}	
		Task_L_LoopAttackMonMore(0x1ab59,2,0,1,point)

		local point1 = {"",1,300,8367,6477,561}	
		local point2 = {"",0,300,7071,6473,577}		
		local point3 = {"",0,300,5273,8173,588}			
		Task_L_LoopAttackMonMore(0x1ab59,3,0,3,point1,point2,point3)

		local point = {"",0,2000,5451,10122,582}	
		Task_L_LoopAttackMonMore(0x1ab59,4,0,1,point)

		local point1 = {"",1,300,4207,9949,582}	
		local point2 = {"",0,2000,2495,10056,587}			
		Task_L_LoopAttackMonMore(0x1ab59,5,0,2,point1,point2)

		local point1 = {"",1,300,1347,9978,588}	
		local point2 = {"",0,3000,38,10090,681}			
		Task_L_LoopAttackMonMore(0x1ab59,6,0,2,point1,point2)

		local point1 = {"",1,300,2324,10785,582}	
		local point2 = {"",1,300,2354,10977,578}	
		local point3 = {"",2,100,2335,11177,584}	
		local point4 = {"",0,300,2316,11862,585}	
		Task_L_LoopAttackMonMore(0x1ab59,7,0,4,point1,point2,point3,point4)

		local point1 = {"",1,300,2404,12632,591}	
		local point2 = {"",2,100,2533,12781,589}	
		local point3 = {"",1,300,4182,12827,591}	
		local point4 = {"",1,500,5041,12748,896}
		local point5 = {"",1,500,5466,13323,922}
		local point6 = {"",0,300,6271,13437,913}	
		Task_L_LoopAttackMonMore(0x1ab59,8,0,6,point1,point2,point3,point4,point5,point6)

		local point1 = {"",2,100,7004,13950,901}
		local point2 = {"",1,100,6968,16712,904}
		Task_L_LongGetTo(0x1ab59,9,10161,2,point1,point2)
		
		local point1 = {"",2,100,7548,16653,902}
		local point2 = {"",1,100,9194,16658,633}
		if Task_L_LongGetTo(0x1ab59,10,10161,2,point1,point2) then
			local point = {"",0,2500,9194,16658,633}	
			Task_L_LoopAttackMonMore(0x1ab59,10,0,1,point)
		end
		
		local point = {"",1,100,9676,16555,642}
		Task_L_TalkToNpc(0x1ab59,11,point,"Azena",0,1,1)

		local point1 = {"",1,300,9605,17460,625}	
		local point2 = {"",0,100,9576,17991,652}			
		Task_L_LoopAttackMonMore(0x1ab59,12,0,2,point1,point2)

		local point = {"",1,100,9644,13177,621}
		Task_L_AutoGetTo(0x1ab59,13,10161,point,0,0)
		
		local point = {"",1,100,9571,10330,26}
		Task_L_AutoGetTo(0x1ab59,14,10161,point,0,0)
		
		local point1 = {"",1,300,12793,10095,609}	
		local point2 = {"",1,300,13614,9949,620}			
		Task_L_LoopAttackMonMore(0x1ab59,15,0,2,point1,point2)

		local point1 = {"",1,500,12772,10110,609}	
		local point2 = {"",1,500,13371,10141,609}	
		local point3 = {"",0,2000,14690,9968,840}			
		Task_L_LoopAttackMonMore(0x1ab5a,1,0,3,point1,point2,point3)

		local point1 = {"",1,300,15354,12029,1166}	
		local point2 = {"",0,2000,15385,12676,1207}			
		Task_L_LoopAttackMonMore(0x1ab5a,2,0,2,point1,point2)

		local point1 = {"",0,600,15414,13164,1202}	
		local point2 = {"",0,2000,15414,13164,1202}			
		Task_L_LoopAttackMonMore(0x1ab5a,3,0,2,point1,point2)

		local point1 = {"",1,300,14691,13326,1203}	
		local point2 = {"",1,300,14432,13274,1203}	
		local point3 = {"",2,100,13256,13037,1211}
		local point4 = {"",2,100,13164,12592,1213}	
		local point5 = {"",0,1500,12499,11473,1187}	
		local point6 = {"",2,100,12473,10509,1193}		
		local point7 = {"",0,1500,12519,8787,1187}	
		local point8 = {"",0,1500,12484,8316,1187}		
		Task_L_LoopAttackMonMore(0x1ab5a,4,0,8,point1,point2,point3,point4,point5,point6,point7,point8)

		local point1 = {"",2,100,12491,8126,1193}
		local point2 = {"",2,100,12586,7670,1197}
		local point3 = {"",1,100,13937,7681,1325}
		if Task_L_LongGetTo(0x1ab5a,5,10161,3,point1,point2,point3) then
			local point1 = {"",0,1500,13937,7681,1325}
			local point2 = {"",0,1500,15795,7657,1476}
			local point3 = {"",0,1500,16238,7666,1554}
			local point4 = {"",0,1500,17392,7674,1546}
			local point5 = {"",1,300,17829,7841,1553}			
			Task_L_LoopAttackMonMore(0x1ab5a,5,0,5,point1,point2,point3,point4,point5)
		end

		local point1 = {"",1,300,17829,7841,1553}	
		local point2 = {"",0,100,17583,9657,1560}			
		Task_L_LoopAttackMonMore(0x1ab5a,6,0,2,point1,point2)
		
		local point = {"",1,1500,17583,9657,1560}
		Task_L_AttackByName(0x1ab5a,7,point,"Ephernia",1)
		
		local AllTaskId = {0x1ab59,0x1ab5a,0x00}
		local point = {"",0,100,17443,9542,1563}
		Task_L_CheckTaskOver(10161,AllTaskId,point)
	end
	---------------------------------------------------------------------------
	--罗亨达尔第6张地图的副本 有3个地图
	if Fun_IsInMapByMapId(10191) then
		
		Task_L_SetMapId(10191,5)
		local point1 = {"",0,100,-10578,-21931,1338}
		local point2 = {"",0,100,-10052,-21916,1340}
		Task_L_LoopCollectMore(0x1af44,1,0,2,point1,point2)
		

		local point1 = {"",2,100,-5366,-17103,1503}
		local point2 = {"",0,2000,-5453,-15359,1346}
		if Task_L_LongGetTo(0x1af44,2,10191,2,point1,point2) then
			local point = {"",0,2000,-5453,-15359,1346}
			Task_L_LoopAttackMonMore(0x1af44,2,0,1,point)
		end

		local point1 = {"",2,100,-5405,-14230,1263}
		local point2 = {"",2,100,-5458,-13651,1009}
		local point3 = {"",1,100,-5492,-13001,1012}
		if Task_L_LongGetTo(0x1af44,3,10191,3,point1,point2,point3) then
			local point1 = {"",0,2000,-5492,-13001,1012}
			local point2 = {"",0,2000,-5320,-12027,975}
			local point3 = {"",2,100,-5073,-11647,913}
			local point4 = {"",2,100,-5214,-11043,680}
			local point5 = {"",0,2000,-4881,-9207,728}
			local point6 = {"",0,2000,-5315,-8431,685}
			Task_L_LoopAttackMonMore(0x1af44,3,0,6,point1,point2,point3,point4,point5,point6)
		end

		local point = {"",0,2000,-5289,-8214,688}
		Task_L_AttackPoint(0x1af44,4,point)

		local point1 = {"",2,100,-5342,-7682,683}
		local point2 = {"",2,100,-5443,-7135,935}
		local point3 = {"",1,100,-5153,-6332,933}
		Task_L_LongGetTo(0x1af44,4,10191,3,point1,point2,point3)

		local point = {"",0,2000,-4175,-5413,1049}
		Task_L_LoopAttackMonMore(0x1af44,5,0,1,point)

		local point = {"",0,500,-1235,-2298,1217}
		Task_L_Collection(0x1af44,6,point) 
		--下棋
		local point1 = {"",1,200,-124,-1967,1316}	
		local point2 = {"",1,100,-381,-1365,1331}		
		Task_L_CarryItem(0x1af44,7,0,point1,point2)
		
		if Fun_IsHaveTask(0x1af44,8) == 1 then
			Fun_Sleep(5000)
		end  

		local point1 = {"",4,10,109,-103,1316}
		local point2 = {"",1,100,2951,-108436,2851}
		if Task_L_LongGetTo(0x1af44,8,10191,2,point1,point2) then
			local point = {"",0,800,2980,-108186,2851}
			if Fun_IsInPoint(point) == 1 then
				local point = {"",0,800,2980,-108186,2851}
				Task_L_AttackPoint(0x1af44,8,point)
			end

			local point1 = {"",2,100,2933,-108227,2851}
			local point2 = {"",0,100,2813,-102863,3240}
			local point3 = {"",0,100,3624,-102860,3236}
			Task_L_LongGetTo(0x1af44,8,10191,3,point1,point2,point3)
		end

		local point = {"",0,1000,3624,-102860,3236}
		if Fun_IsInPoint(point) == 1 then
			local point = {"",0,600,4189,-103011,3230}
			Task_L_AttackPoint(0x1af44,9,point)
		end

		local point1 = {"",2,100,4395,-103005,3230}
		local point2 = {"",2,100,6766,-103309,3507}
		local point3 = {"",0,100,7127,-103335,3507}
		Task_L_LongGetTo(0x1af44,9,10191,3,point1,point2,point3)

		local point1 = {"",0,600,4189,-103011,3230}
		local point2 = {"",2,100,4395,-103005,3230}
		local point3 = {"",2,100,6766,-103309,3507}
		local point4 = {"",0,100,7127,-103335,3507}
		--Task_L_LoopAttackMonMore(0x1af44,9,0,4,point1,point2,point3,point4)	

		local point = {"",1,1500,7578,-103494,3513}
		Task_L_AttackByName(0x1af44,10,point,"Phantom Legion Rook",0)
		
		local point1 = {"",1,100,9270,-103286,3602}
		local point2 = {"",1,100,-727,-1251,1316}
		Task_L_LongGetTo(0x1af44,11,10191,2,point1,point2) 
			
		if Fun_IsHaveTask(0x1af44,12) == 1 then
			Fun_Sleep(5000)
		end  
		
		--下棋
		local point1 = {"",1,200,801,-861,1316}	
		local point2 = {"",1,100,232,-1415,1331}		
		Task_L_CarryItem(0x1af44,12,0,point1,point2)

		if Fun_IsHaveTask(0x1af44,13) == 1 then
			Fun_Sleep(5000)
		end  

		local point1 = {"",4,10,1074,-1103,1316}
		local point2 = {"",1,100,40557,-102357,1109}
		if Task_L_LongGetTo(0x1af44,13,10191,2,point1,point2) then
			local point = {"",0,2000,40557,-102357,1109}
			Task_L_LoopAttackMonMore(0x1af44,13,0,1,point)
		end

		local point1 = {"",2,100,41655,-102342,1109}
		local point2 = {"",1,100,43818,-102387,1480}
		local point3 = {"",1,100,48544,-102358,2000}
		Task_L_LongGetTo(0x1af44,14,10191,3,point1,point2,point3)
		
		local point = {"",1,1500,49201,-102461,2000}
		Task_L_AttackByName(0x1af44,15,point,"Phantom Legion Knight",0)

		local point1 = {"",1,100,51754,-102358,2268}
		local point2 = {"",1,100,-1,-1911,1316}
		Task_L_LongGetTo(0x1af44,16,10191,2,point1,point2)

		if Fun_IsHaveTask(0x1af44,17) == 1 then
			Fun_Sleep(5000)
		end  

		--下棋
		local point1 = {"",1,200,-808,-1333,1316}	
		local point2 = {"",1,100,-44,-1038,1331}		
		local point3 = {"",1,200,-808,-1333,1316}	
		local point4 = {"",1,100,-201,-1242,1331}
		local point5 = {"",1,200,-808,-1333,1316}	
		local point6 = {"",1,100,-364,-729,1331}	
		Task_L_LoopChess(0x1af44,17,0,6,point1,point2,point3,point4,point5,point6)
		--下棋
		local point1 = {"",1,200,359,-342,1316}	
		local point2 = {"",1,100,-611,-972,1331}		
		local point3 = {"",1,200,359,-342,1316}		
		local point4 = {"",1,100,-75,-1768,1331}
		local point5 = {"",1,200,359,-342,1316}		
		local point6 = {"",1,100,-419,-1107,1331}	
		Task_L_LoopChess(0x1af44,17,1,6,point1,point2,point3,point4,point5,point6)


		if Fun_IsHaveTask(0x1af44,18) == 1 then
			Fun_Sleep(5000)
		end 

		local point1 = {"",4,10,-391,851,1534}
		local point2 = {"",1,100,-15569,45534,1900}
		Task_L_LongGetTo(0x1af44,18,10191,2,point1,point2)
		
		local point = {"",0,1500,-15569,45534,1900}
		Task_L_LoopAttackMonMore(0x1af44,19,0,1,point)

		local point = {"",17,1500,-15569,45534,1900}
		Task_L_LoopAttackMonMore(0x1af44,20,0,1,point)

		local point1 = {"",1,100,-15530,48266,2226}
		local point2 = {"",1,100,432,-856,1331}
		Task_L_LongGetTo(0x1af44,21,10191,2,point1,point2)

		local point1 = {"",1,100,1594,402,1758}
		local point2 = {"",1,100,29689,36683,1728}
		Task_L_LongGetTo(0x1af44,22,10191,2,point1,point2)
		
		local point = {"",0,2000,29717,36657,1728}
		Task_L_LoopAttackMonMore(0x1af45,1,0,1,point)
		
		local point = {"",0,800,29717,36657,1728}
		if Fun_IsInPoint(point) == 1 then
			local point = {"",0,800,29717,36657,1728}
			Task_L_AttackPoint(0x1af45,2,point)
		end

		local point = {"",0,100,30963,37979,2138}
		Task_L_Collection(0x1af45,2,point)
		
		local point1 = {"",1,100,31796,42120,2917}--差一个坐标
		local point2 = {"",1,100,131183,-11615,1156}
		Task_L_LongGetTo(0x1af47,1,10191,2,point1,point2)

		local point = {"",0,2000,131164,-10775,1156}
		Task_L_LoopAttackMonMore(0x1af47,2,0,1,point)

		local point = {"",0,3000,-108350,106061,-1708}
		Task_L_LoopAttackMonMore(0x1af47,3,0,1,point)

		local point = {"",1,3000,-115887,102414,3884}
		Task_L_AttackByName(0x1af47,4,point,"Brelshaza",1)

		local point = {"",1,3000,-115850,102014,3884}
		Task_L_AttackByName(0x1af47,5,point,"Brelshaza",1)

		local point = {"",1,100,56222,-10682,1156}
		Task_L_TalkToNpc(0x1af47,6,point,"Azena",0,1,1) 

		local AllTaskId = {0x1af44,0x1af45,0x1af46,0x1af47,0x00}
		local point = {"",0,100,56106,-9101,1397}
		Task_L_CheckTaskOver(10191,AllTaskId,point)
	end
	---------------------------------------------------------------------------3
	--约拿  傲慢方舟
	if Fun_IsInMapByMapId(11352) then
		Task_L_SetMapId(11352,5)
		local point = {"",1,100,-2221,501,2673}
		Task_L_AutoGetTo(0x14a2d1,1,11352,point,0,0)  

		local point = {"",1,1000,62,-1603,2676}
		Task_L_LoopAttackMonMore(0x14a2d1,2,0,1,point)  
	
		local point1 = {"",1,300,342,-1536,2662}
		local point2 = {"",1,100,1054,-1601,2662}
		Task_L_LoopAttackMonMore(0x14a2d1,3,0,2,point1,point2)    
		
		local point1 = {"",2,100,968,-1835,2660}
		local point2 = {"",1,100,1536,-3087,1636}
		Task_L_LongGetTo(0x14a2d1,4,11352,2,point1,point2)

		local point = {"",0,800,1648,-3442,1636}
		Task_L_LoopAttackMonMore(0x14a2d1,5,0,1,point)  
		
		local point1 = {"",2,100,2371,-3798,1637}
		local point2 = {"",1,100,3170,-3170,1637}
		if Task_L_LongGetTo(0x14a2d1,6,11352,2,point1,point2) then
			local point = {"",0,600,3170,-3170,1637}
			Task_L_LoopAttackMonMore(0x14a2d1,6,0,1,point)  
		end

		local point1 = {"",1,300,3971,-2197,1648}
		local point2 = {"",1,300,3969,-2029,1648}
		Task_L_LoopAttackMonMore(0x14a2d1,7,0,2,point1,point2)    
		
		local point1 = {"",2,100,3968,-2014,1648}
		local point2 = {"",1,100,7200,1527,2942}
		Task_L_LongGetTo(0x14a2d2,1,11352,2,point1,point2)

		local point = {"",1,100,7146,1708,2944}
		Task_L_Collection(0x14a2d2 ,2,point)  
		
		local point = {"",0,800,7146,1708,2944}
		Task_L_LoopAttackMonMore(0x14a2d2,3,0,1,point)
		
		local point1 = {"",1,100,7368,-148,2807}
		local point2 = {"",1,100,7798,-153,2795}
		local point3 = {"",1,100,8257,-149,2806}
		Task_L_LongGetTo(0x14a2d2,4,11352,3,point1,point2,point3)

		local point = {"",1,800,11660,-602,2437}
		Task_L_AutoGetTo(0x14a2d2,5,11352,point,0,0)   

		local point = {"",0,800,11660,-602,2437}
		Task_L_LoopAttackMonMore(0x14a2d2,6,0,1,point)

		local point = {"",1,100,10124,371,2426}
		Task_L_Collection(0x14a2d2 ,7,point)  
		
		local point = {"",0,800,10156,2483,2427}
		Task_L_LoopAttackMonMore(0x14a2d2,8,0,1,point)
	
		local point = {"",0,800,7964,5930,2610}
		Task_L_LoopAttackMonMore(0x14a2d3,1,0,1,point)

		local point = {"",1,100,7172,5622,2604}
		Task_L_AutoGetTo(0x14a2d3,2,11352,point,0,0)

		local point1 = {"",2,100,7293,5691,1654}
		local point2 = {"",1,100,7633,6425,1910}
		if Task_L_LongGetTo(0x14a2d3,3,11352,2,point1,point2) then 
			local point1 = {"",1,500,7792,6689,1910}
			local point2 = {"",1,500,8001,7097,1917}
			local point3 = {"",1,500,8212,7429,1911} 
			local point4 = {"",1,100,7802,7871,1909}
			Task_L_LoopAttackMonMore(0x14a2d3,3,0,4,point1,point2,point3,point4)
		end

		local point1 = {"",2,100,7797,7893,1905}
		local point2 = {"",1,100,5019,8901,1894}
		if Task_L_LongGetTo(0x14a2d3,4,11352,2,point1,point2) then 
			local point = {"",0,800,4368,8952,1894}
			Task_L_LoopAttackMonMore(0x14a2d3,4,0,1,point)    
		end

		local point1 = {"",1,500,3965,8347,1895}
		local point2 = {"",0,100,3459,7603,2054}
		Task_L_LoopAttackMonMore(0x14a2d3,5,0,2,point1,point2)

		local point1 = {"",2,100,3450,7309,2100}
		local point2 = {"",1,100,3199,4082,818}
		if Task_L_LongGetTo(0x14a2d3,6,11352,2,point1,point2) then 
			local point = {"",0,800,3199,3961,821}
			Task_L_LoopAttackMonMore(0x14a2d3,6,0,1,point)    
		end

		local point = {"",1,100,4172,1921,1308}
		Task_L_AutoGetTo(0x14a2d3,7,11352,point,0,0)

		local point1 = {"",2,100,1414,1447,2076}
		local point2 = {"",2,100,2598,378,1561}
		local point3 = {"",2,100,3419,133,281}
		Task_L_LongGetTo(0x14a2d3,8,11352,3,point1,point2,point3) 
	
		local point1 = {"",0,800,4069,425,280}
		local point2 = {"",0,1000,5588,1301,283}
		Task_L_LoopAttackMonMore(0x14a2d3,9,0,2,point1,point2)
		
		local point1 = {"",1,100,5944,2093,281}
		local point2 = {"",2,100,6090,2261,281}
		local point3 = {"",1,100,6675,2777,26}
		if Task_L_LongGetTo(0x14a2d3,10,11352,3,point1,point2,point3) then
			local point = {"",0,1000,6948,3067,25}
			Task_L_LoopAttackMonMore(0x14a2d3,10,0,1,point)    
		end

		local point1 = {"",2,100,7425,3881,33}
		local point2 = {"",2,100,7340,4806,-232}
		local point3 = {"",2,100,6603,5122,-232}
		local point4 = {"",1,100,8968,9691,-479}
		Task_L_LongGetTo(0x14a2d3,11,11352,4,point1,point2,point3,point4)

		local point = {"",1,1500,9014,9843,-479}	
		Task_L_LoopAttackMonMore(0x14a2d3,12,0,1,point)    

		local point = {"",1,1500,-3613,22191,-474}	
		Task_L_AttackByName(0x14a2d3 ,13,point,"Белькруз",1)
		
		local AllTaskId = {0x14a2d1,0x14a2d2,0x14a2d3,0x00}
		local point = {"",1,100,9610,10432,-479}
		Task_L_CheckTaskOver(11352,AllTaskId,point)

	end
end
return AutoTaskThread