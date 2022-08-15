extends Node

onready var Infantry = preload("res://Enemies/Infantry.tscn")

var nextEnemyId = 1
var enemies = {}

func _ready():
	#$Level1.add_unit(Infantry.instance(), 400)
	#$Level1.add_unit(Infantry.instance(), 300)
	$EnemySpawnTimer.start()

func create_infantry():
	var enemy = Infantry.instance()
	enemy.id = nextEnemyId
	nextEnemyId += 1
	enemies[enemy.id] = enemy
	enemy.connect("hit",self,"on_hit")
	$Level1.add_unit(enemy, 0)
	
func on_hit(noget):
	print("ouch")
func _process(_delta):
	var towers = get_tree().get_nodes_in_group("tower");
	var enemies = get_tree().get_nodes_in_group("enemy");
	
	if enemies.size() == 0:
		return
		
	enemies.sort_custom(self, "sort_towers_by_distance")
	
	for t in towers:
		for e in enemies:
			if t.in_range(e):
				t.target(e)

func sort_towers_by_distance(a,b):
	return a.get_parent().offset < b.get_parent().offset
		


func _on_EnemySpawnTimer_timeout():
	create_infantry()
