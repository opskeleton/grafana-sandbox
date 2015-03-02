# Intro 
This project manages a sandbox for setting up [grafana](http://grafana.org/) dashboards for [collectd](https://collectd.org/) persisted into [influxdb](http://influxdb.com/).

# Usage
```bash
  # install require gems, puppet modules and fire up vagrant
  $ ./boot.sh
  # in order to create DBs and set root u/p you need to run provision twice.
  $ vagrant provision
```

# Copyright and license

Copyright [2015] [Ronen Narkis]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
