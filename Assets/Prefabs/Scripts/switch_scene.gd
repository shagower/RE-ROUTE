extends Node3D

@export_file("*.tscn") var target_scene: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Character":
		get_tree().change_scene_to_file(target_scene) # Replace with function body.
