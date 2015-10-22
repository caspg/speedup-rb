require 'features_helper'

describe 'Show report' do
  before { ReportRepository.create(Report.new(owner: 'owner', repo:  'repo')) }
  after { ReportRepository.clear }

  let(:report) { ReportRepository.last }

  it 'displays github repo owner and repo name' do
    visit "/reports/#{report.id}"

    expect(page).to have_content('Report for owner/repo')
  end
end
