# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{columbus}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = %q{2009-04-02}
  s.email = %q{nunemaker@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/columbus", "lib/columbus/feed.rb", "lib/columbus/link.rb", "lib/columbus/redirect_follower.rb", "lib/columbus.rb", "test/columbus_test.rb", "test/feed_test.rb", "test/fixtures", "test/fixtures/railsquicktips.html", "test/fixtures/railstips.html", "test/fixtures/railstips_feedburner.html", "test/fixtures/railstips_redirect", "test/link_test.rb", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jnunemaker/columbus}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{columbus}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Autodiscovers feeds from urls}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
