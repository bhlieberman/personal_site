open Tyxml

let element =
  [%html
    {|
<div>
  <footer>
    <p>This page was built with OCaml and HTMX. You can find the source code <a href="https://www.github.com/bhlieberman/personal_site">here</a></p>
  </footer>
</div>
|}]
