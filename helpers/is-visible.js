var isVisible;

isVisible = function(element) {
  var style;
  if (element == null) {
    return false;
  }
  style = window.getComputedStyle(element);
  return style.display !== 'none' && style.visibility !== 'hidden' && document.body.contains(element);
};
