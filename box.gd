extends RigidBody3D

@onready var collision_sound = $CollisionSound

func _on_body_entered(body: Node) -> void:
	if linear_velocity.length() >= 1.0: 
		var path = "res://Assets/SFX/Collision/body_medium_impact_hard" + str(randi_range(1,6)) + ".wav"
		collision_sound.stream = load(path)
		collision_sound.play()
