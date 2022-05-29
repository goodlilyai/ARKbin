LYFun  = {}

--������ӡ�ṹ��ĺ���
function LYPrintf(addstr,val)
    local tempstr = string.format( "LYLUA %s Name:%s,type:%d,range:%.0f,start(%.0f,%.0f,%.0f)",
    addstr,
    val[1],val[2], val[3],val[4],val[5],val[6])
    MSG(tempstr)
end

function LYFun.IsInMapByTab(MapTab)

    for i = 1, #(MapTab) do
        if Fun_IsInMapByMapId(MapTab[i]) then
            return MapTab[i]
        end
    end
    return 0
end


function LYFun.MyDeb(a)
    MSG(a)
end

--�����Ӻ���
function FB_AttackAndFindLadder(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        if Fun_IsFindLadder(ladderPt) then
        --����ͨ�����ƶ�
            MSG("LYLUA �ҵ�����,׼���ƶ�")
            if Fun_GotoUseLadder(ladderPt) then
                MSG("LYLUA  useLadder OKOKO")
                break
            end
        else
            MSG("LYLUA ���Ӵ����...")
            Fun_AttackMonByRange(attackPt)
        end
        
        if (Fun_IsInPoint(nextPt) == 1) then
            MSG("LYLUA �����쳣�����ӣ������Ѿ�����Ŀ��㣡")
            break
        end
    end
end

--���ź���
function FB_AttackAndOpenDoor(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA �˳��߳�")
            break
        end

        if Fun_GotoOpenDoor(ladderPt) then
            MSG("LYLUA �ҵ���,׼���ƶ�")
            FindWay(nextPt)
            break
        end
        --[[
        if Fun_IsFindDoor(ladderPt)==1  then
            MSG("LYLUA �ҵ���,׼���ƶ�")
            if Fun_GotoOpenDoor(ladderPt) then
                MSG("LYLUA ���Ѿ����ƶ�����һ����")
                FindWay(nextPt)
                break
            end
        else
            MSG("LYLUA ����һ����...")
            FindWay(nextPt)
            break
           -- Fun_AttackMonByRange(attackPt)
        end
        ]]
    end
end


--ʹ�û��� 
function FB_AttackAndOpenBlock(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        --���ػ����ܿ��ͳ�ʼ��
        if Fun_IsFindDoor(ladderPt)==0  then
            MSG("LYLUa û���ҵ��Ŵ��")
            Fun_AttackMonByRange(attackPt)
        end

        if Fun_IsFindDoor(ladderPt)==1  then
            MSG("LYLUa �ҵ������ƶ�ȥ����")
            Fun_GotoOpenDoor(ladderPt)
        end

        if Fun_IsFindDoor(ladderPt)==2  then
            MSG("LYLUa �������ƶ�����һ����")
            FindWay(nextPt)
            break
        end

    end
end


--ʹ�û��� 
function FB_AttackAndOpenTurntable(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA  �˳��߳�")
            break
        end

        if Fun_IsFindDoor(ladderPt)==1  then
            MSG("LYLUa �ҵ������ƶ�ȥ����")
            Fun_GotoOpenDoor(ladderPt)
        end

        if Fun_IsFindDoor(ladderPt)==2  then
            MSG("LYLUa  �������ƶ�����һ����")
            FindWay(nextPt)
            break
        end

        --���ػ����ܿ��ͳ�ʼ��
        if Fun_IsFindDoor(ladderPt)==0  then
            MSG("LYLUa  û���ҵ��Ŵ��")
            if Fun_AttackLongMonByName(attackpt) == 2 then
                MSG("LYLUA  ָ�������Ѿ���ʧ��")
                FindWay(nextpt)
                break
            end
        end

    end
end


--������ֺ���
function FB_AttackAndGoNextPt(attackpt,nextpt)
    MSG("LYLUA ���뵽����߳���")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        
        if Fun_AttackMonByRange(attackpt) == 2 then
            MSG("LYLUA �Ѿ�û�й���,����һ����")
            FindWay(nextpt)
            break
        end
    end
end

--ר�Ŵ�������ӵĺ���
function FB_AttackBamBooAndGoNextPt(attackpt,ladder,nextpt)
    MSG("LYLUA ���뵽����߳���")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        
        if Fun_AttackMonByRangeWithBamboo(ladder) == 2 then
            MSG("LYLUA �Ѿ�û�й���,����һ����")
            FindWay(nextpt)
            break
        end
    end
end


--����ǿ��Ѱ·
function FB_AttackAndEnforceGoNextPt(attackpt,nextpt)
    MSG("LYLUA ���뵽����߳���")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        
        if Fun_AttackMonByRange(attackpt) == 2 then
            MSG("LYLUA �Ѿ�û�й���,����һ����")
            Fun_EnforceFindWay(nextpt)
            break
        end

    end
end

--��BOSS
-- attackpt type 1 ʹ�ô��� 2ʹ�ô��в��Ҳ�����
function FB_AttackBoassAndGoNextPt(attackpt,nextpt)
    MSG("LYLUA ���뵽����߳���")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        
        if Fun_AttackBoss(attackpt) == 2 then
            MSG("LYLUA BOSS��ʧ��������")
            FindWay(nextpt)
            break
        end
    end
end


--��Զ����Ĺ�
function FB_AttackLongMonAndGotoNext(attackpt,nextpt)
    MSG("LYLUA ���뵽��Զ�����")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA �˳��߳�")
            break
        end
        
        if Fun_AttackLongMonByName(attackpt) == 2 then
            MSG("LYLUA  ָ�������Ѿ���ʧ��")
            FindWay(nextpt)
            break
        end
    end
end






--�������� 
--����1 ��ʼ����(�ж��Ƿ���������� ����й���ʹ��)
    --�����ͽṹ��start
    --1.1  ����Ǵ�ָ�����ֵĹ�
    --1.2 ���� ��attacktype Ϊ2ʱ  (1����ʹ��ŭ�� 2�����赲������)
          --  ��attacktype Ϊ0 ʱ (2���������)
    --1.2--1.5  ����
--����2 ���� (0������� 1�жϹ�������Ƿ�Ҫʹ������ 2��BOSS  
        --3Ѱ·��Ϊ�϶����ƶ������ ���һ��·�ϵ�·�Ĺ���)
--����2 ��������(�����ж������Ƿ����)
--����3 ��һ��Ŀ������� 
function LYFun.FB_Attack(start,attcktype,ladder,next)
    LYPrintf("���뺯����",start)
    if Fun_IsInPoint(start)==1 then
        LYPrintf("�����ж�",start)
        if (attcktype==1) then
            FB_AttackAndFindLadder(start,ladder,next)
        elseif (attcktype==2) then
            FB_AttackBoassAndGoNextPt(start,next)
        elseif (attcktype==3) then
            FB_AttackAndEnforceGoNextPt(start,next)
        elseif (attcktype==4) then
            FB_AttackAndOpenDoor(start,ladder,next)
        elseif (attcktype==5) then
            FB_AttackAndOpenBlock(start,ladder,next)
        elseif (attcktype==6) then
            FB_AttackBamBooAndGoNextPt(start,ladder,next)
        elseif (attcktype==7) then
            FB_AttackAndOpenTurntable(start,ladder,next)
        elseif (attcktype==99) then
            FB_AttackLongMonAndGotoNext(ladder,next)
        else
            FB_AttackAndGoNextPt(start,next)
        end
    end
end



return LYFun