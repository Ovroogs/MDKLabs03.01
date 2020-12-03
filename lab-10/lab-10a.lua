mod = require 'lab-10-mod'

a = 2
b = 4

print('before swap')
print(a, b)

a, b = mod.lua_swap(a, b)

print('after swap using lua module')
print(a, b)

