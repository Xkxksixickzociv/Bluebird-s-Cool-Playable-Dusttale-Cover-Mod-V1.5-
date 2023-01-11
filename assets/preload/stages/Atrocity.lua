local xx = 250; 
local yy = 675; 
local xx2 = 925;
local yy2 = 675;
local xx3 = 500; 
local yy3 = 700; 
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
	makeLuaSprite('bg','atro-bg', -2000, -475)
	makeLuaSprite('vineboom','sadchara', 0, 0)
	makeLuaSprite('cut','cutscene', 0, 0)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('dark','FlashDark', 0, 0)
	makeLuaSprite('flashout','FlashDark', -1000, 0)
	scaleObject('flashout', 4, 4);
	
	addLuaSprite('bg')
	addLuaSprite('flash')
	addLuaSprite('dark')
	addLuaSprite('swap', false);
	addLuaSprite('fell', false);
	addLuaSprite('3sans', true);
	addLuaSprite('1sans', true);
	addLuaSprite('Flowey', false);
	addLuaSprite('text', true);
	addLuaSprite('vineboom', true)
	addLuaSprite('cut', true)
	setObjectCamera('text', 'other');
	setObjectCamera('vineboom', 'other');
	setObjectCamera('cut', 'other');
	setProperty('Flowey.alpha', 0);
	setProperty('text.alpha', 0);
	setProperty('3sans.alpha', 0);
	addLuaSprite('1sans', true);
	setProperty('1sans.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flash.alpha', 0);
	setProperty('vineboom.alpha', 0);
	setObjectCamera('dark', 'other');
	setProperty('dark.alpha', 0);
	addLuaSprite('flashout')
	setProperty('flashout.alpha', 0);
	
	makeLuaSprite('1','atro-fucking-cutscene/1', 0, 0)
	setObjectCamera('1', 'other');
	addLuaSprite('1')
	setProperty('1.alpha', 0);
	
	makeLuaSprite('2','atro-fucking-cutscene/2', 0, 0)
	setObjectCamera('2', 'other');
	addLuaSprite('2')
	setProperty('2.alpha', 0);
	
	makeLuaSprite('3','atro-fucking-cutscene/3', 0, 0)
	setObjectCamera('3', 'other');
	addLuaSprite('3')
	setProperty('3.alpha', 0);
	
	makeLuaSprite('4','atro-fucking-cutscene/4', 0, 0)
	setObjectCamera('4', 'other');
	addLuaSprite('4')
	setProperty('4.alpha', 0);
	
	makeLuaSprite('5','atro-fucking-cutscene/5', 0, 0)
	setObjectCamera('5', 'other');
	addLuaSprite('5')
	setProperty('5.alpha', 0);
	
	makeLuaSprite('6','atro-fucking-cutscene/6', 0, 0)
	setObjectCamera('6', 'other');
	addLuaSprite('6')
	setProperty('6.alpha', 0);
	
	makeLuaSprite('7','atro-fucking-cutscene/7', 0, 0)
	setObjectCamera('7', 'other');
	addLuaSprite('7')
	setProperty('7.alpha', 0);
	
	makeLuaSprite('8','atro-fucking-cutscene/8', 0, 0)
	setObjectCamera('8', 'other');
	addLuaSprite('8')
	setProperty('8.alpha', 0);
	
	makeLuaSprite('9','atro-fucking-cutscene/9', 0, 0)
	setObjectCamera('9', 'other');
	addLuaSprite('9')
	setProperty('9.alpha', 0);
	
	makeLuaSprite('10','atro-fucking-cutscene/10', 0, 0)
	setObjectCamera('10', 'other');
	addLuaSprite('10')
	setProperty('10.alpha', 0);
	
	makeLuaSprite('11','atro-fucking-cutscene/11', 0, 0)
	setObjectCamera('11', 'other');
	addLuaSprite('11')
	setProperty('11.alpha', 0);
	
	makeLuaSprite('12','atro-fucking-cutscene/12', 0, 0)
	setObjectCamera('12', 'other');
	addLuaSprite('12')
	setProperty('12.alpha', 0);
	
	makeLuaSprite('13','atro-fucking-cutscene/13', 0, 0)
	setObjectCamera('13', 'other');
	addLuaSprite('13')
	setProperty('13.alpha', 0);
	
	makeLuaSprite('14','atro-fucking-cutscene/14', 0, 0)
	setObjectCamera('14', 'other');
	addLuaSprite('14')
	setProperty('14.alpha', 0);
	
	makeLuaSprite('15','atro-fucking-cutscene/15', 0, 0)
	setObjectCamera('15', 'other');
	addLuaSprite('15')
	setProperty('15.alpha', 0);
	
	makeLuaSprite('16','atro-fucking-cutscene/16', 0, 0)
	setObjectCamera('16', 'other');
	addLuaSprite('16')
	setProperty('16.alpha', 0);
end

function cutreset()
setProperty('1.alpha', 0);
setProperty('2.alpha', 0);
setProperty('3.alpha', 0);
setProperty('4.alpha', 0);
setProperty('5.alpha', 0);
setProperty('6.alpha', 0);
setProperty('7.alpha', 0);
setProperty('8.alpha', 0);
setProperty('9.alpha', 0);
setProperty('10.alpha', 0);
setProperty('11.alpha', 0);
setProperty('12.alpha', 0);
setProperty('13.alpha', 0);
setProperty('14.alpha', 0);
setProperty('15.alpha', 0);
setProperty('16.alpha', 0);

end

    function onStepHit()
	 if curStep == 256 or curStep == 384 or curStep == 767 or curStep == 1023 or curStep == 1279 or curStep == 1471 or curStep == 1537 or curStep == 1791 then
	 --only flash
	 flash()
	 end
	 if curStep == 767 or curStep == 1791 then
	 beating = false;
	 end
	 if curStep == 256 or curStep == 1279 then
	 beating = true;
	 end
	 if curStep == 24 then
	 vineboom()
	 end
	 if curStep == 127 then
	 flash()
	 setProperty('camHUD.visible', true);
	 setProperty('cut.alpha', 0);
	 end
	 if curStep == 1508 then
	 setProperty("gf.visible", true);
	 setProperty('gf.alpha', 0);
	 doTweenAlpha('papfade', 'gf', 1, 2, 'linear');
	 end
	 if curStep == 1806 then
	 flash()
	 cutreset()
	 setProperty('cut.alpha', 1);
	 setProperty('1.alpha', 1);
	 end
	 if curStep == 1816 then
	 cutreset()
	 setProperty('2.alpha', 1);
	 end
	 if curStep == 1839 then
	 cutreset()
	 setProperty('3.alpha', 1);
	 end
	 if curStep == 1864 then
	 cutreset()
	 setProperty('4.alpha', 1);
	 end
	 if curStep == 1904 then
	 cutreset()
	 setProperty('5.alpha', 1);
	 end
	 if curStep == 1919 then
	 cutreset()
	 setProperty('6.alpha', 1);
	 end
	 if curStep == 1926 then
	 cutreset()
	 setProperty('7.alpha', 1);
	 end
	 if curStep == 1943 then
	 cutreset()
	 setProperty('8.alpha', 1);
	 end
	 if curStep == 1951 then
	 cutreset()
	 setProperty('9.alpha', 1);
	 end
	 if curStep == 1973 then
	 cutreset()
	 setProperty('10.alpha', 1);
	 end
	 if curStep == 2010 then
	 cutreset()
	 setProperty('3.alpha', 1);
	 end
	 if curStep == 2073 then
	 cutreset()
	 setProperty('11.alpha', 1);
	 end
	 if curStep == 2174 then
	 cutreset()
	 setProperty('12.alpha', 1);
	 end
	 if curStep == 2193 then
	 cutreset()
	 setProperty('13.alpha', 1);
	 end
	 if curStep == 2217 then
	 cutreset()
	 setProperty('14.alpha', 1);
	 end
	 if curStep == 2261 then
	 cutreset()
	 setProperty('15.alpha', 1);
	 end
	 if curStep == 2282 then
	 cutreset()
	 setProperty('16.alpha', 1);
	 end
	 if curStep == 2316 then
	 cutreset()
	 setProperty('3.alpha', 1);
	 end
end

function flash()
    setProperty('flash.alpha', 0.75);
	doTweenAlpha('flashdown', 'flash', 0, 0.5, 'linear');
end

function vineboom()
    setProperty('vineboom.alpha', 1);
	doTweenAlpha('vinedead', 'vineboom', 0, 2, 'linear');
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
    health = getProperty('health')
    if damage == true then
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end
end