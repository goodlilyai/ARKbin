package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local DelegateTaskFun = require("Script.Task.DelegateTask");  --1-50���ű�
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")

MSG("LY ��ʼ�ճ�����-����-����  0404")

--�������ͷֽ⺯����ֻҪһ���������ڵ��ڣ����ֽ⣬����
--����1����Ʒ����Ʒ�ȼ�
--����2: ��Ʒ����ɫ�ȼ���0��ɫ��1��ɫ��2��ɫ��3��ɫ��4��ɫ
Item_L_SetItem(1300,4)--�������1300װ�Ⱥͳ�ɫ��Ʒ
--���ø���
--������2ԭ�ظ��1�������渴�1���縱��������븱�����渴��
Task_L_SetFuHuo(2)
--��������Ʒ����,����һ����ִ��
--����1:��Ʒ�;ðٷֱ�
--����2:�����������
Fun_SetBackHomeInfo(90, 20,0,0)
if Fun_IsInChaos("Chaos Dungeon") == 1 then
    MSG("LYLUa ������")
    if Fun_ChaoAttack(0) == 9 then
        return 1
    end
else
    if DelegateTaskFun()==1 then   --����
        MSG("LYLUa �ճ��������,ȥˢ���縱��")
        if Fun_GetChaosNum() > 0 then
            MSG("LYLUa ����ˢ��������")
            
            --��ҩƷ������Ҳ�����Լ�ɾ������������ֶ���ҩ�� ҪҩƷ�����ͷŵ�F1����Ҫͬ��ʹ�á�
            --����1��ҩƷ����
            --����3��ҩƷ����,��ſ����޸�
            local point = {"Magick Scholar Ethan",1,100,20126,13440,4910}
            Fun_T_BuyItem(100,2,"Super Healing Potion",point)
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
                ChaosId, --��������Ҫ��ID
                0, --����
                0, --�Ѷȵȼ�
                0, --�Ƿ�ƥ��
                { 19169, 13721, 4925 }, --������������
                { 18945, 13943, 4913 }  --���û�гɹ�,���ƶ���������� �ٷ��ؽ�����������
            }
            Fun_GoToDungeonsEx(DungeonInfo) 
        else
            if Task_L_GetLifeEnergy() >= 1000 then
                Fun_SetBackHomeInfo(90, 40,0,0)
                local point = {"",0,100,19525, 14588, 4911}
                if Task_L_LongGetTo(0x44aa21,1,11102,1,point) then
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
                        { 19525, 14588, 4911 }, --����NPC����
                        { 20152, 13414, 4910 } --����NPC����
                    }
                    Fun_BackHome(BackHomeInfo)
                end
                MSG("LYLUa: ����������ʼ����ְҵ")
                AutoLifeThreadFun(6,1,1)
            else
                local glodret = 0 
                if GetRosterPoints() >= 70 then
                    MSG("LYLUa �ճ�ֵ������Ҫ��ȡ")
                    Fun_L_ReceiveReward()
                    Fun_Sleep(5000)
                end

                if FindItemCount("Una's Token") >= 80 then
                    local point = {"Una's Token",1,100,4764,9411,4226}
                    Item_L_ChangeGold(1,80,point)
                else
                    if FindItemCount("Hefty Gold Sack") >= 1 then
                        local point = {"",0,100,5237, 9226, 4226}
                        if FindWay(point) == 1 then
                            LoopUseItem("Hefty Gold Sack")
                            LoopUseItem("Thin Gold Bar")
                            LoopUseItem("Thick Gold Bar")
                        end
                    else
                        glodret = 1
                    end 
                else
                    glodret = 1
                end
                
                if glodret == 1 then
                    MSG("LYLUa: ����û��������,ȥ�ʼ�")
                    local point = {"",1,100,7031,7299,4226}
                    Fun_L_NormalEmail("Vern Castle","Crafting District",point)
                    return 1
                end
            end
        end
    end
end