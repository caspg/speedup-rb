require 'features_helper'

describe 'visit home' do
  it 'is successfull' do
    visit '/'

    expect(page).to have_content('Speedup Rb')
  end
end
