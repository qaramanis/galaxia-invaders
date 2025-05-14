class_name PrasinosMagkasEnemy
extends Enemy

@onready var states: Node = $States

@onready var move_down_state: TimedStateComponent = %MoveDownState
@onready var move_side_state: TimedStateComponent = %MoveSideState
@onready var pause_state: TimedStateComponent = %PauseState
@onready var shoot_state: StateComponent = %ShootState

@onready var move_side_component: MoveComponent = %MoveSideComponent
@onready var projectile_spawner_component: SpawnerComponent = %ProjectileSpawnerComponent

func _ready() -> void:
	super()
	
	for state: StateComponent in states.get_children():
		state.disable()
	
	move_side_component.velocity.x = [-10, 10].pick_random()
	
	move_down_state.state_finished.connect(move_side_state.enable)
	move_side_state.state_finished.connect(func():
		shoot_state.enable()
		scale_component.tween_scale()
		projectile_spawner_component.spawn(global_position)	
		shoot_state.disable()
		shoot_state.state_finished.emit()
	)
	shoot_state.state_finished.connect(pause_state.enable)
	pause_state.state_finished.connect(move_down_state.enable)


	move_down_state.enable()
