extends Control

var passed_text = null
var curr_step = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if passed_text:
		if $NarratorTimer.time_left == 0:
			var curr_dict = get_curr_text(passed_text, curr_step)
			$NarratorTimer.start(curr_dict["time"])
			show_text(curr_dict)
			curr_step += 1

func show_text(text_dict):
	if "text" in text_dict:
		$NarratorText.text = text_dict["text"]
	else:
		return "No text found"

func get_curr_text(text, step):
	var curr_text = text
	
	for i in range(step):
		if "next" in curr_text:
			curr_text = curr_text["next"]
		else:
			return "No more text"
	
	# Return the current text dict
	return curr_text
