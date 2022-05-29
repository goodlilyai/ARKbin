package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local DelegateTaskFun = require("Script.Task.DelegateTask");  --1-50级脚本
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")

MSG("LYLUa 开始T3无限刷混沌副本 必须人物在Puniky大陆 0521")

--设置卖和分解函数，只要一个条件大于等于，不分解，不卖
--参数1：物品的物品等级
--参数2: 物品的颜色等级，0白色，1绿色，2蓝色，3紫色，4橙色
Item_L_SetItem(1320,4)
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
    if Fun_GetChaosNum() >= 0 then
        MSG("LYLUa 满足刷混沌条件")

        --买药品函数，也可以自己删掉这个函数，手动买药。 要药品函数和放到F1函数要同步使用。
        --参数1：药品数量
        --参数3：药品名字,大号可以修改
        --药品不建议用非常高等级的药，现在是70%回血，比如任务总血量8W，用21000的血正好
        local point = {"Sandra",1,100,-12827,3088,488}
        Fun_T_BuyItem(100,2,"Purified Healing Potion",point)
   
        --自动把药品放到F1 和上面买药品函数同步
        Fun_T_PushDwonDrug("Purified Healing Potion")
        
        Task_L_LoopEquipFun()
        Task_L_LoopEquipFun()
        Task_L_LoopEquipFun()
        Task_L_LoopEquipFun()
        MSG("LYlua 进入了修理函数")
        local BackHomeInfo = {
            0, --1比较小地图
            "Nia Village", --大地图
            "Nia Village", --小地图
            "Militia Command Center", --传送阵
            { -17426, 5106, 488 }, --修理NPC坐标
            { -12827, 3088, 488 } --买卖NPC坐标
        }
        Fun_BackHome(BackHomeInfo)

        local ChaosId = Fun_L_GetChaosId()
        local DungeonInfo = {
            0, -- 0.比较大地图  1.比较小地图
            "Nia Village", --大地图名称
            "Nia Village", --小地图名称
            "Militia Command Center", --传送阵名称
            1, --进副本类弄 0普通副本 1混沌副本
            ChaosId, --进副本需要的ID
            0, --弃用
            0, --难度等级
            0, --是否匹配
            { -13482, 5403, 498 }, --进副本的坐标
            { -13722, 5065, 488 }  --如果没有成功,则移动到这个坐标 再返回进副本的坐标
        }

        Fun_GoToDungeonsEx(DungeonInfo)
    else
        MSG("LYLUa: 能量没满足条件,去邮寄")
        local point = {"",1,100,-15806,4663,488}
        Fun_L_NormalEmail("Nia Village","Militia Command Center",point)
        return 1
    end
end
