describe 'createPositionedElement', ->

  it 'should create an element', ->
    elm = createPositionedElement()
    expect(elm.tagName).toEqual 'DIV'

  it 'should not insert the element into the document', ->
    elm = createPositionedElement()
    expect(elm.parentNode).toBe null

  it 'should position the element', ->
    elm = createPositionedElement 100, 200
    expect(elm.style.left).toEqual '100px'
    expect(elm.style.top).toEqual '200px'

  it 'should set default CSS properties', ->
    elm = createPositionedElement()
    expect(elm.style.position).toEqual 'absolute'
    expect(elm.style.width).toEqual '100px'
    expect(elm.style.height).toEqual '100px'

  it 'should set custom CSS properties', ->
    elm = createPositionedElement null, null, {background: 'red'}
    expect(elm.style.background).toEqual 'red'


describe 'addPositionedElement', ->

  afterEach ->
    for elm in document.querySelectorAll '.created-positioned-element'
      elm.parentNode?.removeChild elm

  it 'should insert created element to the BODY', ->
    elm = insertPositionedElement()
    expect(elm.parentNode).toEqual document.body

  it 'should insert created element into custom target', ->
    elm_outer = insertPositionedElement()
    elm_inner = insertPositionedElement null, null, elm_outer
    expect(elm_inner.parentNode).toEqual elm_outer
