node default {

  include nginx

  nginx::resource::vhost { 'grafana.local':
      www_root    => '/opt/grafana',
      listen_port => '8080'
  } ->

  class {'grafana':
    influxdb_host         => $ipaddress_eth1,
    influxdb_dbpath       => '/db/metrics',
    influxdb_user         => 'root',
    influxdb_pass         => 'root',
    influxdb_grafana_user => 'root',
    influxdb_grafana_pass => 'root',
  }

  class {'influxdb': }

  class {'influxdb::root':
    next_pass => 'foobar'
  }

  influxdb::database {'metrics':
    ensure => present,
  }
}
