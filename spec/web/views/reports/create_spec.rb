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

  before(:each) { params.valid? }

  context 'when params are missing' do
    let(:params) { NewReportParams.new({}) }

    it 'displays list of errors' do
      expect(rendered).to include('form-errors')
      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('owner: is required.')
      expect(rendered).to include('repo: is required.')
    end

    it 'adds error-class to form' do

      expect(rendered.scan(/has-error/).size).to eq(2)
    end
  end

  context 'when params are invalid' do
    let(:param_hash) { { report: { owner: 'owner name', repo: 'repo name', path: 'some/ path' } } }
    let(:params) { NewReportParams.new(param_hash) }

    it 'displays list of errors' do
      expect(rendered).to include('form-errors')
      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('owner: white spaces are not allowed.')
      expect(rendered).to include('repo: white spaces are not allowed.')
      expect(rendered).to include('path: white spaces are not allowed.')
    end

    it 'adds error-class to form' do
      expect(rendered.scan(/has-error/).size).to eq(3)
    end
  end

  context 'when params are valid' do
    let(:params) { NewReportParams.new({ report: { owner: 'owner', repo: 'repo' } }) }

    it 'does not display list of errors' do
      expect(rendered).not_to include('form-errors')
      expect(rendered).not_to include('There was a problem with your submission')
    end

    it 'adds error-class to form' do
      expect(rendered.scan(/has-error/).size).to eq(0)
    end
  end
end
