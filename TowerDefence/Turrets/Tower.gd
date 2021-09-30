extends Node2D


export var cool_down = 1
export var turret_range = 800
export var projectile_speed = 100

var Cannon = load("res://Turrets/Cannon.tscn")
onready var CannonBall = preload("res://Projectiles/CannonBall.tscn")

var fire_cooldown = 0

var turret
var target = null
func _ready():
	pass
func has_target() -> bool:
	return target != null
	
func target(enemy):
	target = enemy

func _process(delta):
	fire_cooldown = clamp(fire_cooldown-delta,0, cool_down);
	if has_target():
		turn_towards(target.get_parent().position)
		if fire_cooldown == 0:
			shoot_at_target()
		
func shoot_at_target():
	print("Shooting at target")
	var projectile = CannonBall.instance();
	projectile.position = position
	projectile.velocity = (position - target.get_parent().position) * projectile_speed
	fire_cooldown = cool_down
	add_child(projectile)
	
func turn_towards(point: Vector2):
	var dx = position - point;
	turret.rotation = atan2(dx.y, dx.x) - PI*0.5

func in_range(enemy: Node2D) -> bool:
	return position.distance_squared_to(enemy.get_parent().position) < turret_range*turret_range

func place_cannon():
	if turret:
		print("Cannot place two turrets")
		return
	turret = Cannon.instance()
	add_child(turret)
	pass
