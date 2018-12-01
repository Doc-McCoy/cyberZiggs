extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 200
const JUMP_HEIGTH = 300
onready var animation = get_node("../AnimationZiggs")
var motion = Vector2()

func _physics_process(delta):
	# Aplicar gravidade
	#motion.y += GRAVITY
	
	# Movimentos Básicos
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		if not animation.is_playing():
			animation.play("idle")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		animation.stop()
	
	# Pulo
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		motion.y = -JUMP_HEIGTH
	else:
		#$Sprite.play("jump")
		pass
	
	# Movimentar
	motion = move_and_slide(motion, UP)