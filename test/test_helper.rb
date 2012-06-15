CASSANDRA_VERSION = ENV['CASSANDRA_VERSION'] || '1.0' unless defined?(CASSANDRA_VERSION)

require "rubygems"
require 'test/unit'
require "cassandra"
begin; require 'ruby-debug'; rescue LoadError; end

begin
  @test_client = Cassandra.new('Twitter', 'localhost:9160', {:exception_classes => []})
rescue Thrift::TransportException => e
  #FIXME Make server automatically start if not running
  if e.message =~ /Could not connect/
    puts "*** Please start the Cassandra server by running 'rake cassandra'. ***"
    exit 1
  end
end
