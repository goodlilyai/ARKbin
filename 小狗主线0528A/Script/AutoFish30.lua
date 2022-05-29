
package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local myAutotaskFun = require("Script.Task.Autotask")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")

MSG("Lei_: 开始执行")
if myAutotaskFun.FB(30)==30 then   --副本
    MSG("Lei_: 等级已到30")
    if Task_L_GetLifeEnergy() >= 1000 then
        MSG("Lei_: 满足条件，去钓鱼")
        ChallengeThread()
        GlobalItemFun.Fun(0)
        AutoLifeThreadFun(2,1,1)
    else
        MSG("Lei_: 能量没满足条件,去邮寄")
        local point = {"",1,100,11222,14813,1021}
        Fun_L_NormalEmail("Lakebar","Lakebar",point)
        return 1;
    end
end

