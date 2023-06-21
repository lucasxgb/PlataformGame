extends Control
var start_btn 

func _ready():
	start_btn = get_node("controle/NovoJogo")
	start_btn.grab_focus()
	


func _on_Controles_pressed():
	var telaControles = load("res://Cenas/telaControles.tscn").instance() #instanciação
	get_tree().current_scene.add_child(telaControles) #coloca a imagem sobre a tela inicial
	


func _on_Sair_pressed():
	get_tree().quit()


func _on_Continuar_pressed():
	var telaNivel = load("res://Cenas/selecionarNível.tscn").instance() #instanciação
	get_tree().current_scene.add_child(telaNivel) #coloca a imagem sobre a tela inicial


func _on_NovoJogo_pressed():
	var primeiraTela = load("res://CenaNiveis/nivel1.tscn").instance() #instanciação
	get_tree().current_scene.add_child(primeiraTela)
