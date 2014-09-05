var createPositionedElement, insertPositionedElement;

createPositionedElement = function(left, top, custom_css_attributes) {
  var css_attributes, elm, key, val;
  if (left == null) {
    left = 0;
  }
  if (top == null) {
    top = 0;
  }
  if (custom_css_attributes == null) {
    custom_css_attributes = {};
  }
  css_attributes = {
    position: 'absolute',
    width: '100px',
    height: '100px',
    left: "" + left + "px",
    top: "" + top + "px"
  };
  for (key in custom_css_attributes) {
    val = custom_css_attributes[key];
    css_attributes[key] = val;
  }
  elm = document.createElement('div');
  for (key in css_attributes) {
    val = css_attributes[key];
    elm.style[key] = val;
  }
  elm.className = 'created-positioned-element';
  return elm;
};

insertPositionedElement = function(left, top, parent_node, custom_css_attributes) {
  var elm;
  if (left == null) {
    left = 0;
  }
  if (top == null) {
    top = 0;
  }
  if (parent_node == null) {
    parent_node = document.body;
  }
  if (custom_css_attributes == null) {
    custom_css_attributes = {};
  }
  elm = createPositionedElement(left, top, custom_css_attributes);
  parent_node.appendChild(elm);
  return elm;
};
