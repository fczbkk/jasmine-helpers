var simulateEvent;

simulateEvent = function(obj, type) {
  var event;
  if (document.createEvent) {
    event = document.createEvent('HTMLEvents');
    event.initEvent(type, true, true);
  } else if (document.createEventObject) {
    event = document.createEventObject();
    event.eventType = type;
    event.eventName = type;
  }
  if (obj.dispatchEvent) {
    obj.dispatchEvent(event);
  }
  if (obj.dispatchEvent) {
    return obj.dispatchEvent(event);
  } else if (obj.fireEvent && (typeof htmlEvents !== "undefined" && htmlEvents !== null ? htmlEvents["on" + type] : void 0)) {
    return obj.fireEvent("on" + type, event);
  } else if (obj[type]) {
    return obj[type]();
  } else if (obj["on" + type]) {
    return obj["on" + type]();
  }
};
