RSpec.describe Report do
  it 'can be initialized with attributes' do
    report = Report.new(owner: 'Owner', repo: 'Repo', report_url: 'url')
    expect(report.owner).to eq('Owner')
    expect(report.repo).to eq('Repo')
    expect(report.report_url).to eq('url')
  end
end
