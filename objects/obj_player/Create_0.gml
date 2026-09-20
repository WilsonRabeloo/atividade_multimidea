// Variaveis

velh = 0;
max_velh = 2;

velv = 0;
max_velv = 3.8;

grav = 0.250;

chao = false;
teto = false;

dir = false;
esq = false;
jump = false;

olha = 1;
xscale = 1//0.72
yscale = 1//0.72

var _layer = layer_tilemap_get_id("tl_chao");
colisoes = [obj_parede, _layer];

pega_input = function(){
    
    dir = keyboard_check(ord("D"));
    esq = keyboard_check(ord("A"));
    jump = keyboard_check_pressed(vk_space);
    
}

checa_chao = function()
{
    chao = place_meeting(x, y + 1, colisoes);
}

aplica_vel = function(){
    
    checa_chao();
    velh = (dir - esq) * max_velh;
    
    if !chao
    {
        velv += grav;
    }
    else
    {
        velv = 0;
        y = round(y);
        x = round(x);
        velv = -jump * max_velv;
    }
    
    velv = clamp(velv, -max_velv, max_velv);
    
}

mover = function(){
    
    move_and_collide(velh, velv, colisoes, 4);
    move_and_collide(0, velv, colisoes, 24);
    
}

estado_parado = function()
{
    
    velv = 0;
    velh = 0;
    aplica_vel();
    
    if dir xor esq
    {
        estado = estado_movendo;
    }
    
    if jump{
        estado = estado_pulo;
    }
    
    if !chao{
        estado = estado_pulo;
    }
    
}

estado_movendo = function()
{
    
    aplica_vel();
    
    if velh == 0 {
        estado = estado_parado;
    }
    
    if jump{
        estado = estado_pulo;
    }
    
    if !chao{
        estado = estado_pulo;
    }
    
}

estado_pulo = function()
{
    
    aplica_vel();
    
    if chao{
        estado = estado_parado;
    }
    
}

estado = estado_parado;


ajusta_escala = function(){
    
    if velh != 0{
        
        olha = sign(velh);
        
    }
    
}

troca_sprite = function(_spr){
    
    if sprite_index != _spr{
        
        sprite_index = _spr;
        image_index = 0;
        
    }
    
}

