open Tyxml.Html

let description =
  section
    [
      txt
        "I am a writer, reader, and full-stack web developer from Baltimore, \
         MD, USA. Currently, I live in Albuquerque, in the Land of \
         Enchantment, New Mexico. I take pride in being entirely self-taught \
         in the myriad disciplines and skills required to be a professional \
         programmer. My educational background is in international affairs. I \
         earned a bachelor's degree from the University of Colorado in 2018. I \
         am the author of a novel, Filthy Synecdoche, which appeared through \
         Corona/Samizdat Press in 2022.";
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
    (body [ h1 [ txt "About me" ]; description ])
