require "optparse"

module Asciimation
  class ArgumentParser
    DEFAULT_OPTIONS = {animator: "drop", duration: 5.0}

    def initialize(args)
      @args = args
    end

    attr_reader :args
    private     :args

    def to_hash
      options = DEFAULT_OPTIONS.dup
      hash    = {io: nil, options: options}

      args.options do |parser|
        parser.banner =
          "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] ASCII_ART_PATH"

        parser.separator ""
        parser.separator "Specific Options:"

        parser.on( "--animator NAME", String,
                   "The animator to use." ) do |animator|
          options[:animator] = animator
        end
        parser.on( "-o", "--duration SECONDS", Float,
                   "The seconds this animation should last." ) do |duration|
          options[:duration] = duration
        end

        parser.separator "Common Options:"

        parser.on( "-h", "--help",
                   "Show this message." ) do
          puts parser
          exit
        end

        begin
          path      = args.shift or abort parser.to_s
          hash[:io] = open(path)

          parser.parse!
        rescue OptionParser::ParseError
          abort parser.to_s
        end
      end

      hash
    end
  end
end
