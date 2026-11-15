extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var camera = get_viewport().get_camera_3d()
	look_at(camera.global_transform.origin - Vector3.UP)
	
