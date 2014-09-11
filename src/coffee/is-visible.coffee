isVisible = (element) ->
  return false unless element?

  style = window.getComputedStyle element

  # return conditions
  style.display isnt 'none' and
  style.visibility isnt 'hidden' and
  document.body.contains element
