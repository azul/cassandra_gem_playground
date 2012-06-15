This is a first playground for getting familiar with the cassandra gem and Cassandra itself.

First you probably have to setup the keyspace and column family. You can do this in cassandra-cli like this:
```
connect localhost/9160;
create keyspace Playground;
use Playground;
create COLUMN FAMILY Toys 
  WITH comparator = UTF8Type
  AND key_validation_class=UTF8Type
  ;
exit;
```

So far there is one super simple test - just to prove it's working. You can run it with
```sh
bundler install
ruby test/first_test.rb
```

