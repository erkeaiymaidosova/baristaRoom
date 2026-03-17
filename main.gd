extends Node3D

@export var total_money: int = 3
var money_count: int = 0
var game_won: bool = false

func _ready() -> void:
	$CanvasLayer/MoneyLabel.text = "Tips: 0/" + str(total_money)
	$CanvasLayer/WinLabel.visible = false
	$Girl.visible = false
	
	var anim_player = get_girl_animation_player()
	if anim_player:
		anim_player.stop()

func add_money() -> void:
	if game_won:
		return
	
	money_count += 1
	$MoneyLabel.text = "Tips: " + str(money_count) + "/" + str(total_money)

	if money_count >= total_money:
		win_game()

func win_game() -> void:
	if game_won:
		return
	
	game_won = true
	$WinLabel.visible = true
	$Girl.visible = true
	
	var anim_player = get_girl_animation_player()
	if anim_player:
		anim_player.play("Take 001")

func get_girl_animation_player() -> AnimationPlayer:
	return $Girl.find_child("AnimationPlayer", true, false) as AnimationPlayer
