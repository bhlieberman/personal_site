open Tyxml.Html
open Personal_site.Index

let () =
  let file = open_out "index.html" in
  let fmt = Format.formatter_of_out_channel file in
  pp () fmt document;
  close_out file

let () =
  let about = open_out "about.html" in
  let fmt = Format.formatter_of_out_channel about in
  pp () fmt Personal_site.About_me.page;
  close_out about