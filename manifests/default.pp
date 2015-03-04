node default {

  include nginx

  $pass = 'vagrant'

  nginx::resource::vhost { 'grafana.local':
      www_root    => '/opt/grafana',
      listen_port => '8080'
  } ->

  class {'grafana':
    influxdb_dbpath       => '/db/metrics',
    influxdb_user         => 'root',
    influxdb_pass         => $pass,
    influxdb_grafana_user => 'root',
    influxdb_grafana_pass => $pass,
  }

  class {'influxdb': }

  ensure_resource('package','curl',{ensure => present})

  class {'influxdb::root':
    next_pass => $pass
  } ->

  influxdb::database {'metrics':
    ensure => present,
    pass   => $pass
  }

  influxdb::database {'grafana':
    ensure => present,
    pass   => $pass
  }


  include collectd

  collectd::plugin::network::server{'localhost':
      port => '25826'
  }

  class { 'collectd::plugin::cpu': }

}
