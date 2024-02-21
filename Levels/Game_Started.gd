extends State

@onready var playfieldNode = $"../../playfield"

func stateEntered(): 
	print('entered GAME_STARTED')
	var playerScene = load("res://assets/player/player.tscn")
	var player = playerScene.instantiate()
	player.position.x = 240
	player.position.y = 201
	playfieldNode.add_child(player)

