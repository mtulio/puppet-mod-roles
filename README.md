# roles

#### Table of Contents

1. [Overview](#overview)
2. [Profiles](#profiles)
	* [Linux](#linux)
	* [NMS - Network Management Systems](#nms)
3. [Limitations](#limitations)
4. [Development](#development)

## Overview

Module to manage the puppet 'business layer'. Here you can define pools of configuration and associate it to profiles. This class will work exclusively with 'mtulio-profile' module that implements puppet 'implementation layer'. Each 'role' you can add one or more profiles.

For an better understanding, I have named each 'roles' as a 'pools of servers', each pool has an specific group of configurations[profiles]

For a example, if the node has an 'webserver role' with NGINX, the class can be called 'pool_dmz_nginx' and associate these profiles:
* profiles::linux
* profiles::nms::zabbix_agent
* profiles::web::nginx

In this class you can be specific and detailed in what the business need.

## Profiles

* Linux
* NMS/Zabbix
* Webserver/Nginx [soon]
* Webserver/APACHE [soon]


### Linux

#### Description

 Profile Linux configure Linux system using module 'mtulio-linux'

#### Dependencies

 Module ['Linux'](https://forge.puppetlabs.com/mtulio/linux)

#### Files

 See [module description](https://forge.puppetlabs.com/mtulio/linux)

#### Usage

* Basic security level
```
include ::profiles
class {'::profiles::linux':
  security_level => 'basic',
}
```

* Define your own repository of configuration [module]
```
class {'::profiles' :
  gb_repo_base => '0_REPOSITORY',
  gb_pool      => 'dmz',
}
class {'::profiles::linux' :
  security_level => 'basic',
}
```

### NMS

#### Zabbix Agent

##### Description

 Profile to configure zabbix Agent on a Linux server

##### Dependencies

 Module ['Zabbix'](https://forge.puppetlabs.com/mtulio/zabbix)

##### Files

See [module description](https://forge.puppetlabs.com/mtulio/zabbix)

##### Usage

* Configure Zabbix Agent with the basic parameters defined on class '::profiles::nms::zabbix_agent'. (check out the class to customize the parameters of your organization)

```
 include profiles
 class { 'profiles::nms::zabbix_agent' : }
```

## Limitations

OS compatibility: 
* Red Hat family 7+ 

We're working to support more OS.

## Development

See project page at https://github.com/mtulio/puppet-mod-profiles

## Release Notes

[1.0.0]
* Add Profile Linux [base and sshd configuration]
* Add Profile Zabbix 

