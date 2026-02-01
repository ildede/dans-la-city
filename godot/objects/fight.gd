extends Node3D

func play_fight() -> void:
	$fight/AnimationPlayer.get_animation("kakutou_04").loop_mode = Animation.LOOP_PINGPONG;
	$fight/AnimationPlayer.play("kakutou_04", 0.1)

func stop_fight() -> void:
	$fight/AnimationPlayer.stop()
