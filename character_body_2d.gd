extends CharacterBody2Ds

@export var health_gain := 10  # percent to give the player

func _ready():
	# Connect the Area2D signal in Godot 4 style
	body_entered.connect(Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	# debug print so you can see who touched the coin
	print_debug("Coin touched by: ", body)
	# if the colliding body has the increase_health method, call it
	if body.has_method("increase_health"):
		body.increase_health(health_gain)
		queue_free()  # remove the coin immediately
