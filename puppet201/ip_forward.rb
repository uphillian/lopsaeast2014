forward = File.read('/proc/sys/net/ipv4/ip_forward',1).to_i
Facter.add("ip_forward") do
  setcode do
    case forward
    when 1
      "true"
    when 0
      "false"
    end
  end
end
