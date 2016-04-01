module PortForwarding
  class Generator
    attr_reader :name

    def initialize(file_name)
      @name = name
    end
    def render_template
      # Dir.entries("erb/#{path}").each do |file|
      #   if File.file?("erb/#{path}/#{file}")
      #     input_file = "erb/#{path}/#{file}"
      #     renderer = ERB.new(File.read(input_file),0,'-')
      #     output_file = input_file.gsub(".erb", "").gsub("erb/", "sql/")
      #     puts "creating #{output_file} ... "
      #     unless File.directory?("sql/#{path}")
      #       puts "directory does not exist"
      #       FileUtils.mkdir_p("sql/#{path}")
      #     end
      #     File.open(output_file, "w") do |f|
      #       f.puts renderer.result(binding)
      #     end
      #   end
      # end
      puts "#{Dir.pwd/name}
    end
  end
end
