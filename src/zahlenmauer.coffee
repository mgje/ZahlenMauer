deleteZahlenmauer = ->
	zm = document.getElementById('zahlenmauer')
	while zm.hasChildNodes()
		zm.removeChild zm.lastChild


# Zeichne eine Schicht der Zahlenmauer
nextLayer = (l,offset=0) -> 
	zm = document.getElementById('zahlenmauer')
	t = document.createElement('div')
	t.className = 'table'
	t.style.position = 'relative'
	t.style.left = offset+'px'	
	ma = document.createElement('div')
	ma.className = 'mauer'
	t.appendChild(ma)
	children = zm.children
	if children.length==0
    	zm.appendChild(t)
    else
    	zm.insertBefore(t,children[0])	
	for z in l 
		e = document.createElement('div')
		e.className = 'block'
		e.appendChild(document.createTextNode(z))
		ma.appendChild(e) 

genZahlenmauer = (zahlenmauer) ->
	offset = 0
	# Unterste Schicht
	nextLayer(zahlenmauer,offset)

	while zahlenmauer.length >=2
		offset += 40
		tmp = []
		for i in [0..zahlenmauer.length-2]
			tmp[i]=zahlenmauer[i]+zahlenmauer[i+1]
		zahlenmauer = tmp
		nextLayer(zahlenmauer,offset)

window.evaluateInput = (form) ->
	input = form.input1.value
	zm = []	
	for z in input.split(',')
		zm.push(parseInt(z))

	deleteZahlenmauer()
	genZahlenmauer(zm)

# Events an Formular binden 
# Enter
document.forms[0].onkeypress = (e) ->
	if !e
		e = window.event
	if e.keyCode ==13
		window.evaluateInput(document.forms[0])
		false
# Click
bt = document.forms[0].button
bt.onclick = (e) ->
 	window.evaluateInput(document.forms[0])	

# Darstellung default Mauer
window.evaluateInput(document.forms[0])	

