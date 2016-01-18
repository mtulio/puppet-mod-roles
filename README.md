# roles

#### Table of Contents

1. [Overview](#1-overview)
2. [Roles](#roles)
	* [server_linux](#21-class-server_linux)
	* [pool_dmz_nginx](#22-class-pool_dmz_nginx)
3. [Limitations](#3-limitations)
4. [Development](#4-development)
5. [Release Notes](#5-release-notes)

## 1. Overview

Module to manage the puppet 'business layer'. Here you can define pools of configuration and associate it to profiles. This class will work exclusively with 'mtulio-profile' module that implements puppet 'implementation layer'. Each 'role' you can add one or more profiles.

For an better understanding, I have named each 'roles' as a 'pools of servers', each pool has an specific group of configurations[profiles]

For a example, if the node has an 'webserver role' with NGINX, the class can be called 'pool_dmz_nginx' and associate these profiles:
* profiles::linux
* profiles::nms::zabbix_agent
* profiles::web::nginx

In this class you can be specific and detailed in what the business need.

## 2. Roles

* server_linux   : means a basic Linux server with the base Company configuration
* pool_dmz_nginx : means a pools of Linux servers that has a base Linux Configuration plus NGINX


### 2.1 Class: server_linux

#### Description

 Profile to configure Linux system using its profile [see module mtulio-profiles](https://forge.puppetlabs.com/mtulio/profiles)

#### Dependencies

 Module ['mtulio-profiles'](https://forge.puppetlabs.com/mtulio/linux)

#### Files

 See [module description](https://forge.puppetlabs.com/mtulio/linux)

#### Usage

* Basic usage
```
class {'::roles::server_linux' : }
```

* Using your own 'module repository of configuration'
```
class {'::roles::server_linux' : 
  config_repo => '0_REPOSITORY',
}
```

### 2.2 Class: pool_dmz_nginx

#### Description

 Profile to configure NGINX in a Linux server [in development]

#### Dependencies
#### Files
#### Usage


## 3. Limitations

OS compatibility: 
* Red Hat family 7+ 

We're working to support more OS.

## 4. Development

See project page at https://github.com/mtulio/puppet-mod-roles

## 5. Release Notes

[1.0.0]
* Add Role for Linux server [server_linux]
* In development role/profile for NGINX web server

