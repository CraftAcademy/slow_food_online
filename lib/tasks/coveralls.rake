require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new(:spec)
task test_with_coveralls: [:spec, :cucumber, 'coveralls:push']
