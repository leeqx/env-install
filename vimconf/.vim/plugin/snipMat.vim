>
fun! GetSnipsInCurrentScope()
	let snips = {}
	for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
		call extend(snips, get(s:snippets, scope, {}), 'keep')
		call extend(snips, get(s:multi_snips, scope, {}), 'keep')
	endfor
	return snips
endf
<
