# frozen_string_literal: true

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

desc "Write the latest git SHA to a REVISION file"
task :gitsha do
  `git rev-parse HEAD > REVISION`
end
