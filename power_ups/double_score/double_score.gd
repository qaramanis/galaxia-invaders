extends PowerUp

@onready var duration_timer: Timer = $DurationTimer

func _ready():
	super()
	hitbox_component.hit_hurtbox.connect(_on_player_hit)


func _on_player_hit(hurtbox: HurtboxComponent):
	pass
	
