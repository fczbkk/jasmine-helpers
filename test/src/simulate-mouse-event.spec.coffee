describe 'simulateMouseEvent', ->

  elm = null

  beforeEach ->
    elm = document.body.appendChild document.createElement 'div'

  afterEach ->
    elm.parentNode.removeChild elm


  it 'should fire the event', ->
    event_happened = false
    elm.addEventListener 'click', ->
      event_happened = true
    simulateMouseEvent elm
    expect(event_happened).toEqual true


  it 'should use default properties', ->
    button_pressed = -1
    elm.addEventListener 'click', (event) ->
      button_pressed = event.button
    simulateMouseEvent elm
    expect(button_pressed).toEqual 0


  it 'should allow use of custom properties', ->
    button_pressed = -1
    elm.addEventListener 'mousedown', (event) ->
      button_pressed = event.button
    simulateMouseEvent elm, 'mousedown', 2
    expect(button_pressed).toEqual 2
