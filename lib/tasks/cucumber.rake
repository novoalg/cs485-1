require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:report) do |t|
  t.cucumber_opts = "--format html --out reports/#{Time.now.getutc.to_i}_report.html "
end

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = ""
end

Cucumber::Rake::Task.new(:dryrun) do |t|
  t.cucumber_opts = "--dry-run"
end
