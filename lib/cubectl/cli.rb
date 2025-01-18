require 'thor'

module Cubectl
  class CLI < Thor
    desc "hello NAME", "Says hello to NAME"
    def hello(name)
      puts "Hello, #{name}!"
    end
  end
end
