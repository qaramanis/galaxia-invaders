extends PowerUp

@onready var duration_timer: Timer = $DurationTimer

func _ready():
	super()
	hitbox_component.collision_mask = 1
	hitbox_component.hit_hurtbox.connect(_on_player_hit)

func _on_player_hit(hurtbox: HurtboxComponent):
	var ship = hurtbox.get_parent()
	
	if ship.has_node("FirerateTimer"):
		var firerate_timer = ship.get_node("FirerateTimer")
		firerate_timer.wait_time *= 0.5
		visible = false
		await get_tree().create_timer(duration_timer.wait_time).timeout
		firerate_timer.wait_time /= 0.5
		queue_free()
		
