extends RigidBody3D

@onready var collision_sound = $CollisionSound

func _on_body_entered(_body: Node3D) -> void:
	if linear_velocity.length() >= 0.1: 
		var path = "res://Assets/SFX/Collision/metal_barrel_impact_hard" + str(randi_range(1,6)) + ".wav"
		collision_sound.stream = load(path)
		collision_sound.play()
