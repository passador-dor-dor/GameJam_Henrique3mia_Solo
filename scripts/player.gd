extends CharacterBody2D
var can_dash = false

var SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var level: Node2D = $".."
@onready var clear: Label = $"../Hud/cleared"
@onready var next: Button = $"../Hud/next"

@export var RUN_MULTIPLIER : float = 1.35
var multiplier : float = 1.35

@onready var press_r_: Label = $"../Hud/Press R!"

func cleared():
	clear.show()
	next.show()
	set_physics_process(false)
	animated_sprite_2d.pause()
	level.contar=false
	

func die():
	press_r_.show()
	set_physics_process(false)
	animated_sprite_2d.pause()
	level.contar=false
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"): 
		get_tree().reload_current_scene()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("shift"):
		multiplier = RUN_MULTIPLIER
	else:
		multiplier = 1.0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("r_mb") and can_dash == true:
		$dashtimer.start()
		SPEED *= 3
	velocity.x = direction * SPEED
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
# Altera a animação
	if is_on_floor():			
		if Input.is_action_pressed("shift") and direction:
			animated_sprite_2d.play("run")
		elif direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("jump")
		

# Apply movement
	if direction:	
		velocity.x = direction * SPEED * multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()




func _on_dashtimer_timeout() -> void:
	SPEED = 150.0
