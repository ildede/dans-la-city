extends Node3D

@onready var visible_message = $HUD/Casual

func _ready() -> void:
	if RenderingServer.get_current_rendering_method() == "gl_compatibility":
		# Reduce background and sun brightness when using the Compatibility renderer;
		# this tries to roughly match the appearance of Forward+.
		# This compensates for the different color space and light rendering for lights with shadows enabled.
		$Sun.light_energy = 0.24
		$Sun.shadow_opacity = 0.85
		$Environment.environment.background_energy_multiplier = 0.25

func _on_start_message_timeout() -> void:
	visible_message.visible = false
	$HUD/Casual.visible = true
	visible_message = $HUD/Casual
	$CloseMessage.start(5)

func _on_close_message_timeout() -> void:
	visible_message.visible = false

func _on_start_fight_timeout() -> void:
	$BrokenGlass.play()
	$BackgroundMusic.play()
	$Timer.timeout.connect(_start_fight_animation_and_sound)
	$Timer.start(3)

func _start_fight_animation_and_sound():
	$HUD/TheyNeedMe.visible = true
	visible_message = $HUD/TheyNeedMe
	$CloseMessage.start(5)
	$Scream.play()
	$World/fight.visible = true
	$World/fight.play_fight()
	$World/fight/Audio.play()
