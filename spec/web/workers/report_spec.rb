describe Web::Workers::Report do
  let(:worker)        { described_class.new }
  let(:report_id)     { 007 }
  let(:repo_analyzer) { double }

  it 'calls RepoAnalyzer service with proper attribute' do
    expect(Web::Services::ReportWorkerFlow).to receive(:new).with(report_id)
      .and_return(repo_analyzer)
    expect(repo_analyzer).to receive(:call)

    worker.perform(report_id)
  end
end
