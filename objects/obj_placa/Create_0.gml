caixa = noone



criar_caixa = function(){
    
    var _player = place_meeting(x,y,obj_player);
    
    if _player {
        
        if !instance_exists(caixa){
            caixa = instance_create_layer(x,y,"Assets",obj_caixa_dialogo);
            caixa.image_alpha = 0.6
            caixa.image_xscale = .2
            caixa.texto = texto;
            //caixa.escala = escala;
            
        }
        
    }
    else if !_player{
        
        if instance_exists(caixa){
            caixa.coisar = true;
        }
    }
    
}
