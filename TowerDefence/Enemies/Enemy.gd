extends Node2D

export var Health = 100
export var Speed = 40

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

func counterRotateHealthbarBackToTop():
	$Healthbar.set_rotation(-get_parent().rotation)
	
