package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path
local DelegateTaskFun = require("Script.Task.DelegateTask");  --1-50���ű�
local AutoLifeThreadFun = require("Script.Task.AutoLifeThread")

MSG("LYLUa ��ʼT3����ˢ���縱�� ����������Puniky��½ 0521")

--�������ͷֽ⺯����ֻҪһ���������ڵ��ڣ����ֽ⣬����
--����1����Ʒ����Ʒ�ȼ�
--����2: ��Ʒ����ɫ�ȼ���0��ɫ��1��ɫ��2��ɫ��3��ɫ��4��ɫ
Item_L_SetItem(1320,4)
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
    if Fun_GetChaosNum() >= 0 then
        MSG("LYLUa ����ˢ��������")

        --��ҩƷ������Ҳ�����Լ�ɾ������������ֶ���ҩ�� ҪҩƷ�����ͷŵ�F1����Ҫͬ��ʹ�á�
        --����1��ҩƷ����
        --����3��ҩƷ����,��ſ����޸�
        --ҩƷ�������÷ǳ��ߵȼ���ҩ��������70%��Ѫ������������Ѫ��8W����21000��Ѫ����
        local point = {"Sandra",1,100,-12827,3088,488}
        Fun_T_BuyItem(100,2,"Purified Healing Potion",point)
   
        --�Զ���ҩƷ�ŵ�F1 ��������ҩƷ����ͬ��
        Fun_T_PushDwonDrug("Purified Healing Potion")
        
        Task_L_LoopEquipFun()
        Task_L_LoopEquipFun()
        Task_L_LoopEquipFun()
        Task_L_LoopEquipFun()
        MSG("LYlua ������������")
        local BackHomeInfo = {
            0, --1�Ƚ�С��ͼ
            "Nia Village", --���ͼ
            "Nia Village", --С��ͼ
            "Militia Command Center", --������
            { -17426, 5106, 488 }, --����NPC����
            { -12827, 3088, 488 } --����NPC����
        }
        Fun_BackHome(BackHomeInfo)

        local ChaosId = Fun_L_GetChaosId()
        local DungeonInfo = {
            0, -- 0.�Ƚϴ��ͼ  1.�Ƚ�С��ͼ
            "Nia Village", --���ͼ����
            "Nia Village", --С��ͼ����
            "Militia Command Center", --����������
            1, --��������Ū 0��ͨ���� 1���縱��
            ChaosId, --��������Ҫ��ID
            0, --����
            0, --�Ѷȵȼ�
            0, --�Ƿ�ƥ��
            { -13482, 5403, 498 }, --������������
            { -13722, 5065, 488 }  --���û�гɹ�,���ƶ���������� �ٷ��ؽ�����������
        }

        Fun_GoToDungeonsEx(DungeonInfo)
    else
        MSG("LYLUa: ����û��������,ȥ�ʼ�")
        local point = {"",1,100,-15806,4663,488}
        Fun_L_NormalEmail("Nia Village","Militia Command Center",point)
        return 1
    end
end
