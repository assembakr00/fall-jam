extends Node

var can_interact_with_root = false

var root_status = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	can_interact_with_root = !root_status and can_interact_with_root

var level_1_text = {
	"0text": "Bla", 
	"0time": 3, 
	"1text": "BlaBla", 
	"1time": 3, 
	"2text": "BlaBlaBla", 
	"2time": 3, 
	"3text": "BlaBlaBlaBla", 
	"3time": 3, 
	"4text": "BlaBlaBlaBlaBla", 
	"4time": 3, 
	"5text": "BlaBlaBlaBlaBlaBla", 
	"5time": 3, 
}
