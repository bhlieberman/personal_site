let () =
  Dream.run ~error_handler:Dream.debug_error_handler
  @@ Dream.logger Server.router
