package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local DelegateTaskFun = require("Script.Task.DelegateTask");  --1-50级脚本
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")

MSG("LY 开始日常任务-混沌-钓鱼  0404")

--设置卖和分解函数，只要一个条件大于等于，不分解，不卖
--参数1：物品的物品等级
--参数2: 物品的颜色等级，0白色，1绿色，2蓝色，3紫色，4橙色
Item_L_SetItem(1300,4)--这个保留1300装等和橙色物品
--设置复活
--参数：2原地复活，1副本外面复活，1混沌副本如果不想副本里面复活
Task_L_SetFuHuo(2)
--修理卖物品设置,满足一个就执行
--参数1:物品耐久百分比
--参数2:背包空余格数
Fun_SetBackHomeInfo(90, 20,0,0)
if Fun_IsInChaos("Chaos Dungeon") == 1 then
    MSG("LYLUa 混沌打怪")
    if Fun_ChaoAttack(0) == 9 then
        return 1
    end
else
    if DelegateTaskFun()==1 then   --副本
        MSG("LYLUa 日常任务完毕,去刷混沌副本")
        if Fun_GetChaosNum() > 0 then
            MSG("LYLUa 满足刷混沌条件")
            
            --买药品函数，也可以自己删掉这个函数，手动买药。 要药品函数和放到F1函数要同步使用。
            --参数1：药品数量
            --参数3：药品名字,大号可以修改
            local point = {"Magick Scholar Ethan",1,100,20126,13440,4910}
            Fun_T_BuyItem(100,2,"Super Healing Potion",point)
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
                ChaosId, --进副本需要的ID
                0, --弃用
                0, --难度等级
                0, --是否匹配
                { 19169, 13721, 4925 }, --进副本的坐标
                { 18945, 13943, 4913 }  --如果没有成功,则移动到这个坐标 再返回进副本的坐标
            }
            Fun_GoToDungeonsEx(DungeonInfo) 
        else
            if Task_L_GetLifeEnergy() >= 1000 then
                Fun_SetBackHomeInfo(90, 40,0,0)
                local point = {"",0,100,19525, 14588, 4911}
                if Task_L_LongGetTo(0x44aa21,1,11102,1,point) then
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
                        { 19525, 14588, 4911 }, --修理NPC坐标
                        { 20152, 13414, 4910 } --买卖NPC坐标
                    }
                    Fun_BackHome(BackHomeInfo)
                end
                MSG("LYLUa: 满足条件开始生活职业")
                AutoLifeThreadFun(6,1,1)
            else
                local glodret = 0 
                if GetRosterPoints() >= 70 then
                    MSG("LYLUa 日常值已满需要领取")
                    Fun_L_ReceiveReward()
                    Fun_Sleep(5000)
                end

                if FindItemCount("Una's Token") >= 80 then
                    local point = {"Una's Token",1,100,4764,9411,4226}
                    Item_L_ChangeGold(1,80,point)
                else
                    if FindItemCount("Hefty Gold Sack") >= 1 then
                        local point = {"",0,100,5237, 9226, 4226}
                        if FindWay(point) == 1 then
                            LoopUseItem("Hefty Gold Sack")
                            LoopUseItem("Thin Gold Bar")
                            LoopUseItem("Thick Gold Bar")
                        end
                    else
                        glodret = 1
                    end 
                else
                    glodret = 1
                end
                
                if glodret == 1 then
                    MSG("LYLUa: 能量没满足条件,去邮寄")
                    local point = {"",1,100,7031,7299,4226}
                    Fun_L_NormalEmail("Vern Castle","Crafting District",point)
                    return 1
                end
            end
        end
    end
end