#= require vendor/jquery/jquery-1.7.2.min.js
#= require vendor/jquery.easing.1.3.js
#= require vendor/jquery.imgpreload.min.js
#= require vendor/jquery.scrollTo-1.4.2-min.js
#= require vendor/jquery.ba-dotimeout.min.js
#= require lib/loader.coffee
#= require lib/full_screen_image.coffee

$ ->

  $obj = $('<h1>HELLO</h1>')
  $('body').append($obj)

  $obj1 = $('<h1>GOODBYE</h1>')
  $('body').append($obj1)


  class Room
    constructor: ->
      @fixtures = []
    
    add: (fixture) ->
      @fixtures.push fixture

    visible: (perc) ->
      for fixture in @fixtures
        fixture.visible(perc)


  class Fixture
    constructor: (@$el) ->
      @on_visible_callbacks = []

    visible: (perc) ->
      @execute_on_visible_callbacks(perc)

    on_visible: (callback) ->
      @on_visible_callbacks.push callback

    execute_on_visible_callbacks: (perc)->
      for callback in @on_visible_callbacks
        callback.call(this, perc)


  hello = new Fixture($obj)
  
  hello.on_visible (perc) ->
    this.$el.css left: "#{perc * 100}%"
    
  hello.on_visible (perc) ->
    this.$el.css opacity: perc
  
  
  goodbye = new Fixture($obj1)
  
  goodbye.on_visible (perc) ->
    this.$el.css top: "#{perc * 100}%"


  
  
  room = new Room
  room.add(hello)
  room.add(goodbye)



  window_height = $(window).height()
  center = 1200
  element_height = 700
  top = (center - element_height * 0.5)

  $(window).scroll ->
    scrolltop = $(document).scrollTop()    



    if (scrolltop > (top + element_height) || scrolltop + window_height < top)
      console.log "is not visible"
    else if (scrolltop < (top + element_height))
      top_is_visible = (scrolltop + window_height) < (top + element_height)
      bottom_is_visible = (scrolltop > top)
      both_are_visible = !top_is_visible and !bottom_is_visible

      if top_is_visible
        perc = (((scrolltop + window_height) - top) / element_height)
      if bottom_is_visible
        perc = (((top + element_height) - scrolltop) / element_height)
      if both_are_visible 
        perc = 1

      room.visible(perc)


    
    
    
      

  



















  # Loader.start()
  # 
  # $.imgpreload ($('img').map -> $(this).attr('src')),
  #   all: ->
  #     do Loader.stop
  # 
  #     $('img,.shape').animate 'opacity' : 1
  # 
  #     $(this).find('img.hero').each ->
  #       new FullScreenImage $(this)