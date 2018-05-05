node "dev1.salas4linux.com.br"{
  user{"devops":
   ensure=>present,
   managehome=>true,
   shell=>"/bin/bash",
}
}
