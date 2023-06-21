extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_player_HUD_changer(var Player):
	$barra.rect_size.x = 144 * Player.vida / Player.max_vida
	$Pontos.text =  str(Player.pontos)

