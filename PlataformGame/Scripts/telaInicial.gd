extends Control
var start_btn 

func _ready():
	start_btn = get_node("controle/NovoJogo")
	start_btn.grab_focus()
	



func _on_Controles_pressed():
	var telaControles = load("res://Cenas/telaControles.tscn").instance() #instanciação
	get_tree().current_scene.add_child(telaControles) #coloca a imagem sobre a tela inicial
	pass # Replace with function body.


func _on_Sair_pressed():
	get_tree().quit()
