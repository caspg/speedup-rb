describe Web::Services::RepoAnalyzer do
  before do
    allow(Fasterer::Github).to receive(:scan).with(report.owner, report.repo, nil)
      .and_return(fasterer_response)
  end

  after { ReportRepository.clear }

  let(:report_params) { { owner: 'owner', repo: 'repo', content: nil, form_uuid: 'uuid' } }
  let(:report) { ReportRepository.create(Report.new(report_params)) }
  let(:fasterer_response) { { some: 'hash_response' } }

  subject { described_class.new(report.id) }

  it 'calls Fasterer::Github' do
    expect(Fasterer::Github).to receive(:scan).with(report.owner, report.repo, nil)

    subject.call
  end

  it 'updates report with fasterer_response' do
    subject.call
    reloaded_report = ReportRepository.find(report.id)

    # .to_json is used, because ruby hash is saved as a json in db, and symbols are converted to strings
    expect(reloaded_report.content.to_json).to eq(fasterer_response.to_json)
  end

  context 'when report email is not provided' do
    it 'sends notification email' do
      expect { subject.call }.not_to change(Lotus::Mailer.deliveries, :size)
    end
  end

  context 'when report email is provided' do
    let(:report) do
      ReportRepository.create(Report.new(report_params.merge!(email: 'some@email.com')))
    end

    it 'sends notification email' do
      expect { subject.call }.to change(Lotus::Mailer.deliveries, :size).by(1)
    end
  end
end
