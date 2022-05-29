
package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local Auto50LevUpTask = require("Script.Task.50LevUp")
local myAutotaskFun = require("Script.Task.Autotask")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")


local point = {"",1,100,6956,7311,4226}
if FindWay(point) == 1 then
    Fun_Sleep(480000)
    local point = {"",1,100,6278,9266,4226}
    if FindWay(point) == 1 then
        Fun_Sleep(480000)
    end
end
