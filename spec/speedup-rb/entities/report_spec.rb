RSpec.describe Report do
  it 'can be initialized with attributes' do
    report = Report.new(owner: 'Owner', repo: 'Repo', url_uuid: 'url_uuid', form_uuid: 'form_uuid')
    expect(report.owner).to eq('Owner')
    expect(report.repo).to eq('Repo')
    expect(report.url_uuid).to eq('url_uuid')
    expect(report.form_uuid).to eq('form_uuid')
  end
end
