extends CheckBox

var master = AudioServer.get_bus_index("Master")

func _on_pressed():
	AudioServer.set_bus_mute(master, not AudioServer.is_bus_mute(master))
