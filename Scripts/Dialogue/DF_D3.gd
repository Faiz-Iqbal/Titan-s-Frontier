extends Sprite2D


var timer = 0
var wait_time = 8

func _physics_process(delta):
	if(Dialogue.df_d3 == false):
		visible = true
		
	if(is_visible_in_tree()):
		timer += delta
	if timer>wait_time:
		visible = false
		Dialogue.df_d3 = true
		timer = 0
