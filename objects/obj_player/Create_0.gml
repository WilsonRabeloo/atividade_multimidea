// Variaveis

velh = 0;
max_velh = 2;

velv = 0;
max_velv = 4;

grav = 0.250;

chao = false;
teto = false;

dir = false;
esq = false;
jump = false;

olha = 1;
xscale = 1//0.72
yscale = 1//0.72

cntrl_vel = 0
alphafx = 0

var _layer = layer_tilemap_get_id("tl_chao");
colisoes = [obj_parede, _layer];


efeitos = ["fx_pb","fx_agua","fx_old","fx_blur","fx_wave"]
efeito_atual = -1;


pega_input = function(){
    
    dir = keyboard_check(ord("D"));
    esq = keyboard_check(ord("A"));
    jump = keyboard_check_pressed(vk_space);
    mira = mouse_check_button(mb_right)
    
}

checa_chao = function()
{
    chao = place_meeting(x, y + 1, colisoes);
}

checa_teto = function()
{
    teto = place_meeting(x, y - 1, colisoes);
}

aplica_vel = function(){
    
    checa_chao();
    velh = (dir - esq) * max_velh;
    
    if !chao
    {
        velv += grav;
        if teto velv = grav;
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
    image_blend = c_white
    
    troca_sprite(spr_player_parada)
    velv = 0;
    velh = 0;
    aplica_vel();
    
    if dir xor esq
    {
        estado = estado_movendo;
    }
    
    if jump{
        efeito_mola(0.8,1.5);
        estado = estado_pulo;
        toca(snd_pulo)
    }
    
    if !chao{
        efeito_mola(0.8, 1.5);
        estado = estado_pulo;
    }
    
    if mira{
        estado = estado_atirar;
        
    }
    
}

estado_movendo = function()
{
    troca_sprite(spr_player_andar_orig)
    aplica_vel();
    
    if velh == 0 {
        estado = estado_parado;
    }
    
    if jump{
        toca(snd_pulo)
        efeito_mola(0.8,1.2);
        estado = estado_pulo;
    }
    
    if !chao{
        //efeito_mola(0.8, 1.2);
        estado = estado_pulo;
        toca(snd_pulo);
    }
    
}

estado_pulo = function()
{
    
    aplica_vel();
    
    if chao{
        efeito_mola(1.2, 0.5);
        estado = estado_parado;
    }
    
      if mira{
        
        estado = estado_atirar;
        
    }
    
}

estado_atirar = function()
{
    aplica_vel()
    velh = 0
    
    if (mouse_x-x) != 0 olha = sign(mouse_x-x);
    
    //image_blend = c_blue
    troca_sprite(spr_player_tiro)
    
    if !cntrl_vel{
        image_speed = 0}
    
    if !mira{
        estado = estado_parado
        image_speed=1}
    
    if mouse_check_button_pressed(mb_left)
    {
        cntrl_vel = 1
        image_index = 1
        image_speed = 1
        toca(snd_tiro)
        
        show_debug_message("ababa")
    }
    
    if image_index >= image_number - 1{
        cntrl_vel = 0}
    
    
    if mouse_check_button_pressed(mb_left){
        
        var _tiro = instance_create_layer(x,y-20,layer,obj_tiro_player);
        efeito_mola(1.2,0.8)
        
    }
    
    if keyboard_check_pressed(vk_space) and chao{
        
        efeito_mola(0.8,1.4);
        toca(snd_pulo)
    }
    
    
}

//estado_atirar = function()
//{
    //aplica_vel()
    //velh = 0
    //
    //olha = sign(mouse_x-x)
    //
    //image_blend = c_blue
    //sprite_index = spr_player_tiro
    ////image_index = 0
    //
    ////if image_index = 0{
        ////
        ////image_speed = 0
        ////
    ////}else{
        ////
        ////image_speed = 0
    ////}
    ////
    //
    //
    //if !cntrl_vel image_speed = 0
    //
    //
    //if !mira{
        //
        //estado = estado_parado;
        //
    //}
    //if mouse_check_button_pressed(mb_left){
        //
        //cntrl_vel = 1
        //image_index=1
        //show_debug_message("ababa")
        //
        //
        //
    //}
    //
    //if image_index=0 cntrl_vel = 0
//}

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

levar_dano = function(){
    
    global.shake = 15
    efeito_mola(0.5,1.5)
    alphafx = 2
    toca(snd_hit)
    
}

efeito_atual = -1;

alternar_efeito = function()
{
    efeito_atual++;

    if (efeito_atual >= array_length(efeitos))
        efeito_atual = -1;

    for (var i = 0; i < array_length(efeitos); i++)
    {
        layer_set_visible(layer_get_id(efeitos[i]), i == efeito_atual);
    }
}

