draw_self()

if !desenhar exit
    
/*
draw_set_font(fnt_texto)
draw_set_halign(fa_center) 
draw_set_valign(fa_middle)

var _escala = 0.1
draw_text_ext_transformed(x,y,texto,60, sprite_width*10, _escala,_escala,0)

draw_set_halign(-1) 
draw_set_valign(-1)
draw_set_font(-1)*/

var _txt = scribble(texto).starting_format("fnt_texto",c_white);


_txt.align(fa_center, fa_middle);
_txt.scale(0.15)
_txt.fit_to_box(sprite_width-4,sprite_height)
//_txt.gradient(c_yellow,0.5)



_txt.draw(x,y,escrevedor);
