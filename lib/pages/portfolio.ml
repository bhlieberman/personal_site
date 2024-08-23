open Tyxml.Html

let header = head (title (txt "Portfolio")) []

let card_style =
  "box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\n\
  \  transition: 0.3s;\n\
  \  border-radius: 5px;margin:20px"

let container_style =
  "padding: 2px 16px;display:flex;flex-direction:column;align-items:center"

let project_card =
  div
    ~a:[ a_style card_style ]
    [
      div
        ~a:[ a_style container_style ]
        [
          i ~a:[ a_class [ "fa-solid"; "fa-plus"; "fa-10x" ] ] [];
          a
            ~a:
              [
                a_href "mailto:bhlieberman93@gmail.com";
                a_target "_blank";
                a_rel [ `Noopener; `Noreferrer ];
              ]
            [ txt "Your project here!" ];
        ];
    ]

let filled_card ~link ~title ~classes =
  div
    ~a:[ a_style card_style ]
    [
      div
        ~a:[ a_style container_style ]
        [
          i ~a:[ a_class classes ] [];
          a ~a:[ a_style "padding:10px"; a_href link ] [ txt title ];
        ];
    ]

let cards_display =
  div
    ~a:
      [
        a_style
          "display:grid;grid-template-columns:repeat(3,1fr);grid-auto-rows:auto;grid-gap:1rem;margin-top:20px";
      ]
    [
      filled_card ~title:"NIA"
        ~classes:[ "fa-solid"; "fa-earth-africa"; "fa-10x" ]
        ~link:"https://github.com/bhlieberman/nouvelles-impressions-a-fric";
      filled_card ~title:"clj-baseball"
        ~classes:[ "fa-solid"; "fa-baseball"; "fa-10x" ]
        ~link:"https://github.com/bhlieberman/clj-baseball";
      project_card;
    ]

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
