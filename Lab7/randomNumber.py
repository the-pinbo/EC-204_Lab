state = (1 << 127) | 1
for i in range(2000):
    print(state & 1, end="")
    newbit = (state ^ (state >> 2) ^ (state >> 3)
              ^ (state >> 4) ^ (state >> 8)) & 1
    state = (state >> 1) | (newbit << 127)
print()
