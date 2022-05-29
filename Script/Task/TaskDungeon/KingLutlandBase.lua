KingLutlandBase = {}


function KingLutlandBase.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun");
    local fbMapid = 10892
    local fbMapid2 = 10893  --第二个

    if Fun_IsInMapByMapId(fbMapid) then
        Task_L_SetMapId(10892,5)
        local attackPt = { "", 0, 700, -1252, -1331, 1021 }
        local nextPt = { "", 0, 50, 2709, 4192, 1024 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 1200, 2709, 4192, 1024 }
        local nextPt = { "", 0, 50, 170, 5003, 1024 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --这里开门要打二次  任务3  c605d
        local attackPt = { "开门二次", 0, 800, 170, 5003, 1024 }
        local ladderpt = { "", 0, 200, 465, 5440, 1024 }
        local nextPt = { "", 0, 100, 1372, 7047, 986 }
        fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

        local attackPt = { "上梯子", 0, 300, 1382, 7070, 985 }
        local ladderpt = { "", 0, 100, 1380, 7061, 985 }
        local nextPt = { "", 0, 50, 1382, 7070, 985 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 1446, 7189, 2013 }
        local nextPt = { "", 0, 50, 2725, 8671, 2048 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        if Fun_IsHaveTask(0xc605d, 5) == 1 then
            local attackPt = { "小BOSS", 0, 2000, 2725, 8671, 2048 }
            local nextPt = { "", 0, 50, 3314, 8464, 2058 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end

        if Fun_IsHaveTask(0xc605d, 6) == 1 then
            local attackPt = { "查看书", 0, 1200, 3314, 8464, 2058 }
            local ladderpt = { "", 0, 200, 3314, 8464, 2058 }
            local nextPt = { "", 0, 50, 3492, 7926, 2058 }
            fun.FB_Attack(attackPt, 4, ladderpt, nextPt)
        end

        if Fun_IsHaveTask(0xc605d, 7) == 1 then
            local attackPt = { "开机关", 0, 200, 3492, 7926, 2058 }
            local ladderpt = { "", 0, 100, 3509, 7931, 2127 }
            local nextPt = { "", 0, 50, 1754, 9095, 2287 }
            fun.FB_Attack(attackPt, 4, ladderpt, nextPt)
        end
        --在任务9里面判断吧
        --这里要加个功能把东西丢掉
        local point = { "", 1, 200, 1781, 9121, 2276 }
        Task_L_TalkToNpc(811101, 9, point, "Nahun's Soul", 0, 1, 1)
        
        if Fun_IsHaveTask(811101, 10) == 1 then
            Fun_DropItem()  --丢掉灯笼
            local attackPt = { "", 0, 700, 1601, 9085, 2315 }
            local nextPt = { "", 0, 50, 2686, 10115, 2048 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
            Fun_DropItem()  --丢掉灯笼
        end


        local attackPt = { "开门", 0, 300, 2686, 10115, 2048 }
        local ladderpt = { "", 0, 200, 2686, 10115, 2048 }
        local nextPt = { "", 0, 100, 1297, 11138, 2048 }
        fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 1297, 11138, 2048 }
        local nextPt = { "", 0, 50, 2513, 12096, 2048 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        local attackPt = { "打箱子", 2, 700, 2513, 12096, 2048 }
        local ladderpt = { "", 0, 200, 1819, 12328, 2044 }
        local nextPt = { "", 0, 50, 2513, 12096, 2048 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 1871, 13461, 2022 }
        local nextPt = { "", 0, 50, 2515, 15450, 2050 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        local attackPt = { "", 0, 1500, 2515, 15450, 2050 }
        local ladderpt = { "", 0, 200, 2816, 16085, 2030 }
        local nextPt = { "", 0, 50, 2515, 15450, 2050 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 5544, 17220, 1536 }
        local nextPt = { "", 0, 50, 6113, 17537, 1543 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "开机关", 0, 700, 6113, 17537, 1543 }
        local ladderpt = { "", 0, 300, 6113, 17537, 1543 }
        local nextPt = { "", 0, 100, 6343, 19051, 1536 }
        fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

        local attackPt = { "开机关", 0, 300, 6343, 19051, 1536 }
        local ladderpt = { "", 0, 300, 6343, 19051, 1536 }
        local nextPt = { "", 0, 100, 6793, 22797, 1536 }
        fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

        local attackPt = { "", 0, 1800, 6793, 22797, 1536 }
        local ladderpt = { "", 0, 300, 9222, 24270, 1539 }
        local nextPt = { "", 0, 50, 6793, 22797, 1536 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 10196, 24897, 1533 }
        local nextPt = { "", 0, 50, 12539, 25287, 1536 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 900, 12539, 25287, 1536 }
        local ladderpt = { "", 0, 100, 13112, 24815, 1555 }
        local nextPt = { "", 0, 50, 12539, 25287, 1536 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 15923, 23978, 1031 }
        local nextPt = { "", 0, 50, 17899, 23547, 1032 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "开机关", 0, 700, 17899, 23547, 1032 }
        local ladderpt = { "", 0, 300, 17899, 23547, 1032 }
        local nextPt = { "", 0, 100, 17875, 26112, 1024 }
        fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

        if Fun_IsInPoint(nextPt) == 1 then
            Fun_PassLoadMap()
        end
    end


    if Fun_IsInMapByMapId(fbMapid2) then --下一张地图
        Task_L_SetMapId(10893,5)

        local point1 = {"",10,100,13054, 31975, 3068 }
		local point2 = {"",1,100,13309, 35830, 718 }
		if Task_L_LongGetTo(0xc605e,1,10893,2,point1,point2) then
            local point = {"",0,800,13309, 35830, 718 }
            if Task_L_AttackPoint(0xc605e,1,point) then
                local point = {"",1,100,8718, 41513, 1061 }
                Task_L_LongGetTo(0xc605e,1,10893,1,point)
            end
        else
            local point1 = {"",2,100,13059, 31792, 3068 }
            local point2 = {"",1,100,13309, 35830, 718 }
            Task_L_LongGetTo(0xc605e,1,10893,2,point1,point2)
        end


        local attackPt = { "", 0, 600, 9618, 41685, 1025 }
        local nextPt = { "", 0, 50, 8718, 41513, 1061 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 2, 500, 8718, 41513, 1061 }
        local nextPt = { "", 0, 50, 8009, 43536, 1537 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
		
		--为了防止弹回这里再加一个
		local attackPt = { "防弹回", 0, 250, 7886,42911,1481 }
       local ladderpt = { "", 0, 100, 8077, 43591, 1534 }
        local nextPt = { "", 0, 50, 8077, 43591, 1534 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 8009, 43536, 1537 }
        local ladderpt = { "", 0, 100, 8077, 43591, 1534 }
        local nextPt = { "", 0, 50, 8245, 43864, 1536 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)--第一个跳点

        local attackPt = { "", 0, 300, 8245, 43864, 1536 }
        local nextPt = { "", 0, 50, 10403, 45537, 1959 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 8589, 44561, 1537 }
        local nextPt = { "", 0, 50, 10403, 45537, 1959 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 9157, 45387, 1580 }
        local nextPt = { "", 0, 50, 9676, 45817, 1742 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 9676, 45817, 1742 }
        local nextPt = { "", 0, 50, 10403, 45537, 1959 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 2, 400, 10403, 45537, 1959 }
        local ladderpt = { "", 0, 100, 10801, 45402, 2035 }
        local nextPt = { "", 0, 50, 10403, 45537, 1959 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 400, 10960, 44988, 3246 }
        local ladderpt = { "", 0, 100, 10953, 44959, 3244 }
        local nextPt = { "", 0, 50, 10960, 44988, 3246 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 11104, 44691, 3584 }
        local nextPt = { "", 0, 50, 11762, 41855, 3958 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        local attackPt = { "", 0, 950, 12010, 42645, 3767 }
        local ladderpt = { "", 0, 100, 11754, 41850, 3985 }
        local nextPt = { "", 0, 50, 12010, 42645, 3767 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 11139, 41831, 4094 }
        local nextPt = { "", 0, 50, 9486, 41993, 4097 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 1200, 9486, 41993, 4097 }
        local ladderpt = { "Jagan", 0, 1000, 9486, 41993, 4097 }
        local nextPt = { "", 0, 50, 8679, 44493, 4609 }
        fun.FB_Attack(attackPt, 99, ladderpt, nextPt)

		--卡点新加
		local attackPt = { "", 0, 1200, 8132,42914,4564 }
		local ladderpt = { "Jagan", 0, 800, 9486, 41993, 4097 }
		local nextPt = { "", 0, 50, 8679, 44493, 4609 }
		fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 8679, 44493, 4609 }
        local nextPt = { "", 0, 50, 9679, 45632, 4788 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 9679, 45632, 4788 }
        local nextPt = { "", 0, 50, 10679, 45504, 5083 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 800, 10679, 45504, 5083 }
        local nextPt = { "", 0, 50, 11185, 44721, 5121 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 11185, 44721, 5121 }
        local nextPt = { "", 0, 50, 11658, 43818, 5121 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 11658, 43818, 5121 }
        local nextPt = { "", 0, 50, 11808, 41816, 5495 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 11808, 41816, 5495 }
        local ladderpt = { "", 0, 100, 11754, 41850, 5514 }
        local nextPt = { "", 0, 50, 11754, 41850, 5514 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 11139, 41832, 5627 }
        local nextPt = { "", 0, 50, 9324, 41801, 5633 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 9324, 41801, 5633 }
        local nextPt = { "", 0, 50, 8126, 42186, 5872 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 8126, 42186, 5872 }
        local nextPt = { "", 0, 50, 8440, 44354, 6145 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 8440, 44354, 6145 }
        local nextPt = { "", 0, 50, 6890, 45259, 6145 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local point = { "坐电梯", 0, 500, 6890, 45259, 6145 }
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 6890, 45259, 6145 }
            Fun_GotoTransi(transiPt)
        end

        local attackPt = { "", 0, 400, 6680, 45345, 8701 }
        local nextPt = { "", 0, 50, 8930, 44475, 8705 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 1500, 8930, 44475, 8705 }
        local ladderpt = { "Jagan", 0, 1500, 8930, 44475, 8705 }
        local nextPt = { "", 0, 50, 7774, 43684, 8721 }
        fun.FB_Attack(attackPt, 99, ladderpt, nextPt)

        local attackPt = { "Jagan", 0, 1500, 8930, 44475, 8705 }
        local ladderpt = { "", 0, 200, 7774, 43684, 8721 }
        local nextPt = { "", 0, 50, 7744, 42699, 8705 }
        fun.FB_Attack(attackPt, 7, ladderpt, nextPt)

        local point = { "坐电梯", 0, 100, 7744, 42699, 8705 }
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 7744, 42699, 8705 }
            Fun_GotoTransi(transiPt)
        end

        local attackPt = { "", 0, 200, 7754, 42164, 8707 }
        local nextPt = { "", 0, 50, 8965, 41653, 8704 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 1500, 9809, 42061, 8705 }
        local ladderpt = { "Jagan", 0, 1500, 9809, 42061, 8705 }
        local nextPt = { "", 0, 50, 10864, 41427, 8721 }
        fun.FB_Attack(attackPt, 99, ladderpt, nextPt)

        local attackPt = { "Jagan", 0, 1500,9809, 42061, 8705 }
        local ladderpt = { "", 0, 100, 10864, 41427, 8721 }
        local nextPt = { "", 0, 50, 11715, 41932, 8713 }
        fun.FB_Attack(attackPt, 7, ladderpt, nextPt)

        local point = { "坐电梯", 0, 100, 11715, 41932, 8713 }
        if (Fun_IsInPoint(point) == 1) then
            local transiPt = { 11715, 41932, 8713 }
            Fun_GotoTransi(transiPt)
        end
        
        local attackPt = { "这里先移动过去", 0, 400, 12257, 42122, 8707 }
        local nextPt = { "", 0, 50, 12166, 43406, 8705 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        if Fun_IsHaveTask(811102, 2) == 1 then  --打完还是到这里
            local attackPt = { "这个点重复的", 0, 200, 12166, 43406, 8705 }
            local nextPt = { "", 0, 50, 11234, 44060, 8705 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

            local attackPt = { "打BOSS了", 0, 1500, 11234, 44060, 8705 }
            local ladderpt = { "Jagan", 0, 1500, 11234, 44060, 8705 }
            local nextPt = { "", 0, 50, 11252, 45273, 8721 }
            fun.FB_Attack(attackPt, 99, ladderpt, nextPt)

            local attackPt = { "Jagan", 0, 1500, 11234, 44060, 8705 }
            local ladderpt = { "", 0, 100, 11252, 45273, 8721 }
            local nextPt = { "", 0, 50, 11252, 45273, 8721 }
            fun.FB_Attack(attackPt, 7, ladderpt, nextPt)

        end

        if Fun_IsHaveTask(0xc605e, 3) == 1 then  --这里是结束了跑箱子 --可能存在卡点 
            MSG("LYLua 我进来这里了 ")
            local point1 = {"",1,100,10153, 46214, 8721 }
            local point2 = {"",1,100,9815, 46760, 8723 }
            local point3 = {"",1,100,10018, 47610, 8735 }
            local point4 = {"",1,100,10039, 51406, 8135 }
            Task_L_LongGetTo(0xc605e,3,10893,4,point1,point2,point3,point4)
        end

        if Fun_IsHaveTask(0xc605e, 3) == 0 then
            local attackPt = { "开最后的箱子", 0, 900, 10039, 51406, 8135 }
            local ladderpt = { "", 0, 200, 9979, 51920, 8145 }
            local nextPt = { "", 0, 50, 10026, 51876, 8145 }
            fun.FB_Attack(attackPt, 5, ladderpt, nextPt)

            local task_id_arr = { 811101, 811102 }
            local type = 0  --0代表打完捡东西回城 1.直接回城
            local rangept = { 10039, 51406, 8135 }  --坐标位置 用来判断
            local range = 1500  --范围
            if Task_CheckTaskOverEx(fbMapid2, task_id_arr, type, rangept, range) == 1 then
                return 1
            end
        end
    end

    return 0
end



return KingLutlandBase