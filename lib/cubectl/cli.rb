require 'thor'
require_relative './commands/get'

module Cubectl
  class CLI < Thor
    desc "hello NAME", "Says hello to NAME"
    def hello(name)
      puts "Hello, #{name}!"
    end

    desc "get SUBCOMMAND ...ARGS", "get resources"
    subcommand "get", Cubectl::Commands::Get
  end
end
