extends Area3D

var collected: bool = false

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area3D) -> void:
	if collected:
		return
	
	if area.name == "PickupArea":
		collected = true
		
		var main_scene = get_tree().current_scene
		if main_scene.has_method("add_money"):
			main_scene.add_money()
		
		queue_free()
