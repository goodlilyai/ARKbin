--LightInTheDark 黑暗中的光
LightInTheDark = {}

function LightInTheDark.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
    --LightInTheDark 黑暗中的光
    local infbId = 10691
    local fbMapId = 10691
    local taskId = 602402

    --判断是不是在副本中
    if Fun_IsInMapByMapId(fbMapId) then
        
        local point = { "", 1, 100, -2219, -1887, 257 }
        Task_L_TalkToNpc(taskId, 1, point, "Armen", 0, 2, 1,2)

        local point1 = { "", 2, 100, -900, -906, 4 }
        local point2 = { "", 1, 300, -1174, 1571, -499 }
        if Task_L_LongGetTo(taskId,2,10691,2,point1,point2) then
            local point = { "", 1, 300, -1174, 1571, -499 }
            Task_L_Collection(taskId,2,point)
        end
       

        --移动到石碑
        Task_Goto(taskId, 3, -1103, 3325, -366, 0)
        --清除怪物 -并移动到下一个点
        local attackPt = { "", 0, 1500, -1103, 3325, -366 }
        local nextPt = { "", 0, 50, 454, 2534, -509 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 1500, 454, 2534, -509 }
        local nextPt = { "", 0, 50, 454, 2534, -509 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        -- (下楼后)
        local attackPt = { "下楼后", 0, 550, 1092, 2953, -750 }
        local nextPt = { "", 0, 500, 1990, 3580, -763 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "下楼后", 0, 500, 1990, 3580, -763 }
        local nextPt = { "", 0, 500, 2493, 3467, -763 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "下楼后1", 0, 500, 2493, 3467, -763 }
        local nextPt = { "", 0, 500, 2852, 4062, -676 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "下楼后", 0, 300, 2852, 4062, -676 }
        local nextPt = { "", 0, 300, 2577, 4331, -537 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "下楼后", 0, 300, 2577, 4331, -537 }
        local nextPt = { "", 0, 300, 2619, 4861, -507 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --过完梯子
        local attackPt = { "下楼", 0, 500, 2619, 4861, -507 }
        local ladderpt = { "", 1, 80, 2532, 5506, -509 }
        local nextPt = { "", 0, 150, 2536, 5849, -507 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 150, 2534, 5825, -506 }
        local nextPt = { "", 0, 500, 2443, 6623, -494 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        --过梯子
        local attackPt = { "这里要看一下", 0, 750, 2443, 6623, -494 }
        local ladderpt = { "", 0, 80, 2964, 6477, -482 }
        local nextPt = { "", 0, 150, 4030, 6469, -501 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        --过梯子后的点
        local attackPt = { "", 0, 150, 4030, 6469, -501 }
        local nextPt = { "", 0, 600, 4194, 7841, -507 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --这里是需要打开水闸  这里直接改成900 试试
        local attackPt = { "", 0, 1400, 4194, 7841, -507 }
        if Fun_IsInPoint(attackPt) == 1 then
            --if (Fun_IsHaveTaskBranch(taskId, 7, 0) == 1) then
			 if (Fun_IsHaveTaskBranchFinshCount(taskId, 7) == 0) then
                local attackPt = { "", 0, 1200, 4194, 7841, -507 }
                local nextPt = { "", 0, 600, 4570, 5630, -511 }
                local collectpt = { 4236, 7882, -507 }
                Fun_Collection(attackPt, 6)
            else
                local attackPt = { "", 0, 900, 4194, 7841, -507 }
                local nextPt = { "", 0, 600, 4570, 5630, -511 }
                fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
            end
        end



        local attackPt = { "", 0, 600, 4570, 5630, -511 }
        local nextPt = { "", 0, 500, 5611, 5653, -250 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 500, 5611, 5653, -250 }
        local nextPt = { "", 0, 600, 6579, 5715, -250 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        --开完第一个水闸后上楼梯，新加的
        local attackPt = { "", 0, 500, 6579, 5715, -250 }
        local nextPt = { "", 0, 600, 6828, 4456, -260 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 6828, 4456, -260 }
        local nextPt = { "", 0, 100,  7231, 4767, -251 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 7231, 4767, -251 }
        local nextPt = { "", 0, 100, 7269, 4773, -244 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 7269, 4773, -244 }
        local ladderpt = { "", 0, 80, 7435, 4767, -244 }
        local nextPt = { "", 0, 150, 6720, 5094, -238 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 150, 7742, 4730, 2 }
        local ladderpt = { "", 0, 80, 7759, 4840, 1 }
        local nextPt = { "", 0, 150, 6720, 5094, -238 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 150, 7648, 5144, 0 }
        local ladderpt = { "", 0, 80, 7648, 5144, 0 }
        local nextPt = { "", 0, 300, 7959, 4930, 262 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 7959, 4930, 262 }
        local nextPt = { "", 0, 150, 8189, 3561, 249 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        --这里是需要打开水闸  这里 850 to  1100 
        local attackPt = { "", 0, 2000, 8189, 3561, 249 }
        if Fun_IsInPoint(attackPt) == 1 then
            if (Fun_IsHaveTaskBranch(taskId, 7, 1) == 1) then
                local attackPt = { "", 0, 1500, 8189, 3561, 249 }
                local nextPt = { "", 0, 1500, 8283, 5878, 257 }
                Fun_Collection(attackPt, 6)
            else
                local attackPt = { "", 0, 1100, 8189, 3561, 249 }
                local nextPt = { "", 0, 100, 8283, 5878, 257 }
                FindWay(attackPt)
                --这里改成强制移动看看
                fun.FB_Attack(attackPt, 3, ladderpt, nextPt)
            end
        end


        local attackPt = { "", 0, 600, 8283, 5878, 257 }
        local ladderpt = { "", 0, 80, 8458, 6596, 281 }
        local nextPt = { "", 0, 300, 8483, 8673, -762 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        --过完梯子
        local attackPt = { "", 0, 150, 8462, 8544, -750 }
        local nextPt = { "", 0, 150, 7705, 10045, -750 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 7705, 10045, -750 }
        local ladderpt = { "", 0, 80, 6975, 10147, -767 }
        local nextPt = { "", 0, 150, 6372, 10143, -767 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        --过完梯子
        local attackPt = { "", 0, 150, 6372, 10143, -767 }
        local nextPt = { "", 0, 150, 5272, 10600, -763 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)
       
        local attackPt = { "", 0, 700, 5272, 10600, -763 }
        local nextPt = { "", 0, 150, 6050, 11093, -767 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --[[    local attackPt = {"",0,400,5311,10171,-767}
    local nextPt = {"",0,50, 6106,11093,-767}
    fun.FB_Attack(attackPt,3,ladderpt,nextPt)
]]
        local attackPt = { "", 0, 800, 6050, 11093, -767 }
        if Fun_IsInPoint(attackPt) == 1 then
            --这里是需要打开水闸
            if (Fun_IsHaveTaskBranch(taskId, 7, 2) == 1) then
                local attackPt = { "最后一个水闸", 0, 800, 6050, 11093, -767 }
                local nextPt = { "", 0, 50, 6130, 9248, -1279 }
                Fun_Collection(attackPt, 6)
            else
                local attackPt = { "最后一个水闸", 0, 600, 6050, 11093, -767 }
                local nextPt = { "", 0, 50, 6130, 9248, -1279 }
                fun.FB_Attack(attackPt, 3, ladderpt, nextPt)
            end
        end

        local attackPt = { "", 0, 600, 6130, 9248, -1279 }
        local nextPt = { "", 0, 50, 6386, 8776, -1277 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        
        local attackPt = { "", 0, 200, 6386, 8776, -1277 }
        local ladderpt = { "", 0, 100, 6386, 8776, -1277 }
        local nextPt = { "", 0, 80, 6417, 8433, -1274 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        -- 6393,8425,-1275
        --过完梯子
        local attackPt = { "", 0, 150, 6393, 8425, -1275 }
        local nextPt = { "", 0, 150, 7160, 7581, -1262 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        -- 6393,8425,-1275
        --过完梯子
        local attackPt = { "", 0, 150, 6393, 8425, -1275 }
        local nextPt = { "", 0, 150,8841,7764,-1275}
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        --石像要靠近才会变成怪物
        local attackPt = { "", 0, 1200, 7970,7672,-1275}
        local ladderpt = { "", 0, 50, 9001, 7672, -1256 }
        local nextPt = { "", 0, 150, 10081, 7670, -1280 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        --这里过机关
        local attackPt = { "这里开始过机关", 0, 500, 10081, 7671, -1278 }
        local nextPt = { "", 0, 500, 10766, 7340, -1279 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 10766, 7340, -1279 }
        local nextPt = { "", 0, 500, 11420, 7545, -1279 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 500, 11420, 7545, -1279 }
        local nextPt = { "", 0, 500, 12088, 8240, -1279 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --12346,8274,-1279
        local attackPt = { "楼梯下面", 0, 150, 12088, 8240, -1279 }
        local nextPt = { "", 0, 600, 12639,8145,-1159 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        --楼梯1
		local attackPt = { "楼梯中间面", 0, 300, 12639,8145,-1159 }
        local nextPt = { "", 0, 600, 12926,8385,-1015 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        --楼梯2
		local attackPt = { "楼梯中间面", 0, 300, 12926,8385,-1015 }
        local nextPt = { "", 0, 600, 13207,8121,-892 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        --楼梯3
		local attackPt = { "楼梯中间面", 0, 300, 13207,8121,-892 }
        local nextPt = { "", 0, 600, 13504,8494,-895 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

		local attackPt = { "楼梯中间面", 0, 800, 13504,8494,-895 }
        local nextPt = { "", 0, 600, 12479, 10269, -758 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --打小BOSS
        local startpt =    { "Gatekeeper Ramos", 2, 1500, 12479, 10269, -758 }
        local nextpt =    { "结束", 20, 200, 12505, 10837, -758 }
        fun.FB_Attack(startpt, 2, ladderpt, nextpt)  --打BOSS

        MSG("LYLUA HAHHAHAHAHAHA")
        local attackPt = { "", 0, 500, 12505, 10837, -758 }
        local ladderpt = { "", 0, 100, 12508, 10854, -761 }
        local nextPt = { "", 0, 300, 12493, 10978, -245 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        --机关第二组  
        local attackPt = { "", 0, 300, 12427, 11046, -245 }
        local nextPt = { "", 0, 150, 12457, 11331, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 180, 12457, 11331, -246 }
        local nextPt = { "", 0, 150, 12528, 11679, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 180, 12528, 11679, -246 }
        local nextPt = { "", 0, 150, 12578, 11976, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --机关
        local attackPt = { "", 0, 150, 12578, 11976, -246 }
        local nextPt = { "", 0, 150, 12556, 12200, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        local attackPt = { "", 0, 150, 12556, 12200, -246 }
        local nextPt = { "", 0, 150, 12532, 12459, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        local attackPt = { "", 0, 150, 12532, 12459, -246 }
        local nextPt = { "", 0, 150, 12548, 12717, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        local attackPt = { "", 0, 150, 12548, 12717, -246 }
        local nextPt = { "", 0, 150, 12410, 13365, -246 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        --机关结束
        local attackPt = { "", 0, 500, 12410, 13365, -246 }
        local ladderpt = { "", 0, 80, 12469, 13817, -215 }
        local nextPt = { "", 0, 300, 12427, 16872, -2025 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 150, 12427, 16873, -2027 }
        local nextPt = { "", 0, 150, 12498, 18245, -2043 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 800, 12498, 18245, -2043 }
        local nextPt = { "", 0, 800, 11544, 18682, -1887 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 11544, 18682, -1887 }
        local nextPt = { "", 0, 500, 10668, 18410, -1659 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 10668, 18410, -1659 }
        local nextPt = { "", 0, 500, 9633, 17136, -1518 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 9633, 17136, -1518 }
        local ladderpt = { "", 0, 50, 8996, 16606, -1509 }
        local nextPt = { "", 0, 200, 8378, 16622, -1526 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 8378, 16622, -1526 }
        local nextPt = { "", 0, 800, 7721, 16627, -1531 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 400, 7721, 16627, -1531 }
        local nextPt = { "", 0, 800, 6560, 15299, -1531 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 800, 6560, 15299, -1531 }
        local nextPt = { "", 0, 800, 7129, 14409, -1634 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 7129, 14409, -1634 }
        local nextPt = { "", 0, 800, 7496, 14673, -1817 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 7496, 14673, -1817 }
        local nextPt = { "", 0, 800, 7938, 14466, -2039 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 300, 7938, 14466, -2039 }
        local nextPt = { "", 0, 800, 7984, 15348, -2047 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        if Fun_IsHaveTask(taskId, 12) == 1 then
            local attackPt = { "", 0, 800, 7984, 15348, -2047 }
            local nextPt = { "", 0, 800, 7984, 15348, -2047 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end

        if Fun_IsHaveTask(taskId, 13) == 1 then
            local attackPt = { "", 2, 800, 8151, 15814, -2030 }
            local nextPt = { "", 0, 300, 8151, 15814, -2030 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end

        --做船
        local point = { "", 0, 500, 8151, 15814, -2030 }
        if (Fun_IsInPoint(point) == 1) then
            MSG("LYLua 我这里可以的")
            local transiPt = { 8356, 15812, -2047 }
            Fun_GotoTransi(transiPt)
        end
        --Task_Goto2(taskId ,14,8356,15812,-2047,9422,12741,-2032,1) 
        local attackPt = { "", 0, 400, 9084, 12776, -2035 }
        local ladderpt = { "", 0, 100, 9616, 12783, -2017 }
        local nextPt = { "", 0, 150, 9763, 12814, -1527 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 150, 9763, 12815, -1527 }
        local nextPt = { "", 0, 150, 10326, 12765, -1350 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 1000, 10326, 12765, -1350 }
        local nextPt = { "", 0, 400, 10332, 14608, -1006 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 700, 10332, 14608, -1006 }
        local ladderpt = { "", 0, 100, 10769, 14555, -1007 }
        local nextPt = { "", 0, 200, 10913, 14560, -505 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 10913, 14560, -505 }
        local ladderpt = { "", 0, 100, 11384, 15101, -496 }
        local nextPt = { "", 0, 200, 11536, 15119, 3 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 50, 11537, 15120, 3 }
        local nextPt = { "", 0, 50, 12963, 15096, 5 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        --Кталха, верховная шаманка
        --打小BOSS
        local startpt =    { "Fallen Shaman", 0, 1500, 12963, 15096, 5 }
        local nextpt =    { "结束", 20, 3600, 13978, 15050, 18 }
        fun.FB_Attack(startpt, 0, ladderpt, nextpt)  --打BOSS 改成不锁定BOS，全打

        local attackPt = { "", 0, 500, 13978, 15050, 18 }
        local ladderpt = { "", 0, 100, 14482, 15223, 23 }
        local nextPt = { "", 0, 200, 14602, 15225, 1026 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


		--这里改大一点范围 0225
        local attackPt = { "", 0, 200, 14602, 15225, 1026 }
        local nextPt = { "", 0, 100, 15552, 15553, 1031 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

		--700改成750
        local attackPt = { "", 0, 750, 15552, 15553, 1031 }
        local ladderpt = { "", 0, 100, 15661, 16356, 1058 }
        local nextPt = { "", 0, 300, 15620, 18529, 26 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 700, 15655, 18428, 26 }
        local ladderpt = { "", 0, 100, 16856, 18937, -5 }
        local nextPt = { "", 0, 200,  17219, 18980, -7 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 700, 17172, 18976, -7 }
        local ladderpt = { "", 0, 100, 18139, 19642, 11 }
        local nextPt = { "", 0, 200, 18127, 20253, 5 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 100, 18168, 20285, 5 }
        local nextPt = { "", 0, 100, 18193, 21290, 5 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)



        --这里是需要开门
        if (Fun_IsHaveTaskBranch(taskId, 16, 0) == 1) then
            local attackPt = { "", 0, 300, 18193, 21290, 5 }
            local nextPt = { "", 0, 300, 6130, 9248, -1279 }
            Fun_Collection(attackPt, 6)
            local attackPt = { "", 0, 200, 18275, 21322, 5 }
            local nextPt = { "", 0, 200, 18171, 21930, 18 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        else
            local attackPt = { "", 0, 300, 18193, 21290, 5 }
            local nextPt = { "", 0, 300, 18171, 21930, 18 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end

        local attackPt = { "", 0, 200, 18166, 21883, 18 }
        local nextPt = { "", 0, 700, 18174, 24270, -118 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        if Fun_IsHaveTask(taskId, 17) == 1 then
            local attackPt = { "", 0, 2000, 18174, 24270, -118 }
            local nextPt = { "", 0, 2000, 18174, 24270, -118 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end

        local point1 = { "Thanatos", 1, 1000, 18189, 24321, -117 }
        local point2 = { "", 1, 100, 18193, 24316, -117 }
        Task_L_FbShieldShotBoss(602402, 18, point1, point2)

        local point = { "", 1, 50, 18166, 24441, -117 }
        Task_L_Collection(602402, 19, point)

        local AllTaskId = {602402,0}
        local point = {"",1,100,18144,25055,-120}
        Task_L_CheckTaskOver(10691,AllTaskId,point)
        --[[
        local point = { "", 1, 50, 18166, 24441, -117 }
        if Task_L_Collection(602402, 19, point) then
            local point = { "", 1, 100, 18175, 25045, -120 }
            Task_L_FbEndCollection(0, 0, point)
        end
        --local AllTaskId = { 602402, 0 }
        --Task_CheckTaskOver(AllTaskId, 18175, 24960, -120)
        ]]
    end
end


return LightInTheDark