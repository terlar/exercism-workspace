local hamming = {}

hamming.compute = function(a, b)
	if a:len() ~= b:len() then
		return -1
	end

	local diff = 0

	for i = 1, #a do
		if a:sub(i, i) ~= b:sub(i, i) then
			diff = diff + 1
		end
	end

	return diff
end

return hamming
