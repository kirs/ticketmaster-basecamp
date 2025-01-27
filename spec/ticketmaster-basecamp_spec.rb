require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TicketmasterBasecamp" do
  before(:each) do 
    headers = {'Authorization' => 'Basic MDAwMDAwOkJhc2VjYW1w'}
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/projects/count.xml', headers, fixture_for('project_count'), 200
    end
    @ticketmaster = TicketMaster.new(:basecamp, {:domain => 'ticketmaster.basecamphq.com', :token => '000000'})
  end

  it "should be able to instantiate a new instance" do
    @ticketmaster.should be_an_instance_of(TicketMaster)
    @ticketmaster.should be_a_kind_of(TicketMaster::Provider::Basecamp)
  end

  it "should be able to validate it's authentication" do 
    @ticketmaster.valid?.should be_true
  end
end
