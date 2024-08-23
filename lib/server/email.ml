let send ~body ~subj ~recipient =
  let body = Format.sprintf "echo %s" body in
  let msg = Format.sprintf "mail -s %s %s" subj recipient in
  let cmd = body ^ " | " ^ msg in
  Dream.log "%s" cmd;
  Sys.command cmd
