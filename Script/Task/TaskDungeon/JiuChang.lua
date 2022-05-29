--10182.0,9060.0,1147.6
--11351   MapID
JiuChang = {}

function JiuChang.Fb()
	package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
	local fun = require("Script.LYFun")
	
	if Fun_IsInMapByMapId(11351) then
		Task_Goto(0x149ee9 ,1,886.0,3679.0,108.2,0) 
		Task_TalkNpc(0x149ee9 ,2,851.0,3664.0,108.2,"孚技快抖快志忘把 妒志忘把")  --ID:6c2c9424  
		Task_Collection(0x149ee9 ,3,301.0,3814.0,108.2)
		Task_Attack(0x149ee9 ,4,2922.0,4888.0,365.4,	0) 
		Task_Goto2(0x149ee9 ,5,4883.0,3966.0,267.0,5448.0,4058.0,338.4,0) 
		Task_Attack(0x149ee9 ,6,5930.0,3994.0,394.0, 0) 
		Task_Goto2(0x149ee9 ,7,5988.0,2329.0,386.3,6507.0,2068.0,-516.0,1)  -- 要?? 
		Task_Attack(0x149ee9, 8,8595.0,2112.0,-402 ,1)   
	
		Task_Attack(0x149eea ,1,8706.0,4562.0,-402.7,	0)  
	
		local saveArr = {"妤抖快扶扶抑抄 抒技快抖快志忘把","妙忘抖抑扮 坐批找找快把","妤抖快扶扶抑抄 抒技快抖快志忘把"}
		Task_SaveNpc(0x149eea ,2,8662.0,3952.0,-385.5,saveArr) 
		Task_Goto(0x149eea ,3,10166.0,5169.0,-297.6,	1) 
		Task_Attack(0x149eea ,4,11249.0,4893.0,1225.5,	1)  
		Task_GotoAttack(0x149eea ,5,11535.0,1793.0,1233.9,14376.0,1399.0,1228.8,	1)  -- ?里要看一下
		--6  
		Task_Attack_ladder(0x149eea ,6,14211.0,1494.0,1246.5,	13904.0,2303.0,712.5,0)
		Task_Attack_ladder(0x149eea ,7,13972.0,2807.0,719.0,	14054.0,3890.0,727.1,1)
		--13972.0,2807.0,719.0
		Task_Goto(0x149eea ,8,13999.0,6168.0,712.1,0) 
		Task_GotoAttack(0x149eeb ,1,13677,7096,712,13126.0,8492.0,709.4,	1)  -- ?里要看一下
		Task_Attack(0x149eeb ,2,12497.3,8876.8,674.2,	0)   -- ?里看一下 
		--Task_Attack_ladder(0x149eeb ,3,12403.0,9650.0,663.0,	12075.0,11533.0,1147.6,1)
		Task_Attack_ladder(0x149eeb ,3,12403.0,9650.0,663.0,	12045.0,11508.0,1147.6,0)
		--Task_Attack(0x149eeb ,4,10757.0,11063.0,1147.6,	0) 
		Task_Attack(0x149eeb ,4,10810.0,11324.0,1147.6,	0) 
		--Task_Attack_ladder(0x149eeb ,5,9092.0,9002.0,1147.6,9081.0,9580.0,1647.9,	1)  --?里要跑10193.0,8977.0,1147.6 
		Task_Attack_ladder2(0x149eeb ,5,10193.0,8977.0,1147.6,9092.0,9002.0,1147.6,9081.0,9580.0,1647.9,	1)
		Task_Attack(0x149eeb ,6,8888.1,9941.8,1647.9,	0) 
		Task_Goto(0x149eeb ,7,6386.5,9035.1,1601.1,	0) 
		Task_Attack(0x149eec ,1,4182.0,20844.8,-654.6,	0) 
		Task_Attack(0x149eec ,2,3991.0,21935.0,-650.0,	0) 
		Task_Attack_ladder(0x149eec ,3,4657.0,22183.0,-650.0, 5100.0,22218.0,376.0,	1) 
		Task_Attack(0x149eec ,4,7026.7,18783.1,496.5,	0) 
		Task_Goto(0x149eec ,5,12932.4,18858.9,661.0,	0) 
		Task_AttackBoss(0x149eec ,6,14251.6,18779.7,669.6, "妞快抄抖忘把忘")   --???????

		local AllTaskId ={0x149ee9,0x149eea,0x149eeb,0x149eec,0x00}
		local point = {"",1,100,14377,18569,660}
		if Task_L_CheckTaskOver(11351,AllTaskId,point) then 
			return 1		
		end
	end
	return 0
end

return JiuChang