extends Node2D

var level1Path = "res://Levels/level_1.tscn"
var loadPath = "res://Splash/loading_screen.tscn"

@onready var backspaceSubject: Subject = Subject.new()
var bools: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SceneManager.changeSceneWithLoading(level1Path, loadPath)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
	

		
		

