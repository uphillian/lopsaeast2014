#!/usr/bin/env python
from ansible.runner import Runner
import sys

username=sys.argv[1]

runner = Runner(
    module_name='shell',
    module_args='last -5 %s |cut -c40-55' % username,
    pattern='lopsa',
    forks=2
    )
ds = runner.run()

results = {}

for (hostname,result) in ds['contacted'].items():
  if not 'failed' in result:
    for line in result['stdout'].splitlines():
      results[line] = hostname
print "Last by host:\n"
for x in sorted(results):
  print "\t%s (%s)" % (x,results[x])
try:
  print "Not contacted: "
  for (hostname,result) in results['dark'].items():
    print "%s " % hostname
  print "\n"
except:
  pass
