require 'lotus/model'
require 'lotus/mailer'
Dir["#{ __dir__ }/speedup-rb/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/speedup-rb_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/speedup-rb_development.sqlite3'
     adapter type: :sql, uri: ENV['SPEEDUP_RB_DATABASE_URL']
  #    adapter type: :sql, uri: 'mysql://localhost/speedup-rb_development'
  #
  # adapter type: :file_system, uri: ENV['SPEEDUP_RB_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  # mapping do
    # collection :users do
    #   entity     User
    #   repository UserRepository
    #
    #   attribute :id,   Integer
    #   attribute :name, String
    # end
  # end
end.load!

Lotus::Mailer.configure do
  root "#{ __dir__ }/speedup-rb/mailers"

  # See http://lotusrb.org/guides/mailers/delivery
  delivery do
    development LetterOpener::DeliveryMethod, location: File.expand_path('../../tmp/letter_opener', __FILE__)
    test        :test
    production  :smtp,
      address:              "smtp.gmail.com",
      port:                 587,
      domain:               "speedup-rb.com",
      user_name:            ENV['SMTP_USERNAME'],
      password:             ENV['SMTP_PASSWORD'],
      authentication:       "plain",
      enable_starttls_auto: true
  end
end.load!
