require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class FirstTest < Test::Unit::TestCase
  include Cassandra::Constants

  def setup
    @playground = Cassandra.new('Playground', "localhost:9160", :retries => 2, :connect_timeout => 0.1, :exception_classes => [])
    @playground.clear_keyspace!
  end

  def test_get_key
    @playground.insert(:Toys, key, {'body' => 'v', 'user' => 'v'})
    assert_equal({'body' => 'v', 'user' => 'v'}, @playground.get(:Toys, key))
    assert_equal(['body', 'user'].sort, @playground.get(:Toys, key).timestamps.keys.sort)
    assert_equal({}, @playground.get(:Toys, 'bogus'))
  end

  def key
    caller.first[/`(.*?)'/, 1]
  end
end
