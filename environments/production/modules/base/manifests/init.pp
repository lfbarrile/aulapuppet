
class base {
case $::osfamily{
"redhat":{
$pacotes =["epel-release","git","vim","sysstat","htop","cowsay","sl","figlet"]
}
"debian": {

$pacotes =["git","vim","sysstat","htop","cowsay","sl","figlet"]
}
}
package{$pacotes:
  ensure => present,
}

file{'/root/.bashrc':
source => "puppet:///modules/base/bashrc_base",
ensure=>present
}
}

