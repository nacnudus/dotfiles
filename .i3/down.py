#!/usr/bin/python
import i3

outputs = i3.get_outputs()
output0 = outputs[0]
output1 = outputs[1]

for workspace in i3.get_workspaces():
    if workspace['output'] == output1['name']:
        i3.msg('command', 'workspace %s' % workspace['name'])
        i3.msg('command', 'move workspace to output %s' % output0['name'])

