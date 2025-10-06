# GameManager.gd
extends Node

# O caminho onde o arquivo de ranking será salvo.
# 'user://' é uma pasta especial da Godot para salvar dados do jogador.
const SAVE_PATH = "user://ranking.json"

var timer_active: bool = false
var start_time: float = 0.0
var final_time: float = 0.0

# Inicia ou reinicia o cronômetro
func start_timer():
	start_time = Time.get_unix_time_from_system()
	timer_active = true
	print("Timer iniciado!")

# Para o cronômetro e armazena o tempo final
func stop_timer():
	if timer_active:
		final_time = Time.get_unix_time_from_system() - start_time
		timer_active = false
		print("Timer parado! Tempo final: ", final_time)

# Carrega os scores do arquivo JSON
func load_scores() -> Array:
	if not FileAccess.file_exists(SAVE_PATH):
		return [] # Retorna um array vazio se o arquivo não existe

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	var error = json.parse(content)

	if error == OK:
		return json.get_data()
	else:
		print("Erro ao ler o arquivo JSON: ", json.get_error_message())
		return []

# Salva um novo score no arquivo
func save_score(player_name: String, time: float):
	var scores = load_scores()

	# Cria a nova entrada
	var new_entry = {
		"name": player_name,
		"time": time
	}
	scores.append(new_entry)

	# **A parte mais importante: ordenar a lista pelo menor tempo**
	scores.sort_custom(func(a, b): return a.time < b.time)

	# Salva o array de volta no arquivo
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var json_string = JSON.stringify(scores, "\t") # "\t" para identar e deixar legível
	file.store_string(json_string)
	print("Ranking salvo com sucesso!")

# Função para formatar o tempo em MM:SS:ms
func format_time(seconds: float) -> String:
	var minutes = int(seconds / 60)
	var secs = int(seconds) % 60
	var milliseconds = int((seconds - int(seconds)) * 1000)
	return "%02d:%02d.%03d" % [minutes, secs, milliseconds]
