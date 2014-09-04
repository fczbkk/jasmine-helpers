var simulateMouseEvent;

simulateMouseEvent = function(elm, properties) {
  var evt;
  if (properties == null) {
    properties = {};
  }
  evt = document.createEvent('MouseEvents');
  evt.initMouseEvent(properties.type || 'click', properties.canBubble || true, properties.cancelable || true, properties.view || window, properties.detail || 0, properties.screenX || 0, properties.screenY || 0, properties.clientX || 0, properties.clientY || 0, properties.ctrlKey || false, properties.altKey || false, properties.shiftKey || false, properties.metaKey || false, properties.button || 0, properties.relatedTarget || null);
  return elm.dispatchEvent(evt);
};
