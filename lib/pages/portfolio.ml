open Tyxml.Html
open Tyxml

let header = [%html {|<head><title>Portfolio</title></head>|}]

let card_style =
  "box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\n\
  \  transition: 0.3s;\n\
  \  border-radius: 5px;margin:20px"

let container_style =
  "padding: 2px 16px;display:flex;flex-direction:column;align-items:center"

let project_card =
  let icons_class = [ "fa-solid"; "fa-plus"; "fa-10x" ] in
  let href = "mailto:bhlieberman93@gmail.com" in
  let target = "_blank" in
  [%html
    "<div class=\"project-card\" style=" card_style "><div><i class="
      icons_class "></i>\n  <a href=" href " target=" target " rel="
      [ `Noopener; `Noreferrer ] "><p>Your project here!</p></a></div></div>"]

let filled_card ~link ~title ~classes =
  let html =
    [%html
      "<div style=" card_style ">\n    <div style=" container_style
        ">\n      <i class=" classes
        "></i>\n      <a style=\"padding:10px\" href=" link ">\n        <p>"
        [ txt title ]
        "</p>\n      </a>\n    </div>\n  </div>"]
  in
  html

let cards_display =
  let style =
    "display:grid;grid-template-columns:repeat(3,1fr);grid-auto-rows:auto;grid-gap:1rem;margin-top:20px"
  in
  let html =
    [%html
      "<div class=\"card-display\"><div style=" style ">\n    "
        [
          filled_card ~title:"NIA"
            ~link:"https://github.com/bhlieberman/nouvelles-impressions-a-fric"
            ~classes:[ "fa-solid"; "fa-earth-africa"; "fa-10x" ];
          filled_card ~title:"clj-baseball"
            ~classes:[ "fa-solid"; "fa-baseball"; "fa-10x" ]
            ~link:"https://github.com/bhlieberman/clj-baseball";
          project_card;
        ]
        "\n  </div></div>"]
  in
  html

let page =
  html header
  @@ body
       [
         div
           ~a:
             [ a_style "display:flex;align-items:center;flex-direction:column" ]
           [ h1 [ txt "My Work" ]; Nav_bar.tabs; cards_display ];
       ]

let page_string = Format.asprintf "%a" (pp ()) page
