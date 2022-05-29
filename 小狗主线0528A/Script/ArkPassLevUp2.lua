package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local Auto50LevUpTask = require("Script.Task.50LevUp")
local myAutotaskFun = require("Script.Task.Autotask")
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")
local GlobalItemFun = require("Script.GlobalItem")
local ArkPassFun = require("Script.ArkPass")

MSG("LYLUa: ��ʼִ��50ֱ��2��ɫ7��ͨ��֤ 0527")

--�������ͷֽ⺯����ֻҪһ���������ڵ��ڣ����ֽ⣬����
--����1����Ʒ����Ʒ�ȼ�
--����2: ��Ʒ����ɫ�ȼ���0��ɫ��1��ɫ��2��ɫ��3��ɫ��4��ɫ
Item_L_SetItem(1300,4)
--���ø���
--������2ԭ�ظ��1�������渴�1���縱��������븱�����渴��
Task_L_SetFuHuo(2)
--��������Ʒ����,����һ����ִ��
--����1:��Ʒ�;ðٷֱ�
--����2:�����������
if GetArkPassLev() < 7 then
    Fun_SetBackHomeInfo(90, 20,0,0)
else
    Fun_SetBackHomeInfo(80, 20,0,0)  
end

if Fun_IsInChaos("Chaos Dungeon") == 1 then
    MSG("LYLUa ������")
    if Fun_ChaoAttack(0) == 9 then
        return 1
    end
else
    local ret
    if GetCharactIndex() == 0 then
        MSG("LYLUa ִ��50����ű�")
        ret = myAutotaskFun.FB(50)
    else
        MSG("LYLUa ִ��50ֱ���ű�")
        ret = Auto50LevUpTask.FB(50)
    end

    if ret == 50 then   --����
        MSG("LYLUa ��ʼˢ����")
        --�����ƶ��ٶ�
        --������0�����٣�1���٣�2�������٣�3�ռ�����
        SetSpeed(0)

        if Task_L_GetTaskIsComplete(0x47b761) then
            Task_L_CompleteGlobalTask(0x47b761,-1)
        end

        if Task_L_GetTaskIsComplete(0x47b762) then
            Task_L_CompleteGlobalTask(0x47b762,-1)
        end

        if Task_L_GetTaskIsComplete(0x47b763) then
            Task_L_CompleteGlobalTask(0x47b763,-1)
        end

        if Task_L_FindTask(0x47b761) == 0 and Task_L_FindTask(0x47b762) == 0 and Task_L_FindTask(0x47b763) == 0 then
            
            if GetIsCanRecv(0x47b761) == 1 then
                Task_L_AcceptGlobalTask(0x47b761)
                Fun_Sleep(2000)
            end

            if Task_L_FindTask(0x47b761) == 0 then
                if GetIsCanRecv(0x47b762) == 1 then
                    Task_L_AcceptGlobalTask(0x47b762)
                    Fun_Sleep(2000)
                end
            end

            if Task_L_FindTask(0x47b761) == 0 then
                if Task_L_FindTask(0x47b762) == 0 then
                    if GetIsCanRecv(0x47b763) == 1 then
                        Task_L_AcceptGlobalTask(0x47b763)
                        Fun_Sleep(2000)
                    end
                end
            end
        end

        if FindTransmit("Plaza of Harmony") == 1 then 
            if Task_L_FindTask(0x47b761) == 1 or Task_L_FindTask(0x47b762) == 1 or Task_L_FindTask(0x47b763) == 1 then
                MSG("LYLUa ��¡ ����ˢ��������")
                
                --��ҩƷ������Ҳ�����Լ�ɾ������������ֶ���ҩ�� ҪҩƷ�����ͷŵ�F1����Ҫͬ��ʹ�á�
                --����1��ҩƷ����
                --����3��ҩƷ����,��ſ����޸�
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

                MSG("LYLUa ����ˢ�꣬��Ҫ����ɫ")

                if Fun_IsInMapByMapId(11102) then
                else
                    local point = {"",1,100,14355,14679,5053}
                    Fun_L_Transmit("Plaza of Harmony",point)
                end

                local glodret = 0 
                if GetCharactIndex() == 0 then
                    if GetRosterPoints() >= 70 then
                        MSG("LYLUa �ճ�ֵ������Ҫ��ȡ")
                        Fun_L_ReceiveReward()
                        Fun_Sleep(2000)
                    end

                    if FindItemCount("Una's Token") >= 80 then
                        local point = {"Una's Token",1,100,4764,9411,4226}
                        Item_L_ChangeGold(1,80,point)
                    else
                        if FindItemCount("Hefty Gold Sack") >= 1 then
                            local point = {"",0,100,5237, 9226, 4226}
                            if FindWay(point) == 1 then
                                GlobalItemFun.Fun(0)
                                LoopUseItem("Hefty Gold Sack")
                                LoopUseItem("Thin Gold Bar")
                                LoopUseItem("Thick Gold Bar")
                            end
                        else
                            LoopUseItem("Thin Gold Bar")
                            LoopUseItem("Thick Gold Bar")
                            glodret = 1
                        end   
                    end    
                else
                    glodret = 1
                end
                
                local exchageret
                if GetCharactIndex() == 0 and GetRosterPoints() >= 70 then
                    if ShoppingRevGift() == 1 then
                        local point = {"",1,100,7031,7299,4226}
                        if RevEmail("Vern Castle","Crafting District",point) == 1 then
                            local point = {"",0,100,6690, 8260, 4226}
                            FindWay(point)
                            GlobalItemFun.Fun(0)
                            LoopUseItemBox(5,"Battle Item Selection Chest")
                            LoopUseItemBox(0,"Destruction Stone Selection Pouch")
                            LoopUseItemBox(0,"Guardian Stone Selection Pouch")
                            LoopUseItemBox(0,"Sailing Coin Selection Chest")
                            LoopUseItemBox(0,"Honing Leapstone Selection Chest")
                            LoopUseItemBox(0,"Honing Shard Selection Chest")
                            GlobalItemFun.Fun(0)
                            MSG("LYLUa ׼��ȥǿ��")
                            local point = {"",1,100,7482,8591,4285}
                            if Strengthen(1,100000,10,point) ==1 then  
                            
                                MSG("LYLUa ǿ�����")
                                if ChallengeThread() == 1 then
                                    if GetArkPassLev() < 7 then
                                        --��ȡ�����Ƿ����
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Repair Ship") == 1 then
                                                MSG("LYLUa ��������ֻ����û�����")
                                                ArkPassFun.Fun(0,GetArkPassExp(),1)
                                            end
                                        end
                                    end

                                    if GetArkPassLev() < 7 then
                                        --��ȡ�����Ƿ����
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Use Recovery Battle Item") == 1 then
                                                MSG("LYLUa ����ʹ��ս��ҩ��û�����")
                                                ArkPassFun.Fun(1,GetArkPassExp(),1)
                                            end
                                        end
                                    end
                                        
                                    MSG("LYLUa Challenge ��ȡ���")
                                    local point = {"",0,100,6690, 8260, 4226}
                                    FindWay(point)
                                    
                                    if ArkPassThread() == 1 then 
                                        GlobalItemFun.Fun(0)
                                        MSG("LYLUa arkpass ���")
                                        exchageret = 1
                                    end
                                end
                            end
                        end
                    end
                else
                    exchageret = 1
                end
                
                if exchageret == 1 and glodret == 1 then
                    local point = {"",0,2000, 19169, 13721, 4925}
                    if Fun_IsInPoint(point) == 1 then
                        local point = {"",0,100,13301, 7576, 4262}
                        FindWay(point)
                    end

                    local point = {"",1,100,7031,7299,4226}
                    local retvalue = VernPowerpass(0,point)

                    if retvalue == 1 and 
                    GetCharactIndex() == 0 and 
                    GetRosterPoints() >= 70 then
                        MSG("LYLUa ֱ��ȫ���������,ȥ�ʼ�,��Ҫ���˺�")
                        local point = {"",1,100,7031,7299,4226}
                        Fun_L_NormalEmail("Vern Castle","Crafting District",point)
                        return 1
                    end

                    if retvalue == 2 then
                        MSG("LYLUa �½���ɫû�з���ֱ����,��Ҫ���˺�")
                        Fun_SetConfigValue(6)
                    end
                end
            end
        else
            if Task_L_FindTask(0x47b761) == 1 or Task_L_FindTask(0x47b762) == 1 or Task_L_FindTask(0x47b763) == 1 then
                MSG("LYLUa ¬���� ����ˢ��������")
                
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
            else

                MSG("LYLUa ����ˢ�꣬��Ҫ����ɫ")

                if Fun_IsInMapByMapId(10801) then
                else
                    local point = {"",1,100,3383,4578,424}
                    Fun_L_Transmit("Market District",point)
                end

                local glodret = 0 
                if GetCharactIndex() == 0 then
                    MSG("LYLUa �ճ�ֵ������Ҫ��ȡ0")
                    if GetRosterPoints() >= 70 then
                        MSG("LYLUa �ճ�ֵ������Ҫ��ȡ1")
                        Fun_L_ReceiveReward()
                        Fun_Sleep(2000)
                    end

                    if FindItemCount("Una's Token") >= 80 then
                        local point = {"Una's Token",1,100,311,5868,448}
                        Item_L_ChangeGold(1,80,point)
                    else
                        if FindItemCount("Hefty Gold Sack") >= 1 then
                            local point = {"",0,100,-26, 5794, 453}
                            if FindWay(point) == 1 then
                                GlobalItemFun.Fun(0)
                                LoopUseItem("Hefty Gold Sack")
                                LoopUseItem("Thin Gold Bar")
                                LoopUseItem("Thick Gold Bar")
                            end
                        else
                            LoopUseItem("Thin Gold Bar")
                            LoopUseItem("Thick Gold Bar")
                            glodret = 1
                        end
                    end
                else
                    glodret = 1
                end

                local exchageret
                if GetCharactIndex() == 0 and GetRosterPoints() >= 70 then
                    if ShoppingRevGift() == 1 then
                        local point = {"",1,100,-580,5473,448}
                        if RevEmail("Luterra Castle","Market District",point) == 1 then
                            local point = {"",0,100,-26, 5794, 453}
                            FindWay(point)

                            GlobalItemFun.Fun(0)
                            LoopUseItemBox(5,"Battle Item Selection Chest")
                            LoopUseItemBox(0,"Destruction Stone Selection Pouch")
                            LoopUseItemBox(0,"Guardian Stone Selection Pouch")
                            LoopUseItemBox(0,"Sailing Coin Selection Chest")
                            LoopUseItemBox(0,"Honing Leapstone Selection Chest")
                            LoopUseItemBox(0,"Honing Shard Selection Chest")
                            GlobalItemFun.Fun(0)

                            local point = {"",1,100,1984,7534,448}
                            if Strengthen(1,100000,12,point) ==1 then  
                            
                                MSG("LYLUa ǿ�����")
                                if ChallengeThread() == 1 then
                                    if GetArkPassLev() < 7 then
                                        --��ȡ�����Ƿ����
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Repair Ship") == 1 then
                                                MSG("LYLUa ��������ֻ����û�����")
                                                ArkPassFun.Fun(0,GetArkPassExp(),1)
                                            end
                                        end
                                    end

                                    if GetArkPassLev() < 7 then
                                        --��ȡ�����Ƿ����
                                        if GetArkPassExp() >= 970 then
                                            if GetArkMission("Use Recovery Battle Item") == 1 then
                                                MSG("LYLUa ����ʹ��ս��ҩ��û�����")
                                                ArkPassFun.Fun(1,GetArkPassExp(),1)
                                            end
                                        end
                                    end
                                        
                                    MSG("LYLUa Challenge ��ȡ���")
                                    local point = {"",0,100,-26, 5794, 453}
                                    FindWay(point)
                                    
                                    if ArkPassThread() == 1 then 
                                        GlobalItemFun.Fun(0)
                                        MSG("LYLUa arkpass ���")
                                        exchageret = 1
                                    end
                                end
                            end
                        end
                    end
                else
                    exchageret = 1
                end
                
                if exchageret == 1 and glodret == 1 then
                    local point = {"",1,100,-580,5473,448}
                    local retvalue = VernPowerpass(0,point)

                    if retvalue == 1 and 
                    GetCharactIndex() == 0 and 
                    GetRosterPoints() >= 70 then
                        MSG("LYLUa ֱ��ȫ���������,ȥ�ʼ�,��Ҫ���˺�")
                        local point = {"",1,100,-580,5473,448}
                        Fun_L_NormalEmail("Luterra Castle","Market District",point)
                        return 1
                    end

                    if retvalue == 2 then
                        MSG("LYLUa �½���ɫû�з���ֱ����,��Ҫ���˺�")
                        Fun_SetConfigValue(6)
                    end
                end
            end
        end
    end
end
