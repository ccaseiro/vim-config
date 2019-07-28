let current_compiler = "ocaml-test"
CompilerSet makeprg=dune\ runtest
CompilerSet errorformat=
      \%EFile\ \"%f\"\\,\ line\ %l\\,\ characters\ %c%.%#:%m,
      \%EFile\ \"%f\"\\,\ line\ %l\\,\ characters\ %c%.%#,
      \%Z\\s%#,
      \%CError:\ %m,
      \%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',
      \%D%*\\a:\ Entering\ directory\ `%f',
      \%X%*\\a:\ Leaving\ directory\ `%f',
      \%D%*\\a[%*\\d]:\ Entering\ directory\ '%f',
      \%X%*\\a[%*\\d]:\ Leaving\ directory\ '%f',
      \%D%*\\a:\ Entering\ directory\ '%f',
      \%X%*\\a:\ Leaving\ directory\ '%f',
      \%DEntering\ directory\ '%f',
      \%XLeaving\ directory\ '%f',
      \%DMaking\ %*\\a\ in\ %f,
      \%-G%.%#,
      \%-G%.%#
