extends Control

@onready var hud_masque = $Container/MarginContainer/VFlowContainer/Masque
@onready var hud_rose = $Container/MarginContainer/VFlowContainer/Rose
@onready var hud_baton = $Container/MarginContainer/VFlowContainer/Baton
@onready var hud_chapeau = $Container/MarginContainer/VFlowContainer/Chapeau
@onready var hud_gants = $Container/MarginContainer/VFlowContainer/Gants
@onready var hud_smoking = $Container/MarginContainer/VFlowContainer/Smoking
@onready var hud_cape = $Container/MarginContainer/VFlowContainer/Cape

func on_object_collected(type):
	print("on_object_collected: ", type)
	match type:
		"masque":
			hud_masque.uppercase = true
		"rose":
			hud_rose.uppercase = true
		"baton":
			hud_baton.uppercase = true
		"chapeau":
			hud_chapeau.uppercase = true
		"gants":
			hud_gants.uppercase = true
		"smoking":
			hud_smoking.uppercase = true
		"cape":
			hud_cape.uppercase = true
