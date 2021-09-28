extends Node

func _ready():
	if !$EnemyPath:
		print("Level is missing the Path2D node 'EnemyPath' for ground enemies to follow")

func add_unit(unit: Node2D):
	var path_follow = PathFollow2D.new()
	path_follow.add_child(unit)
	path_follow.offset = 400
	$EnemyPath.add_child(path_follow)

func _process(delta: float):
	var path_follows = $EnemyPath.get_children()
	for path_follow in path_follows:
		path_follow.offset += path_follow.get_child(0).Speed*delta
