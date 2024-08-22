open Tyxml.Html

let element =
  footer
    ~a:
      [
        a_style
          "display:flex;align-self:center;align-items:center;justify-content:center;width:50%;margin-top:auto;padding:20px";
      ]
    [
      txt
        "This page was built with OCaml and HTMX. You can find the source code ";
      a
        ~a:[ a_href "https://www.github.com/bhlieberman/personal_site" ]
        [ txt " here" ];
    ]
