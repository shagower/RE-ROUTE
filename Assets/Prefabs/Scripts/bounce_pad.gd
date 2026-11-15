extends Area3D

var raycast: RayCast3D

@export_group("Panel")
@export var axis = Vector3.UP
@export var rotating = 15

func _ready() -> void:
	raycast = get_tree().get_first_node_in_group("player_raycast")
	
func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact") or event.is_action_pressed("throw")) and raycast:
		if raycast.is_colliding() and raycast.get_collider() == self: rotate_panel()

func rotate_panel(): 
	rotate(axis, deg_to_rad(rotating))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
