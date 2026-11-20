@tool
extends DialogicIndexer

func _get_events() -> Array:
	return [this_folder.path_join('event_message_choice.gd')]

func _get_subsystems() -> Array:
	return [{'name':'MessageChoice', 'script':this_folder.path_join('subsystem_message_choice.gd')}]