
package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local fun = require("Script.LYFun")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")


if Task_L_GetLifeEnergy() >= 1000 then
    MSG("Lei_: ����������ʼ����ְҵ")
    ChallengeThread()
    GlobalItemFun.Fun(0)

    AutoLifeThreadFun(6,1,1)
else
    local point = {"",1,100,13206,7636,4262}
    if FindWay(point) == 1 then
        MSG("Lei_: ����û��������,ȥ�ʼ�")
        local point = {"",1,100,7031,7299,4226}
        Fun_L_NormalEmail("Vern Castle","Crafting District",point)
        return 1
    end
end
