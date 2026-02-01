extends Node3D

@onready var visible_message = $HUD/Casual
var fighting = false
var last_message_done = false

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
	fighting = true
	visible_message.visible = false
	$HUD/TheyNeedMe.visible = true
	visible_message = $HUD/TheyNeedMe
	$CloseMessage.start(5)
	$Scream.play()
	$World/fight.visible = true
	$World/fight.play_fight()
	$World/fight/Audio.play()


func _player_enter_fight_area(body: Node3D) -> void:
	if fighting and $Player.coins < 7:
		visible_message.visible = false
		$HUD/NotDressed.visible = true
		visible_message = $HUD/NotDressed
		$CloseMessage.start(5)

	if fighting and $Player.coins >= 7 and not last_message_done:
		last_message_done = true
		visible_message.visible = false
		$World/fight/Audio.stop()
		$World/fight.stop_fight()
		$Player.play_end_animation()
		$HUD/JobDone.visible = true
		visible_message = $HUD/JobDone
		$Timer.timeout.disconnect(_start_fight_animation_and_sound)
		$Timer.timeout.connect(message2)
		$Timer.start(3)

func message2():
	visible_message.visible = false
	$HUD/DidNothing.visible = true
	visible_message = $HUD/DidNothing
	$Timer.timeout.disconnect(message2)
	$Timer.timeout.connect(message3)
	$Timer.start(3)

func message3():
	visible_message.visible = false
	$HUD/Exactly.visible = true
	visible_message = $HUD/Exactly
	$BackgroundMusic.stop()
	$FinalMusic.stop()
	$CreditsMusic.play()
	$Timer.timeout.disconnect(message3)
	$Timer.timeout.connect(credits_roll)
	$Timer.start(4)

func credits_roll():
	$HUD/CenterContainer.visible = true
	$HUD/CenterContainer/VideoStreamPlayer.play()
