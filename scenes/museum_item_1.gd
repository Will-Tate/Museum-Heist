extends CharacterBody2D
var player
var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.




func _on_area_2d_body_entered(body):
	if body.has_method("getCanSee"):
		player_in_area= true
		player = body
		player.setCanHide(true)
		



func _on_area_2d_body_exited(body):
	if body.has_method("getCanSee"):
		player_in_area= false
		player = body
		player.setCanHide(false)
