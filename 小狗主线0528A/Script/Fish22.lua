
package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local myAutotaskFun = require("Script.Task.Autotask")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")

MSG("Lei_: 开始执行 0521")
if myAutotaskFun.FB(22)==22 then   --副本
    MSG("Lei_: 等级已到22")
    if Task_L_GetLifeEnergy() >= 1000 then
        
        ChallengeThread()
        GlobalItemFun.Fun(0)
        MSG("Lei_: 满足条件，去钓鱼")
        AutoLifeThreadFun(2,1,1)
    else
        MSG("Lei_: 能量没满足条件,去邮寄")
        local point = {"",1,100,11222,14813,1021}
        Fun_L_NormalEmail("Lakebar","Lakebar",point)
        return 1;
    end
end

