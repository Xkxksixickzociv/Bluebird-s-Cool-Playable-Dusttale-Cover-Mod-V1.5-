local xx = 500;
local yy = 650;
local xx2 = 1000;
local yy2 = 650;
local xx3 = 450;
local yy3 = 600;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = false;
local beat_skip = 0;

function onBeatHit()
    if beat_skip == 0 then
	    beat_skip = 1
        if beating == true then
	        triggerEvent('Add Camera Zoom', 0.075, 0.04)
		end
	else
	    beat_skip = 0
	    
end
end

function onCreate()
	--background boi
	makeLuaSprite('bg','BG', -1300, -1700)
	makeLuaSprite('asgore','asgore', 800, 350)
	makeLuaSprite('papyrus','papyrus', 1200, 800)
	makeLuaSprite('toriel','toriel', 500, 750)
	makeLuaSprite('undyne','undyne', -200, 550)
	scaleObject('undyne', 1.5, 1.5);
	makeLuaSprite('cut','cutscene', 0, 0)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('dark','FlashDark', 0, 0)
	
	addLuaSprite('bg')
	addLuaSprite('asgore')
	addLuaSprite('toriel')
	addLuaSprite('undyne', true)
	addLuaSprite('papyrus', true)
	addLuaSprite('flash')
	addLuaSprite('dark')
	addLuaSprite('cut', true)
	setObjectCamera('flash', 'other');
	setProperty('flash.alpha', 0);
	setObjectCamera('dark', 'other');
	setProperty('dark.alpha', 0);
	setObjectCamera('cut', 'other');
	
	setProperty('toriel.alpha', 0);
	setProperty('undyne.alpha', 0);
	setProperty('papyrus.alpha', 0);
	setProperty('asgore.alpha', 0);
	setProperty('cut.alpha', 0);
end

    function onStepHit()
	 if curStep == 1184 or curStep == 1314 or curStep == 1570 or curStep == 2338 or curStep == 2521 or curStep == 2524 or curStep == 2528 or curStep == 2722 or curStep == 2728 or curStep == 2734 or curStep == 2738 then
	 flash();
	 end
	 if curStep == 62 or curStep == 2375 then
	 setProperty('camHUD.visible', false);
	 triggerEvent('Camera Follow Pos', xx3, yy3)
	 setProperty('cut.alpha', 1);
	 end
	 if curStep == 130 or curStep == 2466 then
	 setProperty('camHUD.visible', true);
	 setProperty('cut.alpha', 0);
	 flash();
	 end
	 if curStep == 1057 then --change to sad part
	 flash();
	 end
	 if curStep == 2746 then
	 setProperty('dark.alpha', 1);
	 end
	 if curStep == 1248 then
	 doTweenAlpha('asgore', 'asgore', 1, 5, 'linear');
	 end
	 if curStep == 1258 then
	 doTweenAlpha('toriel', 'toriel', 1, 2, 'linear');
	 end
	 if curStep == 1266 then
	 doTweenAlpha('papyrus', 'papyrus', 1, 2, 'linear');
	 end
	 if curStep == 1281 then
	 doTweenAlpha('undyne', 'undyne', 1, 2, 'linear');
	 end
	 if curStep == 2738 then
	 setProperty('camHUD.visible', false);
	 setProperty('cut.alpha', 0);
	 end
end

function flash()
    setProperty('flash.alpha', 0.75);
	doTweenAlpha('flashdown', 'flash', 0, 0.5, 'linear');
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function opponentNoteHit()
    health = getProperty('health')
    if damage == true then
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end
end