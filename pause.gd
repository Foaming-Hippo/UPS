extends Control


signal resumed

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		hide()
		emit_signal("resumed")
