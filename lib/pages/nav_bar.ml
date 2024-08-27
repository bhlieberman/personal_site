open Tyxml.Html
open Tyxml

let tabs =
  let el_id = "navbar" in
  [%html
    "<nav id = " el_id ">\n    "
      (List.map
         (fun (title, link) ->
           [%html
             "<a _hx-target=\"#main\" _hx-get=" link ">" [ txt title ] "</a>"])
         [
           ("Home", "/");
           ("About me", "/about");
           ("Portfolio", "/portfolio");
           ("Contact", "/contact");
         ])
      "\n  </nav>"]
