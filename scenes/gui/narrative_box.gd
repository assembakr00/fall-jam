extends Control

var passed_text = null
var curr_step = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if passed_text:
		print("Narrative Box has something")

func get_curr_text(text, step):
	var curr_text = text
	
	for i in range(step):
		if "next" in curr_text:
			curr_text = curr_text["next"]
		else:
			return "No more text"
	
	# Return the current text dict
	return curr_text
