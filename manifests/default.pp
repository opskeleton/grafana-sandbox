node default {

  class { 'elasticsearch':
    manage_repo  => true,
    repo_version => '1.4'
  }

  include nginx

  nginx::resource::vhost { 'grafana.local':
      www_root    => '/opt/grafana',
      listen_port => '8080'
  } ->

  class {'grafana':
    influxdb_host         => 'localhost',
    influxdb_dbpath       => '/db/metrics',
    influxdb_user         => 'root',
    influxdb_pass         => 'root',
    influxdb_grafana_user => 'root',
    influxdb_grafana_pass => 'root',
    elasticsearch_host    => 'localhost',
  }

  class {'influxdb': }
}
