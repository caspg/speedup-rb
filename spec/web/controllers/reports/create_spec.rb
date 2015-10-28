describe Web::Controllers::Reports::Create do
  let(:action) { described_class.new }
  let(:worker) { Web::Workers::Report }

  after { ReportRepository.clear }

  context 'with valid params' do
    let(:valid_params) { Hash[report: { owner: 'owner', repo: 'repo', form_uuid: 'uuid' }] }

    it 'creates a new report' do
      expect{ action.call(valid_params) }.to change{ ReportRepository.all.size }.by(1)
    end

    it 'redirects to the reports#show' do
      response = action.call(valid_params)
      report = ReportRepository.last

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq("/reports/#{report.id}")
    end

    it 'creates new async job' do
      expect { action.call(valid_params) }.to change(worker.jobs, :size).by(1)
      expect(worker.jobs.last['args']).to eq([ReportRepository.last.id])
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

    it 'does not create new async job' do
      expect { action.call(invalid_params) }.not_to change(worker.jobs, :size)
    end
  end
end
