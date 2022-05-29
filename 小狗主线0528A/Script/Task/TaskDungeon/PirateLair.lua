--海盗巢穴副本  0413
--0000000000002B2B
--package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
--local fun = require("Script.LYFun");
PirateLair = {}

function PirateLair.FB(IsMatch)

    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
    local FBMapId = 11051
    if Fun_IsInMapByMapId(FBMapId) then

        local attackPt = { "", 2, 300, 17304, 3274, 632 }
        local nextPt = { "", 0, 50, 16817, 3136, 636 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 100, 16817, 3136, 636 }
        local ladderpt = { "", 0, 100, 16806, 3151, 642 }
        local nextPt = { "", 0, 200, 16713, 3152, 144 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)


        local attackPt = { "", 0, 300, 16713, 3152, 144 }
        local nextPt = { "", 0, 50, 16370, 4361, 144 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 600, 16370, 4361, 144 }
        local ladderpt = { "", 0, 100, 16604, 4321, 154 }
        local nextPt = { "", 0, 200, 16760, 4346, 645 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 16760, 4346, 645 }
        local nextPt = { "", 0, 50, 17160, 4810, 647 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 17160, 4810, 647 }
        local ladderpt = { "", 0, 100, 16986, 4901, 656 }
        local nextPt = { "", 0, 100, 16650, 4994, 645 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 16650, 4994, 645 }
        local ladderpt = { "", 0, 100, 16431, 5052, 666 }
        local nextPt = { "", 0, 200, 16201, 5313, 897 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 16201, 5313, 897 }
        local nextPt = { "", 0, 50, 15299, 5838, 899 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        local attackPt = { "打小BOOS过梯子", 0, 700, 15299, 5838, 899 }
        local ladderpt = { "", 0, 100, 14690, 5645, 911 }
        local nextPt = { "", 0, 200, 14575, 5311, 649 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "过完梯子点", 0, 300, 14575, 5311, 649 }
        local nextPt = { "", 0, 50, 13978, 5046, 651 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "再过一次梯子", 0, 400, 13978, 5046, 651 }
        local ladderpt = { "", 0, 80, 13793, 5402, 663 }
        local nextPt = { "", 0, 150, 13751, 5538, 1161 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "这个梯子范围很小", 0, 300, 13751, 5538, 1161 }
        local ladderpt = { "", 0, 80, 13541, 5748, 1161 }
        local nextPt = { "", 0, 300, 12315, 5809, 142 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 12315, 5809, 142 }
        local nextPt = { "", 0, 50, 11235,5831,144 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 0, 2000, 11235,5831,144 }
        if (Fun_IsInPoint(attackPt) == 1) then
            MSG("LYlua 找到搬箱子的地方")
            if Fun_AttackMonByRangeNoBack(attackPt) == 2 then
                local startPt = { "", 0, 180, 11235,5831,144 }
                if (Fun_CheckCarryInPoint(startPt) == 1) then
                    MSG("LYLUa 开始处理线箱子线程")
                    local nextPt = { "", 0, 180,  10778,5758,144 }
                    Fun_MoveCarryToNextPt(startPt, nextPt)
                else
                    MSG("LYLUa 开始处理移动到机关线程")
                    local ladderPt = { "", 0, 300, 11409,6579,144 }
                    if Fun_IsFindDoor(ladderPt) == 1 then
                        MSG("LYLUa 找到了门移动去开门")
                        Fun_GotoOpenDoor(ladderPt)
                    end
                end
            end
            --没有怪才去搬箱子
        end


        --过了加载画面
        local attackPt = { "", 0, 300, 6980, 21157, -0 }
        local nextPt = { "", 0, 50, 8197, 21042, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 500, 8197, 21042, -0 }
        local nextPt = { "", 0, 50, 9803, 21110, -0 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)


        local attackPt = { "", 2, 800, 9803, 21110, -0 }
        local nextPt = { "", 0, 50, 10228, 21288, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 2, 500, 10228, 21288, -0 }
        local nextPt = { "", 0, 50, 11119, 21804, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 11119, 21804, -0 }
        local nextPt = { "", 0, 50, 10231, 23846, 0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 10231, 23846, 0 }
        local nextPt = { "", 0, 50, 11965, 24311, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 11965, 24311, -0 }
        local nextPt = { "", 0, 50, 12821, 24418, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 12821, 24418, -0 }
        local nextPt = { "", 0, 50, 13372, 24168, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 2, 300, 13372, 24168, -0 }
        local nextPt = { "", 0, 50, 14563, 24272, -0 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        if Fun_IsHaveTask(1006401, 8) == 1 then
            local attackPt = { "", 0, 900, 14563, 24272, -0 }
            local nextPt = { "", 0, 50, 14329, 24390, -0 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end
        --砍树的时候看下任务ID 是多少 --可能是9  要先去打任斧头，然后装备上去
        if Fun_IsHaveTask(1006401, 9) == 1 then
            MSG("Lei 打箱子1111")
            local attackPt = { "", 2, 300, 14329, 24390, -0 }
            local nextPt = { "", 0, 50, 14563, 24272, -0 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

            local attackPt = { "", 0, 800, 15128, 24814, -0 }
            Fun_UseGenAttack()
            if Fun_AttackMonByRange(attackPt) == 2 then
                local attackPt = { "", 0, 200, 15128, 24814, -0 }
                if Fun_IsFindDoor(attackPt) == 1 then
                    MSG("LYLUa 找到了门移动去开门")
                    Item_L_UseLifeAex("Old Logging Tool (Axe)")
                    Fun_GotoOpenDoor(attackPt)
                end
            end 
        end
        --切换攻击姿态
        if Fun_IsHaveTask(1006401, 10) == 1 then
            Item_L_UseLifeAex("Old Logging Tool (Axe)")
            Fun_UseGenAttack()
        end
        --在一个点.也用任务卡着
        if Fun_IsHaveTask(1006401, 10) == 1 then

            local point1 = {"",2,100,15309, 24722, -0 }
            local point2 = {"",0,100,16105, 23921, -15 }
            Task_L_LongGetTo(1006401,10,11051,2,point1,point2)
            --CurIndex: 10
            local attackPt = { "", 0, 300, 14995, 24851, -0 }
            local ladderpt = { "", 0, 80, 15309, 24722, -0 }
            local nextPt = { "", 0, 200, 16105, 23921, -15 }
            --fun.FB_Attack(attackPt, 1, ladderpt, nextPt)
        end

        local attackPt = { "", 0, 400, 16105, 23921, -15 }
        local nextPt = { "", 0, 50, 18209, 20143, -226 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        --有阻挡物
        local attackPt = { "", 0, 700, 18209, 20143, -226 }
        local nextPt = { "", 0, 50, 21745, 20143, -226 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 2, 800, 21745, 20143, -226 }
        local nextPt = { "", 0, 50, 22019, 22623, -227 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 22019, 22623, -227 }
        local nextPt = { "", 0, 50, 22426, 23912, -317 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)

        local attackPt = { "", 0, 700, 22426, 23912, -317 }
        local nextPt = { "", 0, 50, 23179, 25041, -680 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        local attackPt = { "", 0, 500, 23179, 25041, -680 }
        local nextPt = { "", 0, 50, 20007, 24991, -207 }
        fun.FB_Attack(attackPt, 3, ladderpt, nextPt)


        local attackPt = { "", 0, 140, 20007, 24991, -207 }
        local ladderpt = { "", 0, 100, 20022, 24957, -207 }
        local nextPt = { "", 0, 200, 20254, 25067, 61 }
        fun.FB_Attack(attackPt, 1, ladderpt, nextPt)

        local attackPt = { "", 0, 200, 20254, 25067, 61 }
        local nextPt = { "", 0, 50, 21009, 24482, 58 }
        fun.FB_Attack(attackPt, 0, ladderpt, nextPt)

        if Fun_IsHaveTask(1006401, 12) == 1 then
            local attackPt = { "", 0, 700, 21009, 24482, 58 }
            local nextPt = { "", 0, 50, 21009, 24482, 58 }
            fun.FB_Attack(attackPt, 0, ladderpt, nextPt)
        end
        --CurIndex: 14
        --[[if Fun_IsHaveTask(1006401, 13) == 1 then
            local ladderpt = { "", 0, 400, 21120, 23918, 58 }
            if Fun_IsFindDoor(ladderpt) == 1 then
                MSG("LYLUa 找到了门移动去开门")
                Fun_GotoOpenDoor(ladderpt)
            end
        end]]
        Task_Collection(1006401,13,21120, 23918, 58)
        if Fun_IsHaveTask(1006401, 14) == 1 then
            local attackPt = { "Guardian Eolh", 1, 2000, 20989, 24098, 58 }
            local nextPt = { "", 0, 50, 20989, 24098, 58 }
            fun.FB_Attack(attackPt, 2, ladderpt, nextPt)

            local attackPt = {"",0,2000,22251,26156,-680}
            local nextPt = {"",0,50,22251,26156,-680}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end
 

        local task_id_arr = { 1006401, 0 }
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { 22842, 26031, -684 }  --坐标位置 用来判断
        local range = 1500  --范围
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end

    end
end

return PirateLair