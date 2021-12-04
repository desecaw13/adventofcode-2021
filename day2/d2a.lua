local commands = {up = 0, down = 0, forward = 0}

for s in io.lines('input.txt') do
	local _, _, command, value = string.find(s, "(%a+) (%d+)")
	commands[command] = commands[command] + value
end

local depth = commands.down - commands.up

local answer = depth * commands.forward

print(answer) -- 1507611
