local function copy(t)
	if type(t) ~= 'table' then return t end

	local c = {}
	for k, v in pairs(t) do
		if type(v) == 'table' then
			c[k] = copy(v)
		else
			c[k] = v
		end
	end

	return c
end

local function oneleft(t)
	local one = next(t)
	local two = next(t, (one or 0) + 1)
	
	if one ~= nil and two ~= nil then return false end
	if one == nil and two ~= nil then return true end
	if one == nil and two == nil then error('bad: empty') end
end

local function remove(t, i, v)
	for k, b in pairs(t) do
		if b[i] == v then
			t[k] = nil
		end
	end
end

local function determine(t, pos)
	local ones = 0
	local zeros = 0

	for i, bits in ipairs(t) do
		if bits[pos] == '0' then
			zeros = zeros + 1
		else
			ones = ones + 1
		end
	end
	
	return ones > zeros
end

local oxy_gentr
local co2_scrub

local nums = {}
for s in io.lines('input.txt') do
	local bits = {}
	for bit in s:gmatch'.' do
		bits[#bits+1] = bit
	end
	nums[#nums+1] = bits
end

local og = copy(nums)
local cs = copy(nums)
for pos=1,#nums[1] do
	if not oneleft(og) then
		if determine(og, pos) then
			remove(og, pos, '0')
		else
			remove(og, pos, '1')
		end
	end

	if not oneleft(cs) then
		if determine(cs, pos) then
			remove(cs, pos, '1')
		else
			remove(cs, pos, '0')
		end
	end
end

assert(#og == 1, 'og '..#og)
assert(#cs == 1, 'cs '..#cs)

-- todo: refactor all of this.
-- [adventofcode day 3 part 2](https://adventofcode.com/2021/day/3#part2)

local rating = oxy_gentr * co2_scrub

print(rating)
