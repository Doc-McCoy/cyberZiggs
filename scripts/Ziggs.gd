extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 300
const JUMP_HEIGTH = 600
onready var animation = get_node("../AnimationZiggs")
var motion = Vector2()

func _physics_process(delta):
	# Aplicar gravidade
	motion.y += GRAVITY
	
	# Movimentos Básicos
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Torso.set_scale(Vector2(1,1))
		if not animation.is_playing():
			#animation.play("floating")
			pass
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Torso.set_scale(Vector2(-1,1))
	else:
		motion.x = 0
		if not animation.is_playing():
			animation.play("idle")
	
	# Pulo
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		motion.y = -JUMP_HEIGTH
	else:
		#$Sprite.play("jump")
		pass
	
	# Movimentar
	motion = move_and_slide(motion, UP)