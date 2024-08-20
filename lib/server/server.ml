open Dream
open Dream_htmx

let htmx_resp body =
  Dream.response ~headers:[ ("Content-Type", "text/html") ] body

let router =
  router
    [
      get "/" (from_filesystem "assets" "index.html");
      get "/about" (fun _req ->
          Pages.About_me.page_string |> htmx_resp |> push "/about";
          empty `OK);
    ]
