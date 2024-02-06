local lpeg = require "lpeg"
local P = lpeg.P
local Cg = lpeg.Cg
local Ct = lpeg.Ct
local V = lpeg.V
local C = lpeg.C
local S = lpeg.S

local nl = P("\n")
local blankline = P("\n")
local tab = P("\t")
local control = S("\t\n")
local noncontrol = P(1) - control

local id     = C( noncontrol^1 )
local form   = C( noncontrol^1 )
local lemma  = C( noncontrol^1 )
local upos   = C( noncontrol^1 )
local xpos   = C( noncontrol^1 )
local feats  = C( noncontrol^1 )
local head   = C( noncontrol^1 )
local deprel = C( noncontrol^1 )
local deps   = C( noncontrol^1 )
local misc   = C( noncontrol^1 )

function strip(s)
	return string.gsub(s, "^%s*", "")
end

local comment = "#" * ((P(1) - nl)^0 / strip) * nl

local word = Ct(
	Cg(id,     "ID")     * tab *
	Cg(form,   "FORM")   * tab *
	Cg(lemma,  "LEMMA")  * tab *
	Cg(upos,   "UPOS")   * tab *
	Cg(xpos,   "XPOS")   * tab *
	Cg(feats,  "FEATS")  * tab *
	Cg(head,   "HEAD")   * tab *
	Cg(deprel, "DEPREL") * tab *
	Cg(deps,   "DEPS")   * tab *
	Cg(misc,   "MISC") * nl
)

local function words2graph(ws)
	return ws
end

local sentence = Ct(Cg(Ct(comment^0), "comments") * Cg((Ct(word^0) / words2graph), "words") * blankline)
local conllu = Ct({ sentence * V(1) + P(-1) })

local M = {
	conllu = conllu,
	sentence = sentence,
	comment = comment,
	word = word,
	id = id,
	form = form,
	lemma = lemma,
	upos = upos,
	xpos = xpos,
	feats = feats,
	head = head,
	deprel = deprel,
	deps = deps,
	misc = misc
}

return M
