extends Node2D
signal hit
signal dead
export var Health = 100
export var Speed = 40
var id = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if $Healthbar == null:
		print("Enemy is missing $Healthbar")
	$Healthbar.max_value = Health
	$Healthbar.min_value = 0

func _process(_delta):
	# Compensate for PathFollow2Ds automatic rotation
	counterRotateHealthbarBackToTop()
	$Healthbar.value = Health
	
	if Health <= 0:
		emit_signal("dead")
		print("Queue enemy for removal")
		get_parent().queue_free();

func _on_Infantry_hit(projectile):
	Health -= projectile.damage

func counterRotateHealthbarBackToTop():
	$Healthbar.set_rotation(-get_parent().rotation)
	
