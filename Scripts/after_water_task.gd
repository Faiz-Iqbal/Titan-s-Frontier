extends VideoStreamPlayer

func _on_finished():
	Story.wanal_t1 = true
	get_tree().change_scene_to_file("res://Scence/indoor_lab.tscn")
