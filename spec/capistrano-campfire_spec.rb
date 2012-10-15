require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Capistrano::Campfire do
  let :configuration do
    config = Capistrano::Configuration.new

    config.extend(Capistrano::Spec::ConfigurationExtension)
    config.extend(Capistrano::Campfire)

    config
  end

  context "loaded into a configuration" do

    it "has no default options" do
      configuration.campfire_options.should == {}
    end

    context "with configuration for a single room" do
      before do
        configuration.set :campfire_options, {
          :account => "awesomellc",
          :token => "yyz123",
          :ssl => true,
          :room => "General Awesomeness"
        }

        @campfire = stub("campfire")
        ::Tinder::Campfire.should_receive(:new).with("awesomellc", :token => "yyz123", :ssl => true, :ssl_verify => nil).and_return(@campfire)

        @room = stub("room")
        @campfire.should_receive(:find_room_by_name).with("General Awesomeness").and_return(@room)

      end

      it "speaks in a single room using `campfire_room.speak`" do
        @room.should_receive(:speak).with("IMPENDING DOOM")

        configuration.campfire_room.speak "IMPENDING DOOM"
      end

    end

    context "with configuration for multiple rooms" do
      before do
        configuration.set :campfire_options, :rooms => [{
                                                         :account => 'zim',
                                                         :room => 'World Conquest',
                                                         :token => '001000101110101001011112'
                                                       }, {
                                                         :account => 'swolleneyeballnetwork',
                                                         :room => 'Agents',
                                                         :token => '2001000101110101001011110'
                                                       }],
                                             :ssl => true
        @zim_campfire = stub("zim_campfire")
        ::Tinder::Campfire.should_receive(:new).with('zim', :token => '001000101110101001011112', :ssl => true, :ssl_verify => nil).and_return(@zim_campfire)

        @world_conquest_room = stub("world_conquest_room")
        @zim_campfire.should_receive(:find_room_by_name).with("World Conquest").and_return(@world_conquest_room)

        @swolleneyeballnetwork_campfire = stub("swolleneyeballnetwork_campfire")
        ::Tinder::Campfire.should_receive(:new).with('swolleneyeballnetwork', :token => '2001000101110101001011110', :ssl => true, :ssl_verify => nil).and_return(@swolleneyeballnetwork_campfire)

        @agents_room = stub("agents_room")
        @swolleneyeballnetwork_campfire.should_receive(:find_room_by_name).with("Agents").and_return(@agents_room)
      end

      it "speaks in all rooms using `campfire_rooms.speak`" do
        @world_conquest_room.should_receive(:speak).with("DOOM IMPENDING")
        @agents_room.should_receive(:speak).with("DOOM IMPENDING")

        configuration.campfire_rooms.speak "DOOM IMPENDING"
      end
    end
  end

end
