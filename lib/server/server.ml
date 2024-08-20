open Dream
open Dream_htmx

let htmx_resp body =
  Dream.response ~headers:[ ("Content-Type", "text/html") ] body

let router =
  router
    [
      get "/" (fun _req -> html Pages.Index.page_string);
      get "/about" (fun _req ->
          Pages.About_me.page_string |> htmx_resp |> redirect "/about";
          html Pages.About_me.page_string);
      get "/contact" (fun _req ->
          Pages.Contact.page_string |> htmx_resp |> push "/contact";
          html Pages.Contact.page_string);
      get "/static/**" (static "assets/public")
    ]
