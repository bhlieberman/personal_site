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

let contact_form =
  form ~a:[a_style "width:500px"]
    [
      label ~a:[ a_label_for "msg" ] [ txt "Your message" ];
      textarea ~a:[ a_id "msg" ] (txt "");
      label ~a:[ a_label_for "email" ] [ txt "Enter your email" ];
      input ~a:[ a_input_type `Email; a_id "email" ] ();
      button ~a:[a_button_type `Submit] [(txt "Submit")]
    ]

let page =
  html (head page_title [])
    (body
       [
         div
           ~a:
             [ a_style "display:flex;align-items:center;flex-direction:column" ]
           [ h1 [ txt "Contact me" ]; Nav_bar.tabs; greeting; contact_form ];
       ])

let page_string = Format.asprintf "%a" (pp ()) page
