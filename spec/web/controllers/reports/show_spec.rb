describe Web::Controllers::Reports::Show do
  before do
    @report = ReportRepository.create(Report.new(owner: 'owner', repo:  'repo', form_uuid: 'uuid'))
  end
  after { ReportRepository.clear }

  let(:action) { described_class.new }

  context 'when report with given id exists' do
    let(:params) { Hash[id: @report.id] }

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end

    it 'exposes correct report' do
      action.call(params)
      expect(action.exposures[:report]).to eq(@report)
    end
  end

  context 'when report with given id exists' do
    let(:params) { {} }

    it 'returns 404 code with appropriate message' do
      response = action.call(params)

      expect(response[0]).to eq(404)
    end
  end
end
