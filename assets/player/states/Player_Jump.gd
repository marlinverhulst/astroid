extends State
@onready var sprite = $"../../CharacterBody2D/AnimatedSprite2D"
@onready var character = $"../../CharacterBody2D"
var jumped = false

func stateEntered(): 
	print('Jump entered')
	sprite.play("walk")
	
func statePhysicsProcess(delta: float) -> void :
	if not jumped:
		character.velocity.y += host.JUMP_VELOCITY
		jumped = true
	if not character.is_on_floor():
		character.velocity.y += host.gravity * delta
		
	var direction = Input.get_axis("ui_left", "ui_right")	
	if direction:
		sprite.flip_h = direction == -1 
		character.velocity.x = direction * host.SPEED
		sprite.play("walk") # but should be falling
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, host.SPEED)
		sprite.play("walk") # but should be falling
	if character.is_on_floor():
		jumped = false
		host.changeState('Walk')	
	character.move_and_slide()

func stateUnhandledInput(event) -> void : 
	pass
	
	
	
