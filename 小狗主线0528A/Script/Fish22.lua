
package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local myAutotaskFun = require("Script.Task.Autotask")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")

MSG("Lei_: ��ʼִ�� 0521")
if myAutotaskFun.FB(22)==22 then   --����
    MSG("Lei_: �ȼ��ѵ�22")
    if Task_L_GetLifeEnergy() >= 1000 then
        
        ChallengeThread()
        GlobalItemFun.Fun(0)
        MSG("Lei_: ����������ȥ����")
        AutoLifeThreadFun(2,1,1)
    else
        MSG("Lei_: ����û��������,ȥ�ʼ�")
        local point = {"",1,100,11222,14813,1021}
        Fun_L_NormalEmail("Lakebar","Lakebar",point)
        return 1;
    end
end

