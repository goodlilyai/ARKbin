--��ϣ�����о�����  0330

AiXiMan = {}

function AiXiMan.FB(IsMatch)
    package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
    local fun = require("Script.LYFun")
    --package.path = "D:/lua/LYFun.lua"
    --local fun = require("LYFun");
    local FBMapId = 10462

    if Fun_IsInMapByMapId(FBMapId) then
        Task_Goto(0x2dfb19,1,-514,3876,64)
        Task_Collection(0x2dfb19,2,-157,3950,64)

        if Fun_IsHaveTask(0x2dfb19, 3) == 1 then
            local attackPt = {"",0,800,-205,3924,64}
            local nextPt = {"",0,50,-1958,8401,65}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local attackPt = {"",0,800,-1958,8401,65}
            local nextPt = {"",0,50,-1852,8821,69}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end
        if Fun_IsHaveTask(0x2dfb19, 4) == 1 then
            local attackPt = {"",0,800,-1852,8821,69}
            local nextPt = {"",0,50,818,9774,577}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local attackPt = {"",0,800,818,9774,577}
            local nextPt = {"",0,50,818,9774,577}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end


        Task_Attack(0x2dfb19,5, 1255,7761,577,0)
        if Fun_IsHaveTask(0x2dfb19, 6) == 1 then
            local point = { "1", 0, 50,1422,7067,667}
            FindWay(point)
            local point = { "2", 0, 50,1452,6817,753}
            FindWay(point)
            local point = { "2", 0, 50,1141,6880,746}
            FindWay(point)
            local point = { "2", 0, 50,1288,7527,583}
            FindWay(point)
        end


        --Task_Goto(0x2dfb19,6,1422,7067,667)
        --Task_Attack(0x2dfb19,4, -1958,8401,65,0)
        Task_Collection(0x2dfb19,7,1451,6823,753)
        Task_Attack(0x2dfb19,8, 1118,5822,761,0)
        Task_Collection(0x2dfb19,9,1818,5680,762)

        if Fun_IsHaveTask(0x2dfb19, 10) == 1 then
            local attackPt = {"",0,600,1818,5680,762}
            local nextPt = {"",0,50,1314,3476,757}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local point = { "������", 0, 200,1314,3476,757}
            if (Fun_IsInPoint(point) == 1) then
                local transiPt = { 1314,3476,757 }
                Fun_GotoTransi(transiPt)
            end

            local attackPt = {"",0,400,1280,3140,53}
            local nextPt = {"",0,50,2712,3114,72}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)
        end
        
        if Fun_IsHaveTask(0x2dfb19, 11) == 1 then
            local attackPt = {"",0,500,2712,3114,72}
            local nextPt = {"",0,50,9291,1891,64}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dfb1a, 1) == 1 then
            local attackPt = {"",0,500,9291,1891,64}
            local nextPt = {"",0,50,11624,5778,66}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end
        if Fun_IsHaveTask(0x2dfb1a, 2) == 1 then
            local attackPt = {"1",0,1000,11449,6436,66}
            local nextPt = {"",0,50,10791,7981,-58}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local attackPt = {"2",0,600,10791,7981,-58}
            local nextPt = {"",0,50,10803,9640,-57}
            fun.FB_Attack(attackPt,0,ladderpt,nextPt)

            local attackPt = {"3",0,600,10797,9710,-57}
            local nextPt = {"",0,50,10906,12191,-60}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local attackPt = {"",0,700,10906,12191,-60}
            local nextPt = {"",0,50,8705,11130,-318}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local attackPt = {"",0,900,8705,11130,-318}
            local nextPt = {"",0,50,8947,8839,-310}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)

            local attackPt = {"",0,700,8947,8839,-310}
            local nextPt = {"",0,50,11449,6436,66}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end

        if Fun_IsHaveTask(0x2dfb1a, 3) == 1 then
            Task_Goto(0x2dfb1a,3,9176,7942,-447)
        end

        if Fun_IsHaveTask(0x2dfb1a, 4) == 1 then
            Task_Collection(0x2dfb1a,4,9176,7942,-447)
        end

        if Fun_IsHaveTask(0x2dfb1a, 5) == 1 then
            Task_Attack(0x2dfb1a,5, 8812,6620,-455,0)
        end
        
        if Fun_IsHaveTask(0x2dfb1a, 6) == 1 then
            local point = {"",1,800,9486,6775,-453}
            Task_L_Collection(0x2dfb1a ,6,point)
        end

        if Fun_IsHaveTask(0x2dfb1a, 7) == 1 then
            local point1 = {"",10,300,8928,4834,-447}
            local point2 = {"",0,1000,10065,1907,64 }
            if Task_L_LongGetTo(0x2dfb1a, 7,10462,2,point1,point2) then
                local point = { "", 0, 900, 10065,1907,64 }
                Task_L_Collection(0x2dfb1a,7,point)
            end
        end
        if Fun_IsHaveTask(0x2dfb1a, 8) == 1 then
            local attackPt = {"",0,1200,10638,1966,71}
            local nextPt = {"",0,50,13998,1948,71}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end
        if Fun_IsHaveTask(0x2dfb1b, 1) == 1 then
            local attackPt = {"",1,1500,14926,1972,79}
            local nextPt = {"",0,50,14926,1972,79}
            fun.FB_Attack(attackPt,3,ladderpt,nextPt)
        end
        
        Task_Collection(0x2dfb1b,2,16577,1910,193)
        local task_id_arr = { 0x2dfb1b,0x2dfb1a,0x2dfb19 }
        local type = 0  --0�����������س� 1.ֱ�ӻس�
        local rangept = { 14926,1972,79}  --����λ�� �����ж�
        local range = 1800  --��Χ
        if Task_CheckTaskOverEx(FBMapId, task_id_arr, type, rangept, range) == 1 then
            return 1
        end
   --[[ else
        local DungeonInfo = {
            0, -- 0.�Ƚϴ��ͼ  1.�Ƚ�С��ͼ
            "����ӧ�� ������ڧ�", --���ͼ����
            "����ӧ�� ������ڧ�", --С��ͼ����
            "����է��ѧߧ�ڧ� ?���֧��?", --����������
            0, --��������Ū 0��ͨ���� 1���縱��
            0x28de, --��������Ҫ��ID
            0, --����ǽ����縱�� ����Ҫ���
            0, --�Ѷȵȼ�
            0, --�Ƿ�ƥ��
            {4148,4769,-1022 }, --������������
            {3720,4812,-1024 }        --���û�гɹ�,���ƶ���������� �ٷ��ؽ�����������
        }
        Fun_GoToDungeonsEx(DungeonInfo)]]
    end
end

return AiXiMan