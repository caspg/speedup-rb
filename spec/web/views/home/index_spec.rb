describe Web::Views::Home::Index do
  let(:params)    { Lotus::Action::Params.new({}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { described_class.new(template, exposures.merge(format: :html)) }
  let(:rendered)  { view.render }

  it 'responds to easy_errors methods' do
    expect(view).to respond_to(:error_presenter)
    expect(view).to respond_to(:error_class_for)
  end
end
