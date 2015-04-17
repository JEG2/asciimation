require "forwardable"

module Asciimation
  class Animator
    def initialize(io: , options: )
      animator = options.delete(:animator)
      name     = "#{animator}_animator"
      file     = File.join(__dir__, name)
      require_relative file

      @animator = Asciimation.const_get(
        name.capitalize.gsub(/_([a-z])/) { $1.upcase }
      ).new(io: io, options: options)
    rescue LoadError
      abort "Error:  no such animator %p" % animator
    end

    extend         Forwardable
    def_delegators :@animator, :animate
  end
end
