describe Web::Services::ReportWorkerFlow do
  subject { described_class.new(report_id) }

  let(:report_id)              { 'fake_id' }
  let(:reset_time)             { 1234567890 }
  let(:report_analyzer_double) { double }
  let(:rate_limits_double)     { double }

  before do
    allow(Web::Services::RepoAnalyzer).to receive(:new) { report_analyzer_double }
    allow(report_analyzer_double).to receive(:call)

    allow(Web::Services::ApiRateLimits).to receive(:new) { rate_limits_double }
    allow(rate_limits_double).to receive(:fetch_data)    { rate_limit_data }
  end

  context 'when remaining rate limit is higher than minimum value' do
    let(:rate_limit_data) { Hash[:remaining, 1001, :reset, reset_time] }

    it 'calls analyzer service' do
      expect(Web::Services::RepoAnalyzer).to receive(:new).with(report_id)
        .and_return(report_analyzer_double)
      expect(report_analyzer_double).to receive(:call)

      subject.call
    end

    it 'does not call report worker' do
      expect(Web::Workers::Report).not_to receive(:perform_at)

      subject.call
    end
  end

  context 'when remaining rate limit is lower than minimum value' do
    let(:rate_limit_data) { Hash[:remaining, 999, :reset, reset_time] }

    it 'does not call analyzer service' do
      expect(Web::Services::RepoAnalyzer).not_to receive(:new)

      subject.call
    end

    it 'calls report worker' do
      expect(Web::Workers::Report).to receive(:perform_at).with(reset_time + 30, report_id)

      subject.call
    end
  end
end
