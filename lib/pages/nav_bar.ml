open Tyxml.Html
open Util

let tabs =
  nav
    ~a:[ a_style "display:flex;gap:10px" ]
    [
      a
        ~a:[ on_click "console.log('Going home...')"; target "#main"; get "/" ]
        [ txt "Home" ];
      a
        ~a:
          [
            on_click "console.log('Going to about me...')";
            target "#main";
            get "/about";
          ]
        [ txt "About me" ];
      a
        ~a:
          [
            on_click "console.log('Going to portfolio...')";
            target "#main";
            get "/portfolio";
          ]
        [ txt "Portfolio" ];
      a
        ~a:
          [
            on_click "console.log('Going to contact...')";
            target "#main";
            get "/contact";
          ]
        [ txt "Contact" ];
    ]
