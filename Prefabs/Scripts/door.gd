extends MeshInstance3D

@export_category("Door")
@export var opened_position: Vector3
@export var tween_speed = 3
@export var timeout_time = 1.5
## @export var open_signal: Signal
var closed_position

func _ready() -> void:
	closed_position = global_position
	
	## open_signal.connect(open)

func open() -> void:
	var tween = create_tween()
	tween.set_ease(tween.EASE_IN)
	tween.tween_property(self,"position",opened_position,tween_speed)
	$Slide.play()
	await tween.finished
	print("finished")
	tween.stop()
	$Slide.stop()
	$Stop.play()
	await get_tree().create_timer(timeout_time).timeout
	print("i MIGHT be lowering idk")
	tween.set_ease(tween.EASE_OUT)
	tween.tween_property(self,"position",closed_position,tween_speed)
	$Slide.play()
	tween.play()
	await tween.finished
	$Slide.stop()
	$Stop.play()


func _on_orbmachine_triggered() -> void:
	pass # Replace with function body.
