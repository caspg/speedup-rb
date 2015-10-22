RSpec.describe Report do
  it 'can be initialized with attributes' do
    report = Report.new(owner: 'Owner', repo: 'Repo')
    expect(report.owner).to eq('Owner')
    expect(report.repo).to eq('Repo')
  end
end
