--¾«ÁéÖ®µØ

if Fun_IsInMapByMapId(10161) then
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
    Task_L_TalkToNpc(0x1ab59,11,point,"§¬§à§â§à§Ý§Ö§Ó§Ñ §¡§Ù§Ö§ß§Ñ",0,1,1)

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

    local point1 = {"",1,300,13614,9949,620}	
    local point2 = {"",0,2000,14690,9968,840}			
    Task_L_LoopAttackMonMore(0x1ab5a,1,0,2,point1,point2)

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
    Task_L_AttackByName(0x1ab5a,7,point,"§ª§æ§Ú§â§Ú§à§ß, §ï§Ü§Ù§Ñ§â§ç §à§Ô§ß§ñ",1)

    local AllTaskId = {0x1ab59,0x1ab5a,0x00}
    local point = {"",0,100,17443,9542,1563}
    Task_L_CheckTaskOver(10161,AllTaskId,point)
end