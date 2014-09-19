simulateEvent = (obj, type) ->

  # SETUP EVENT

  # modern browsers
  if document.createEvent
    event = document.createEvent 'HTMLEvents'
    event.initEvent type, true, true

  # IE9-
  else if document.createEventObject
    event = document.createEventObject()
    event.eventType = type
    event.eventName = type


  # FIRE EVENT

  # modern browsers
  if obj.dispatchEvent
    obj.dispatchEvent event

  # IE9-
  if obj.dispatchEvent
    obj.dispatchEvent event

  else if obj.fireEvent and htmlEvents?["on#{type}"]
    obj.fireEvent "on#{type}", event

  else if obj[type]
    obj[type]()

  else if obj["on#{type}"]
    obj["on#{type}"]()
