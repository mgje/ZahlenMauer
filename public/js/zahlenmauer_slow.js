// Generated by CoffeeScript 1.6.1
(function() {
  var bt, deleteZahlenmauer, divE, evaluateInput, form, genButtons, genZahlenmauer, gzm, makeButtonGroup, nextLayer;

  gzm = [];

  deleteZahlenmauer = function() {
    var zmE, _results;
    zmE = document.getElementById('zahlenmauer');
    _results = [];
    while (zmE.hasChildNodes()) {
      _results.push(zmE.removeChild(zmE.lastChild));
    }
    return _results;
  };

  nextLayer = function(l, offset) {
    var cE, children, mE, tE, z, zmE, _i, _len, _results;
    if (offset == null) {
      offset = 0;
    }
    tE = document.createElement('div');
    tE.className = 'table';
    tE.style.position = 'relative';
    tE.style.left = offset + 'px';
    mE = document.createElement('div');
    mE.className = 'mauer';
    tE.appendChild(mE);
    zmE = document.getElementById('zahlenmauer');
    children = zmE.children;
    if (children.length === 0) {
      zmE.appendChild(tE);
    } else {
      zmE.insertBefore(tE, children[0]);
    }
    _results = [];
    for (_i = 0, _len = l.length; _i < _len; _i++) {
      z = l[_i];
      cE = document.createElement('div');
      cE.className = 'block';
      cE.appendChild(document.createTextNode(z));
      _results.push(mE.appendChild(cE));
    }
    return _results;
  };

  makeButtonGroup = function(i, operator) {
    var bE, iE;
    bE = document.createElement('button');
    bE.className = 'btn';
    bE.setAttribute('nr', i);
    bE.setAttribute('op', operator);
    iE = document.createElement('i');
    if (operator === 'inc') {
      iE.className = 'icon-plus-sign';
    }
    if (operator === 'dec') {
      iE.className = 'icon-minus-sign';
    }
    bE.appendChild(iE);
    return bE;
  };

  genButtons = function(zm) {
    var divE, i, z, _i, _len, _results;
    divE = document.getElementById('button-zahlen');
    while (divE.hasChildNodes()) {
      divE.removeChild(divE.lastChild);
    }
    i = 0;
    _results = [];
    for (_i = 0, _len = zm.length; _i < _len; _i++) {
      z = zm[_i];
      divE.appendChild(makeButtonGroup(i, 'inc'));
      divE.appendChild(makeButtonGroup(i, 'dec'));
      _results.push(i = i + 1);
    }
    return _results;
  };

  genZahlenmauer = function() {
    var i, offset, tmp, zm, _i, _ref, _results;
    offset = 0;
    zm = gzm;
    nextLayer(zm, offset);
    genButtons(zm);
    _results = [];
    while (zm.length >= 2) {
      offset += 40;
      tmp = [];
      for (i = _i = 0, _ref = zm.length - 2; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        tmp[i] = zm[i] + zm[i + 1];
      }
      zm = tmp;
      _results.push(nextLayer(zm, offset));
    }
    return _results;
  };

  evaluateInput = function(form) {
    var input, z, zm, _i, _len, _ref;
    input = form.input1.value;
    zm = [];
    _ref = input.split(',');
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      z = _ref[_i];
      zm.push(parseInt(z));
    }
    gzm = zm;
    deleteZahlenmauer();
    return genZahlenmauer();
  };

  form = document.forms[0];

  document.forms[0].onkeypress = function(e) {
    if (!e) {
      e = window.event;
    }
    if (e.keyCode === 13) {
      evaluateInput(form);
      return false;
    }
  };

  bt = document.forms[0].button;

  bt.onclick = function(e) {
    evaluateInput(form);
    return false;
  };

  divE = document.getElementById('button-zahlen');

  divE.onclick = function(e) {
    var bE, nr, op;
    if (e.target.className.indexOf('icon') === 0) {
      bE = e.target.parentElement;
    } else {
      bE = e.target;
    }
    op = bE.getAttribute('op');
    nr = parseInt(bE.getAttribute('nr'));
    if (op === 'inc') {
      gzm[nr] += 1;
    } else {
      gzm[nr] -= 1;
    }
    deleteZahlenmauer();
    return genZahlenmauer();
  };

  evaluateInput(form);

}).call(this);
