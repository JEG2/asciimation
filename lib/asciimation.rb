require "rurses"

require_relative "asciimation/version"
require_relative "asciimation/argument_parser"
require_relative "asciimation/animator"

module Asciimation
  module_function

  def animate(args)
    Rurses.program(modes: %i[c_break no_echo hide_cursor]) do |screen|
      screen.refresh_in_memory
      Rurses.update_screen

      Animator.new(ArgumentParser.new(args)).animate(screen)

      Rurses.get_key
    end
  end
end
