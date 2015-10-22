get '/', to: 'home#index'

post '/', to: 'reports#create', as: :reports
get '/reports/:id', to: 'reports#show', as: :report
