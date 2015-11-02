require_relative '../../../../apps/web/views/reports/show'

describe Web::Views::Reports::Show do
  let(:report)    { Report.new(id: 1, owner: 'owner', repo: 'repo') }
  let(:exposures) { Hash[report: report] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/reports/show.html.erb') }
  let(:view)      { described_class.new(template, exposures.merge(format: :html)) }
  let(:rendered)  { view.render }

  it 'exposes #report' do
    expect(view.report).to eq exposures.fetch(:report)
  end

  it { expect(rendered).to include('owner', 'repo') }
end
