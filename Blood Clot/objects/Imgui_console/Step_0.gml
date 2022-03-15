
//debug functionality
key_debug = keyboard_check_pressed(vk_f3);
if(key_debug and !debug){ debug = true; }
else if(key_debug and debug){ debug = false; }

//a method for console logging
function logConsole(prefix = "", text = "")
{
	var stack_length = array_length(stack);
	stack_prefix[stack_length] = prefix;
	stack[stack_length] = text;		
}