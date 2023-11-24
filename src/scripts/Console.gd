tool
extends Control

var viewport: Control = load("res://addons/godot3-ingame-terminal/src/Console.tscn").instance()
onready var container = $Container

# ==== EXPORT ====
export var welcome_message: String = "Welcome to NAPD Terminal \nType [color=#ffff66] [url=help]help[/url][/color] to get more information\n"
export var prefix: String = "$"
export var prefix_color: Color = Color.white
export var readonly: bool = false

var status = "IDLE"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var viewport = load("res://addons/godot4-ingame-terminal/src/Console.tscn").instantiate()
	#var aa = viewport.new()
	if viewport is Control:
		viewport.readonly = true
		viewport.welcome_message = welcome_message
		viewport.prefix = prefix
		viewport.prefix_color = Color.aqua
		add_child(viewport)
		#viewport.set("welcome_message", "Hello")
		
		
		#print(get_node("Console/Container").welcome_message)
		#get_node("Console/Container").welcome_message = "hello"

func get_status():
	return status

# append string
func write(text):
	text = str(text)
	viewport.write(text)
	
func print_with_typing_effect(text: String, interval: float):
	text = str(text)
	var store_temp_text = false
	var temp_text = ""
	status = "RUNNING"
	for character in text:
		if character == "[":
			store_temp_text = true
		if !store_temp_text:
			viewport.write(character)	
		if store_temp_text:
			temp_text = temp_text + character
		if character == "]":
			store_temp_text = false
			#temp_text = temp_text + ']'
			print(temp_text)
			viewport.write(temp_text)
			temp_text = ""
		yield(get_tree().create_timer(interval), "timeout")		
	status = "STOPPED"	
