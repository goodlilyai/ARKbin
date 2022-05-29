--package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
--local fun = require("Script.LYFun");
--local FBMapId = 11052
--02b2c
--托托克之心
ToToHeart = {}

function ToToHeart.FB(IsMatch)

    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
    local FBMapId = 11052
    if Fun_IsInMapByMapId(FBMapId) then
        local attackPt = { "", 0, 300, 3698, 3937, 512 }
        local nextPt = { "", 0, 50, 3696, 4012, 512 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 3696, 4012, 512 }
        local nextPt = { "", 0, 50, 3799, 5887, 512 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 3799, 5887, 512 }
        local nextPt = { "", 0, 50, 3672, 7470, 512 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "开机关", 0, 700, 3672, 7470, 512 }
        local ladderpt = { "", 0, 300, 3763, 7749, 512 }
        local nextPt = { "", 0, 300, 3932, 10025, 504 }
        fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

        if Fun_IsHaveTask(1007401, 3) == 1 then
            local attackPt = { "采树", 0, 700, 3932, 10025, 504 }
            if Fun_AttackMonByRange(attackPt) == 2 then
                local attackPt = { "", 0, 200, 3932, 10025, 504 }
                if Fun_IsFindDoor(attackPt) == 1 then
                    MSG("LYLUa 找到了门移动去开门")
                    Fun_GotoOpenDoor(attackPt)
                end
            end
        end

        if Fun_IsHaveTask(1007401, 4) == 1 then
            local attackPt = { "", 0, 200, 3311, 8561, 513 }
            Fun_EnforceFindWay(attackPt)
        end

        Task_Collection(1007401, 5,3375, 8643, 513)

        if Fun_IsHaveTask(1007401, 6) == 1 then
            local attackPt = { "", 0, 400, 3375, 8643, 513 }
            local ladderpt = { "", 0, 100, 3213, 8815, 511 }
            local nextPt = { "", 0, 200, 2958, 8766, 5 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end


        local point1 = {"",0,800,1368,9410,-275}
		local point2 = {"",0,800,874,8501,-297}
		local point3 = {"",0,800,395,7138,-475}
		Task_L_LoopAttackMonMore(1007401,7,0,3,point1,point2,point3)

        local point1 = {"",2,100,-75, 7211, -449 }
		local point2 = {"",0,100,-2389,8257,-1250}
        Task_L_LongGetTo(1007401,8,11052,2,point1,point2)

        local point1 = {"",0,800,-2134,8228,-1250}
		local point2 = {"",0,800,-2650,6917,-1286}
        local point3 = {"",0,800,-2023,5005,-1185}
		local point4 = {"",0,800,-2016,3866,-1249}
		Task_L_LoopAttackMonMore(1007401,9,0,4,point1,point2,point3,point4)

        local point1 = {"",2,100,-1676, 3210, -1249 }
		local point2 = {"",0,100,-1009, 2545, -1554}
        Task_L_LongGetTo(1007401,10,11052,2,point1,point2)

        local point1 = {"",0,800,-846,2341,-1553}
		local point2 = {"",0,800,644,1325,-1622}
        local point3 = {"",0,1000,1729,438,-1740}
		Task_L_LoopAttackMonMore(1007401,11,0,3,point1,point2,point3)

        local point1 = {"",2,100,2261, 260, -1739 }
		local point2 = {"",0,100,5253, 501, -2048 }
        Task_L_LongGetTo(1007401,12,11052,2,point1,point2)

        local attackPt = { "", 0, 2000, 5253, 501, -2048 }
        local nextPt = { "", 0, 50, 5561, 1119, -2048 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        if Fun_IsHaveTask(1007401, 14) == 1 then
            local attackPt = { "", 0, 200, 5561, 1119, -2048 }
            if Fun_IsFindDoor(attackPt) == 1 then
                MSG("LYLUa 找到了门移动去开门")
                Fun_GotoOpenDoor(attackPt)
            end
        end


        if Fun_IsHaveTask(1007401, 15) == 1 then
            local attackPt = { "", 0, 200, 9735, -283, -2048 }
            Fun_EnforceFindWay(attackPt)
        end

        local attackPt = { "", 0, 1000, 9735, -283, -2048 }
        local nextPt = { "", 0, 50, 11248, 5799, -2048 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 1000, 11248, 5799, -2048 }
        local ladderpt = { "", 0, 100, 11462, 6107, -2040 }
        local nextPt = { "", 0, 200, 11576, 6324, -1817 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 11576, 6324, -1817 }
        local nextPt = { "", 0, 50, 12075, 6937, -1800 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 12075, 6937, -1800 }
        local ladderpt = { "", 0, 100, 12253, 7355, -1800 }
        local nextPt = { "", 0, 150, 12270, 7750, -1820 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 100, 12270, 7750, -1820 }
        local nextPt = { "", 0, 50, 12064, 8121, -1792 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 12064, 8121, -1792 }
        local ladderpt = { "", 0, 100, 11942, 8254, -1784 }
        local nextPt = { "", 0, 150, 11714, 8494, -1791 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 100, 11511, 8718, -1791 }
        Task_L_UseMusic(1007401, 21, "Heart's Melody", attackPt)

        if Fun_IsHaveTask(1007401, 22) == 1 then
            local attackPt = { "", 0, 400, 11471, 8739, -1791 }
            local ladderpt = { "", 0, 100, 11669, 8958, -1807 }
            local nextPt = { "", 0, 150, 11892, 9226, -1810 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end

        local attackPt = { "", 0, 60, 11892, 9226, -1810 }
        local nextPt = { "", 0, 50, 12273,9608,-1792 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        if Fun_IsHaveTask(1007401, 23) == 1 then
            local attackPt = { "", 0, 1000, 12273,9608,-1792 }
            local ladderpt = { "", 0, 100, 11522, 10242, -1781 }
            local nextPt = { "", 0, 150, 11209, 10177, -1807 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end


        local attackPt = { "", 0, 100, 11209, 10177, -1807 }
        local nextPt = { "", 0, 50, 10735, 10360, -1792 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 300, 10735, 10360, -1792 }
        local ladderpt = { "", 0, 100, 10676, 10689, -1790 }
        local nextPt = { "", 0, 150, 10615, 11020, -1796 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 10648, 11281, -1791 }
        local ladderpt = { "", 0, 100, 10907, 11157, -1772 }
        local nextPt = { "", 0, 150, 11191, 11685, -1792 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 200, 11191, 11685, -1792 }
        local nextPt = { "", 0, 50, 12144, 11852, -1792 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 700, 12144, 11852, -1792 }
        Task_L_UseMusic(1007401, 25, "Heart's Melody", attackPt)


        if Fun_IsHaveTask(1007401, 26) == 1 then
            local attackPt = { "", 0, 700, 12106, 11798, -1792 }
            local ladderpt = { "", 0, 100, 12187, 11405, -1788 }
            local nextPt = { "", 0, 200, 12708, 11119, -1757 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end

        local attackPt = { "", 0, 200, 12708, 11119, -1757 }
        local nextPt = { "", 0, 50, 13633, 11667, -1792 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 800, 13633, 11667, -1792 }
        local ladderpt = { "", 0, 100, 13782, 12268, -1762 }
        local nextPt = { "", 0, 200, 13777, 12580, -1540 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 13777, 12580, -1540 }
        local nextPt = { "", 0, 50, 13655, 13885, -1538 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 1500, 13655, 13885, -1538 }
        local nextPt = { "", 0, 50, 13655, 13885, -1538 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 700, 12753, 14637, -1538 }
        Task_L_UseMusic(1007401, 30, "Heart's Melody", attackPt)


        if Fun_IsHaveTask(1007401, 31) == 1 then
            local attackPt = { "", 0, 700, 12753, 14637, -1538 }
            local ladderpt = { "", 0, 100, 12778, 15024, -1517 }
            local nextPt = { "", 0, 150, 12777, 15367, -1533 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end

        local attackPt = { "", 0, 200, 12777, 15367, -1533 }
        local nextPt = { "", 0, 50, 17825, 15892, -2551 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        if Fun_IsHaveTask(1007401, 32) == 1 then
            Fun_Sleep(5000)
            local point = { "这里要等NPC就位", 1, 200, 18297, 15189, -2562 }
            Task_L_TalkToNpc(1007401, 32, point, "Totoiki", 0, 1, 1)
        end

        local point = { "", 1, 200, 18025, 16818, -2555 }
        Task_L_TalkToNpc(1007401, 33, point, "Totoiki", 0, 1, 1)

        local point = { "", 1, 200, 16742, 15714, -2542 }
        Task_L_TalkToNpc(1007401, 34, point, "Totoiki Captain", 0, 1, 1)

        local point1 = {"",2,100,18384, 16037, -2561 }
		local point2 = {"",0,100,18795,16126,-2045}
        Task_L_LongGetTo(1007401,35,11052,2,point1,point2)

        local attackPt = {"",0,50,18559,16076,-2049}
        local nextPt = {"",0,50,18795,16126,-2045}
        fun.FB_Attack(attackPt,3,ladderpt,nextPt)

        --这里修改了
        local point = { "坐电梯", 0, 240,18795,16126,-2045}
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 18795,16126,-2045 }
            Fun_GotoTransi(transiPt)
        end
        local attackPt = { "电梯下来需要测试左1", 0, 300, 18865,14262,-1482 }
        local nextPt = { "", 0, 50, 19036, 13698, -1486 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local point = { "坐电梯", 0, 600, 19036, 13698, -1486 }
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 19441, 13607, -1483 }
            Fun_GotoTransi(transiPt)
        end

        local attackPt = { "电梯下来需要测试左", 0, 400, 20477, 13566, -764 }
        local nextPt = { "", 0, 50, 21012, 13588, -780 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 21012, 13588, -780 }
        local nextPt = { "", 0, 50, 20976,15886,-1015 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        --有可能上电梯右  新加begin  这边需要测试
        local attackPt = {"",0,400,18514,17612,-1480}
        local nextPt = {"",0,50,19326,17999,-1474}
        fun.FB_Attack(attackPt,0,ladderpt,nextPt)

        local point = { "坐电梯右", 0, 300, 19120,17918,-1488 }
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 19326,17999,-1474 }
            Fun_GotoTransi(transiPt)
        end

        local attackPt = {"",0,300,19948,17870,-1006}
        local nextPt = {"",0,50,20976,15886,-1015}
        fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        --新加end

        local point = {"",10,2000,20976,15886,-1015}	
        Task_L_AttackByName(1007401 ,37,point,"Ark Guardian Occel",1)


        if Fun_IsHaveTask(1007401, 38) == 1 then
            local attackPt = { "", 0, 200, 21066,16041,-1015}
            if Fun_IsFindDoor(attackPt) == 1 then
                MSG("LYLUa 找到了门移动去开门")
                Fun_GotoOpenDoor(attackPt)
            end
        end

        local task_id_arr = { 1007401, 0 }
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { 21155,15796,-1015 }  --坐标位置 用来判断
        local range = 1500  --范围
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end
    end
end

return ToToHeart