
text		= ["ONCE UPON A TIME ... LONG AGO IN THE EVERGROWING TREES OF THE UNDERWORLD ... THERE LIE THREE DOVES IN WAIT FOR THEIR MASTER",
				"DJDKHSDKJSHDJKSHDJKSHDJKS  SDS DSDS D SDSDS "];
text		= global.defaults.intro_text;
count		= 0;
page		= 0;
text_speed	= .25;

timer		= [0, 0];
time		= [60, 30];
check		= false;

enum intro_states {wait, play, intro, outro}
state = intro_states.wait;
enum intro_times {page_end, in_between}

function initialize()
{
	// Set up text
	for (var i = 0; i < array_length(text); i++)
	{
		// Wrap text
		text[i] = string_wrap(text[i], 144);
		
		// Establish length (for no index issues
		length[i] = string_length(text[i])
		
		page_number = i;
	}
	
}

initialize();