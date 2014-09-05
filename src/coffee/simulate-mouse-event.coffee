simulateMouseEvent = (elm, type = 'click', button = 0, other = {}) ->

  # default values of all event properties
  properties =
    type           : 'click'
    canBubble      : true
    cancelable     : true
    view           : window
    detail         : 0
    screenX        : 0
    screenY        : 0
    clientX        : 0
    clientY        : 0
    ctrlKey        : false
    altKey         : false
    shiftKey       : false
    metaKey        : false
    button         : 0
    relatedTarget  : null

  other.type = type

  # convert keywords to button ID
  other.button = switch button
    when 'left'   then 0
    when 'middle' then 1
    when 'right'  then 2
    else button

  # mix custom properties into the default ones
  properties[key] = val for key, val of other

  evt = document.createEvent 'MouseEvents'
  evt.initMouseEvent(
    properties.type
    properties.canBubble
    properties.cancelable
    properties.view
    properties.detail
    properties.screenX
    properties.screenY
    properties.clientX
    properties.clientY
    properties.ctrlKey
    properties.altKey
    properties.shiftKey
    properties.metaKey
    properties.button
    properties.relatedTarget
  )

  elm.dispatchEvent evt
