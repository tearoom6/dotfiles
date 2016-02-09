## ~/.pryrc
## pry Personal Preference File @tearoom6

## Appearance
# Prompt
Pry.config.prompt_name = "ruby"
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{Pry.config.prompt_name} #{RUBY_VERSION} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{Pry.config.prompt_name} #{RUBY_VERSION} (#{obj}):#{nest_level} * " },
]
