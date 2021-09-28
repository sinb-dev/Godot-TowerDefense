extends Node

onready var Infantry = preload("res://Enemies/Infantry.tscn")

func _ready():
	var soldier = Infantry.instance()
	$Level1.add_unit(soldier)

