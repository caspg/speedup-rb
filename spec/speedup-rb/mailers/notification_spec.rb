require 'spec_helper'

describe Mailers::Notification do
  before do
    Lotus::Mailer.deliveries.clear
  end

  let(:report)     { Report.new(id: 1, owner: 'owner', repo: 'repo', email: 'example@email.com') }
  let(:report_uri) { Web::Routes.url(:report, id: report.id) }

  it 'delivers notification email' do
    Mailers::Notification.deliver(report: report)
    mail = Lotus::Mailer.deliveries.last

    expect(mail.to).to eq([report.email])
    expect(mail.subject).to eq('Report for owner/repo is ready!')
    expect(mail.body.encoded).to include(report_uri)
  end
end

