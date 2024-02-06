local parse = require "conllu-parse"
local pprint = require("pprint").pprint

local data = io.stdin:read("a")

local treebank = parse.conllu:match(data)

function assemble(s, i)
	if s[i].DEPREL == "compound" then
		local sub, len = assemble(s, tonumber(s[i].HEAD))
		return s[i].FORM .. " " .. sub, len + 1
	else
		return s[i].FORM, 1
	end
end

local compounds = {}

for i,sentence in ipairs(treebank) do
	for j = 1, #sentence.words do
		local res, len = assemble(sentence.words, j)
		if len > 1 then
			compounds[res] = true
		end
	end
end

for k,v in pairs(compounds) do
	if v then
		print(k)
	end
end
