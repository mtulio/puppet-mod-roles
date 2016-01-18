#
# == Class: ROLES / POOL_DMZ_NGINX
#
# Manage pool of servers NGINX on DMZ zone.
#
class roles::pool_dmz_nginx (
  $config_repo = $gb_repo_base,
) inherits roles {

  # BASIC envs
  $pool = 'dmz'
  notice(" ##INFO> roles::pool_dmz_nginx::pool [${pool}]")

  # Config main class: profiles 
  class { '::profiles':
    gb_pool      => $pool,
    gb_repo_base => $config_repo,
  }

  # Config profile linux
  class { '::profiles::linux' :
    security_level => 'basic',
  }

  # Config profile NMS zabbix
  class {'::profiles::nms::zabbix_agent' : }

  # TODO:
  ## Crete profile NGINX
  #inlcude ::profiles::web::nginx
}
