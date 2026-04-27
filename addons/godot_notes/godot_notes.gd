@tool
extends Control

const SAVE_PATH: String = "res://addons/godot_notes/project_notes.txt"

@onready var text_field: TextEdit = $TextEdit 

func _ready() -> void:
	text_field.text = load_note()

func save_note(content: String) -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(content)
		file.close()

func load_note() -> String:
	if not FileAccess.file_exists(SAVE_PATH):
		return "Write your notes here"
		
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content: String = file.get_as_text()
	file.close()
	return content

func _on_text_edit_text_changed() -> void:
	save_note(text_field.text)
