open Tyxml.Html

let page_title = title (txt "Contact me")

let greeting =
  div
    [
      section
        ~a:[ a_style "text-wrap:no-wrap;max-width:500px" ]
        [
          p
            [
              txt
                "If you have any questions, concerns, or anything else you \
                 wish to communicate to me, feel free to reach out through \
                 this form!";
            ];
        ];
    ]

let resume =
  object_
    ~a:
      [a_style "margin:20px 0px 20px 0px";
        Unsafe.string_attrib "type" "application/pdf";
        a_data "static/resume.pdf";
        a_width 750;
        a_height 1000;
      ]
    []

let page =
  html (head page_title [])
    (body
       [
         div
           ~a:
             [ a_style "display:flex;align-items:center;flex-direction:column" ]
           [ h1 [ txt "Contact me" ]; Nav_bar.tabs; resume; Footer.element ];
       ])

let page_string = Format.asprintf "%a" (pp ()) page
