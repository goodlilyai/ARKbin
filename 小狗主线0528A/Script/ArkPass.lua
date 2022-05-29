package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
ArkPass  = {}

function ArkPass.Fun(IsMatch,value,type)
    while (1) 
    do
        if IsThreadExitCode() == 1 then
            MSG("LYLUA 退出线程")
            return 0
        end

        if IsMatch == 1 then
            if Fun_IsInChaos("Chaos Dungeon") == 1 then
                MSG("LYLUa 混沌打怪")
                if GetArkPassExp() >= (value+50) then
                    Fun_ChaoAttack(0)
                else
                    Fun_ChaoAttack(2)
                end
            else
                if GetArkPassExp() >= (value+50) then
                    return 1
                else
                    if FindTransmit("Plaza of Harmony") == 1 then 
                        local point = {"Magick Scholar Ethan",1,100,20126,13440,4910}
                        Fun_T_BuyItem(50,2,"Super Healing Potion",point)
                
                        --自动把药品放到F1 和上面买药品函数同步
                        Fun_T_PushDwonDrug("Super Healing Potion")
                        
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        MSG("LYlua 进入了修理函数")
                        local BackHomeInfo = {
                            0, --1比较小地图
                            "Vern Castle", --大地图
                            "Vern Castle", --小地图
                            "Plaza of Harmony", --传送阵
                            { 19498, 14547, 4911 }, --修理NPC坐标
                            { 20133, 13453, 4910 } --买卖NPC坐标
                        }
                        Fun_BackHome(BackHomeInfo)
        
                        local ChaosId = Fun_L_GetChaosId()
                        local DungeonInfo = {
                            0, -- 0.比较大地图  1.比较小地图
                            "Vern Castle", --大地图名称
                            "Vern Castle", --小地图名称
                            "Plaza of Harmony", --传送阵名称
                            1, --进副本类弄 0普通副本 1混沌副本
                            1, --进副本需要的ID
                            0, --弃用
                            0, --难度等级
                            0, --是否匹配
                            { 19169, 13721, 4925 }, --进副本的坐标
                            { 18945, 13943, 4913 }  --如果没有成功,则移动到这个坐标 再返回进副本的坐标
                        }
                        Fun_GoToDungeonsEx(DungeonInfo)
                    else
                        --买药品函数，也可以自己删掉这个函数，手动买药。 要药品函数和放到F1函数要同步使用。
                        --参数1：药品数量
                        --参数3：药品名字,大号可以修改
                        local point = {"Calfarr",1,100,5371,4414,448}
                        Fun_T_BuyItem(50,2,"Super Healing Potion",point)
                
                        --自动把药品放到F1 和上面买药品函数同步
                        Fun_T_PushDwonDrug("Super Healing Potion")
                        
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        MSG("LYlua 进入了修理函数")
                        local BackHomeInfo = {
                            0, --1比较小地图
                            "Luterra Castle", --大地图
                            "Luterra Castle", --小地图
                            "Market District", --传送阵
                            { 4933, 4481, 448 }, --修理NPC坐标
                            { 5371, 4414, 448} --买卖NPC坐标
                        }
                        Fun_BackHome(BackHomeInfo)

                        local ChaosId = Fun_L_GetChaosId()
                        local DungeonInfo = {
                            0, -- 0.比较大地图  1.比较小地图
                            "Luterra Castle", --大地图名称
                            "Luterra Castle", --小地图名称
                            "Market District", --传送阵名称
                            1, --进副本类弄 0普通副本 1混沌副本
                            1, --进副本需要的ID
                            0, --弃用
                            0, --难度等级
                            0, --是否匹配
                            { 4435, 5517, 448 }, --进副本的坐标
                            { 4205, 5318, 448 }  --如果没有成功,则移动到这个坐标 再返回进副本的坐标
                        }
                        Fun_GoToDungeonsEx(DungeonInfo)
                    end
                end
            end
        else
            --去修理船只
            if Fun_IsInMapByMapId(11102) then
                --贝隆城
                if GetArkPassExp() >= (value+50) then
                    return 1
                else
                    local point = {"",1,100,13713,13262,-110}
                    Fun_L_Transmit("Central Port",point)
                end
            end
            if Fun_IsInMapByMapId(11111) then
                --贝隆港口
                if GetArkPassExp() >= (value+50) then
                    local point = {"",1,100,5427,8032,4273}
                    Fun_L_Transmit("Crafting District",point)
                else
                    local point = {"",1,100,14416,11306,-117}
                    FindWay(point)
                end
            end

            if Fun_IsInMapByMapId(10801) then
                --卢特兰
                if GetArkPassExp() >= (value+50) then
                    return 1
                else
                    local point = {"",1,100,6794,6974,562}
                    Fun_L_Transmit("Wavestrand Port",point)
                end
            end
            if Fun_IsInMapByMapId(10804) then
                --在卢特兰港口
                if GetArkPassExp() >= (value+50) then
                    local point = {"",1,100,3383,4578,424}
                    Fun_L_Transmit("Market District",point)
                else
                    local point = {"",1,100,3302,13909,-144}
                    FindWay(point)
                end
            end
            if Fun_IsInMapByMapId(30703) then
                --在港口了
                if type == 1 then
                    if GetArkPassExp() >= (value+50) then
                        local point = {"",1,100,12646,16664,1}
                        SeaToLand(30703,point)
                    else
                        --贝隆港口
                        local point = {"",1,100,13511,17956,1}
                        SeaToPoint(point)

                        local point = {"",1,100,12646,16664,1}
                        SeaToBack(point)
                    end
                else
                    if GetArkPassExp() >= (value+50) then
                        local point = {"",1,100,-32214,32204,1}
                        SeaToLand(30703,point)
                    else
                        --贝隆港口
                        local point = {"",1,100,-32400,33243,1}
                        SeaToPoint(point)

                        local point = {"",1,100,-32214,32204,1}
                        SeaToBack(point)
                    end
                end
            end
        end
    end
end

return ArkPass