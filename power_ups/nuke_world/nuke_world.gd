extends PowerUp

const ExplosionEffect = preload("res://effects/explosion/explosion_effect.tscn")

func _ready():
	super()
	hitbox_component.hit_hurtbox.connect(_on_player_hit)

func _on_player_hit(hurtbox: HurtboxComponent):
	visible = false
	var big_explosion = ExplosionEffect.instantiate()
	get_tree().current_scene.add_child(big_explosion)
	big_explosion.global_position = global_position
	big_explosion.scale = Vector2(3, 3)
	
	var enemies = []
	_find_enemies_recursive(get_tree().current_scene, enemies)
	for enemy in enemies:
		if enemy.has_node("DestroyedComponent"):
			var destroyed_component = enemy.get_node("DestroyedComponent")
			destroyed_component.destroy()
		else:
			enemy.queue_free()
	
	var enemy_generator = get_tree().root.find_child("EnemyGenerator", true, false)
	
	if enemy_generator:
		enemy_generator.kalamaris_enemy_spawner_timer.paused = true
		enemy_generator.kavouris_enemy_spawner_timer.paused = true
		enemy_generator.keravnos_enemy_spawner_timer.paused = true
		enemy_generator.prasinos_magkas_spawner_timer.paused = true
		
		await get_tree().create_timer(5.0).timeout
		
		if is_instance_valid(enemy_generator):
			enemy_generator.kalamaris_enemy_spawner_timer.paused = false
			enemy_generator.kavouris_enemy_spawner_timer.paused = false
			enemy_generator.keravnos_enemy_spawner_timer.paused = false
			enemy_generator.prasinos_magkas_spawner_timer.paused = false
	
	queue_free()

func _find_enemies_recursive(node, enemies_array):
	if node is Enemy and is_instance_valid(node):
		enemies_array.append(node)
	
	if is_instance_valid(node):
		for child in node.get_children():
			_find_enemies_recursive(child, enemies_array)
