module Asciimation
  class DropAnimator
    def initialize(io: , options: )
      @io      = io
      @options = options
    end

    attr_reader :io, :options
    private     :io, :options

    def animate(screen)
      lines.each_with_index.reverse_each do |line, i|
        (i + 1 + top_lines(screen)).times do |y|
          draw_line(screen, " " * line.size, y - 1) unless y.zero?
          draw_line(screen, line,            y)
          redraw(screen)
          wait(screen)
        end
      end
    end

    private

    def lines
      @lines ||= io.map { |line| line.rstrip }
    end

    def left_padding(screen)
      @left_padding ||= " " * ((screen.columns - lines.map(&:size).max) / 2)
    end

    def top_lines(screen)
      @top_lines ||= (screen.lines - lines.size) / 2
    end

    def pause(screen)
      @pause ||=
        options[:duration] /
        (1..lines.size).inject(0) { |sum, i| sum + i + top_lines(screen) + 1 }
    end

    def draw_line(screen, line, y)
      screen.move_cursor(x: 0, y: y)
      screen.draw_string(left_padding(screen) + line)
    end

    def redraw(screen)
      screen.refresh_in_memory
      Rurses.update_screen
    end

    def wait(screen)
      sleep pause(screen)
    end
  end
end
