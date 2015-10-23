class FastererWorker
  include Sidekiq::Worker

  def perform(report_id)
  end
end
