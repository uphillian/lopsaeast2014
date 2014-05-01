procs = Integer(`ls -d /proc/[0-9]*|wc -l`)
cpus = Integer(Facter.value('processorcount'))
Facter.add('load_per_cpu') do
  setcode do
    procs/cpus
  end
end
