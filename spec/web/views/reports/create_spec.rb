class NewReportParams < Lotus::Action::Params
  param :report do
    param :owner, presence: true, format: /^\w+$/
    param :repo, presence: true, format: /^\w+$/
  end
end

describe Web::Views::Reports::Create do
  let(:exposures) { Hash[params: params] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { described_class.new(template, exposures.merge(format: :html)) }
  let(:rendered)  { view.render }


  context 'when params are missing' do
    let(:params) { NewReportParams.new({}) }

    it 'displays list of errors' do
      params.valid?

      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('owner: is required.')
      expect(rendered).to include('repo: is required.')
    end
  end

  context 'when params are missing' do
    let(:params) { NewReportParams.new({ report: { owner: 'owner name', repo: 'repo name' } }) }

    it 'displays list of errors' do
      params.valid?

      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('owner: white spaces are not allowed.')
      expect(rendered).to include('repo: white spaces are not allowed.')
    end
  end
end
