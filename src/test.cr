require "./test/*"
require "kemal"

module Test
end
get "/" do
  "Hello World!"
end
Kemal.run