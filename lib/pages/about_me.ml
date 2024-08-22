open Tyxml.Html

let description =
  section ~a:[a_style "display:flex;flex-direction:column"]
    [
      p
        [
          txt
            "I am a writer, reader, and full-stack web developer from \
             Baltimore, MD, USA. Currently, I live in Albuquerque, in the Land \
             of Enchantment, New Mexico. I take pride in being entirely \
             self-taught in the myriad disciplines and skills required to be a \
             professional programmer. My educational background is in \
             international affairs. I earned a bachelor's degree from the \
             University of Colorado in 2018. I am the author of a novel, \
             Filthy Synecdoche, which appeared through Corona/Samizdat Press \
             in 2022.";
        ];
      p
        [
          txt
            "I got my start in the industry doing data ETL work in Python. \
             Since then, I have experimented with\n\
            \        dozens of languages, but I have spent most of my time \
             working in Clojure, a dynamic and functional Lisp dialect that \
             runs on the Java Virtual Machine. I have a passion for clean, \
             maintainable and performant code, and for programming in general. \
             I love to think about code, and talk about it with other people. \
             I am particularly keen on working in functional languages. \
             Lately, I have been learning OCaml, which I have used to produce \
             this website.";
        ];
      p
        [
          txt
            "I dedicate my leisure to biblio- and cine-philia. I am an \
             aspiring film critic as well as a published author. You can buy \
             that book at coronasamizdat.com, if you are so inclined. Your \
             support is appreciated.";
        ];
      p
        [
          txt
            "...and what would a good website be without some cat pictures? I \
             am the proud parent of the feline siblings, Itty and Bitty, \
             pictured here:";
        ];
      img
        ~a:[ a_style "max-height:500px;max-width:300px;align-self:center" ]
        ~src:"static/kitties.jpg" ~alt:"A picture of two very cute cats" ();
    ]

let page =
  html
    (head
       (title (txt "About me"))
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
       ])
    (body [ h1 [ txt "About me" ]; Nav_bar.tabs; description; Footer.element ])

let page_string = Format.asprintf "%a" (pp ()) page
