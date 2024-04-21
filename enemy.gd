extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $Detection/CollisionShape2D

var speed = 100
var player
var player_in_area = false
var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player_in_area:
		if player.getCanSee()==true:
			player.die()
	velocity.x = direction * speed
	
	move_and_slide()
	animated_sprite_2d.play("default")
	if direction == -1 :
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false


func _on_detection_body_entered(body):
	if body.has_method("getCanSee"):
		player_in_area= true
		player = body
	if body.has_method("inverter"):
		direction = direction *-1
		collision_shape_2d.position *=-1


func _on_detection_body_exited(body):
	if body.has_method("getCanSee"):
		player_in_area= false
		player = body
