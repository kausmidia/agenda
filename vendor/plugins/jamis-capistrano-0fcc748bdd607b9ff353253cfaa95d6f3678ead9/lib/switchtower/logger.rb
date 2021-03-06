module SwitchTower
  class Logger #:nodoc:
    attr_accessor :level

    IMPORTANT = 0
    INFO      = 1
    DEBUG     = 2
    TRACE     = 3
    
    MAX_LEVEL = 3

    def initialize(options={})
      output = options[:output] || STDERR
      case
        when output.respond_to?(:puts)
          @device = output
        else
          @device = File.open(output.to_str, "a")
          @needs_close = true
      end

      @options = options
      @level = 0
    end

    def close
      @device.close if @needs_close
    end

    def log(level, message, line_prefix=nil)
      if level <= self.level
        indent = "%*s" % [MAX_LEVEL, "*" * (MAX_LEVEL - level)]
        message.split(/\r?\n/).each do |line|
          if line_prefix
            @device.print "#{indent} [#{line_prefix}] #{line.strip}\n"
          else
            @device.puts "#{indent} #{line.strip}\n"
          end
        end
      end
    end

    def important(message, line_prefix=nil)
      log(IMPORTANT, message, line_prefix)
    end

    def info(message, line_prefix=nil)
      log(INFO, message, line_prefix)
    end

    def debug(message, line_prefix=nil)
      log(DEBUG, message, line_prefix)
    end

    def trace(message, line_prefix=nil)
      log(TRACE, message, line_prefix)
    end
  end
end
