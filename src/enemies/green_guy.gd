extends CharacterBody2D

const damage: PackedScene = preload("res://src/enemies/DamageMarker.tscn")

@export
var move_speed: float = 1500
@export
var health: int = 1000
var win: bool = false

@onready
var player = $"../Player"
@onready
var healthbar = $BossHealth/ColorRect

var healthbar_ratio

func _ready() -> void:
	healthbar_ratio = healthbar.size.x / health

func _process(delta: float) -> void:
	$Sprite2D.rotation += delta

func _physics_process(delta: float) -> void:
	move_speed += 5 * delta
	move_and_slide()
	if abs(position.x) > 100000:
		position = Vector2(-1909.0,-688.0)
	if position.x > player.position.x:
		velocity.x -= delta * move_speed
	else:
		velocity.x += delta * move_speed
	
	if position.y > player.position.y:
		velocity.y -= delta * move_speed
	else:
		velocity.y += delta * move_speed

signal game_end()

func _on_area_2d_area_entered(area: Area2D) -> void:
	var bullet = area.get_parent()
	if bullet is Bullet:
		health -= bullet.damage
		healthbar.size.x -= bullet.damage * healthbar_ratio
		velocity += Vector2(cos(bullet.rotation) * 300, sin(bullet.rotation) * 300)
		var damage_instance = damage.instantiate()
		damage_instance.damage = bullet.damage
		damage_instance.global_position = bullet.global_position
		if !win:
			get_tree().root.add_child(damage_instance)
		bullet.hide()
		player.add_funds(bullet.damage)
		bullet.queue_free()
		if health <= 0:
			win = true
			game_end.emit()
