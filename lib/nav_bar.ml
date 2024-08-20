open Tyxml.Html

let tabs =
  nav
    ~a:[ a_style "display:flex;gap:10px" ]
    [
      a ~a:[ a_href "/home.html" ] [ txt "Home" ];
      a ~a:[ a_href "/about.html" ] [ txt "About me" ];
      a ~a:[ a_href "/portfolio.html" ] [ txt "Portfolio" ];
      a ~a:[ a_href "/contact.html" ] [ txt "Contact" ];
    ]
