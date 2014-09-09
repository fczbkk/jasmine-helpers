describe 'getCssProperty', ->


  added_elements = []


  createElement = (tag_name = 'div') ->
    elm = document.body.appendChild document.createElement tag_name
    added_elements.push elm
    elm


  afterEach ->
    elm.parentNode.removeChild elm while elm = added_elements.pop()


  it 'should return null for non-existing property', ->
    elm = createElement()
    expect(getCssProperty elm, 'xxx').toBe null


  it 'should return value of non-defined (default) property', ->
    block_elm = createElement 'div'
    inline_elm = createElement 'span'
    expect(getCssProperty block_elm, 'display').toBe 'block'
    expect(getCssProperty inline_elm, 'display').toBe 'inline'


  it 'should return value of defined property', ->
    elm = createElement()
    elm.style.width = '100px'
    expect(getCssProperty elm, 'width').toBe '100px'


  it 'should return computed value of property', ->
    elm = createElement()
    elm.style.fontSize = '10px'
    elm.style.width = '10em'
    expect(getCssProperty elm, 'width').toBe '100px'
