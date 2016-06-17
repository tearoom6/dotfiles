## ~/.pryrc
## pry Personal Preference File @tearoom6

## Appearance
# Prompt
Pry.config.prompt_name = "ruby"
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{Pry.config.prompt_name} #{RUBY_VERSION} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{Pry.config.prompt_name} #{RUBY_VERSION} (#{obj}):#{nest_level} * " },
]

## Shortcuts
# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

## Plugins
# pry-byebug
if defined?(PryByebug) || defined?(PryDebugger) || defined?(PryNav)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

