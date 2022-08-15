extends Area2D

signal clicked

func _ready():
	pass

func _on_Slot_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_mask == 1 && event.pressed:
			on_clicked()
	pass

func on_clicked():
	emit_signal("clicked", self)
