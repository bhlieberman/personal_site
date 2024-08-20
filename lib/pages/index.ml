open Tyxml.Html

let page_body =
  div
    ~a:[ a_style "display:flex;align-items:center;flex-direction:column" ]
    [
      h1 [ txt "Ben Lieberman" ];
      Nav_bar.tabs;
      h3
        ~a:[ a_style "font-style:italic" ]
        [
          txt
            "Welcome to my website. There are many like it, but this one is \
             mine.";
        ];
    ]

let page_title = title (txt "Ben Lieberman")

let document =
  html
    (head page_title
       [
         meta
           ~a:
             [
               a_name "viewport";
               a_content "width=device-width, initial-scale=1.0";
             ]
           ();
         link ~rel:[ `Stylesheet ]
           ~href:"https://cdn.jsdelivr.net/npm/water.css@2/out/water.css" ();
         script
           ~a:
             [
               a_src "https://unpkg.com/htmx.org@2.0.2";
               a_crossorigin `Anonymous;
               a_integrity
                 "sha384-Y7hw+L/jvKeWIRRkqWYfPcvVxHzVzn5REgzbawhxAuQGwX1XWe70vji+VSeHOThJ";
             ]
           (txt "");
       ])
    (body [ page_body ])
