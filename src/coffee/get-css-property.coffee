getCssProperty = (elm, property) ->

  # modern browsers
  if window.getComputedStyle?
    style = window.getComputedStyle elm, null
    return style.getPropertyValue property

  # old versions of IE
  if elm.currentStyle?
    # convert property name to camelCase
    property = property.replace /-(.)/g, (match, group1) ->
      group1.toUpperCase()
    return elm.currentStyle[property]

  null
