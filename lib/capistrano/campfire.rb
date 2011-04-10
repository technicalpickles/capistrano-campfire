require 'capistrano'
require 'tinder'

module Capistrano
  class Campfire
    def self.load_into(configuration)
      configuration.load do
        set :campfire_options, {}

        set :campfire_room do

          account = campfire_options[:account]
          token = campfire_options[:token]
          ssl = campfire_options[:ssl]
          room_name = campfire_options[:room]

          campfire = ::Tinder::Campfire.new account,
            :token => token,
            :ssl => ssl

          campfire.find_room_by_name(room_name)
        end
      end
    end

  end
end

if Capistrano::Configuration.instance
  Capistrano::Campfire.load_into(Capistrano::Configuration.instance)
end

