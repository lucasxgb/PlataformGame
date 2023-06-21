extends KinematicBody2D

var move_speed = 800
var gravity = 1200
var jump_force = -1100 #pq na godot é inverso o eixo y (pra cima positivo e pra baixo negativo)
var velocity = Vector2()
var is_grounded

var vidaAnterior = 100
var vida = 100
var max_vida = 100
var recuperar_vida = 100

var pontosAnterior = 0
var pontos = 0
var nivelAtual = 1

signal player_HUD_changer

onready var raycasts = get_node("raycasts")

func _physics_process(delta):
	mudarLevel()
	
	if vidaAnterior != vida:
		vidaAnterior = vida
		emit_signal("player_HUD_changer", self)
		
	if pontosAnterior != pontos:
		pontosAnterior = pontos
		emit_signal("player_HUD_changer", self)
	
	if vida <= 0:
		get_tree().change_scene("res://CenaNiveis/nivel" + str(nivelAtual) + ".tscn")
	
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

func mudarLevel():
	pass
