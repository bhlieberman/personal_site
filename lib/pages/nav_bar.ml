open Tyxml.Html
open Util

let tabs =
  nav
    ~a:[ a_style "display:flex;gap:10px" ]
    [
      a
        ~a:[ on_click "console.log('Going home...')"; target "#main" ]
        [ txt "Home" ];
      a
        ~a:[ on_click "console.log('Going to about me...')"; target "#main" ]
        [ txt "About me" ];
      a
        ~a:[ on_click "console.log('Going to portfolio...')"; target "#main" ]
        [ txt "Portfolio" ];
      a ~a:[ on_click "console.log('Going to contact...')"; target "#main" ] [ txt "Contact" ];
    ]
