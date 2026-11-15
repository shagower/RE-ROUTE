class_name InteractableButton
extends Node3D 
signal pressed

var raycast: RayCast3D

func _ready() -> void:
	raycast = get_tree().get_first_node_in_group("player_raycast")

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("interact") or event.is_action_pressed("throw")) and raycast:
		if raycast.is_colliding() and raycast.get_collider() == $Button:
			_on_button_pressed()

func _on_button_pressed() -> void:
	$Button/Mesh/AnimationPlayer.play("press")
	# Broadcast the signal so this specific instance can trigger its unique action
	pressed.emit()
