local xx = 350; 
local yy = 750; 
local xx2 = 850;
local yy2 = 750;
local xx3 = 500; 
local yy3 = 700; 
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
	makeLuaSprite('bg','rage-BG', -2000, -675)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('dark','FlashDark', 0, 0)
	makeLuaSprite('flashout','FlashDark', -1000, 0)
	scaleObject('flashout', 4, 4);
	makeAnimatedLuaSprite('swap','swap', -500, 700);
		addAnimationByPrefix('swap','loop','swap',20);
	makeAnimatedLuaSprite('fell','fell', 1400, 670);
		addAnimationByPrefix('fell','loop','fell',24);
	makeAnimatedLuaSprite('3sans','Characters/3sans', -80, 600);
		addAnimationByPrefix('3sans','loop','idle',24);
	makeAnimatedLuaSprite('1sans','Characters/1sans', 890, 605);
		addAnimationByPrefix('1sans','loop','idle',24);
	makeAnimatedLuaSprite('Flowey','Flowey', 775, 820);
		addAnimationByPrefix('Flowey','loop','Flowey',20);
	makeAnimatedLuaSprite('text','sans-textbox', 225, 400);
		addAnimationByPrefix('text','loop','sans-text',23);
	scaleObject('text', 0.8, 0.8);
	makeLuaSprite('cut','cutscene', 0, 0)
	
	addLuaSprite('anti-lag')
	addLuaSprite('anti-lag2')
	setProperty('anti-lag.alpha', 0);
	setProperty('anti-lag2.alpha', 0);
	addLuaSprite('bg')
	addLuaSprite('flash')
	addLuaSprite('dark')
	addLuaSprite('swap', false);
	addLuaSprite('fell', false);
	addLuaSprite('3sans', true);
	addLuaSprite('1sans', true);
	addLuaSprite('Flowey', false);
	addLuaSprite('text', true);
	addLuaSprite('cut', true)
	setObjectCamera('text', 'hud');
	setProperty('Flowey.alpha', 0);
	setProperty('text.alpha', 0);
	setProperty('3sans.alpha', 0);
	addLuaSprite('1sans', true);
	setProperty('1sans.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flash.alpha', 0);
	setObjectCamera('dark', 'other');
	setProperty('dark.alpha', 0);
	addLuaSprite('flashout')
	setProperty('flashout.alpha', 0);
	setObjectCamera('cut', 'other');
	setProperty('cut.alpha', 0);
end

    function onStepHit()
	 if curStep == 121 then
        setProperty('camHUD.visible', false);
		setProperty('cut.alpha', 1);
	 end
	 if curStep == 128 then
        setProperty('camHUD.visible', true);
		setProperty('cut.alpha', 0);
		beating = true;
	 end
	 if curStep == 897 then
	 setProperty('boyfriend.alpha', 0);
	 setProperty('dad.alpha', 0);
	 triggerEvent('Change Character', 1, '3pap');
	 triggerEvent('Change Character', 0, '1pap');
	 doTweenAlpha('dadtween', 'dad', 1, 2, 'linear');
	 doTweenAlpha('bftween', 'boyfriend', 1, 2, 'linear');
	 setCharacterX('dad', -100);
     setCharacterY('dad', 250);
	 setCharacterX('bf', 750);
     setCharacterY('bf', 300);
	 setProperty('1sans.alpha', 0.35);
	 setProperty('3sans.alpha', 0.35);
     setProperty('flash.alpha', 1);
	 yy = 650; 
     yy2 = 650;
	 doTweenAlpha('changeflash', 'flash', 0, 1, 'linear');
	 end
	 if curStep == 899 then
	 triggerEvent('Play Animation', 0, 'singUP');
	 end
	 if curStep == 640 or curStep == 1857 then
	 beating = false;
	 end
	 if curStep == 910 then
	 beating = true;
	 end
	 if curStep == 770 then
	 setProperty('text.alpha', 1);
	 objectPlayAnimation('text','loop', true);
	 end
	 if curStep == 785 then
	 flash();
	 setProperty('text.alpha', 0);
	 end
	 if curStep == 1074 then
	 doTweenAlpha('changeflashout', 'flashout', 1, 2, 'linear');
	 end
	 if curStep == 1169 then
	 doTweenAlpha('changeflashoutend', 'flashout', 0, 1, 'linear');
	 end
	 if curStep == 1696 then
	 triggerEvent('Camera Follow Pos',xx3,yy3)
	 setProperty('camHUD.visible', false);
	 setProperty('cut.alpha', 1);
	 end
	 if curStep == 1706 or curStep == 1698 then
	 flash()
	 end
	 if curStep == 1726 then
	 flash2()
	 yy = 750; 
     yy2 = 750;
	 setCharacterX('dad', -100);
     setCharacterY('dad', 400);
	 setCharacterX('bf', 900);
     setCharacterY('bf', 400);
	 setProperty('1sans.alpha', 0);
	 setProperty('3sans.alpha', 0);
	 setProperty('camHUD.visible', true);
	 setProperty('cut.alpha', 0);
	 setProperty('Flowey.alpha', 1);
	 end
end

function flash()
    setProperty('flash.alpha', 1);
	doTweenAlpha('flashdown', 'flash', 0, 0.5, 'linear');
end

function flash2()
    setProperty('flash.alpha', 1);
	doTweenAlpha('flashdown2', 'flash', 0, 2, 'linear');
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