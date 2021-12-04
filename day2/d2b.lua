local aim = 0
local pos = 0
local depth = 0

local commands = {
	up = function(n) aim = aim - n end,
	down = function(n) aim = aim + n end,
	forward = function(n)
		pos = pos + n
		depth = depth + aim * n
	end
}

for s in io.lines('input.txt') do
	local _, _, command, value = string.find(s, "(%a+) (%d+)")
	commands[command](value)
end

local answer = pos * depth

print(answer) -- 1880593125
