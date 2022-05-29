--艾尔盖茨
AierGaici = {}

function AierGaici.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
   -- package.path = "D:/lua/LYFun.lua"
   -- local fun = require("LYFun");
    local FBMapId = 10463
    -- 28df

    if Fun_IsInMapByMapId(FBMapId) then

        local point1 = {"",1,300,6937,2345,513}
        local point2 = {"",1,300,7219,2361,513}
		local point3 = {"",1,400,7800,2296,513}
		local point4 = {"",1,800,7566,2540,516}
        Task_L_GotoAttackMore(0x2dff01, 1,0,4,point1,point2,point3,point4)

        local attackPt = {"",2,900,7566,2540,516}
        local ladderpt = {"",2,900,7566,2540,516}
        local nextPt = {"",0,50,7667,3993,515}
        fun.FB_Attack(attackPt,6,ladderpt,nextPt)

        local attackPt = {"",0,900,7667,3993,515}
        local ladderpt = {"",0,900,7667,3993,515}
        local nextPt = {"",0,50,7419,4936,513}
        fun.FB_Attack(attackPt,3,ladderpt,nextPt)

        local attackPt = {"",0,900,7419,4936,513}
        local ladderpt = {"",2,900,7419,4936,513}
        local nextPt = {"",0,50,7600,7133,515}
        fun.FB_Attack(attackPt,3,ladderpt,nextPt)

        local attackPt = {"",0,800,7600,7133,515}
        local nextPt = {"",0,50,7498,8432,517}
        fun.FB_Attack(attackPt,3,ladderpt,nextPt)

        local attackPt = {"",0,1200,7498,8432,517}
        local nextPt = {"",0,50,7727,9818,519}
        fun.FB_Attack(attackPt,0,ladderpt,nextPt)

        local point = { "坐电梯", 0, 200,7727,9818,519}
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 7727,9818,519 }
            Fun_GotoTransi(transiPt)
        end

        local attackPt = {"",0,300,7632,10175,3085}
        local nextPt = {"",0,50,9607,11321,3089}
        fun.FB_Attack(attackPt,3,ladderpt,nextPt)

        if Fun_IsHaveTask(0x2dff01, 3) == 1 then
            local attackPt = {"",0,1200,9607,11321,3089}
            local nextPt = {"",0,50,10710,11567,3088}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dff01, 4) == 1 then
            local attackPt = { "", 0, 300, 10710,11567,3088 }
            if Fun_IsFindDoor(attackPt) == 1 then
                MSG("LYLUa 找到了门移动去开门")
                Fun_GotoOpenDoor(attackPt)
            end
        end

        if Fun_IsHaveTask(0x2dff02, 1) == 1 then
            local point = { "坐电梯", 0, 300,10725,11602,3088}
            if (Fun_IsInPoint(point) == 1) then
                local transiPt = { 10956,11621,3085 }
                Fun_GotoTransi(transiPt)
            end

            local attackPt = {"",0,400,11459,16241,3711}
            local nextPt = {"",0,50,10444,16762,3712}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dff02, 2) == 1 then
            local attackPt = {"",0,2000,10444,16762,3712}
            local nextPt = {"",0,50,9390,17565,3709}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end


        if Fun_IsHaveTask( 0x2dff02, 3) == 1 then
            local attackPt = { "", 0, 400, 9461,17605,3709 }
            if Fun_IsFindDoor(attackPt) == 1 then
                MSG("LYLUa 找到了门移动去开门")
                Fun_GotoOpenDoor(attackPt)
            end
        end

        if Fun_IsHaveTask(0x2dff03, 1) == 1 then
            local point = { "坐电梯", 0, 300,9461,17605,3709}
        
            if (Fun_IsInPoint(point) == 1) then
                local transiPt = { 9318,17580,3709 }
                Fun_GotoTransi(transiPt)
            end

            local attackPt = {"",0,400,5624,16777,4469}
            local nextPt = {"",0,50,5094,15304,4470}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dff03, 2) == 1 then
            local attackPt = {"",0,1200,5094,15304,4470}
            local nextPt = {"",0,50,4292,14771,4467}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end

        if Fun_IsHaveTask( 0x2dff03, 3) == 1 then
            local attackPt = { "", 0, 300, 4292,14771,4467 }
            if Fun_IsFindDoor(attackPt) == 1 then
                MSG("LYLUa 找到了门移动去开门")
                Fun_GotoOpenDoor(attackPt)
            end
        end

        if Fun_IsHaveTask(0x2dff04, 1) == 1 then
            local point = { "坐电梯", 0, 300,4292,14771,4467}
            if (Fun_IsInPoint(point) == 1) then
                local transiPt = { 4148,14736,4466 }
                Fun_GotoTransi(transiPt)
            end

            local attackPt = {"",0,400,5049,9946,5332}
            local nextPt = {"",0,50,5906,9930,5331}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dff04, 2) == 1 then
            local attackPt = {"",0,1200,6141,9997,5332}
            local nextPt = {"",0,50,7851,14048,5637}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dff05, 1) == 1 then
            local attackPt = {"",0,800,7851,14048,5637}
            local nextPt = {"",0,50,7671,15724,5775}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end

        local point = {"Lord of Evolution Krause",15,2000,7671,15724,5776}
        Task_L_LoopAttackMonMore(0x2dff05,2,0,1,point)

        local task_id_arr = { 0x2dff01,0x2dff02,0x2dff03,0x2dff04 ,0x2dff05}
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { 6527,9841,5332}  --坐标位置 用来判断
        local range = 1500  --范围
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end
    end
end

return  AierGaici
