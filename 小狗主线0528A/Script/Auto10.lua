package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local myAutotaskFun = require("Script.Task.Autotask");  --1-10级脚本
if myAutotaskFun.FB(10)==2 then
    MSG("LYLUa 已经到了")
end
MSG("LY Testetsetet111111")