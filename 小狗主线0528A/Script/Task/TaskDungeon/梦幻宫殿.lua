--梦幻宫殿

if Fun_IsInMapByMapId(10191) then
	Task_L_SetFuHuo(0);
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
		local point2 = {"",2,100,-5073,-11647,913}
		local point3 = {"",2,100,-5214,-11043,680}
		local point4 = {"",0,2000,-4881,-9207,728}
		local point5 = {"",0,2000,-5315,-8431,685}
		Task_L_LoopAttackMonMore(0x1af44,3,0,5,point1,point2,point3,point4,point5)
	end

	local point = {"",0,1000,-5289,-8214,688}
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
		local point1 = {"",0,600,2933,-108227,2851}
		local point2 = {"",2,100,2933,-108227,2851}
		local point3 = {"",0,100,2813,-102863,3240}
		local point4 = {"",0,100,3624,-102860,3236}
		Task_L_LoopAttackMonMore(0x1af44,8,0,4,point1,point2,point3,point4)
	end

	local point1 = {"",0,600,4189,-103011,3230}
	local point2 = {"",2,100,4395,-103005,3230}
	local point3 = {"",2,100,6766,-103309,3507}
	local point4 = {"",0,100,7127,-103335,3507}
	Task_L_LoopAttackMonMore(0x1af44,9,0,4,point1,point2,point3,point4)	

	local point = {"",1,1500,7578,-103494,3513}
	Task_L_AttackByName(0x1af44,10,point,"Призрачная ладья",0)
	
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
	local point2 = {"",1,100,48544,-102358,2000}
	Task_L_LongGetTo(0x1af44,14,10191,2,point1,point2)
	
	local point = {"",1,1500,49201,-102461,2000}
	Task_L_AttackByName(0x1af44,15,point,"Черный конь",0)

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
	Task_L_AttackPoint(0x1af45,2,point)

	local point = {"",0,100,30963,37979,2138}
	Task_L_Collection(0x1af45,2,point)
	
	local point1 = {"",1,100,31796,42120,2917}--差一个坐标
	local point2 = {"",1,100,131183,-11615,1156}
	Task_L_LongGetTo(0x1af47,1,10191,2,point1,point2)

	local point = {"",0,2000,131164,-10775,1156}
	Task_L_LoopAttackMonMore(0x1af47,2,0,1,point)

	local point = {"",0,2000,-108350,106061,-1708}
	Task_L_LoopAttackMonMore(0x1af47,3,0,1,point)

	local point = {"",1,1500,-115887,102414,3884}
	Task_L_AttackByName(0x1af47,4,point,"Аврельсуд",1)

	local point = {"",1,1500,-115850,102014,3884}
	Task_L_AttackByName(0x1af47,5,point,"Аврельсуд",1)

	local point = {"",1,100,56222,-10682,1156}
	Task_L_TalkToNpc(0x1af47,6,point,"Королева Азена",0,1,1) 

	local AllTaskId = {0x1af44,0x1af45,0x1af46,0x1af47,0x00}
	local point = {"",0,100,56106,-9101,1397}
    Task_L_CheckTaskOver(10191,AllTaskId,point)
end