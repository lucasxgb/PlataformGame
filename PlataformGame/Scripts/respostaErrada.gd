extends Area2D


func _ready():
	pass # Replace with function body.


func personagem_pegou_numero_errado(body):
	body.vida -= 10
	print(body.vida)

	# Agenda o objeto atual para ser liberado da memória
	self.queue_free()
	
	var noPai = self.get_parent()
	var filhoNumeros = noPai.get_node("Numeros")
	
	if filhoNumeros != null:
		# Remove o nó filho do nó pai
		noPai.remove_child(filhoNumeros)
	
	var filhoItens = noPai.get_node("Itens")
	if filhoItens != null:
		# Remove o nó filho do nó pai
		noPai.remove_child(filhoItens)


