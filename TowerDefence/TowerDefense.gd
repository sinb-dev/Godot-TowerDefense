extends Node

onready var Infantry = preload("res://Enemies/Infantry.tscn")

func _ready():
	$Level1.add_unit(Infantry.instance(), 400)
	$Level1.add_unit(Infantry.instance(), 300)

func _process(_delta):
	var towers = get_tree().get_nodes_in_group("tower");
	var enemies = get_tree().get_nodes_in_group("enemy");
	
	enemies.sort_custom(self, "sort_towers_by_distance")
	
	if enemies.size() == 0:
		return
	for t in towers:
		for e in enemies:
			if t.in_range(e):
				t.target(e)

func sort_towers_by_distance(a,b):
	return a.get_parent().offset < b.get_parent().offset
		
