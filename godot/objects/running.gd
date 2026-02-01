extends Node3D

func _ready() -> void:
	$Running/AnimationPlayer.play("mixamo_com", 0.1)
