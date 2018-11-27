extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 200
const JUMP_HEIGTH = 300
var motion = Vector2()

func _physics_process(delta):
	# Aplicar gravidade
	motion.y += GRAVITY
	
	# Movimentos Básicos
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false;
		#$Spirte.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true;
		#$Spirte.play("run")
	else:
		motion.x = 0
		#$Spirte.play("idle")
	
	# Pulo
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		motion.y = -JUMP_HEIGTH
	else:
		#$Sprite.play("jump")
		pass
	
	# Movimentar
	motion = move_and_slide(motion, UP)