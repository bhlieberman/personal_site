open Tyxml.Html

let page_body =
  div
    ~a:
      [
        a_style "display:flex;align-items:center;flex-direction:column";
        a_id "main";
      ]
    [
      h1 [ txt "Ben Lieberman" ];
      Nav_bar.tabs;
      h3
        ~a:[ a_style "font-style:italic" ]
        [
          txt
            "This is my website. There are many like it, but this one is mine.";
        ];
      section
        ~a:[ a_style "display:flex;flex-direction:column" ]
        [
          p
            [
              txt
                "Welcome. Here you will find my 'home' on the Internet. The \
                 links above will show you the salient information you need to \
                 understand my professional and personal background. Here is a \
                 picture of me, when I was younger and happier:";
            ];
          img
            ~a:
              [ a_style "align-self:center;margin-top:10px;margin-bottom:10px" ]
            ~src:"static/headshot.jpeg"
            ~alt:"A headshot of the page's author, Ben Lieberman" ();
          p
            [
              txt
                "I am currently looking for part- or full-time work as a \
                 full-stack software developer. Reach out to me at \
                 bhlieberman93@gmail.com or use the contact form if you want \
                 to chat!";
            ];
        ];
    ]

let page_title = title (txt "Ben Lieberman")

let page =
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
         script
           ~a:
             [
               a_src "https://kit.fontawesome.com/d7bae1ca43.js";
               a_crossorigin `Anonymous;
             ]
           (txt "");
       ])
    (body
       ~a:
         [
           a_style
             "display:flex;flex-direction:column;align-items:center;min-height:100vh;flex-grow:1";
         ]
       [ page_body ])

let page_string = Format.asprintf "%a" (pp ()) page
