get '/', to: 'home#index'

post '/reports', to: 'reports#create', as: :reports
