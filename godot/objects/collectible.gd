extends Area3D

@export var type: String

var time := 0.0
var grabbed := false

func _on_body_entered(body):
	if body.has_method("collect_coin") and !grabbed:
		body.collect_coin(type)
		Audio.play("res://sounds/coin.ogg") # Play sound		
		$Mesh.queue_free() # Make invisible
		$Particles.emitting = false # Stop emitting stars
		grabbed = true

func _process(delta):
	rotate_y(2 * delta) # Rotation
	position.y += (cos(time * 5) * 1) * delta # Sine movement
	time += delta
