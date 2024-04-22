extends Control

# Define an array of texts
var texts = ["Hey Ania, I have another job for you. ", "My sources have informed me that the Kritik Museum is adding another artifact to its collection, to be on display in a few days. ", "The artifact in question is Garuda’s feather. ", "Yes, THE Garuda. You’re familiar with the legend, I’m sure. ","Your mission, should you choose to accept, is to infiltrate the high security Museum, repossess the artifact, replace it with this letter","and return the artifact to the Indian people. ", "May the odds be ever in your favor"]
var current_text_index = 0

# Reference to the Label node
@onready var text = $Dialogue/TextureRect/Text
@onready var label = $MarginContainer/TextureRect/TextLabel
@onready var button1 = $TextureButton
@onready var button2 = $TextureButton2


func _ready():
	if text:
		text.text = texts[current_text_index]
	if label:
		label.text = "Operator"
	button2.hide()

func _on_texture_button_pressed():
	current_text_index += 1
	if current_text_index >= texts.size():
		text.text = "Do you accept?"
		button1.hide()
		button2.show()
	elif current_text_index < texts.size():
		text.text = texts[current_text_index]

func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://main.tscn") # Replace with function body.
