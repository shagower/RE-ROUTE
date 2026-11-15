extends Node3D

var orb = preload("res://Assets/Prefabs/orb.tscn")

var loadedorb: CharacterBody3D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("shoot")

func fire():
	if loadedorb: loadedorb.queue_free()
	loadedorb = orb.instantiate()
	get_tree().current_scene.add_child(loadedorb)
	loadedorb.global_transform = global_transform
	var forward_dir: Vector3 = -global_transform.basis.x
	loadedorb.move_direction = forward_dir
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
