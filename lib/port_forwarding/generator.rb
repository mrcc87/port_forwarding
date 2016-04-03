module PortForwarding
  class Generator
    attr_reader :name

    def initialize(file_name="forward")
      @name = file_name
    end
    def render_template
      input_file = File.expand_path('../../templates/forward.yml.erb', __FILE__)
      renderer = ERB.new(File.read(input_file),0,'-')
      output_file = "#{Dir.pwd}/#{name}.yml"
      puts "creating #{name}.yml ... "
      File.open(output_file, "w") do |f|
        f.puts renderer.result(binding)
      end
    end
  end
end
