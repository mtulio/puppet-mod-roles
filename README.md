# Linux

#### Table of Contents

1. [Overview](#overview)
2. [Profiles](#profiles)
	* [Linux](#linux)
	* [NMS - Network Management Systems](#nms)
3. [Limitations](#limitations)
4. [Development](#development)

## Overview

Module to manage the puppet 'abstraction layer'. Here you can define profiles for your roles. This class will work better with 'roles' class [business layer]. You can add one or more profile for each 'role'.

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

