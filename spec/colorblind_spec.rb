require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Colorblind-enhanced logger" do

  before(:each) do
    @output  = StringIO.new
    @logger  = ActiveSupport::BufferedLogger.new(@output)
  end

  it "is Colorblind-enhanced" do
    @logger.should respond_to(:add_with_colors)
  end

  it "converts pseudo-xml tags to colors" do
    colors = 
      {"black" => "30",
       "red" => "31",
       "green" => "32",
       "yellow" => "33",
       "blue" => "34",
       "magenta" => "35",
       "cyan" => "36",
       "white" => "37",

       "RED" => "41",
       "GREEN" => "42",
       "YELLOW" => "43",
       "BLUE" => "44",
       "MAGENTA" => "45",
       "CYAN" => "46",
       "WHITE" => "47"}

    colors.each_pair do |color,code|
      @logger.debug "I have a nice <#{color}>color</> and I like it"
      @output.string.should include("I have a nice \e[0;#{code}mcolor\e[0m and I like it")
    end
  end

end
