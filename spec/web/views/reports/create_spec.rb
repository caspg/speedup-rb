class NewReportParams < Lotus::Action::Params
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  param :report do
    param :repo_full,  presence: true, format: /^\S+\/\S+$/
    param :path, presence: true, format: /^\S*$/
    param :form_uuid
    param :email, format: VALID_EMAIL_REGEX
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
      expect(rendered).to include('repo: is required.')
      expect(rendered).to include('path: is required.')
    end

    it 'adds error-class to form' do

      expect(rendered.scan(/has-error/).size).to eq(2)
    end
  end

  context 'when params are invalid' do
    let(:param_hash) do
      { report: { repo_full: 'owner / repo', path: 'some/ path', email: 'wrong email' } }
    end
    let(:params) { NewReportParams.new(param_hash) }

    it 'displays list of errors' do
      expect(rendered).to include('form-errors')
      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('repo: wrong format.')
      expect(rendered).to include('path: wrong format.')
      expect(rendered).to include('email: wrong format.')
    end

    it 'adds error-class to form' do
      expect(rendered.scan(/has-error/).size).to eq(3)
    end
  end

  context 'when params are valid' do
    let(:params) { NewReportParams.new({ report: { repo_full: 'owner/repo', path: 'path/' } }) }

    it 'does not display list of errors' do
      expect(rendered).not_to include('form-errors')
      expect(rendered).not_to include('There was a problem with your submission')
    end

    it 'adds error-class to form' do
      expect(rendered.scan(/has-error/).size).to eq(0)
    end
  end
end
