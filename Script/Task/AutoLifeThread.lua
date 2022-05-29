


--第1个参数，生活职业类型：1钓鱼，2挖矿，3，砍树，4采集
--第2个参数，买道具的大地图
--第3个参数，钓鱼的大地图
--第4个参数，买道具的坐标点，以及传送阵名字
--第5个参数，钓鱼的坐标边，以及传送阵名字
--第6个参数，鱼钩下钩坐标点

AutoLifeThread = {}
--1：大陆序列 
--2:生活类型  1钓鱼，2挖矿，3，砍树，4采集
--3：点序列
function AutoLifeThread(MainLand,Type,Index)
    local ItemList = {
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest"
    }
    Item_L_UseBoxList(ItemList)
    if (MainLand == 2) then--卢特兰
        if (Type == 1) then
            if (Index == 1) then
                local ShopPoint = {"Lakebar",0,100,13184,13499,1023}--买道具点
                local FishPoint = {"Lakebar",0,100,8197,16605,963}--钓鱼点
                local HookPoint = {"",0,100,8100,16805,968}--下钩点
                Fun_L_LifeThread(Type,"Lakebar","Lakebar",ShopPoint,FishPoint,HookPoint)
            end
        end
    elseif (MainLand == 6) then--贝隆
        if (Type == 1) then
            if (Index == 1) then
                local ShopPoint = {"Plaza of Harmony",0,100,19305,1681,3846}--买道具点
                local FishPoint = {"Central Port",0,100,15298,13856,-126}--钓鱼点
                local HookPoint = {"",0,100,15541,20575,-106}--下钩点
                Fun_L_LifeThread(Type,"Vern Castle","Port Krona",ShopPoint,FishPoint,HookPoint)
            end
        end
    end   
    return 0 
end

return AutoLifeThread

