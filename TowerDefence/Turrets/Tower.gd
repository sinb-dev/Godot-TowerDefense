extends Node2D

var Cannon = load("res://Turrets/Cannon.tscn")
var turret_range = 800
var turret
func _ready():
	pass

func turn_towards(point: Vector2):
	var dx = position - point;
	turret.rotation = atan2(dx.y, dx.x) - PI/2

func in_range(point: Vector2) -> bool:
	return position.distance_squared_to(point) < turret_range*turret_range

func place_cannon():
	if turret:
		print("Cannot place two turrets")
		return
	turret = Cannon.instance()
	add_child(turret)
	pass
