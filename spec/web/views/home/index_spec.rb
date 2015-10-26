require 'spec_helper'
require_relative '../../../../apps/web/views/home/index'

class NewReportParams < Lotus::Action::Params
  param :report do
    param :owner, presence: true
    param :repo, presence: true
  end
end

describe describe Web::Views::Home::Index do
  let(:params)    { NewReportParams.new({}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { Web::Views::Home::Index.new(template, exposures.merge(format: :html)) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    params.valid?

    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('owner is required')
    expect(rendered).to include('repo is required')
  end
end
