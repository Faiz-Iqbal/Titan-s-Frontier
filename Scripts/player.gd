extends CharacterBody2D

@export var move_speed : float = 300
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")


func _ready():
	update_animation_parameters(starting_direction)
	if(get_tree().get_current_scene().get_name() == "Indoor Lab"):
		if(PlayerDetect.player_position_indoor.x < 270):
			PlayerDetect.player_position_indoor = Vector2(270, PlayerDetect.player_position_indoor.y)
		set("position", PlayerDetect.player_position_indoor)
		
	if(get_tree().get_current_scene().get_name() == "Outdoor"):
		set("position", PlayerDetect.Player_position_outdoor)

func _physics_process(_delta): 
	if(get_tree().get_current_scene().get_name() == "Indoor Lab"):
		PlayerDetect.player_position_indoor = position
		
	if(get_tree().get_current_scene().get_name() == "Outdoor"):
		PlayerDetect.Player_position_outdoor = position
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)	
	
	#Update velocityd
	velocity = input_direction * move_speed
	
	if (PlayerDetect.player_can_move):
		
		update_animation_parameters(input_direction)
		
		move_and_slide()
	pick_new_state()

func update_animation_parameters(move_input : Vector2):
	
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)
		
func pick_new_state():
	
	if (velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
	
