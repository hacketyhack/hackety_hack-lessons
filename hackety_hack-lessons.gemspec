# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hackety_hack/lessons/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Steve Klabnik"]
  gem.email         = ["steve@steveklabnik.com"]
  gem.description   = %q{A set of lessons to learn Ruby programming, from the Hackety Hack project.}
  gem.summary       = %q{The lessons from Hackety Hack.}
  gem.homepage      = "http://hackety.com/lessons"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "hackety_hack-lessons"
  gem.require_paths = ["lib"]
  gem.version       = HacketyHack::Lessons::VERSION

  gem.add_runtime_dependency "metadown"
end
