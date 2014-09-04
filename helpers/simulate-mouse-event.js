var simulateMouseEvent;

simulateMouseEvent = function(elm, type, button, other) {
  var evt, key, properties, val;
  if (type == null) {
    type = 'click';
  }
  if (button == null) {
    button = 0;
  }
  if (other == null) {
    other = {};
  }
  properties = {
    type: 'click',
    canBubble: true,
    cancelable: true,
    view: window,
    detail: 0,
    screenX: 0,
    screenY: 0,
    clientX: 0,
    clientY: 0,
    ctrlKey: false,
    altKey: false,
    shiftKey: false,
    metaKey: false,
    button: 0,
    relatedTarget: null
  };
  other.type = type;
  other.button = (function() {
    switch (button) {
      case 'left':
        return 0;
      case 'middle':
        return 1;
      case 'right':
        return 2;
      default:
        return button;
    }
  })();
  for (key in other) {
    val = other[key];
    properties[key] = val;
  }
  evt = document.createEvent('MouseEvents');
  evt.initMouseEvent(properties.type, properties.canBubble, properties.cancelable, properties.view, properties.detail, properties.screenX, properties.screenY, properties.clientX, properties.clientY, properties.ctrlKey, properties.altKey, properties.shiftKey, properties.metaKey, properties.button, properties.relatedTarget);
  return elm.dispatchEvent(evt);
};
