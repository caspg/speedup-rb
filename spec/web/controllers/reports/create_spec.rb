describe Web::Controllers::Reports::Create do
  let(:action) { described_class.new }

  after { ReportRepository.clear }

  context 'with valid params' do
    let(:valid_params) { Hash[report: { owner: 'owner', repo: 'repo' }] }

    it 'creates a new report' do
      expect{ action.call(valid_params) }.to change{ ReportRepository.all.size }.by(1)
    end

    it 'redirects to the reports#show' do
      response = action.call(valid_params)
      report = ReportRepository.last

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq("/reports/#{report.id}")
    end
  end

  context 'with invalid params' do
    let(:invalid_params) { Hash[report: {}] }

    it 'does not create new Report' do
      expect{ action.call(invalid_params) }.not_to change{ ReportRepository.all.size }
    end

    it 're-render the home#index' do
      response = action.call(invalid_params)

      expect(response[0]).to eq(200)
    end
  end
end