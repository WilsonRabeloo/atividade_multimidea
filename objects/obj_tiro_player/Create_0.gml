direction = point_direction(x,y,mouse_x, mouse_y)
speed = 5

px = x
py = y


_part = part_system_create(ps_exemplo)
part_system_position(_part, px, py)
part_system_angle(_part, direction+90);
