


--��1������������ְҵ���ͣ�1���㣬2�ڿ�3��������4�ɼ�
--��2������������ߵĴ��ͼ
--��3������������Ĵ��ͼ
--��4������������ߵ�����㣬�Լ�����������
--��5�����������������ߣ��Լ�����������
--��6���������㹳�¹������

AutoLifeThread = {}
--1����½���� 
--2:��������  1���㣬2�ڿ�3��������4�ɼ�
--3��������
function AutoLifeThread(MainLand,Type,Index)
    local ItemList = {
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest",
        "Regulus' Light Currency Chest"
    }
    Item_L_UseBoxList(ItemList)
    if (MainLand == 2) then--¬����
        if (Type == 1) then
            if (Index == 1) then
                local ShopPoint = {"Lakebar",0,100,13184,13499,1023}--����ߵ�
                local FishPoint = {"Lakebar",0,100,8197,16605,963}--�����
                local HookPoint = {"",0,100,8100,16805,968}--�¹���
                Fun_L_LifeThread(Type,"Lakebar","Lakebar",ShopPoint,FishPoint,HookPoint)
            end
        end
    elseif (MainLand == 6) then--��¡
        if (Type == 1) then
            if (Index == 1) then
                local ShopPoint = {"Plaza of Harmony",0,100,19305,1681,3846}--����ߵ�
                local FishPoint = {"Central Port",0,100,15298,13856,-126}--�����
                local HookPoint = {"",0,100,15541,20575,-106}--�¹���
                Fun_L_LifeThread(Type,"Vern Castle","Port Krona",ShopPoint,FishPoint,HookPoint)
            end
        end
    end   
    return 0 
end

return AutoLifeThread

