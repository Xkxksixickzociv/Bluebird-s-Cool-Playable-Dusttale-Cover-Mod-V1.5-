local xx = -50; 
local yy = 725; 
local xx2 = -50;
local yy2 = 725;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = false;
local beat_skip = 0;

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.visible", false);

end

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
	setProperty('camHUD.visible', false);
	makeLuaSprite('bg','shit-bg', -1500, -875)
	makeLuaSprite('bg2','flatgr Ass', -1500, -575)
	scaleObject('bg2', 2.2, 2.2);
	
	
	makeLuaSprite('cut','cutscene', 0, 0)
	makeLuaSprite('cut2','AAAAA', 0, 0)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('dark','FlashDark', 0, 0)
	makeLuaSprite('flashout','FlashDark', -1000, 0)
	scaleObject('flashout', 4, 4);
	
	addLuaSprite('bg')
	addLuaSprite('bg2')
	addLuaSprite('flash')
	addLuaSprite('dark')
	addLuaSprite('cut', true)
	addLuaSprite('cut2', true)
	setObjectCamera('cut', 'other');
	setObjectCamera('cut2', 'hud');
	setObjectCamera('flash', 'other');
	setProperty('flash.alpha', 0);
	setObjectCamera('dark', 'other');
	addLuaSprite('flashout')
	setProperty('flashout.alpha', 0);
	setProperty('bg2.alpha', 0);
	setProperty('cut2.alpha', 0);
end

    function onStepHit()
	 if curStep == 1 then
	 setProperty('dad.alpha', 0);
	 triggerEvent('Camera Follow Pos',xx+1,yy)
	 doTweenAlpha('fadedark', 'dark', 0, 3, 'linear');
	 end
	 if curStep == 136 then
     doTweenAlpha('omfgisthatsans', 'dad', 1, 1, 'linear');
	 end
	 if curStep == 146 then
	 beating = true;
	 flash()
	 setProperty('camHUD.visible', true);
	 setProperty('cut.alpha', 0);
	 end
	 if curStep == 533 then
	 beating = false;
	 flash()
	 setProperty('bg.alpha', 0);
	 setProperty('bg2.alpha', 1);
	 triggerEvent('Change Character', 1, 'shit-sans2');
	 triggerEvent('Set Cam Zoom', 0.6, 0.2);
	 setCharacterX('bf', 500);
     setCharacterY('bf', 500);
	 setCharacterX('dad', -550);
     setCharacterY('dad', 550);
	 xx2 = 300;
     yy2 = 650;
	 end
	 if curStep == 785 then
	 beating = true;
	 flash()
	 setProperty('bg.alpha', 1);
	 setProperty('bg2.alpha', 0);
	 triggerEvent('Change Character', 1, 'shit-sans');
	 triggerEvent('Set Cam Zoom', 0.8, 0.2);
	 setCharacterX('bf', 5000);
     setCharacterY('bf', 0);
	 setCharacterX('dad', -250);
     setCharacterY('dad', 550);
	 xx2 = -50;
     yy2 = 725;
	 end
	 if curStep == 1304 then
	 setProperty('camHUD.visible', false);
	 setProperty('cut.alpha', 1);
	 end
	 if curStep == 1441 then
	 flash()
	 setProperty('camHUD.visible', true);
	 setProperty('cut.alpha', 0);
	  triggerEvent('Set Cam Zoom', 0.8, 0.2);
	 end
	 if curStep == 1842 then
	 setProperty('cut2.alpha', 1);
	 end
	 if curStep == 1858 then
	 setProperty('dark.alpha', 1);
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
    triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.01');
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.03);
		end
    end