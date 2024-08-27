open Tyxml.Html
open Tyxml

let page_body =
  [%html
    "<div id=\"main\">\n      <h1>Ben Lieberman</h1>" [ Nav_bar.tabs ]
      "<h3 style=\"font-style:italic\">\n\
      \      This is my website. There are many like it, but this one is mine.\n\
      \      </h3>\n\
      \      <section id=\"main-content\">\n\
      \        <p>Welcome. Here you will find my 'home' on the Internet. The \
       links above will show you the salient information you need to \
       understand my professional and personal background. Here is a picture \
       of me, when I was younger and happier:</p>\n\
      \        "
      [
        img
          ~a:[ a_id "headshot" ]
          ~src:"static/headshot.jpeg"
          ~alt:"A headshot of the page's author, Ben Lieberman" ();
      ]
      "\n\
      \        <p>I am currently looking for part- or full-time work as a \
       full-stack software developer. Reach out to me at \
       bhlieberman93@gmail.com.</p>\n\
      \      </section>\n\
      \      </div>"]

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
         link ~rel:[ `Stylesheet ] ~href:"static/css/water.css" ();
         [%html "<link rel=" [ `Stylesheet ] " href=\"static/css/main.css\">"];
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
    (body [ page_body ])

let page_string = Format.asprintf "%a" (pp ()) page
