draw_sprite_ext(sprite_index,image_index,x,y,xscale*olha,yscale,image_angle,image_blend,1)


gpu_set_blendmode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,xscale*olha,yscale,image_angle,c_white,alphafx)
gpu_set_blendmode(bm_normal)