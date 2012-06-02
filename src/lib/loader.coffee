#= require ../vendor/spin.min.js

class @Loader
  @start: ->
# Spinner
    $(".loader").spin 
      lines:     9 # The number of lines to draw
      length:    3 # The length of each line
      width:     5 # The line thickness
      radius:    13 # The radius of the inner circle
      rotate:    5 # The rotation offset
      color:     '#F90' # #rgb or #rrggbb
      speed:     1.4 # Rounds per second
      trail:     51 # Afterglow percentage
      shadow:    true # Whether to render a shadow
      hwaccel:   false # Whether to use hardware acceleration
      className: 'spinner' # The CSS class to assign to the spinner
      zIndex:    2e9 # The z-index (defaults to 2000000000)
      top:       'auto' # Top position relative to parent in px
      left:      'auto' # Left position relative to parent in px
  @stop: ->
    $('.loader').fadeOut 500, -> 
      $(this).remove()