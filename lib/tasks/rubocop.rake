require 'rubocop/rake_task'

desc 'run RuboCop'
task :rubocop do
  RuboCop::RakeTask.new
end
