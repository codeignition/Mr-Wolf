Gem::Specification.new do |s|
  s.name               = "mrwolf"
  s.version            = "0.0.0"
  s.default_executable = "mrwolf"

  s.authors = ["codeignition"]
  s.description = %q{cleaner}
  s.email = %q{hello@codeignition.co}
  s.files = ["lib/mrwolf.rb", "lib/mrwolf/transporter_to_s3.rb","lib/mrwolf/packager_to_rpm.rb","bin/mrwolf","test/test_transporter.rb","test/test_packager.rb"]
  s.require_paths = ["lib"]
  s.summary = %q{mrwolf the cleaner!}
  s.bindir = "bin"
  s.add_dependency "thor"
  s.executables << "mrwolf"
end
