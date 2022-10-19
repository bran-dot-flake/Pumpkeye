
var hsep = 3; var vsep = 40; var line_sep = string_height("A") + 3;


// Instance variables
for (var i = 0; i < array_length(instance); i++)
{
	if variable_instance_exists(instance[i,0], instance[i,1])
	{
		var val = variable_instance_get(instance[i,0], instance[i,1]);
		var nme = string_upper(instance[i,1]);
		var str = nme + " " + string(val);
		
		draw_text(hsep, vsep + i * line_sep, str);
	}
	else array_delete(instance, i, 1);
}



// Global variables
draw_set_color(c_gray);
for (var j = 0; j < array_length(globals); j++)
{
	var k = i + j;
	
	if variable_global_exists(globals[j])
	{
		var val = variable_global_get(globals[j]);
		var nme = string_upper(globals[j]);
		var str = nme + " " + string(val);
		
		draw_text(hsep, vsep + k * line_sep, str);
	}
	else array_delete(globals, j, 1);
}
draw_set_color(c_white);