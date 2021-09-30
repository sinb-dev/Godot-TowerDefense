extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocity: Vector2 = Vector2(100,100);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position += velocity * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
