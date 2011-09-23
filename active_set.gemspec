# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_set/version"

Gem::Specification.new do |s|
  s.name        = "active_set"
  s.version     = ActiveSet::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ian Young"]
  s.email       = ["ian.greenleaf+github@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Set behavior for ActiveRecord}
  s.description = %q{Use set columns with ActiveRecord.}

  s.rubyforge_project = "active_set"

  s.add_dependency "activerecord", "~> 3.0.9"
  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_development_dependency "mysql2", "~> 0.2.0"
  s.add_development_dependency "sqlite3", "~>1.3.4"
  s.add_development_dependency "rspec", "~> 2.6.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
