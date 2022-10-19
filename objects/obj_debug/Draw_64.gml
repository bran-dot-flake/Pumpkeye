
var hsep = 3; var vsep = 3; var line_sep = string_height("A") + 3;

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