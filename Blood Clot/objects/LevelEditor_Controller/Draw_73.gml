/// @desc draw paint boxes

var _sz = ea_get_size();
var _rw = (room_width div _sz);
var _rh = (room_height div _sz)
var _cellx = clamp((mouse_x div _sz), 0, _rw - 1) * _sz;
var _celly = clamp((mouse_y div _sz), 0, _rh - 1) * _sz;
draw_rectangle_colour(_cellx, _celly, _cellx + _sz, _celly + _sz, c_black, c_black, c_black, c_black, true);
draw_set_alpha(0.25);
draw_rectangle_colour(_cellx - _sz, _celly - _sz, _cellx + (_sz * 2), _celly + (_sz * 2), c_red, c_red, c_red, c_red, true);

draw_set_alpha(1);





