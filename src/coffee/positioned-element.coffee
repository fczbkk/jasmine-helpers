createPositionedElement = (
  left = 0
  top = 0
  custom_css_attributes = {}
) ->

  css_attributes =
    position: 'absolute'
    width:    '100px'
    height:   '100px'
    left:     "#{left}px"
    top:      "#{top}px"

  # mix custom CSS attributes into the default ones
  css_attributes[key] = val for key, val of custom_css_attributes

  # create the element and set its CSS properties
  elm = document.createElement 'div'
  elm.style[key] = val for key, val of css_attributes

  # adding a class name to all created elements makes cleanup much easier
  elm.className = 'created-positioned-element'

  # return created element
  elm


insertPositionedElement = (
  left = 0
  top = 0
  parent_node = document.body
  custom_css_attributes = {}
) ->

  elm = createPositionedElement left, top, custom_css_attributes
  parent_node.appendChild elm
  elm
