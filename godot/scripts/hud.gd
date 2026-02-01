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
			hud_masque.get_child(0).visible = true
		"rose":
			hud_rose.get_child(0).visible = true
		"baton":
			hud_baton.get_child(0).visible = true
		"chapeau":
			hud_chapeau.get_child(0).visible = true
		"gants":
			hud_gants.get_child(0).visible = true
		"smoking":
			hud_smoking.get_child(0).visible = true
		"cape":
			hud_cape.get_child(0).visible = true
