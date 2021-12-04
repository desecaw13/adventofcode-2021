local depths = {}

for i in io.lines('input1.txt') do
	depths[#depths+1] = tonumber(i)
end

local count = 0
for i,v in ipairs(depths) do
	if i ~= 1 then
		if v > depths[i-1] then
			count = count + 1
		end
	end
end

print(count) -- 1696
