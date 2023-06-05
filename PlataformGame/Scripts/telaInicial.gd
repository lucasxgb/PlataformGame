extends Control
var start_btn 

func _ready():
	start_btn = get_node("controle/NovoJogo")
	start_btn.grab_focus()
	



