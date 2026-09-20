
function inicia_efeito_mola(){
    
    xscale=1;
    yscale=1;
    
}


function efeito_mola(_xscale,_yscale){
    
    xscale=_xscale;
    yscale=_yscale;
    
    
}

function retorna_mola(_qnt){
    
    xscale = lerp(xscale,1,_qnt);
    yscale = lerp(yscale,1,_qnt);
    
    
}

function desenha_mola(){
    
    draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha);
    
    //aqui faz mais sentido fazer o drawsprite do proprio personagem
    
}