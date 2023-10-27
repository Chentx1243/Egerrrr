extends Area2D

@export var rate = 10 #调整移速放大倍率
func _physics_process(delta):
	for i in get_overlapping_areas():
		if(i.is_in_group("ball")):
			get_node("pong").play()
			i.vec.x = -5#偏离速度
	var up = Input.get_action_strength("2上")*rate
	var down = Input.get_action_strength("2下")*rate
	position.y = position.y-up+down
