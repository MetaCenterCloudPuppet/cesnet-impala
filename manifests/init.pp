# == Class: impala
#
# Configure Impala Puppet Module.
#
class impala (
  $catalog_hostname = $::fqdn,
  $statestore_hostname = $::fqdn,
  $servers = [$::fqdn],

  $alternatives = '::default',
  $features = {},
  $properties = undef,
) inherits ::impala::params {
  include ::stdlib

  validate_string($alternatives)

  $dyn_properties = {
    # short-circuit reads
    'dfs.client.read.shortcircuit' => true,
    'dfs.domain.socket.path' => '/var/run/hadoop-hdfs/dn.socket',
    'dfs.client.file-block-storage-locations.timeout.millis' => '10000',
  }
  $_properties = merge($dyn_properties, $properties)
}