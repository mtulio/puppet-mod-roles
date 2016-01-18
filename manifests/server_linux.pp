#
# == Class: ROLES / SERVER_LINUX
#
# Manage Server with Linux and NMS Zabbix.
#
class roles::server_linux (
  $config_repo = $gb_repo_base,
) inherits roles {

  # BASIC envs
  $pool = 'default'
  notice(" ##INFO> roles::server_linux::pool [${pool}]")

  # Config main class: profiles 
  if $config_repo == undef {
    class { '::profiles':  }
  }
  else {
    class { '::profiles':
      gb_pool      => $pool,
      gb_repo_base => $config_repo,
    }
  }

  # Config profile linux
  class { '::profiles::linux' :
    security_level => 'high',
  }

  # Config profile NMS zabbix
  class {'::profiles::nms::zabbix_agent' : }

}
