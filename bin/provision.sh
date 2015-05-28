#! /bin/sh

# Set up Riak data types
touch /etc/riak/provisioned_start

if [ ! -f /etc/riak/provisioned_finished ]; then
sleep 1
riak-admin bucket-type create sets '{"props":{"datatype":"set"}}'
sleep 1
riak-admin bucket-type create counters '{"props":{"datatype":"counter"}}'
sleep 1
riak-admin bucket-type activate sets
sleep 1
riak-admin bucket-type activate counters
sleep 1
riak-admin bucket-type create maps '{"props":{"datatype":"map"}}'
sleep 1
riak-admin bucket-type activate maps
sleep 1
touch /etc/riak/provisioned_finished
fi

exec sleep 36000000
