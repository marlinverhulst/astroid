extends Node2D


@onready var dropShip = $DropShip
@onready var player = $cut_sceen_player_yellow
@onready var demoDoneSubject = Subject.new() 
var centerScreenX = 240
var centerScreenY = 200
var dropShipSpeed = 80
var playerFallSpeed = 120
var doneEmitted = false

var dropShipInPlace = false
var playerInPlace = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moveDropShipToCenter(delta)
	dropPlayer(delta)
	moveDropShipOutOfScreen(delta)

func moveDropShipToCenter(delta) -> void:
	if centerScreenX > dropShip.position.x and not dropShipInPlace:
		dropShip.position.x += dropShipSpeed * delta
	else: dropShipInPlace = true  

func dropPlayer(delta) -> void:
	player.position.x = centerScreenX
	if dropShipInPlace:
		if player.position.y < centerScreenY:  
			player.visible = true
			player.position.y += playerFallSpeed * delta
		else: playerInPlace = true	
			
func moveDropShipOutOfScreen(delta) -> void:
	if dropShipInPlace and playerInPlace:
		if dropShip.position.y > -65:
			dropShip.position.y-= dropShipSpeed * delta
		elif not doneEmitted:
			demoDoneSubject.emit(true)
			doneEmitted = true
			 
