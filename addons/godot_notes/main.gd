@tool
extends EditorPlugin

var dock: Control

func _enter_tree() -> void:
	dock = preload("res://addons/godot_notes/godot_notes.tscn").instantiate()
	add_control_to_bottom_panel(dock, "Notes")
	
func _exit_tree() -> void:
	remove_control_from_bottom_panel(dock)
	dock.queue_free()
