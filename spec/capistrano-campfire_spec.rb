require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Capistrano::Campfire do
  let :configuration do
    config = Capistrano::Configuration.new

    config.extend(Capistrano::Spec::ConfigurationExtension)
    Capistrano::Campfire.load_into(config)

    config
  end

  context "loaded into a configuration" do

    it "has no default options" do
      configuration.campfire_options.should == {}
    end

    it "gives access to a room, given correct campfire options" do
      configuration.set :campfire_options, {
        :account => "awesomellc",
        :token => "yyz123",
        :ssl => true,
        :room => "General Awesomeness"
      }

      campfire = stub("campfire")
      ::Tinder::Campfire.should_receive(:new).with("awesomellc", :token => "yyz123", :ssl => true).and_return(campfire)

      room = stub("room")
      campfire.should_receive(:find_room_by_name).with("General Awesomeness").and_return(room)

      configuration.campfire_room.should == room
    end

  end

end
