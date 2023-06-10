extends KinematicBody2D

var move_speed = 480
var gravity = 1200
var jump_force = -720 #pq na godot é inverso o eixo y (pra cima positivo e pra baixo negativo)
var velocity = Vector2()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	move_and_slide(velocity)



func _get_input():
	
	var move_direction = int(Input.is_action_just_pressed("move_right")) -  int(Input.is_action_just_pressed("move_left"))
	velocity.x = move_speed * move_direction
	
	if move_direction !=0:
		$textura.scale.x = move_direction
