var simulateEvent;

simulateEvent = function(obj, type) {
  var event;
  event = document.createEvent('HTMLEvents');
  event.initEvent(type, true, true);
  return obj.dispatchEvent(event);
};
