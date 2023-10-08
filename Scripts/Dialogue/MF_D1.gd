extends Sprite2D


var timer = 0
var wait_time = 9

func _physics_process(delta):

	if(Input.is_action_pressed("action") and PlayerDetect.mf_detect and Dialogue.df_d1 == false and Story.db_c1 == true):
		PlayerDetect.player_can_move = false
		visible = true
	if(is_visible_in_tree()):
		timer += delta
	if timer>wait_time:
		visible = false
		Dialogue.mf_d1 = true
		PlayerDetect.player_can_move = true
		timer = 0
		
	
