
package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local fun = require("Script.LYFun")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")


MSG("Lei_: ��ʼִ�� 0521")
if Task_L_GetLifeEnergy() >= 1000 then
    MSG("Lei_: ����������ʼ����ְҵ")
    ChallengeThread()
    GlobalItemFun.Fun(0)

    AutoLifeThreadFun(2,1,1)
else
    MSG("Lei_: ����û��������,ȥ�ʼ�")
    local point = {"",1,100,11222,14813,1021}
    Fun_L_NormalEmail("Lakebar","Lakebar",point)
    return 1;
end
