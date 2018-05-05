class docker {
case $::osfamily {
"debian":{
 $pacotes = ["apt-transport-https","ca-certificates","curl","software-properties-common"]
package{$pacotes:
       ensure=>present
}
exec {"chave_repo_puppet":
     command=>"/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add -"
}
exec{"adicionando_repo":
command => "/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable'"
}
exec{"atualizando_repo":
command=> "/usr/bin/apt update"
}
package{"docker-ce":
ensure=>present
}
}
"redhat":{
$pacotes=["docker","docker-client","docker-client-latest","docker-common","docker-latest","docker-latest-logrotate","docker-selinux","docker-engine-selinux","docker-engine"]

package{
$pacotes:
ensure=>absent
}
$instalar=["yum-utils","device-mapper-persistent-data","lvm2"]
package { $instalar:
ensure=>present
}
exec{"adicionando_repo":
command=>"/usr/bin/yum-config-manager --enable docker-ce-edge"
}
package{"docker-ce":
ensure=>present

}
}
}

}


