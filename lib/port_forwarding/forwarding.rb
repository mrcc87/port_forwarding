module PortForwarding
  class Forward
    attr_reader :servers, :threads
    attr_accessor :counter

    # load the yaml file with the configurations
    def initialize(file)
      @servers = YAML.load_file(file)
      @threads = []
      greeting
    end

    def forward
      # cycle throught all the management ips
      servers.each do |server|
        management_ip = server['management_ip']
        production_ips = server['production_ips']
        username = server['username']
        password = server['password']

        # for each management ip open an ssh session
        t = Thread.new {
          begin
            Net::SSH.start(management_ip, username, :password => password, :timeout => 3) do |ssh|
              puts "Connecting to #{management_ip}..."

              # cycle through all the production ips
              production_ips.each do |ip|
                production_ip = ip['ip']
                remote_ports = ip['remote_ports']
                local_ports = ip['local_ports']
                remote_ports_index = 0

                # for each production ip cycle the remote ports
                remote_ports.each do |remote_port|

                  # check if the local port should be the same as the remote port
                  # if not assign the correct value
                  local_port = local_ports[remote_ports_index]
                  local_port = remote_port if local_port == 0

                  puts "forwarding to #{production_ip}:#{remote_port} on local port #{local_port}"
                  ssh.forward.local(local_port, production_ip, remote_port)
                  remote_ports_index += 1
                end
              end
              ssh.loop { true }
            end
          rescue Net::SSH::AuthenticationFailed
            puts "Authentication failed on #{management_ip}, for user #{username}"
          rescue Net::SSH::ConnectionTimeout
            puts "Connection timeout to host #{management_ip}"
          end
        }

        threads << t
      end

      threads.each do |thr|
        thr.join
      end
    end

    private
    def greeting
      a = Artii::Base.new
      puts a.asciify("Port Forwarding")
    end
  end
end
