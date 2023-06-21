extends Area2D

func _ready():
	pass 


func caiu_buraco(body):
	get_tree().change_scene("res://CenaNiveis/nivel" + str(body.nivelAtual) + ".tscn")
