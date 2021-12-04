local depths = {}
for i in io.lines('input1.txt') do
	depths[#depths+1] = tonumber(i)
end

local windows = {}
for i=3,#depths do
	if depths[i] == nil then break end
	
	windows[#windows+1] = depths[i] + depths[i-1] + depths[i-2]
end

local count = 0
for i=2,#windows do
	if windows[i] > windows[i-1] then
		count = count + 1
	end
end

print(count) -- 1737
