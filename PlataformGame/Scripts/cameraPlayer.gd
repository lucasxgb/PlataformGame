extends Camera2D

onready var player = null

func _ready():
	player = get_node("/root/Player")

func _process(delta):
	if player:
		var player_global_transform = player.get_global_transform()
		var player_position = player_global_transform.origin

		var camera_position = position
		camera_position.y = player_position.y
		position = camera_position
