draw_self()
//draw_sprite_ext(sprite_index,0,x,y,1.5,1.5,0,image_blend,0.5)

var _esc = random_range(0,0.02);
gpu_set_blendmode(bm_add);
//draw_sprite_ext(spr_tocha_brilho,0,x,y,0.3+_esc,0.3+_esc,0,c_white,0.3+_esc);
draw_sprite_ext(sprite_index,0,x,y,1.5+_esc,1.5+_esc,0,image_blend,0.2+_esc)
gpu_set_blendmode(bm_normal);