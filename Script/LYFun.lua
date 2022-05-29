LYFun  = {}

--用来打印结构体的函数
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

--过梯子函数
function FB_AttackAndFindLadder(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA 退出线程")
            break
        end
        if Fun_IsFindLadder(ladderPt) then
        --出现通道就移动
            MSG("LYLUA 找到梯子,准备移动")
            if Fun_GotoUseLadder(ladderPt) then
                MSG("LYLUA  useLadder OKOKO")
                break
            end
        else
            MSG("LYLUA 梯子打怪中...")
            Fun_AttackMonByRange(attackPt)
        end
        
        if (Fun_IsInPoint(nextPt) == 1) then
            MSG("LYLUA 发现异常过梯子，但是已经到达目标点！")
            break
        end
    end
end

--开门函数
function FB_AttackAndOpenDoor(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA 退出线程")
            break
        end

        if Fun_GotoOpenDoor(ladderPt) then
            MSG("LYLUA 找到门,准备移动")
            FindWay(nextPt)
            break
        end
        --[[
        if Fun_IsFindDoor(ladderPt)==1  then
            MSG("LYLUA 找到门,准备移动")
            if Fun_GotoOpenDoor(ladderPt) then
                MSG("LYLUA 门已经打开移动至下一个点")
                FindWay(nextPt)
                break
            end
        else
            MSG("LYLUA 到下一个点...")
            FindWay(nextPt)
            break
           -- Fun_AttackMonByRange(attackPt)
        end
        ]]
    end
end


--使用机关 
function FB_AttackAndOpenBlock(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA 退出线程")
            break
        end
        --机关还不能开就初始化
        if Fun_IsFindDoor(ladderPt)==0  then
            MSG("LYLUa 没有找到门打怪")
            Fun_AttackMonByRange(attackPt)
        end

        if Fun_IsFindDoor(ladderPt)==1  then
            MSG("LYLUa 找到了门移动去开门")
            Fun_GotoOpenDoor(ladderPt)
        end

        if Fun_IsFindDoor(ladderPt)==2  then
            MSG("LYLUa 打开了门移动到下一个点")
            FindWay(nextPt)
            break
        end

    end
end


--使用机关 
function FB_AttackAndOpenTurntable(attackPt,ladderPt,nextPt)
    while (1) 
    do
        if Fun_IsThreadExit()==1 then
            MSG("LYLUA  退出线程")
            break
        end

        if Fun_IsFindDoor(ladderPt)==1  then
            MSG("LYLUa 找到了门移动去开门")
            Fun_GotoOpenDoor(ladderPt)
        end

        if Fun_IsFindDoor(ladderPt)==2  then
            MSG("LYLUa  打开了门移动到下一个点")
            FindWay(nextPt)
            break
        end

        --机关还不能开就初始化
        if Fun_IsFindDoor(ladderPt)==0  then
            MSG("LYLUa  没有找到门打怪")
            if Fun_AttackLongMonByName(attackpt) == 2 then
                MSG("LYLUA  指定怪物已经消失了")
                FindWay(nextpt)
                break
            end
        end

    end
end


--正常打怪函数
function FB_AttackAndGoNextPt(attackpt,nextpt)
    MSG("LYLUA 进入到打怪线程了")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA 退出线程")
            break
        end
        
        if Fun_AttackMonByRange(attackpt) == 2 then
            MSG("LYLUA 已经没有怪物,换下一个点")
            FindWay(nextpt)
            break
        end
    end
end

--专门处理打竹子的函数
function FB_AttackBamBooAndGoNextPt(attackpt,ladder,nextpt)
    MSG("LYLUA 进入到打怪线程了")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA 退出线程")
            break
        end
        
        if Fun_AttackMonByRangeWithBamboo(ladder) == 2 then
            MSG("LYLUA 已经没有怪物,换下一个点")
            FindWay(nextpt)
            break
        end
    end
end


--带上强制寻路
function FB_AttackAndEnforceGoNextPt(attackpt,nextpt)
    MSG("LYLUA 进入到打怪线程了")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA 退出线程")
            break
        end
        
        if Fun_AttackMonByRange(attackpt) == 2 then
            MSG("LYLUA 已经没有怪物,换下一个点")
            Fun_EnforceFindWay(nextpt)
            break
        end

    end
end

--打BOSS
-- attackpt type 1 使用大招 2使用大招并且不换怪
function FB_AttackBoassAndGoNextPt(attackpt,nextpt)
    MSG("LYLUA 进入到打怪线程了")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA 退出线程")
            break
        end
        
        if Fun_AttackBoss(attackpt) == 2 then
            MSG("LYLUA BOSS消失或者死亡")
            FindWay(nextpt)
            break
        end
    end
end


--打超远距离的怪
function FB_AttackLongMonAndGotoNext(attackpt,nextpt)
    MSG("LYLUA 进入到打远距离怪")
    while (1)
    do
        if Fun_IsThreadExit() == 1 then
            MSG("LYLUA 退出线程")
            break
        end
        
        if Fun_AttackLongMonByName(attackpt) == 2 then
            MSG("LYLUA  指定怪物已经消失了")
            FindWay(nextpt)
            break
        end
    end
end






--副本函数 
--参数1 开始坐标(判断是否在这个区域 如果有怪物就打怪)
    --子类型结构如start
    --1.1  如果是打指定名字的怪
    --1.2 类型 当attacktype 为2时  (1代表使用怒气 2代表被阻挡不换怪)
          --  当attacktype 为0 时 (2代表打箱子)
    --1.2--1.5  坐标
--参数2 类型 (0正常打怪 1判断怪物打完是否要使用梯子 2打BOSS  
        --3寻路改为肯定会移动到标点 而且会打路上挡路的怪物)
--参数2 梯子坐标(用来判断梯子是否存在)
--参数3 下一个目标点坐标 
function LYFun.FB_Attack(start,attcktype,ladder,next)
    LYPrintf("进入函数了",start)
    if Fun_IsInPoint(start)==1 then
        LYPrintf("进入判断",start)
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