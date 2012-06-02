require "coyote/rake"

namespace :js do
  coyote :watch do |config|
    config.input = "src/application.coffee"
    config.output = "application.js"
    config.options = { :quiet => true }
  end
  coyote :build do |config|
    config.input = "src/application.coffee"
    config.output = "application.js"
    config.options = { :compress => true }
  end
end

