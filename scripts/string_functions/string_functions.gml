
///@desc 
///@arg str
///@arg max_width
function string_wrap(str, max_str_w)
{
	// Insert line break every given index at last possible open space
	var str_len = string_length(str);
	var last_free_spce = 1;
	
	var substr; var cur_char = 1; repeat str_len
	{
		// Copy until current character
		substr = string_copy(str, 1, cur_char);
		
		// Mark free spaces
		if string_char_at(str, cur_char) == " " last_free_spce = cur_char;
		
		// Check if exceeded max length
		if string_width(substr) > max_str_w
		{
			// Insert line break : Delete extra space
			str = string_delete(str, last_free_spce, 1);
			str = string_insert("\n", str, last_free_spce);
		}
		
		// Increment character
		cur_char++;
	}
	
	return str;
}



///@arg str
///@arg max_height
function string_chop(str, mx_hgt)
{
	var str_chop = [];
	var last_free_spce = 1;
	
	var substr_indx = 1; var hgt = string_height(str); var indx = 0;; var cur_char = 1; repeat string_length(str)
	{
		// Copy string to current character
		var substr = string_copy(str, substr_indx, cur_char);
		var rem_hgt = string_height(substr)
		
		// Insert max string into array : Reset string and current character
		if string_height(substr) > mx_hgt
		{
			// Go back to last free space
			substr = string_copy(substr, substr_indx, cur_char - 1);
			
			// Add substring to array
			array_insert(str_chop, indx, substr);
			indx++;
			substr_indx += cur_char - 1;
		}
		// Mark free spaces
		else
		{
			//if string_char_at(substr, cur_char)	
		}
		
		cur_char++;
	}
	
	array_insert(str_chop, indx, substr);
	return str_chop;
}