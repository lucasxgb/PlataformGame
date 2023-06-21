extends Area2D

func _ready():
	pass 


func caiu_buraco(body):
	get_tree().reload_current_scene()
	#var resetarTela = load(Niveis.current_level).instance()
	
	#get_tree().current_scene.add_child(resetarTela)
	#var telaGameOver = load("res://Cenas/telaGameOver.tscn").instance() #instanciação
	# #
