class @FullScreenImage
  @images = []
  @set_dimensions = (width, height) ->
    image.set_dimensions(width, height) for image in @images
  
  constructor: (@$image)->
    FullScreenImage.images.push this
    @real_width = @$image.attr "width"
    @real_height = @$image.attr "height"
    @aspect_ratio = @real_width / @real_height
    
  set_dimensions: (width, height) ->
    @css = left: 0, top: 0
    @width = width
    @height = @width / @aspect_ratio
    
    if @height >= height
      top = (@height - height) / 2
      @css.top = "-#{top}px"
    else
      @height = height
      @width = @height * @aspect_ratio
      left = (@width - width) / 2
      # @css.left = "-#{left}px"
    
    @$image.width(@width).height(@height).css(@css)