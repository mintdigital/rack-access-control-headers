task :default => [:spec]

desc "Run specs"
task :spec => FileList['test/*_spec.rb'] do |t|
  suite = t.prerequisites
  sh "bundle exec rspec -I.:lib:test #{suite.join(' ')}" 
end
