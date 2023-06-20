extends KinematicBody2D

var move_speed = 800
var gravity = 1200
var jump_force = -1100 #pq na godot é inverso o eixo y (pra cima positivo e pra baixo negativo)
var velocity = Vector2()
var is_grounded
onready var raycasts = get_node("raycasts")


func _physics_process(delta):
	velocity.y += gravity * delta
	
	_get_input()
	velocity = move_and_slide(velocity)

	is_grounded = _check_is_ground()
	_set_animation()
	

func _get_input():
	velocity.x=0
	var move_direction = int(Input.is_action_pressed("move_right")) -  int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
	
	if move_direction !=0:
		if move_direction > 0:
			if $textura.flip_h == false:
				$textura.flip_h = true
		else: 
			if $textura.flip_h == true:
				$textura.flip_h= false
				
		

func _input(event):
	if event.is_action_pressed("jump") and is_grounded:
		velocity.y = jump_force / 2
		
func _check_is_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false

func _set_animation():
	var anim = "idle"
	if !is_grounded:
		anim = "jump"
	elif velocity.x !=0:
		anim = "andando"
	if $anim.assigned_animation != anim:
		$anim.play(anim)

