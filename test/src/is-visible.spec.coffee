describe 'isVisible', ->

  elm = null

  beforeEach ->
    elm = document.body.appendChild document.createElement 'div'

  afterEach ->
    elm?.parentNode?.removeChild elm

  it 'should say regular element is visible', ->
    expect(isVisible elm).toEqual true

  it 'should say not displayed element is not visible', ->
    elm.style.display = 'none'
    expect(isVisible elm).toEqual false

  it 'should say hidden element is not visible', ->
    elm.style.visibility = 'hidden'
    expect(isVisible elm).toEqual false

  it 'should say non-existing element is not visible', ->
    elm.parentNode.removeChild elm
    expect(isVisible elm).toEqual false

  it 'should say falsy object is not visible', ->
    expect(isVisible null).toEqual false

  it 'should say unattached element is not visible', ->
    unattached_elm = document.createElement 'div'
    expect(isVisible unattached_elm).toEqual false
