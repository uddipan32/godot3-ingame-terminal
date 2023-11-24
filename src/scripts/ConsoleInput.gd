extends LineEdit

#const Actions = preload('../Actions.gd')
# @var  String
var _current_command

func _ready():
	self.grab_focus()
	# Console keyboard control
	self.set_process_input(true)

	self.connect('text_submitted', self, 'execute')


# @param  InputEvent
#func _gui_input(event):
#	if Console.consume_input and self.has_focus():
#		accept_event()


# @param  InputEvent  e
func _input(e):
	# Don't process input if console is not visible
	if !is_visible_in_tree():
		return

	# Show next line in history
	#if Input.is_action_just_pressed(Actions.CONSOLE_HISTORY_UP):
	#	self._current_command = Console.History.current()
	#	Console.History.previous()

	#	if self._tmp_user_entered_command == null:
	#		self._tmp_user_entered_command = self.text

	# Show previous line in history
	#if Input.is_action_just_pressed(Actions.CONSOLE_HISTORY_DOWN):
	#	self._current_command = Console.History.next()

	#	if !self._current_command and self._tmp_user_entered_command != null:
	#		self._current_command = self._tmp_user_entered_command
	#		self._tmp_user_entered_command = null

	# Autocomplete on TAB
	#if Input.is_action_just_pressed(Actions.CONSOLE_AUTOCOMPLETE):
	#	if self._autocomplete_triggered_timer and self._autocomplete_triggered_timer.get_time_left() > 0:
	#		self._autocomplete_triggered_timer = null
	#		var commands = Console.get_command_service().find(self.text)
	#		if commands.length == 1:
	#			self.set_text(commands.get_by_index(0).get_name())
	#		else:
	#			for command in commands.get_value_iterator():
	#				var name = command.get_name()
	#				Console.write_line('[color=#ffff66][url=%s]%s[/url][/color]' % [ name, name ])
	#	else:
	#		self._autocomplete_triggered_timer = get_tree().create_timer(1.0, true)
	#		var autocompleted_command = Console.get_command_service().autocomplete(self.text)
	#		self.set_text(autocompleted_command)

	# Finish
	if self._current_command != null:
		self.set_text(self._current_command.getText() if self._current_command and typeof(self._current_command) == TYPE_OBJECT else self._current_command)
		self.accept_event()
		print(self._current_command)
		self._current_command = null


func execute(input):
	#$"..".write_line('[color=#999999]$[/color] ' + input)
	self.clear()
