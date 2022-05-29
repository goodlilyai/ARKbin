
--生死边界  0508
LifeAndDeath = {}

function LifeAndDeath.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
    local FBMapId = 10765
    if Fun_IsInMapByMapId(FBMapId) then

        local point = { "", 0, 100,270,3694,2816}
        Task_L_LongGetTo(0xae2b9,1,10765,1,point)

        Task_Attack(0xae2b9, 2, 1624,3341,2813,    0)

        local point = { "", 0, 100,3674,3274,2827}
        if Task_L_LongGetTo(0xae2b9,3,10765,1,point) then
            Task_Attack(0xae2b9, 3, 3674,3274,2827,    0)
        end

        local point = { "", 0, 100,5134,970,2816}
        if Task_L_LongGetTo(0xae2b9,4,10765,1,point) then
            Task_Attack(0xae2b9, 4, 5134,970,2816,    0)
        end

        local point = { "", 0, 100,8203,1638,2548}
        Task_L_LongGetTo(0xae2b9,5,10765,1,point)

        local point = { "", 0, 100,8203,1638,2548}
        if Task_L_LongGetTo(0xae2b9,6,10765,1,point) then
            Task_Attack(0xae2b9, 6, 8203,1638,2548,    0)
        end

        local point1 = { "", 2, 100, 10570,6709,2560}
        local point2 = { "", 0, 100,12045, 11508, 1147}
        Task_L_LongGetTo(0xae2b9,7,10765,2,point1,point2)

        local point = { "", 0, 100,12234,1527,1277}
        if Task_L_LongGetTo(0xae2b9,8,10765,1,point) then
            Task_Attack(0xae2b9, 8, 12234,1527,1277,    0)
        end

        local point = { "", 0, 100,17361,2695,781}
        Task_L_LongGetTo(0xae2b9,9,10765,1,point)

        local point = { "", 0, 100,17231,4036,783}
        if Task_L_LongGetTo(0xae2b9,10,10765,1,point) then
            Task_Attack(0xae2b9,10, 17231,4036,783,    0)
        end
        
        Task_Attack_ladder(0xae2b9, 11, 17727,6328,778,    17727,6328,778, 0)

        local point = { "", 0, 100,17355,7802,510}
        if Task_L_LongGetTo(0xae2b9,12,10765,1,point) then
            Task_Attack(0xae2b9,12, 17355,7802,510,    0)
        end
      
        local point1 = { "", 1, 100, 127297, 7686, 510 }
        local point2 = { "", 1, 100, 15650, 9799, 509 }
        local point3 = { "", 1, 100, 12446,7676,-6}
        Task_L_LongGetTo(0xae2b9,13,10765,3,point1,point2,point3)

        if Fun_IsHaveTask(0xae2b9,14)==1 then
            local attackPt = {"",2,700,12446,7676,-6}
            local nextPt = {"",0,100,12446,7676,-6}
            
            if(Fun_IsInPoint(attackPt)==0) then
                Fun_EnforceFindWay(nextPt)
            else
                local ladderpt = {"",0,100,12408,7510,-3}
                fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
            end
        end

        if Fun_IsHaveTask(0xae2b9,15)==1 then
            local attackPt = {"",2,200,12446,7676,-6}
            local ladderpt = {"",0,100,12408,7510,-3}
            local nextPt = {"",0,100,12633,7144,-256}
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end
        
        local attackPt = {"",0,200,12633,7144,-256}
        local nextPt = {"",0,50,15284,7137,-260}
        fun.FB_Attack(attackPt,0,ladderpt,nextPt)

        Task_Attack(0xae2b9,16, 16117,6307,-257,    0)

        if Fun_IsHaveTask(0xae2b9,17) == 1 then
            local point = { "", 1, 1000, 16117,6307,-257 }
            if Fun_IsInPoint(point) == 1 then
                local point = { "", 1, 1000, 16117,6307,-257 }
                Task_L_AttackPoint(0xae2b9,17,point)
            end
        end
      
        local point1 = { "", 1, 100, 16408, 5607, -260 }
        local point2 = { "", 1, 100, 15965, 4702, -262 }
        local point3 = { "", 1, 100, 15953, 2883,-268}
        local point4 = { "", 1, 100, 14649, 2757,-513}
        local point5 = { "", 1, 100, 12716,4509,-514}
        Task_L_LongGetTo(0xae2b9,17,10765,5,point1,point2,point3,point4,point5)

        local point1 = { "", 1, 100, 12716,4509,-514}
        local point2 = { "", 1, 100, 12739,4654,-518}
        Task_L_LongGetTo(0xae2b9,18,10765,2,point1,point2)

        local point1 = { "", 2, 100, 12739,4654,-518}
        local point2 = { "", 0, 100,3720,23344,1341}
        Task_L_LongGetTo(0xae2b9,19,10765,2,point1,point2)

        local point = { "", 0, 1500,3720,23344,1341}
        if (Fun_IsInPoint(point) == 1) then
            local point = {"",1,1200,3720,23344,1341}
            Task_L_AttackByName(0xae2b9,19,point,"Hellspawn Banda",1)
        end

        local task_id_arr = { 0xae2b9, 0 }
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { 13978,5004,-1536 }  --坐标位置 用来判断
        local range = 1500  --范围
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end
    end
end

return LifeAndDeath