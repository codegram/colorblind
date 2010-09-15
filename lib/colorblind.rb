require 'active_support/core_ext/module' # For alias_method_chain
require 'active_support/buffered_logger'

module Colorblind

  def self.included(base)
    base.class_eval do
      include InstanceMethods
      alias_method_chain :add, :colors
    end
  end

  module InstanceMethods

    def add_with_colors(severity, message = nil, progname = nil, &block)
      message.gsub!(/(<[a-zA-Z]+>)/) {|color| color_to_code(color)}
      message.gsub!('</>', "\e[0m")
      add_without_colors(severity, message, progname, &block) 
    end

  private

    def color_to_code(color)
      color = case color.gsub(/<?>?/,'')
      when "black" then "30"
      when "red" then "31"
      when "green" then "32"
      when "yellow" then "33"
      when "blue" then "34"
      when "magenta" then "35"
      when "cyan" then "36"
      when "white" then "37"

      when "RED" then "41"
      when "GREEN" then "42"
      when "YELLOW" then "43"
      when "BLUE" then "44"
      when "MAGENTA" then "45"
      when "CYAN" then "46"
      when "WHITE" then "47"
      end
      "\e[0;#{color}m"
    end
  end

end

module ActiveSupport
  class BufferedLogger
    include Colorblind
  end
end
