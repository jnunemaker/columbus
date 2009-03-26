require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'matchy'
require 'fakeweb'

FakeWeb.allow_net_connect = false

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'columbus'

class Test::Unit::TestCase
  def fixture_file(file)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', file))
  end
end