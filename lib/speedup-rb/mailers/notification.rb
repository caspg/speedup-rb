class Mailers::Notification
  include Lotus::Mailer

  from    'noreply@speedup-rb.com'
  to      :recipient
  subject :subject

  def report_uri
    Web::Routes.url(:report, id: report.id)
  end

  def report_full_name
    "#{report.owner}/#{report.repo}"
  end

  private

  def recipient
    report.email
  end

  def subject
    "Report for #{report_full_name} is ready!"
  end
end
