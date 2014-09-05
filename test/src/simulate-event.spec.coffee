describe 'simulateEvent', ->

  it 'should fire window.onscroll event', ->
    event_happened = false
    window.addEventListener 'scroll', ->
      event_happened = true
    simulateEvent window, 'scroll'
    expect(event_happened).toEqual true
