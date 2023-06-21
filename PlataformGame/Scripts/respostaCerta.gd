extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func personagem_pegou_numero_certo(body):
	body.pontos += 10
	print(body.pontos)
	if body.vida < 90:
		body.vida += 10

	# Agenda o objeto atual para ser liberado da memória
	self.queue_free()
	
	var noPai = self.get_parent()
	var filhoNumeros = noPai.get_node("Numeros")
	if filhoNumeros != null:
		# Remove o nó filho do nó pai
		noPai.remove_child(filhoNumeros)
		#print(noPai.name)
	
	var filhoItens = noPai.get_node("Itens")
	if filhoItens != null:
		# Remove o nó filho do nó pai
		noPai.remove_child(filhoItens)
		#print(noPai.name)
