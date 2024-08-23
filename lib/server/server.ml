open Dream
open Dream_htmx

let htmx_resp body =
  Dream.response ~headers:[ ("Content-Type", "text/html") ] body

let _contact_page req =
  Tyxml.Html.(
    html
      (head (title (txt "Contact me")) [])
      (body
         [
           div
             ~a:
               [
                 a_style "display:flex;align-items:center;flex-direction:column";
               ]
             [
               h1 [ txt "Contact me" ];
               Pages.Nav_bar.tabs;
               Pages.Contact.greeting;
               form
                 ~a:
                   [
                     a_style "width:500px"; a_method `Post; a_action "/contact";
                   ]
                 [
                   Tyxml.Html.Unsafe.data (Dream.csrf_tag req);
                   label ~a:[ a_label_for "msg" ] [ txt "Your message" ];
                   textarea ~a:[ a_name "msg" ] (txt "");
                   label ~a:[ a_label_for "from" ] [ txt "Enter your email" ];
                   input ~a:[ a_input_type `Email; a_name "from" ] ();
                   button ~a:[ a_button_type `Submit ] [ txt "Submit" ];
                 ];
               Pages.Footer.element;
             ];
         ]))

let router =
  router
    [
      get "/" (fun _req -> html Pages.Index.page_string);
      get "/about" (fun _req ->
          Pages.About_me.page_string |> htmx_resp |> redirect "/about";
          html Pages.About_me.page_string);
      get "/contact" (fun _req ->
          html Pages.Contact.page_string);
      post "/contact" (fun req ->
          let open Lwt.Syntax in
          let* form = Dream.form req in
          let msg, from =
            match form with
            | `Ok [ ("from", from); ("msg", msg) ] -> (msg, from)
            | _ -> ("", "")
          in
          let subj = "Hello!" in
          let code = Email.send ~body:msg ~subj ~recipient:from in
          if code == 0 then Dream.redirect req "/" else empty `Bad_Request);
      get "/portfolio" (fun _req ->
        html Pages.Portfolio.page_string);
      get "/static/**" (static "assets/public");
      get "/js/**" (static "_build/default/bin")
    ]
