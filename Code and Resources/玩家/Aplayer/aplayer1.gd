extends Area2D

var vec2:Vector2=Vector2(0,10)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("ai")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
