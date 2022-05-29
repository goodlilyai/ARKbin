

DelegateTask = {}
function DelegateTask(Type)
    MSG("Lei_: 委托任务开始!!!  0327")

    if Fun_L_GetDailyDelegateTaskCount() == 0 then
        --可以领取奖励
        Fun_L_ReceiveReward()
        if Fun_IsInMapByMapId(11102) then
            MSG("Lei_: 每日任务完成!!!")
            return 1
        end
    end

    if Fun_L_GetWeeklyDelegateTaskCount() > 0 then
        if Task_L_CompleteGlobalTask(0x47b762,-1) then
            --这个每周混沌打怪任务先不开放，如果每周生活职业两个完不成，那就可以把这个打开
            --Fun_L_WeeklyDelegateTask(0x47b761)
            Task_L_AcceptGlobalTask(0x47b761)
        end
    end

    if Fun_L_GetWeeklyDelegateTaskCount() > 0 then
        if Task_L_CompleteGlobalTask(0x47bf31,-1) then--这两个是钓鱼的周常
            Task_L_AcceptGlobalTask(0x47bf32)
            --Fun_L_WeeklyDelegateTask(0x47bf32)
        end
    end


    if Fun_L_GetWeeklyDelegateTaskCount() > 0 then
        Task_L_CompleteGlobalTask(0x47b761,-1)
    end
    if Fun_L_GetWeeklyDelegateTaskCount() > 0 then
        Task_L_CompleteGlobalTask(0x47bf32,-1)
    end

    if Task_L_FindTask(0x10dad9) == 0 then
        Task_L_AcceptGlobalTask(0x10dad9)
       --Fun_L_DailyDelegateTask(0x10dad9)--贝隆 任务
    end

    if Task_L_FindTask(0x3d1329) == 0 then
        Task_L_AcceptGlobalTask(0x3d1329)
        --Fun_L_DailyDelegateTask(0x3d1329)--海上任务
    end
    if Task_L_FindTask(0x4d9d89) == 0 then
        Task_L_AcceptGlobalTask(0x4d9d89)
        --Fun_L_DailyDelegateTask(0x4d9d89)--岛上任务
    end
    --[[
    if Task_L_FindTask(0xf4c6a) == 0 then
        Fun_L_DailyDelegateTask(0xf4c6a)--托托克岛 任务
    end

    if Task_L_FindTask(0xf4c69) == 0 then
        if Task_L_FindTask(0xf4c6a) == 0 then
            Fun_L_DailyDelegateTask(0xf4c69)--托托克岛 任务
        end
    end
    --]]

    if Fun_IsHaveTask(0x47b761,1) == 0 and Fun_IsHaveTask(0x47b762,1) == 0 then--混沌每周任务
        Task_L_AcceptGlobalTask(0x47b762)
        --Fun_L_WeeklyDelegateTask(0x47b762)
    end

    if Fun_IsHaveTask(0x47bf31,1) == 0 and Fun_IsHaveTask(0x47bf32,1) == 0 then--钓鱼每周任务
        Task_L_AcceptGlobalTask(0x47bf31)
        --Fun_L_WeeklyDelegateTask(0x47bf31)
    end

    if Fun_IsInMapByMapId(11102) then
        --[[
        local point = {"Portal Statue",0,100,13651,10569,4685}
        if Task_L_LongGetTo(0x10dad9,1,11102,1,point) then
            local point = {"Portal Statue",2,100,13651,10569,4685}
            if Task_L_SetBackHome(0x10dad9,1,point) then
                Task_L_UseTransmit(0x10dad9,1,"Fesnar Highland","Fesnar Highland")
            end
         end
         --]]
         Task_L_UseTransmit(0x10dad9,1,"Fesnar Highland","Fesnar Highland")
    end

    if Fun_IsInMapByMapId(11113) then--贝隆北 打怪任务
        if Task_L_GetTaskIsComplete(0x10dad9) then
            local point1 = {"",1,100,12862,24123,3978}
            local point2 = {"",1,100,12295,18338,3989}	
            local point3 = {"",1,100,15702,16132,3978}
            if Task_L_LongGetTo(0x10dad9,1,11113,3,point1,point2,point3) then
                local point = {"",1,100,13992,10263,3978}
                Task_L_CompleteTask(0x10dad9 ,1,point,"Guild Scribe Seraza",-1)
            end
        else
            local point = {"Horatio",1,100, 14379,10139,3978}
            Task_L_BuyItem(0x10dad9,1,100,7,"Super Healing Potion",point)

            --1.持久  2.背包空余
            Fun_SetBackHomeInfo(90,20,0,0)
            --修理
            if Fun_IsHaveTask(0x10dad9,1) == 1 then
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

            local point1 = {"",1,100,15702,16132,3978}
            local point2 = {"",1,100,12295,18338,3989}	
            local point3 = {"",1,100,13923,22307,3978}
            local point4 = {"",1,100,11930,24319,3978}	
            if Task_L_LongGetTo(0x10dad9,1,11113,4,point1,point2,point3,point4) then
    
                local point = {"",0,800,11081,21471,4499}	
                Task_L_LoopAttackMonMore(0x10dad9,1,0,1,point)
    
                local point1 = {"",0,1200,11496,24038,3978}	
                local point2 = {"",0,1200,10271,21768,4502}	
                Task_L_LoopAttackMonMore(0x10dad9,1,1,2,point1,point2)
            end
        end
        
        if Task_L_FindTask(0x10dad9) == 0 then
            Task_L_UseTransmit(0x3d1329,1,"Central Port","Central Port")
        end

        if Task_L_FindTask(0x10dad9) == 0 then
            if Task_L_FindTask(0x3d1329) == 0 then
                if Task_L_FindTask(0x4d9d89) == 0 then
                    Task_L_UseTransmit(0x44aa21,1,"Crafting District","Central Port")
                end
            end
        end
    end


    if Fun_IsInMapByMapId(11119) then--等待
        MSG("Lei_: 等待船。。。")
        Fun_Sleep(5000)
    end

    if Fun_IsInMapByMapId(10805) then--等待
        MSG("Lei_: 等待船。。。")
        Fun_Sleep(5000)
    end

  
    if Fun_IsInMapByMapId(11111) then--贝隆港口

        if Task_L_FindTask(0x10dad9) == 0 then
            local point = {"",1,100,14416,11306,-117}
            Task_L_LongGetTo(0x3d1329,1,11111,1,point)
        end

        Task_L_UseTransmit(0x10dad9,1,"Crafting District","Fesnar Highland")
        if Fun_L_GetDailyDelegateTaskCount() == 0 then
        else
            if Task_L_FindTask(0x10dad9) == 0 then
                if Task_L_FindTask(0x3d1329) == 0 then
                    if Task_L_FindTask(0x4d9d89) == 0 then
                        Task_L_UseTransmit(0x44aa21,1,"Crafting District","Central Port")
                    end
                end
            end
        end
    end

    if Fun_IsInMapByMapId(30703) then--航海

        if Fun_IsHaveTask(0x3d1329,1) == 1 then
            Fun_Sleep(10000)
            Task_H_LeavePort(0x3d1329,1) 
            local point = {"",2,100,3728,38252,1}
            Task_L_LongGetTo(0x3d1329,1,30703,1,point)--已修复
        end

        if Task_L_GetBranchCount(0x3d1329,2,0) == 0 then
            local point = {"",1,100,-17163,45491,1}
            if Task_L_LongGetTo(0x3d1329,2,30703,1,point) then
                local point = {"",2,100,-17163,45491,1}
                Task_H_GetInDockAndBackLand(0x3d1329,2,point) 
            end
        end

        if Task_L_GetBranchCount(0x3d1329,2,0) == 1 then
            if Task_L_GetBranchCount(0x3d1329,2,1) == 0 then
                Fun_Sleep(10000)
                Task_H_LeavePort(0x3d1329,2)

                local point = {"",2,100,-6105,3808,1}
                Task_L_LongGetTo(0x3d1329,2,30703,1,point)--已修复
            end
        end

        if Task_L_GetBranchCount(0x3d1329,2,0) == 1 then
            if Task_L_GetBranchCount(0x3d1329,2,1) == 1 then
                if Task_L_GetBranchCount(0x3d1329,2,2) == 0 then
                    local point = {"",2,100,7058,51884,1}
                    Task_L_LongGetTo(0x3d1329,2,30703,1,point)--已修复
                end
            end
        end

        if Task_L_FindTask(0x3d1329) == 0 then
            if Task_L_FindTask(0x4d9d89) == 0 then
                Fun_Sleep(5000)
                local point = {"",2,100,12779,16778,1}
                Task_H_GetInDockAndBackLand(0x44aa21,1,point) 
            end
        end
    end

    if Fun_IsInMapByMapId(50028) then
        local point = {"",1,100,3724,-7376,-163}
        Task_L_LongGetTo(0x3d1329,1,50028,1,point)

        local point = {"",2,100,3281,-7099,-163}
        Task_L_LongGetTo(0x3d1329,2,50028,1,point)
    end

    if Fun_IsInMapByMapId(50086) then
        if Task_L_GetBranchCount(0x3d1329,2,1) == 0 then
            local point = {"",1,100,3330,3155,149}
            Task_L_LongGetTo(0x3d1329,2,50086,1,point)
        end

        local point = {"",1,100,4670,5523,159}
        Task_L_Collection(0x4d9d89,1,point)

        local point1 = {"",0,100,5331,5315,163}
		local point2 = {"",0,100,4178,4902,157}
		local point3 = {"",0,100,4181,4393,157}
		local point4 = {"",0,100,4262,3626,150}
        local point5 = {"",0,100,4266,3248,142}
		local point6 = {"",0,100,4934,2837,148}
		local point7 = {"",0,100,5395,3285,142}
		local point8 = {"",0,100,7027,3750,62}
        local point8 = {"",0,100,7036,5075,46}
		Task_L_LoopCollectMore(0x4d9d89,2,0,9,point1,point2,point3,point4,point5,point6,point7,point8,point9)

        local point = {"",1,100,4440,5472,159}
        Task_L_CompleteTask(0x4d9d89 ,2,point,"Tired Part-Timer",-1)

        if Task_L_GetBranchCount(0x3d1329,2,1) == 1 then
            if Task_L_FindTask(0x4d9d89) == 0 then
                local point = {"",2,100,2423,2605,89}
                Task_L_LongGetTo(0x3d1329,2,50086,1,point)
            end
        end

        if  Fun_IsHaveTask(0x3d1329, 2) == 0 then
            if Task_L_FindTask(0x4d9d89) == 0 then
                local point = {"",2,100,2423,2605,89}
                Task_L_LongGetTo(0x3d1329,1,50086,1,point)

                local point = {"",2,100,2423,2605,89}
                Task_L_LongGetTo(0x44aa21,1,50086,1,point)
            end
        end
    end

    if Fun_IsInMapByMapId(50070) then

        if Task_L_GetBranchCount(0x3d1329,2,2) == 0 then
            local point = {"",1,100,9834,2764,-102}
            Task_L_LongGetTo(0x3d1329,2,50070,1,point)
        end

        Task_L_CompleteGlobalTask(0x3d1329,-1)

        if Task_L_FindTask(0x3d1329) == 0 then
            --Fun_L_UseBackHomeMusic("Song of Return",50070)
            local point = {"",2,100,10785,2048,-102}
            Task_L_LongGetTo(0x44aa21,1,50070,1,point)
        end

        local point = {"",2,100,10785,2048,-102}
        Task_L_LongGetTo(0x3d1329,1,50070,1,point)
    end


    if Fun_IsInMapByMapId(11011) then--托托克

        MSG("Lei 托托克")
        local point = {"",1,100,9471,2937,525}
        Task_L_LongGetTo(0x3d1329,1,11011,1,point)

        if Task_L_GetBranchCount(0x3d1329,2,0) == 0 then
            local point = {"",0,100,8715,5801,512}
            Task_L_LongGetTo(0x3d1329,2,11011,1,point)
        end

        if Task_L_GetBranchCount(0x3d1329,2,0) == 1 then
            if Task_L_GetTaskIsComplete(0xf4c6a) then
                local point = {"",1,100,18400,20749,1306}
                Task_L_CompleteTask(0xf4c6a ,1,point,"Chitoto",-1)
            else
                local point = {"",1,100,26685,18910,1049}
                if Task_L_UseTransmitPoint(0xf4c6a,1,"Ancient Grindstone Vestige",point) then
                    local point1 = {"",1,100,21748,22523,512}
                    local point2 = {"",1,100,17459,23398,1024}
                    local point3 = {"",1,100,16504,21290,1024}
                    if Task_L_LongGetTo(0xf4c6a,1,11011,3,point1,point2,point3) then
                        local point1 = {"",0,1000,16595,20790,1024}
                        local point2 = {"",0,1000,16986,20356,1031}
                        local point3 = {"",0,1000,16025,19597,1024}
                        local point4 = {"",0,1000,15781,20516,1024}
                        Task_L_LoopAttackMonMore(0xf4c6a,1,0,4,point1,point2,point3,point4)
                    end
                end
            end

            if Task_L_GetTaskIsComplete(0xf4c69) then
                local point = {"",1,100,18400,20749,1306}
                Task_L_CompleteTask(0xf4c69 ,1,point,"Chitoto",-1)
            else
                local point = {"",1,100,26685,18910,1049}
                if Task_L_UseTransmitPoint(0xf4c69,1,"Ancient Grindstone Vestige",point) then
                    local point1 = {"",1,100,21748,22523,512}
                    local point2 = {"",1,100,17459,23398,1024}
                    local point3 = {"",1,100,16504,21290,1024}
                    if Task_L_LongGetTo(0xf4c69,1,11011,3,point1,point2,point3) then
                        local point1 = {"",0,400,16595,20790,1024}
                        local point2 = {"",0,400,16986,20356,1031}
                        local point3 = {"",0,400,16025,19597,1024}
                        local point4 = {"",0,400,15781,20516,1024}
                        Task_L_LoopCollectMore(0xf4c69,1,0,4,point1,point2,point3,point4)
                    end
                end
            end

            
            if Task_L_FindTask(0xf4c69) == 0 then
                if Task_L_FindTask(0xf4c6a) == 0 then
                    local point = {"",1,100,8380,6591,542}
                    if Task_L_UseTransmitPoint(0x3d1329,2,"Oceanscent Seashore",point) then
                        local point = {"",1,100,9471,2937,525}
                        Task_L_AutoGetTo(0x3d1329,2,11011,point,0,0) 
                    end
                end
            end
        end
    end

    if Fun_L_GetDailyDelegateTaskCount() == 0 then
        --可以领取奖励
        Fun_L_ReceiveReward()
        MSG("Lei_: 每日任务完成!!!")
        return 1
    end

    return 0
end

return DelegateTask

