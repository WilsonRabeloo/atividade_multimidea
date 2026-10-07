if (keyboard_check_pressed(ord("E")) && !ativou && instance_place(x,y,obj_player))
{
    layer_sequence_create(layer, x, y, sq_some);
    ativou = true;
}

