pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
function _init()
	t=0
	player = {} 
	player.x = 20 
	player.y = 50 
	player.sprite = 0 
	player.h = 3
	player.p = 0 
	player.box = {x1=0,y1=0,x2=7,y2=7}
	
	bullets = {}
	enemies = {}

 for i=1,4 do
 add(enemies, {
  sp=1,
  m_x=i*16,
  m_y=60-i*8,
  x=-32,
  y=-32,
  r=12,
  box = {x1=0,y1=0,x2=7,y2=7}
 })
 end
end 

function abs_box(s)
 local box = {}
 box.x1 = s.box.x1 + s.x
 box.y1 = s.box.y1 + s.y
 box.x2 = s.box.x2 + s.x
 box.y2 = s.box.y2 + s.y
 return box

end

function coll(a,b)
 -- todo
 box_a = abs_box(a)
 box_b = abs_box(b)
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
    
    t=t+1
 
 			for e in all(enemies) do
			  e.x = e.r*sin(t/50) + e.m_x
			  e.y = e.r*cos(t/50) + e.m_y
			 	if coll(ship,e) then
			    --todo
			  
			  end
			 end
 
			 for b in all(bullets) do
			  b.x+=b.dx
			  b.y+=b.dy
			  
			  if b.x < 0 or b.x > 128 or
   b.y < 0 or b.y > 128 then
			    del(bullets,b)
			  end
			  
			  for e in all(enemies) do
			   if coll(b,e) then
			    del(enemies,e)
			    ship.p += 1
			   end
			  end
			  
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
    print(ship.p,9) 
    spr(player.sprite, player.x, player.y)
				
				for b in all(bullets) do 
			  spr(b.sp,b.x,b.y)
			 end
			 
			 for e in all(enemies) do
			  spr(e.sp,e.x,e.y)
			 end
			 
			 for i=1,4 do
			  if i<=player.h then 
			  spr(16,80+6*i,3)
			  else
			  spr(17,80+6*i,3)
			  end
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
08080000060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888000666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08880000066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00800000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

