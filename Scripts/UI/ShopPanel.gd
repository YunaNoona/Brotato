extends Panel
class_name ShopPanel

const SHOP_CARD_SCENE = preload("res://Scenes/UI/Shop/ShopCard.tscn")

@export var shop_items: Array[ItemBase]

@onready var items_container: HBoxContainer = %ItemsContainer
@onready var passive_container: GridContainer = %PassiveContainer
@onready var weapons_container: GridContainer = %WeaponsContainer


func _ready() -> void:
	for child in passive_container.get_children() : child.queue_free()
	for child in weapons_container.get_children() : child.queue_free()

func load_shop(current_wave : int) -> void:
	
	for child in items_container.get_children() : child.queue_free()

	var config := Global.SHOP_PROBABILITY_CONFIG
	var selected_items := Global.select_items_for_offer(shop_items, current_wave, config)
	for shop_item : ItemBase in selected_items:
		var card_instance := SHOP_CARD_SCENE.instantiate() as ShopCard
		items_container.add_child(card_instance)
		card_instance.shop_item = shop_item
 
