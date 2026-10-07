criar_sequence = function()
{
    with (obj_inimigo)
    {
        instance_destroy();
    }

    var seq = choose(seq_enemy_mov_h, seq_enemy_mov_v);

    layer_sequence_create(
        "Instances",
        obj_player.x,
        obj_player.y,
        seq
    );

    // 4 segundos da sequence
    alarm[0] = room_speed * 5;
};

criar_sequence();