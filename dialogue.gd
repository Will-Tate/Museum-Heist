extends Control

# Define an array of texts
var texts = ["Hey Ania, I have another job for you. ", "I've got new information from our sources" ,"The Aritisg Museum is adding another artifact to its collection in a few days. ", "The artifact in question is Garuda’s feather. ", "Yes, THE Garuda. You’re familiar with the legend, I’m sure. ","Your mission, should you choose to accept, is to","a) Infiltrate the high security museum ","b) Repossess the artifact", "c) Replace it with the letter" ,"d) Return the artifact to the Indian people. ", "May the odds be ever in your favor.."]
var current_text_index = 0

# Reference to the Label node
@onready var text = $Dialogue/TextureRect/Text
@onready var label = $MarginContainer/TextureRect/TextLabel
@onready var button1 = $TextureButton
@onready var button2 = $TextureButton2
@onready var button3 = $TextureButton3

func _ready():
	if text:
		text.text = texts[current_text_index]
	if label:
		label.text = "Operator"
	button2.hide()
	button3.hide()

func _on_texture_button_pressed():
	current_text_index += 1
	if current_text_index >= texts.size():
		text.text = "Do you accept?"
		button1.hide()
		button2.show()
		button3.show()
	elif current_text_index < texts.size():
		text.text = texts[current_text_index]

func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://main.tscn") # Replace with function body.


func _on_texture_button_3_pressed():
	text.text = "Really? You don’t want to fight systemic colonialism?"
	button3.hide()
