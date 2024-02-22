extends State
@onready var sprite = $"../../CharacterBody2D/AnimatedSprite2D"
@onready var character = $"../../CharacterBody2D"


func stateEntered(): 
	print('Walk entered')
	sprite.play("walk")
	
func statePhysicsProcess(delta: float) -> void :
	if not character.is_on_floor():
		character.velocity.y += host.gravity * delta
		
	var direction = Input.get_axis("ui_left", "ui_right")	
	if direction:
		sprite.flip_h = direction == -1 
		character.velocity.x = direction * host.SPEED
		sprite.play("walk")
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, host.SPEED)
		host.changeState("Idle")

	character.move_and_slide()

func stateInput(event) -> void : 
	if event.is_action_pressed("ui_accept") and character.is_on_floor():
		host.changeState('Jump')	
	
	
	
