package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
ArkPass  = {}

function ArkPass.Fun(IsMatch,value,type)
    while (1) 
    do
        if IsThreadExitCode() == 1 then
            MSG("LYLUA �˳��߳�")
            return 0
        end

        if IsMatch == 1 then
            if Fun_IsInChaos("Chaos Dungeon") == 1 then
                MSG("LYLUa ������")
                if GetArkPassExp() >= (value+50) then
                    Fun_ChaoAttack(0)
                else
                    Fun_ChaoAttack(2)
                end
            else
                if GetArkPassExp() >= (value+50) then
                    return 1
                else
                    if FindTransmit("Plaza of Harmony") == 1 then 
                        local point = {"Magick Scholar Ethan",1,100,20126,13440,4910}
                        Fun_T_BuyItem(50,2,"Super Healing Potion",point)
                
                        --�Զ���ҩƷ�ŵ�F1 ��������ҩƷ����ͬ��
                        Fun_T_PushDwonDrug("Super Healing Potion")
                        
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        MSG("LYlua ������������")
                        local BackHomeInfo = {
                            0, --1�Ƚ�С��ͼ
                            "Vern Castle", --���ͼ
                            "Vern Castle", --С��ͼ
                            "Plaza of Harmony", --������
                            { 19498, 14547, 4911 }, --����NPC����
                            { 20133, 13453, 4910 } --����NPC����
                        }
                        Fun_BackHome(BackHomeInfo)
        
                        local ChaosId = Fun_L_GetChaosId()
                        local DungeonInfo = {
                            0, -- 0.�Ƚϴ��ͼ  1.�Ƚ�С��ͼ
                            "Vern Castle", --���ͼ����
                            "Vern Castle", --С��ͼ����
                            "Plaza of Harmony", --����������
                            1, --��������Ū 0��ͨ���� 1���縱��
                            1, --��������Ҫ��ID
                            0, --����
                            0, --�Ѷȵȼ�
                            0, --�Ƿ�ƥ��
                            { 19169, 13721, 4925 }, --������������
                            { 18945, 13943, 4913 }  --���û�гɹ�,���ƶ���������� �ٷ��ؽ�����������
                        }
                        Fun_GoToDungeonsEx(DungeonInfo)
                    else
                        --��ҩƷ������Ҳ�����Լ�ɾ������������ֶ���ҩ�� ҪҩƷ�����ͷŵ�F1����Ҫͬ��ʹ�á�
                        --����1��ҩƷ����
                        --����3��ҩƷ����,��ſ����޸�
                        local point = {"Calfarr",1,100,5371,4414,448}
                        Fun_T_BuyItem(50,2,"Super Healing Potion",point)
                
                        --�Զ���ҩƷ�ŵ�F1 ��������ҩƷ����ͬ��
                        Fun_T_PushDwonDrug("Super Healing Potion")
                        
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        Task_L_LoopEquipFun()
                        MSG("LYlua ������������")
                        local BackHomeInfo = {
                            0, --1�Ƚ�С��ͼ
                            "Luterra Castle", --���ͼ
                            "Luterra Castle", --С��ͼ
                            "Market District", --������
                            { 4933, 4481, 448 }, --����NPC����
                            { 5371, 4414, 448} --����NPC����
                        }
                        Fun_BackHome(BackHomeInfo)

                        local ChaosId = Fun_L_GetChaosId()
                        local DungeonInfo = {
                            0, -- 0.�Ƚϴ��ͼ  1.�Ƚ�С��ͼ
                            "Luterra Castle", --���ͼ����
                            "Luterra Castle", --С��ͼ����
                            "Market District", --����������
                            1, --��������Ū 0��ͨ���� 1���縱��
                            1, --��������Ҫ��ID
                            0, --����
                            0, --�Ѷȵȼ�
                            0, --�Ƿ�ƥ��
                            { 4435, 5517, 448 }, --������������
                            { 4205, 5318, 448 }  --���û�гɹ�,���ƶ���������� �ٷ��ؽ�����������
                        }
                        Fun_GoToDungeonsEx(DungeonInfo)
                    end
                end
            end
        else
            --ȥ����ֻ
            if Fun_IsInMapByMapId(11102) then
                --��¡��
                if GetArkPassExp() >= (value+50) then
                    return 1
                else
                    local point = {"",1,100,13713,13262,-110}
                    Fun_L_Transmit("Central Port",point)
                end
            end
            if Fun_IsInMapByMapId(11111) then
                --��¡�ۿ�
                if GetArkPassExp() >= (value+50) then
                    local point = {"",1,100,5427,8032,4273}
                    Fun_L_Transmit("Crafting District",point)
                else
                    local point = {"",1,100,14416,11306,-117}
                    FindWay(point)
                end
            end

            if Fun_IsInMapByMapId(10801) then
                --¬����
                if GetArkPassExp() >= (value+50) then
                    return 1
                else
                    local point = {"",1,100,6794,6974,562}
                    Fun_L_Transmit("Wavestrand Port",point)
                end
            end
            if Fun_IsInMapByMapId(10804) then
                --��¬�����ۿ�
                if GetArkPassExp() >= (value+50) then
                    local point = {"",1,100,3383,4578,424}
                    Fun_L_Transmit("Market District",point)
                else
                    local point = {"",1,100,3302,13909,-144}
                    FindWay(point)
                end
            end
            if Fun_IsInMapByMapId(30703) then
                --�ڸۿ���
                if type == 1 then
                    if GetArkPassExp() >= (value+50) then
                        local point = {"",1,100,12646,16664,1}
                        SeaToLand(30703,point)
                    else
                        --��¡�ۿ�
                        local point = {"",1,100,13511,17956,1}
                        SeaToPoint(point)

                        local point = {"",1,100,12646,16664,1}
                        SeaToBack(point)
                    end
                else
                    if GetArkPassExp() >= (value+50) then
                        local point = {"",1,100,-32214,32204,1}
                        SeaToLand(30703,point)
                    else
                        --��¡�ۿ�
                        local point = {"",1,100,-32400,33243,1}
                        SeaToPoint(point)

                        local point = {"",1,100,-32214,32204,1}
                        SeaToBack(point)
                    end
                end
            end
        end
    end
end

return ArkPass