getCssProperty = (elm, property) ->
  style = window.getComputedStyle elm, null
  style.getPropertyValue property
