local g
local e

local nums = {}
for s in io.lines('input.txt') do
	local bits = {}
	
	for bit in s:gmatch'.' do
		bits[#bits+1] = bit
	end
	
	nums[#nums+1] = bits
end

local bt = {}
for i, bits in ipairs(nums) do
	for j, b in ipairs(bits) do
		bt[j] = bt[j] or {}
		bt[j][i] = b
	end
end

local gamma = ''
local epsilon = ''
for _, pos in ipairs(bt) do
	local ones = 0
	local zeros = 0
	
	for _, v in ipairs(pos) do
		if v == '0' then
			zeros = zeros + 1
		else
			ones = ones + 1
		end
	end
	
	if ones > zeros then
		gamma = gamma .. '1'
		epsilon = epsilon .. '0'
	else
		gamma = gamma .. '0'
		epsilon = epsilon .. '1'
	end
end

g = tonumber(gamma, 2)
e = tonumber(epsilon, 2)

local power = g * e

print(power) -- 2035764
