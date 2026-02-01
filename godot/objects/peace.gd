extends Node3D

func _ready() -> void:
	$man1/AnimationPlayer.play("mixamo_com", 0.1)
	$man2/AnimationPlayer.play("mixamo_com", 0.1)
