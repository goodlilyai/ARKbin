package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local myAutotaskFun = require("Script.Task.Autotask");  --1-10���ű�
if myAutotaskFun.FB(10)==2 then
    MSG("LYLUa �Ѿ�����")
end
MSG("LY Testetsetet111111")