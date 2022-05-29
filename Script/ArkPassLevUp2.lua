package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local Auto50LevUpTask = require("Script.Task.50LevUp")
local myAutotaskFun = require("Script.Task.Autotask")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")
local ArkPassFun = require("Script.ArkPass")

MSG("LYLUa: 开始执行50直升2角色7级通行证 0527")

--设置卖和分解函数，只要一个条件大于等于，不分解，不卖
--参数1：物品的物品等级
--参数2: 物品的颜色等级，0白色，1绿色，2蓝色，3紫色，4橙色
Item_L_SetItem(1300,4)
--设置复活
--参数：2原地复活，1副本外面复活，1混沌副本如果不想副本里面复活
Task_L_SetFuHuo(2)
--修理卖物品设置,满足一个就执行
--参数1:物品耐久百分比
--参数2:背包空余格数
if GetArkPassLev() < 7 then
    Fun_SetBackHomeInfo(90, 20,0,0)
else
    Fun_SetBackHomeInfo(80, 20,0,0)  
end

if Fun_IsInChaos("Chaos Dungeon") == 1 then
    MSG("LYLUa 混沌打怪")
    if Fun_ChaoAttack(0) == 9 then
        return 1
    end
else
    local ret
    if GetCharactIndex() == 0 then
        MSG("LYLUa 执行50任务脚本")
        ret = myAutotaskFun.FB(50)
    else
        MSG("LYLUa 执行50直升脚本")
        ret = Auto50LevUpTask.FB(50)
    end

    if ret == 50 then   --副本
        MSG("LYLUa 开始刷混沌")
        --设置移动速度
        --参数：0不加速，1加速，2超级加速，3终极加速
        SetSpeed(0)

        if Task_L_GetTaskIsComplete(0x47b761) then
            Task_L_CompleteGlobalTask(0x47b761,-1)
        end

        if Task_L_GetTaskIsComplete(0x47b762) then
            Task_L_CompleteGlobalTask(0x47b762,-1)
        end

        if Task_L_GetTaskIsComplete(0x47b763) then
            Task_L_CompleteGlobalTask(0x47b763,-1)
        end

        if Task_L_FindTask(0x47b761) == 0 and Task_L_FindTask(0x47b762) == 0 and Task_L_FindTask(0x47b763) == 0 then
            
            if GetIsCanRecv(0x47b761) == 1 then
                Task_L_AcceptGlobalTask(0x47b761)
                Fun_Sleep(2000)
            end

            if Task_L_FindTask(0x47b761) == 0 then
                if GetIsCanRecv(0x47b762) == 1 then
                    Task_L_AcceptGlobalTask(0x47b762)
                    Fun_Sleep(2000)
                end
            end

            if Task_L_FindTask(0x47b761) == 0 then
                if Task_L_FindTask(0x47b762) == 0 then
                    if GetIsCanRecv(0x47b763) == 1 then
                        Task_L_AcceptGlobalTask(0x47b763)
                        Fun_Sleep(2000)
                    end
                end
            end
        end

        if FindTransmit("Plaza of Harmony") == 1 then 
            if Task_L_FindTask(0x47b761) == 1 or Task_L_FindTask(0x47b762) == 1 or Task_L_FindTask(0x47b763) == 1 then
                MSG("LYLUa 贝隆 满足刷混沌条件")
                
                --买药品函数，也可以自己删掉这个函数，手动买药。 要药品函数和放到F1函数要同步使用。
                --参数1：药品数量
                --参数3：药品名字,大号可以修改
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

                MSG("LYLUa 混沌刷完，需要换角色")

                if Fun_IsInMapByMapId(11102) then
                else
                    local point = {"",1,100,14355,14679,5053}
                    Fun_L_Transmit("Plaza of Harmony",point)
                end

                local glodret = 0 
                if GetCharactIndex() == 0 then
                    if GetRosterPoints() >= 70 then
                        MSG("LYLUa 日常值已满需要领取")
                        Fun_L_ReceiveReward()
                        Fun_Sleep(2000)
                    end

                    if FindItemCount("Una's Token") >= 80 then
                        local point = {"Una's Token",1,100,4764,9411,4226}
                        Item_L_ChangeGold(1,80,point)
                    else
                        if FindItemCount("Hefty Gold Sack") >= 1 then
                            local point = {"",0,100,5237, 9226, 4226}
                            if FindWay(point) == 1 then
                                GlobalItemFun.Fun(0)
                                LoopUseItem("Hefty Gold Sack")
                                LoopUseItem("Thin Gold Bar")
                                LoopUseItem("Thick Gold Bar")
                            end
                        else
                            LoopUseItem("Thin Gold Bar")
                            LoopUseItem("Thick Gold Bar")
                            glodret = 1
                        end   
                    end    
                else
                    glodret = 1
                end
                
                local exchageret
                if GetCharactIndex() == 0 and GetRosterPoints() >= 70 then
                    if ShoppingRevGift() == 1 then
                        local point = {"",1,100,7031,7299,4226}
                        if RevEmail("Vern Castle","Crafting District",point) == 1 then
                            local point = {"",0,100,6690, 8260, 4226}
                            FindWay(point)
                            GlobalItemFun.Fun(0)
                            LoopUseItemBox(5,"Battle Item Selection Chest")
                            LoopUseItemBox(0,"Destruction Stone Selection Pouch")
                            LoopUseItemBox(0,"Guardian Stone Selection Pouch")
                            LoopUseItemBox(0,"Sailing Coin Selection Chest")
                            LoopUseItemBox(0,"Honing Leapstone Selection Chest")
                            LoopUseItemBox(0,"Honing Shard Selection Chest")
                            GlobalItemFun.Fun(0)
                            MSG("LYLUa 准备去强化")
                            local point = {"",1,100,7482,8591,4285}
                            if Strengthen(1,100000,10,point) ==1 then  
                            
                                MSG("LYLUa 强化完成")
                                if ChallengeThread() == 1 then
                                    if GetArkPassLev() < 7 then
                                        --获取任务是否完成
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Repair Ship") == 1 then
                                                MSG("LYLUa 发现修理船只任务没有完成")
                                                ArkPassFun.Fun(0,GetArkPassExp(),1)
                                            end
                                        end
                                    end

                                    if GetArkPassLev() < 7 then
                                        --获取任务是否完成
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Use Recovery Battle Item") == 1 then
                                                MSG("LYLUa 发现使用战斗药剂没有完成")
                                                ArkPassFun.Fun(1,GetArkPassExp(),1)
                                            end
                                        end
                                    end
                                        
                                    MSG("LYLUa Challenge 领取完毕")
                                    local point = {"",0,100,6690, 8260, 4226}
                                    FindWay(point)
                                    
                                    if ArkPassThread() == 1 then 
                                        GlobalItemFun.Fun(0)
                                        MSG("LYLUa arkpass 完毕")
                                        exchageret = 1
                                    end
                                end
                            end
                        end
                    end
                else
                    exchageret = 1
                end
                
                if exchageret == 1 and glodret == 1 then
                    local point = {"",0,2000, 19169, 13721, 4925}
                    if Fun_IsInPoint(point) == 1 then
                        local point = {"",0,100,13301, 7576, 4262}
                        FindWay(point)
                    end

                    local point = {"",1,100,7031,7299,4226}
                    local retvalue = VernPowerpass(0,point)

                    if retvalue == 1 and 
                    GetCharactIndex() == 0 and 
                    GetRosterPoints() >= 70 then
                        MSG("LYLUa 直升全部操作完毕,去邮寄,需要换账号")
                        local point = {"",1,100,7031,7299,4226}
                        Fun_L_NormalEmail("Vern Castle","Crafting District",point)
                        return 1
                    end

                    if retvalue == 2 then
                        MSG("LYLUa 新建角色没有发现直升卡,需要换账号")
                        Fun_SetConfigValue(6)
                    end
                end
            end
        else
            if Task_L_FindTask(0x47b761) == 1 or Task_L_FindTask(0x47b762) == 1 or Task_L_FindTask(0x47b763) == 1 then
                MSG("LYLUa 卢特兰 满足刷混沌条件")
                
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
            else

                MSG("LYLUa 混沌刷完，需要换角色")

                if Fun_IsInMapByMapId(10801) then
                else
                    local point = {"",1,100,3383,4578,424}
                    Fun_L_Transmit("Market District",point)
                end

                local glodret = 0 
                if GetCharactIndex() == 0 then
                    MSG("LYLUa 日常值已满需要领取0")
                    if GetRosterPoints() >= 70 then
                        MSG("LYLUa 日常值已满需要领取1")
                        Fun_L_ReceiveReward()
                        Fun_Sleep(2000)
                    end

                    if FindItemCount("Una's Token") >= 80 then
                        local point = {"Una's Token",1,100,311,5868,448}
                        Item_L_ChangeGold(1,80,point)
                    else
                        if FindItemCount("Hefty Gold Sack") >= 1 then
                            local point = {"",0,100,-26, 5794, 453}
                            if FindWay(point) == 1 then
                                GlobalItemFun.Fun(0)
                                LoopUseItem("Hefty Gold Sack")
                                LoopUseItem("Thin Gold Bar")
                                LoopUseItem("Thick Gold Bar")
                            end
                        else
                            LoopUseItem("Thin Gold Bar")
                            LoopUseItem("Thick Gold Bar")
                            glodret = 1
                        end
                    end
                else
                    glodret = 1
                end

                local exchageret
                if GetCharactIndex() == 0 and GetRosterPoints() >= 70 then
                    if ShoppingRevGift() == 1 then
                        local point = {"",1,100,-580,5473,448}
                        if RevEmail("Luterra Castle","Market District",point) == 1 then
                            local point = {"",0,100,-26, 5794, 453}
                            FindWay(point)

                            GlobalItemFun.Fun(0)
                            LoopUseItemBox(5,"Battle Item Selection Chest")
                            LoopUseItemBox(0,"Destruction Stone Selection Pouch")
                            LoopUseItemBox(0,"Guardian Stone Selection Pouch")
                            LoopUseItemBox(0,"Sailing Coin Selection Chest")
                            LoopUseItemBox(0,"Honing Leapstone Selection Chest")
                            LoopUseItemBox(0,"Honing Shard Selection Chest")
                            GlobalItemFun.Fun(0)

                            local point = {"",1,100,1984,7534,448}
                            if Strengthen(1,100000,12,point) ==1 then  
                            
                                MSG("LYLUa 强化完成")
                                if ChallengeThread() == 1 then
                                    if GetArkPassLev() < 7 then
                                        --获取任务是否完成
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Repair Ship") == 1 then
                                                MSG("LYLUa 发现修理船只任务没有完成")
                                                ArkPassFun.Fun(0,GetArkPassExp(),1)
                                            end
                                        end
                                    end

                                    if GetArkPassLev() < 7 then
                                        --获取任务是否完成
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Use Recovery Battle Item") == 1 then
                                                MSG("LYLUa 发现使用战斗药剂没有完成")
                                                ArkPassFun.Fun(1,GetArkPassExp(),1)
                                            end
                                        end
                                    end
                                        
                                    MSG("LYLUa Challenge 领取完毕")
                                    local point = {"",0,100,-26, 5794, 453}
                                    FindWay(point)
                                    
                                    if ArkPassThread() == 1 then 
                                        GlobalItemFun.Fun(0)
                                        MSG("LYLUa arkpass 完毕")
                                        exchageret = 1
                                    end
                                end
                            end
                        end
                    end
                else
                    exchageret = 1
                end
                
                if exchageret == 1 and glodret == 1 then
                    local point = {"",1,100,-580,5473,448}
                    local retvalue = VernPowerpass(0,point)

                    if retvalue == 1 and 
                    GetCharactIndex() == 0 and 
                    GetRosterPoints() >= 70 then
                        MSG("LYLUa 直升全部操作完毕,去邮寄,需要换账号")
                        local point = {"",1,100,-580,5473,448}
                        Fun_L_NormalEmail("Luterra Castle","Market District",point)
                        return 1
                    end

                    if retvalue == 2 then
                        MSG("LYLUa 新建角色没有发现直升卡,需要换账号")
                        Fun_SetConfigValue(6)
                    end
                end
            end
        end
    end
end
