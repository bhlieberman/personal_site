let () =
  Dream.run ~interface:"0.0.0.0" ~error_handler:Dream.debug_error_handler
  @@ Dream.logger Server.router
