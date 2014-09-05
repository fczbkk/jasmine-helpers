simulateEvent = (obj, type) ->
  event = document.createEvent 'HTMLEvents'
  event.initEvent type, true, true
  obj.dispatchEvent event
