extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocity: Vector2 = Vector2(100,100);
export var speed: int = 0;
export var damage: int = 50
var target: Vector2;
var target_id: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_target(id, x, y):
	target = Vector2(x,y);
	target_id = id
	
func set_speed(s: int):
	speed = s
	
func _process(delta):
	if target == null:
		return;
	var x = target.x
	var y = target.y
	var v: Vector2 = Vector2(x,y)
	var t = Vector2(global_position.x, global_position.y)
	var d = v.distance_squared_to(global_position)
	if d < 4:
		
		print("Queue projectile for removal")
		queue_free()
		emit_signal("hit")
		#target.emit_signal("hit",self)
	position += v.normalized() * speed * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
