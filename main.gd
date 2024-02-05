extends Node2D

var level1Path = "res://Levels/level_1.tscn"
var loadPath = "res://Splash/loading_screen.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$SceneManager.changeSceneWithLoading(level1Path, loadPath)	

