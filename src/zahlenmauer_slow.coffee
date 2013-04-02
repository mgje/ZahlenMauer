# Globale Variable für die Zahlenmauer
gzm = []

deleteZahlenmauer = ->
	zmE = document.getElementById 'zahlenmauer'
	while zmE.hasChildNodes()
		zmE.removeChild zmE.lastChild

# Zeichne eine Schicht der Zahlenmauer
nextLayer = (l,offset=0) -> 
	# HTML Elemente erzeugen (jede Zeile als div Tabelle)
	tE = document.createElement 'div'
	tE.className = 'table'
	tE.style.position = 'relative'
	tE.style.left = offset+'px'	
	mE = document.createElement 'div'
	mE.className = 'mauer'
	tE.appendChild mE 
	zmE = document.getElementById 'zahlenmauer'
	children = zmE.children
	if children.length == 0
		zmE.appendChild tE
	else
		zmE.insertBefore tE,children[0]	
 
    # Für alle Zahlen in der Liste DIV Elemente erzeugen und Werte eintragen
	for z in l 
		cE = document.createElement 'div' 
		cE.className = 'block'
		cE.appendChild document.createTextNode(z)
		mE.appendChild cE 

makeButtonGroup = (i,operator) ->
	bE = document.createElement 'button'
	bE.className = 'btn'
	bE.setAttribute 'nr',i 
	bE.setAttribute 'op',operator

	iE = document.createElement 'i'
	if operator == 'inc'
		iE.className = 'icon-plus-sign'
	
	if operator == 'dec'
		iE.className = 'icon-minus-sign'

	bE.appendChild iE
	bE

genButtons = (zm) ->
	divE = document.getElementById 'button-zahlen'
	while divE.hasChildNodes()
		divE.removeChild divE.lastChild

	i = 0
	for z in zm
		divE.appendChild makeButtonGroup i,'inc'
		divE.appendChild makeButtonGroup i,'dec'
		i = i + 1

genZahlenmauer = ->
	offset = 0
	zm = gzm
	# Unterste Schicht

	nextLayer zm,offset 

	# Erzeugung der Buttons
	genButtons zm

	while zm.length >= 2
		offset += 40
		tmp = []
		for i in [0..zm.length-2]
			tmp[i]=zm[i]+zm[i+1]
		zm = tmp
		nextLayer zm,offset

# Ausertung des Formularfeldes
evaluateInput = (form) ->
	input = form.input1.value
	zm = []	
	for z in input.split ',' 
		zm.push parseInt z

	gzm = zm
	deleteZahlenmauer()
	genZahlenmauer()

# Der folgende Teil wird einmal, nach dem Laden der Seite ausgeführt
form = document.forms[0]
# Events an Formular binden 
# Enter
document.forms[0].onkeypress = (e) ->
	if !e
		e = window.event
	if e.keyCode ==13
		evaluateInput form
		false
# Click
bt = document.forms[0].button
bt.onclick = (e) ->
 	evaluateInput form	
 	false

# Listener increase / decrease
divE = document.getElementById 'button-zahlen'
divE.onclick = (e) ->
	if e.target.className.indexOf('icon') == 0 
		bE = e.target.parentElement
	else
		bE = e.target
	
	op = bE.getAttribute 'op'
	nr = parseInt bE.getAttribute 'nr'
	
	if op == 'inc'
		gzm[nr] += 1
	else
		gzm[nr] -= 1

	deleteZahlenmauer()
	genZahlenmauer()


# Darstellung Default Mauer
evaluateInput form	

