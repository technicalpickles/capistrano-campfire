require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Capistrano::Campfire do
  let :configuration do
    config = Capistrano::Configuration.new
    configuration.extend(Capistrano::Spec::ConfigurationExtension)
    Moonshine::CapistranoIntegration.load_into(@configuration)
  end

  it "populates :campfire_room"
end
