require 'capistrano'
require 'tinder'

module Capistrano
  module Campfire
    class RoomCollection
      def initialize(campfire_options)
        rooms_options = campfire_options[:rooms]

        @rooms = rooms_options.map do |room_options|
          account = room_options[:account] || campfire_options[:account]
          token = room_options[:token] || campfire_options[:token]
          ssl = room_options[:ssl] || campfire_options[:ssl]
          ssl_verify = room_options[:ssl_verify] || campfire_options[:ssl_verify]
          room_name = room_options[:room] || campfire_options[:room]


          campfire = ::Tinder::Campfire.new account,
            :token => token,
            :ssl => ssl,
            :ssl_verify => ssl_verify
          campfire.find_room_by_name(room_name)
        end
      end

      def speak(message)
        @rooms.each do |room|
          room.speak message
        end
      end
    end

    def self.extended(configuration)
      configuration.load do
        set :campfire_options, {}

        set :campfire_room do

          account = campfire_options[:account]
          token = campfire_options[:token]
          ssl = campfire_options[:ssl]
          ssl_verify = campfire_options[:ssl_verify]
          room_name = campfire_options[:room]

          campfire = ::Tinder::Campfire.new account,
            :token => token,
            :ssl => ssl,
            :ssl_verify => ssl_verify

          campfire.find_room_by_name(room_name)
        end

        set :campfire_rooms do
          RoomCollection.new(campfire_options)
        end
      end
    end

  end
end

if Capistrano::Configuration.instance
  Capistrano::Configuration.instance.extend(Capistrano::Campfire)
end
