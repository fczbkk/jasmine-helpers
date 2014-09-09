var getCssProperty;

getCssProperty = function(elm, property) {
  var style;
  style = window.getComputedStyle(elm, null);
  return style.getPropertyValue(property);
};
