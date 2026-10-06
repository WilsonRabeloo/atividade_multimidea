vivo = true
timer = game_get_speed(gamespeed_fps)*random_range(1,4)
inicia_efeito_mola();


atirar = function(){ 
    
    if vivo
    {
    
          if timer<=0 {
            show_debug_message("atirou");
            efeito_mola(0.7,1.3)
            timer = game_get_speed(gamespeed_fps)*irandom_range(1,5);
            
            var dir = point_direction(x,y,obj_player.x, obj_player.y-16);
            var _t = instance_create_layer(x,y,layer,obj_tiro_inimigo)
            _t.direction = dir
            _t.speed = 2
            toca(snd_tiro)

                
          
          } 
        
    }
}

morrer = function(){
    
    //vivo = false
    
    if !vivo{
        
        image_alpha-=0.1
        
        if image_alpha<=0 instance_destroy();
        
    }
    
    
}

