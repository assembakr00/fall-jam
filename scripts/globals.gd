extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var level_1_text = {
	"text": "Bla", 
	"time": 3, 
	"next": {
		"text": "BlaBla", 
		"time": 3, 
		"next": {
			"text": "BlaBlaBla", 
			"time": 3, 
			"next": {
				"text": "BlaBlaBlaBla", 
				"time": 3, 
				"next": {
					"text": "BlaBlaBlaBlaBla", 
					"time": 3, 
					"next": {
						"text": "BlaBlaBlaBlaBlaBla", 
						"time": 3, 
						"next": {
							"text": "BlaBlaBlaBlaBlaBlaBla", 
							"time": 3, 
							"next": {
								"text": "BlaBlaBlaBlaBlaBlaBlaBla", 
								"time": 3, 
								"next": {
									
								}
							}
						}
					}
				}
			}
		}
	}
}
