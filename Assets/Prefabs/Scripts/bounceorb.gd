extends CharacterBody3D

@export_group("Movement")
@export var speed = 5
@export var move_direction = Vector3.RIGHT

var camera
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = get_viewport().get_camera_3d()
	$loop.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if camera: 
		var target: Vector3 = camera.global_transform.origin
		var direction = (target - global_transform.origin).normalized()
	
		var up := Vector3.UP
		if abs(direction.dot(Vector3.UP)) > 0.99:
			up = Vector3.BACK  # or Vector3.FORWARD — anything not parallel
	
		look_at(target, up)
	
func _physics_process(delta: float) -> void:
	var shoot_velocity = move_direction * speed * delta
	var collision: = move_and_collide(shoot_velocity)

	if collision:
		move_direction = move_direction.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("ObjectCollision"): queue_free()
		
	
	
	
