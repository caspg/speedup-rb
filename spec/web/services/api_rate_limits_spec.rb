class ApiResponse
  # reset it's a unix timestamp
  def parsed_response
    { 'resources' => { 'remaining' => 999, 'reset' => 1446476769 } }
  end
end

describe Web::Services::ApiRateLimits do
  before do
    allow(HTTParty).to receive(:get) { ApiResponse.new }

    Fasterer::Github.configure { |config| config.access_token = 'some_access_token' }
  end

  let(:expected_base_uri)     { 'https://api.github.com/rate_limit' }
  let(:expected_query_params) { Hash[:query, { 'access_token' => 'some_access_token' }] }
  let(:expected_result)       { Hash[:remaining, 999, :reset, 1446476769] }

  it 'calls HTTParty with correct query params' do
    described_class.new.fetch_data

    expect(HTTParty).to have_received(:get).with(expected_base_uri, expected_query_params)
  end

  it 'returns correct hash with results' do
    expect(described_class.new.fetch_data).to eq(expected_result)
  end
end
