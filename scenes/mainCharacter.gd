extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canHide = false;
var canSee = true;
var canMove = true;
@onready var sprite_2d = $Sprite2D
@onready var main_char_body = $"."



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
		
	if Input.is_action_just_pressed("hide_behind") and canHide:
		hideBehind();
	if Input.is_action_just_released("hide_behind") and canSee == false:
		unHide()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if canMove:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		if velocity.x !=0 and sprite_2d.animation !="walk":
			sprite_2d.animation ="walk"
		if velocity.x ==0 and canSee == true:
			sprite_2d.animation = "default"
		var isLeft = velocity.x <0
		sprite_2d.flip_h = isLeft
	
func hideBehind():
	#swap sprites to hiding
	velocity.x = 0;
	velocity.y = 0;
	sprite_2d.animation = "Hide"
	canMove = false
	canSee = false;
	
	
func unHide():
	canSee = true;
	canMove = true
	sprite_2d.animation = "default"
	#when released swap back sprite, reenable movement and detection 

func getCanSee():
	return canSee

func setCanHide(canI):
	canHide = canI

func die():
	main_char_body.global_position.x= 82
	main_char_body.global_position.y= 120
	#sprite_2d.visible=false
