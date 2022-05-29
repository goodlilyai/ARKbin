
--死灵洞穴 0428
CaveOfDead = {}

function CaveOfDead.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")

    local FBMapId = 10764
    if Fun_IsInMapByMapId(FBMapId) then

        local point1 = {"",2,100,-6284,394,3071}
        local point2 = {"",1,100,-4926,756,2048}
        Task_L_LongGetTo(0xaf259,1,10764,2,point1,point2)

        local point = {"",0,100,-4787,1324,2048}
        Task_L_Collection(0xaf259 ,2,point)

        local point1 = {"",2,100,-4943, 1362, 2065}
        local point2 = {"",1,100,-4797, 2806, 1024}
        Task_L_LongGetTo(0xaf259,3,10764,2,point1,point2)


        local point1 = {"",2,100,-2934, 2789, 1025}
        local point2 = {"",1,100,-3302, 3132, 755}
        if Task_L_LongGetTo(0xaf259,4,10764,2,point1,point2) then
            local point = {"",1,100,-3302, 3132, 755 }
            Task_L_Collection(717401, 4, point)
        end

        local point1 = {"",2,100,-3267, 2865, 755}
        local point2 = {"",1,100,-3054, 5472, 1024}
        if Task_L_LongGetTo(0xaf259,5,10764,2,point1,point2) then
            local point = {"",0,600,-3054, 5472, 1024 }
            Task_L_Collection(0xaf259, 5, point)
        end

        local point = {"",0,600, -3054, 5472, 1024}
		Task_L_LoopAttackMonMore(0xaf259,6,0,1,point)

        local point = {"",0,600,-1993, 3914, 1024}
		Task_L_LoopCollectMore(0xaf259,7,0,1,point)

        local point = {"",0,600,-5111, 4547, 1025}
		Task_L_LoopCollectMore(0xaf259,7,1,1,point)

        local point = {"",0,600,-2993, 3766, 1024 }
        Task_L_Collection(0xaf259, 8, point)
        
        Task_AttackBoss(717401, 9,  -3404,3828,1024, "Corrupted Girapati")
        
        local task_id_arr = { 717401, 0 }
        local type = 0  --0代表打完捡东西回城 1.直接回城
        local rangept = { -3404,3828,1024 }  --坐标位置 用来判断
        local range = 1500  --范围
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end
    end
end

return CaveOfDead