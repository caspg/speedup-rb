describe Web::Controllers::Reports::Show do
  before do
    @report = ReportRepository.create(Report.new(owner: 'owner', repo:  'repo', form_uuid: 'uuid'))
  end
  after { ReportRepository.clear }

  let(:action) { described_class.new }
  let(:params) { Hash[id: @report.id] }


  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes correct report' do
    action.call(params)
    expect(action.exposures[:report]).to eq(@report)
  end
end
