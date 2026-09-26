extends Control

var curr_text = null
var curr_step = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if curr_text:
		if $NarratorTimer.time_left == 0:
			change_time(curr_text)
			show_text(curr_text)
			curr_step += 1

# Update the text
func show_text(text_dict):
	if str(curr_step) + "text" in text_dict:
		$NarratorText.text = text_dict[str(curr_step) + "text"]
	else:
		return "No text found"

# Start the timer
func change_time(text_dict):
	if str(curr_step) + "time" in text_dict:
		$NarratorTimer.start(text_dict[str(curr_step) + "time"])
	else:
		return "No time set"
