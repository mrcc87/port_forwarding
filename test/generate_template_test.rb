require "test_helper"
require "port_forwarding"

describe PortForwarding::Generator do
  before do
    @file_name = "test-config-file"
    @forward = "#{Dir.pwd}/forward.yml"
    @test_config_file = "#{Dir.pwd}/#{@file_name}.yml"
  end

  describe "Render template" do
    it "should generate a forward.yml file when no argument is passed" do
      generator = PortForwarding::Generator.new
      generator.render_template
      assert File.exist?(@forward)
    end

   it "should generate a yml file with the same name as the argument" do
      generator = PortForwarding::Generator.new(@file_name)
      generator.render_template
      assert File.exist?(@test_config_file)
    end

  end

  after do
    File.delete(@forward) if File.exist?(@forward)
    File.delete(@test_config_file) if File.exist?(@test_config_file)
  end
end
