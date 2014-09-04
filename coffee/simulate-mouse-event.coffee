simulateMouseEvent = (elm, properties = {}) ->

  evt = document.createEvent 'MouseEvents'
  evt.initMouseEvent(
    # click, mousedown, mouseup, mouseover, mousemove, mouseout
    properties.type           or 'click'
    properties.canBubble      or true
    properties.cancelable     or true
    properties.view           or window
    properties.detail         or 0
    properties.screenX        or 0
    properties.screenY        or 0
    properties.clientX        or 0
    properties.clientY        or 0
    properties.ctrlKey        or false
    properties.altKey         or false
    properties.shiftKey       or false
    properties.metaKey        or false
    # 0 - left, 1 - middle, 2 - right
    properties.button         or 0
    properties.relatedTarget  or null
  )
  elm.dispatchEvent evt
