extends State
@onready var sprite = $"../../CharacterBody2D/AnimatedSprite2D"
@onready var character = $"../../CharacterBody2D"

func stateEntered(): 
	host.sprite.play("idle")
	

func statePhysicsProcess(delta: float) -> void :
	if not character.is_on_floor():
		character.velocity.y += host.gravity * delta
		
	host.character.move_and_slide()
	


func stateInput(event) -> void : 
	if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
		host.changeState('Walk')
	if event.is_action_pressed("ui_accept") and character.is_on_floor():
		host.changeState('Jump')	
	
	
	
