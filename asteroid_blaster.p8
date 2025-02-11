pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
t=0

function init()
	player = {} 
	player.x = 20 
	player.y = 50 
	player.sprite = 0 
	player.speed = 2 
	player.moving = false
	bullets = {}
	enemies = {}

 for i=1,10 do
 add(enemies, {
  sp=1,
  m_x=i*16,
  m_y=60-i*8,
  x=-32,
  y=-32,
  r=12
 })
 end
end 

function fire()
	local b = {
  sp=3,
  x=player.x,
  y=player.y,
  dx=4,
  dy=0
 }
 add(bullets,b)
end

function _update() 
    player.moving = false
    t=t+1
 
 			for e in all(enemies) do
			  e.x = e.r*sin(t/50) + e.m_x
			  e.y = e.r*cos(t/50) + e.m_y
			 end
 
			 for b in all(bullets) do
			  b.x+=b.dx
			  b.y+=b.dy
			  
			  if b.x < 0 or b.x > 128 or
   b.y < 0 or b.y > 128 then
			    del(bullets,b)
			  end
			 end
			 if(t%6<3) then
			  player.speed=1
			 else
			  player.speed=2
			 end
    
    
    if (btn(2)) then 
        player.y -= player.speed 
        if player.y < -10 then 
            player.y = 128 
        end
         
    end
    if (btn(3)) then
        player.y += player.speed
        if player.y > 128 then
            player.y = -10
        end
        
    end
    
    if (btnp(4)) then
        fire()
    end
    
end

function _draw()
    cls() 
    spr(player.sprite, player.x, player.y)
				
				for b in all(bullets) do 
			  spr(b.sp,b.x,b.y)
			 end
			 
			 for e in all(enemies) do
			  spr(e.sp,e.x,e.y)
			 end
end
__gfx__
00000000000000000000000000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004444000000000001288210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000044444409999999912899821000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
776cd000444444449aaaaaa9189aa981000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56776777444440449aaaaaa9189aa981000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07765000444404049999999912899821000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000044040400000000001288210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004444000000000000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00efe000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0efffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00efe000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e00e0077700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000efe007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
60600000000066606660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60600000060060000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06000000000066606660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60600000060000606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60600000000066606660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000666066606660666006600000666060006660666066600660666066600000000000000000000000000000000000000
00000000000000000000000000000000000060060606660600060000000606060006060060060006060606066600000000000000000000000000000000000000
00000000000000000000000000000000000060066606060660066600000666060006660060066006060660060600000000000000000000000000000000000000
00000000000000000000000000000000000060060606060600000600000600060006060060060006060606060600000000000000000000000000000000000000
00000000000000000000000000000000000660060606060666066000000600066606060060060006600606060600000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070700000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070700000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000788870000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000007aaa70000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000088800000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070700000000000000000000000000000000000000000000000000000000000000000000000
b33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33bb33b
3b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b333b33
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454
45544444455444444554444445544444455444444554444445544444455444444554444445544444455444444554444445544444455444444554444445544444
44445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444
44544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
45444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444
44444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544
44d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d44444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
54445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444
44d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d4
44544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444
45444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444
44444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544
44d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d44444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
54445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444544454445444
44d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d444d4
44544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444
45444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444
44444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544444445444444454444444544
44d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d4444444d44444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444

__sfx__
00021f00000000e05000000000000000000000140501b0501f050210500000023050000000000000000000000000000000000000a85000000000000000000000000000000000000128501a8501c8500000000000
__music__
06 40424344

