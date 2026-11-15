extends MeshInstance3D

func _on_button_pressed() -> void:
	var tween = create_tween()
	tween.set_ease(tween.EASE_IN)
	tween.tween_property(self,"position",Vector3(-6.31,7,0.025),3)
	await tween.finished
	print("finished")
	tween.stop()
	await get_tree().create_timer(1.5).timeout
	print("i MIGHT be lowering idk")
	tween.set_ease(tween.EASE_OUT)
	tween.tween_property(self,"position",Vector3(-6.31,2.262,0.025),3)
	tween.play()
