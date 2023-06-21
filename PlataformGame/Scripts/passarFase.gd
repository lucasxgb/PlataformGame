extends Area2D


func _ready():
	pass 


func _on_passarFase_area_entered(body):
	#print(body.nivelAtual)
	body.nivelAtual += 1
	#print(body.nivelAtual)
	get_tree().change_scene("res://CenaNiveis/nivel" + str(body.nivelAtual) + ".tscn")
