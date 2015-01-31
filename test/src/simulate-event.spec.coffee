describe 'simulateEvent', ->

  it 'should fire window.onscroll event', ->
    event_happened = false
    window.addEventListener 'scroll', ->
      event_happened = true
    simulateEvent window, 'scroll'
    expect(event_happened).toEqual true

  it 'should not fire an event twice', ->
    event_counter = 0
    window.addEventListener 'scroll', ->
      event_counter++
    simulateEvent window, 'scroll'
    expect(event_counter).toEqual 1
