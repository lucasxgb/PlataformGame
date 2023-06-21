extends Control


func _on_btnMenu_pressed():
	var menuInicial = load("res://Cenas/telaInicial.tscn").instance() #instanciação
	get_tree().current_scene.add_child(menuInicial) #



func _on_btnReiniciar_pressed():
	var telaPassada = load(Niveis.current_level).instance()
	get_tree().current_scene.add_child(telaPassada)
