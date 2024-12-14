extends Area2D

@onready var timer = $Timer
@onready var sfx: AudioStreamPlayer2D = $SFX1
@onready var sfx_2: AudioStreamPlayer2D = $SFX2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	randomize()

func _on_body_entered(body: Node2D) -> void:
	var random_number = randi_range(0, 1)
	print("You died!")
	Engine.time_scale = 0.5
	body.dead = true
	body.get_node("CollisionShape2D").queue_free()
	if random_number == 0:
		sfx.play()
	else:
		sfx_2.play()
	timer.start()
	



func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
