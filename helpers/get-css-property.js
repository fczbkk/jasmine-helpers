var getCssProperty;

getCssProperty = function(elm, property) {
  var style;
  if (window.getComputedStyle != null) {
    style = window.getComputedStyle(elm, null);
    return style.getPropertyValue(property);
  }
  if (elm.currentStyle != null) {
    property = property.replace(/-(.)/g, function(match, group1) {
      return group1.toUpperCase();
    });
    return elm.currentStyle[property];
  }
  return null;
};
