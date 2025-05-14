class_name PowerUp
extends Node2D

@onready var move_component: MoveComponent = $MoveComponent
@onready var stats_component: StatsComponent = $StatsComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var shake_component: ShakeComponent = $ShakeComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent


func _ready():
	hitbox_component.collision_mask = 1	
	
	stats_component.no_health.connect(queue_free)
