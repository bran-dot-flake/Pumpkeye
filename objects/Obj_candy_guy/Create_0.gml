
hp = 10;

if (has_weapon)
{
	mygun = instance_create_layer(x,y, "Gun", Obj_Enemy_weapon)
	with(mygun)
	{
		owner = other.id
	}
}
else mygun = noone;