coisar = false
image_alpha = 0
image_xscale = .1
image_yscale = .1

escrevedor = scribble_typist();
escrevedor.in(0.5,5)

scribble_anim_wave(1,0.2,0.2)

sumir = function(){
    
    if coisar{
        
        desenhar = false
        
        image_xscale = lerp(image_xscale, 0, 0.2)
        image_yscale = lerp(image_yscale, 0, 0.2)
        image_alpha = lerp(image_alpha,0,0.1)
        y = lerp(y,ystart,0.2)
        
        if image_alpha<=0.01 instance_destroy();
    
    }
}


aparecer = function(){
    
   if !coisar{ 
       image_xscale = lerp(image_xscale, 2.5, 0.1)
       image_yscale = lerp(image_yscale, 1, 0.15)
       image_alpha = lerp(image_alpha,.6,0.1)
   
       y = lerp(y,ystart-35,0.1)
   
       if (y <= ystart-20) and !coisar {desenhar = true}
    }
    
}


//texto = "wasd pra andar !"
desenhar = false