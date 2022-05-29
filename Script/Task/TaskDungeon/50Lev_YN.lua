
--燕之结界普通
YanZhiEnchantmentNormal = {}

function YanZhiEnchantmentNormal.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
    local FBMapId = 10762

    --0x2a0a
    --10762
    if Fun_IsInMapByMapId(FBMapId) then
        if Fun_IsHaveTask(711401, 1) == 1 then
            local attackPt = { "", 0, 200, 14414, 1772, -64 }
            local nextPt = { "", 0, 50, 14431, 2456, -64 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

            local attackPt = { "", 2, 200, 14431, 2456, -64 }
            local nextPt = { "", 0, 50, 15966, 5397, -64 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


            local attackPt = { "", 2, 800, 15966, 5397, -64 }
            local ladderpt = { "", 2, 900, 16134,5663,-64 }
            local nextPt = { "", 0, 50, 17227, 6758, -52 }
            fun.FB_Attack(attackPt, 6, ladderpt, nextPt)
        end

        Task_Attack(711401, 2, 17227, 6758, -52,    0)
        if Fun_IsHaveTask(711401, 3) == 1 then

            local attackPt = { "", 2, 700, 17411, 6824, -52 }
            local nextPt = { "", 0, 50, 18134, 7547, 5 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


            local attackPt = { "", 2, 200, 18134, 7547, 5 }
            local nextPt = { "", 0, 50, 20309, 7333, -320 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local point1 = {"",0,800,20309,7333,-320}
            local point2 = {"",0,800,21035,8124,-320}
            local point3 = {"",0,800,21541,9497,-320}
            Task_L_LoopAttackMonMore(711401,3,0,3,point1,point2,point3)
            --[[
            local attackPt = { "", 0, 1000, 17227, 6758, -52 }
            local nextPt = { "", 0, 50, 18134, 7547, 5 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

            local attackPt = { "", 2, 200, 18134, 7547, 5 }
            local nextPt = { "", 0, 50, 20856, 7881, -320 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local attackPt = { "这里新加一个", 0, 900, 20856, 7881, -320 }
            local nextPt = { "", 0, 50, 21653, 9650, -320 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

            local attackPt = { "", 0, 900, 21653, 9650, -320 }
            local nextPt = { "", 0, 50, 21653, 9650, -320 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
            --]]
        end

        Task_Goto(711401, 4, 23343, 9908, 69, 0)
        local attackPt = { "", 0, 300, 23343, 9908, 69 }
        local ladderpt = { "", 0, 100, 23544, 9933, 69 }
        local nextPt = { "", 0, 200, 24120, 10047, 327 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 400, 24120, 10047, 327 }
        local ladderpt = { "", 0, 100, 23957, 10130, 366 }
        local nextPt = { "", 0, 200, 23685, 10273, 564 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 23655, 10324, 589 }
        local nextPt = { "", 0, 50, 22134, 11500, 592 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 22134, 11500, 592 }
        local nextPt = { "", 0, 50, 22426, 12314, 593 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 2, 300, 22426, 12314, 593 }
        local ladderpt = { "", 0, 100, 22434, 12425, 592 }
        local nextPt = { "", 0, 200, 22474, 12724, 831 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local point1 = {"",0,800,22550,13276,839}
        local point2 = {"",0,800,23385,13723,708}
        local point3 = {"",0,800,21829,13986,823}
        Task_L_LoopAttackMonMore(711401,8,0,3,point1,point2,point3)

        --Task_Attack(711401, 8, 21563, 14065, 830,    0)
        Task_GotoAttack(711401, 9, 21366, 14263, 853, 20876, 14601, 841,    1)

        local point1 = {"",0,900,20402,15089,834}
        local point2 = {"",0,900,19649,15936,848}
        Task_L_LoopAttackMonMore(711401,10,0,2,point1,point2)
        --Task_Attack(711401, 10, 19579, 15913, 834,    0)
        Task_Attack_ladder(711401, 11, 18762, 16251, 973,    18762, 16251, 973, 0)

        local point1 = {"",0,800,18542,17707,721}
        local point2 = {"",0,800,18049,18403,723}
        local point3 = {"",0,800,16850,18458,725}
        Task_L_LoopAttackMonMore(711401,12,0,3,point1,point2,point3)
        --Task_Attack(711401, 12, 16995, 18394, 723,    0)
        Task_Attack_ladder(711401, 13, 16441, 18126, 725,    16441, 18126, 725, 0)

        if Fun_IsHaveTask(711401, 14) == 1 then
            local attackPt = { "", 0, 300, 16432, 18013, 192 }
            local nextPt = { "", 0, 50, 17450, 14449, 64 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end

        local attackPt = { "测试打竹子", 2, 900, 17450, 14449, 64 }
        local ladderpt = { "", 2, 500, 16957, 14390, 64 }
        local nextPt = { "", 0, 50, 17450, 14449, 64 }
        fun.FB_Attack(attackPt, 6, ladderpt, nextPt)

        if Fun_IsHaveTask(711401, 15) == 1 then
            local attackPt = { "", 0, 200, 17450, 14449, 64 }
            local nextPt = { "", 0, 50, 14596, 15580, 70 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local attackPt = { "", 2, 500, 14596, 15580, 70 }
            local nextPt = { "", 0, 50, 14634, 12963, 70 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local attackPt = { "", 2, 500, 14634, 12963, 70 }
            local nextPt = { "", 0, 50, 13466, 14384, 70 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local attackPt = { "", 2, 400, 13466, 14384, 70 }
            local nextPt = { "", 0, 50, 13466, 14384, 70 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)
        end

        if Fun_IsHaveTask(711401, 16) == 1 then
            local attackPt = { "", 2, 400, 13466, 14384, 70 }
            local nextPt = { "", 0, 50, 12735, 14177, 65 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
            local attackPt = { "", 2, 400, 12735, 14177, 65 }
            local ladderpt = { "", 0, 100, 12734, 14203, 63 }
            local nextPt = { "", 0, 200, 12058, 14196, 63 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end
        if Fun_IsHaveTask(711401, 17) == 1 then


            local attackPt = { "", 0, 200, 12058, 14196, 63 }
            local nextPt = { "", 0, 50, 11286, 17329, -256 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local attackPt = { "", 2, 900, 11286, 17329, -256 }
            local ladderpt = { "", 0, 100, 11407, 17416, -256 }
            local nextPt = { "", 0, 100, 11556, 17757, 0 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end

        if Fun_IsHaveTask(711401, 18) == 1 then
            local attackPt = { "", 0, 100, 11601, 17728, 1 }
            local ladderpt = { "", 0, 100, 11612, 17747, 0 }
            local nextPt = { "", 0, 10, 11457, 17929, 257 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

            local attackPt = { "", 0, 100, 11457, 17929, 257 }
            local nextPt = { "", 0, 50, 9527, 17903, 404 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

            local point1 = {"",0,800,9527,17903,404}
            local point2 = {"",0,800,8663,17117,388}
            Task_L_LoopAttackMonMore(711401,18,0,2,point1,point2)
        end

        if Fun_IsHaveTask(711401, 19) == 1 then
            local attackPt = { "", 0, 900, 9032, 17593, 369 }
            local ladderpt = { "", 0, 100, 8324, 16975, 359 }
            local nextPt = { "", 0, 50, 8292, 16619, 139 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

            local attackPt = { "", 0, 100, 8321, 16572, 137 }
            local ladderpt = { "", 0, 100, 8379, 16509, 139 }
            local nextPt = { "", 0, 200, 7971, 16486, -128 }
            fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

            local attackPt = { "", 0, 900, 7971, 16486, -128 }
            local nextPt = { "", 0, 50, 6139, 11395, 5 }
            fun.FB_Attack(attackPt, 3, ladderpt, nextPt)
        end

        local point1 = {"",0,1200,6139,11395,5}
        local point2 = {"",0,1200,4890,12243,197}
        local point3 = {"",0,1200,3861,12608,197}
        local point4 = {"",0,1500,3896,15350,401}
        local point5 = {"",0,800,3851,15991,401}
        Task_L_LoopAttackMonMore(711401,20,0,5,point1,point2,point3,point4,point5)

        local point = {"",0,300,3851,15991,401}
        --Task_L_GotoAttackMore(711401,21,0,1,point)
        local point = {"",0,300,3851,15991,401}
        Task_L_LongGetTo(711401,21,10762,1,point)
        
        local attackPt = { "", 0, 1200, 3868, 15336, 401 }
        local ladderpt = { "", 0, 100, 3803, 16304, 396 }
        local nextPt = { "", 0, 50, 3547, 16599, 135 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 3547, 16599, 135 }
        local ladderpt = { "", 0, 100, 3830, 16591, 166 }
        local nextPt = { "", 0, 50, 3547, 16599, 135 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "打BOS啦", 1, 1500, 3974, 18180, -115 }
        local nextPt = { "", 0, 50, 3974, 18180, -115 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        --Task_Attack(711401, 20, 3674,15663,389,    0)
        local task_id_arr = { 711401, 0 }
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { 3974, 18180, -115 }  --坐标位置 用来判断
        local range = 1500  --范围
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end
    end
end
    
return YanZhiEnchantmentNormal