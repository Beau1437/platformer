extends Node2D

@onready
var player = $".."
@onready
var player_sprite = $"../Sprite2D"
@onready
var ammo_counter = $AmmoCounter

var clip: Stack = Stack.new()

var can_shoot = true
var in_shop = false

const red_bullet: PackedScene = preload("res://src/player/gun/bullets/RedBullet.tscn")
const blue_bullet: PackedScene = preload("res://src/player/gun/bullets/BlueBullet.tscn")
const green_bullet: PackedScene = preload("res://src/player/gun/bullets/GreenBullet.tscn")
var bullet
var speed
var reload_speed
var num_bullets
var damage

func _init():
	for n in 8:
		clip.push(1)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if cos(rotation) < -0.25:
		scale.y = -1
		player_sprite.frame = 1
	elif cos(rotation) > 0.25:
		scale.y = 1
		player_sprite.frame = 0
	if Input.is_action_just_pressed("shoot") && can_shoot && !in_shop && clip.size() != 0:
		var type: int = clip.pop()
		bullet = bullet_properties(type)
		for n in num_bullets:
			get_tree().create_timer(randf_range(0,0.00003 * speed)).timeout.connect(
				func():
					var bullet_instance = bullet.instantiate()
					bullet_instance.damage = damage
					bullet_instance.speed = speed
					get_tree().root.add_child(bullet_instance)
					bullet_instance.global_position = global_position
					if randf_range(1,2) > 1.5:
						bullet_instance.rotation = rotation + randf_range(0, 0.25)
					else:
						bullet_instance.rotation = rotation - randf_range(0, 0.25)
			)
		player.velocity -= Vector2(cos(rotation) * 1200, sin(rotation) * 1200)
		cooldown(reload_speed)
		ammo_counter.text = str(clip.size(), "/8")

func cooldown(time) -> void:
	can_shoot = false
	get_tree().create_timer(time).timeout.connect(
		func():
			can_shoot = true
	)

func bullet_properties(type: int) -> PackedScene:
	if type == 1:
		reload_speed = 0.8
		speed = 3000
		num_bullets = 5
		damage = 5
		return red_bullet
	elif type == 2:
		reload_speed = 0.1
		speed = 2000
		num_bullets = 4
		damage = 20
		return blue_bullet
	reload_speed = 1
	speed = 1500
	num_bullets = 2
	damage = 100
	return green_bullet

func clip_size():
	return clip.size()

func add_shell(type: int):
	clip.push(type)
	ammo_counter.text = str(clip.size(), "/8")
