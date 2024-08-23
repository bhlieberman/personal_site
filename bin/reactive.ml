open Tyxml_lwd
open Js_of_ocaml
open Lwdom

let tooltip =
  Html.span
    ~a:
      [
        Html.a_id (Lwd.pure "tooltip");
        Html.a_hidden ();
        Html.a_onmouseover
          (attr (fun _ ->
               let this = Dom_html.getElementById "tooltip" in
               Js.Unsafe.meth_call this "removeAttribute"
                 [| Js.Unsafe.coerce @@ Js.string "hidden" |]
               |> ignore;
               false));
      ]
    [ Html.txt (Lwd.pure "") ]

let observerOpts = IntersectionObserver.empty_intersection_observer_options ()

let observer_cb
    (entries :
      IntersectionObserver.intersectionObserverEntry Js.t Js.js_array Js.t)
    (_ : IntersectionObserver.intersectionObserver Js.t) =
  entries##forEach
    (Js.wrap_callback
       (fun (entry : IntersectionObserver.intersectionObserverEntry Js.t) _ _ ->
         print_endline (entry##.isIntersecting |> Js.to_bool |> string_of_bool)))

let _observer =
  new%js IntersectionObserver.intersectionObserver
    (Js.wrap_callback observer_cb)
    observerOpts

let _ =
  Dom_html.window##.onload :=
    Dom_html.handler (fun _ ->
        print_endline "loaded";
        let card = Dom_html.getElementById "card" in
        List.iter (Dom.appendChild card)
          (Lwd_seq.to_list (Lwd.quick_sample (Lwd.observe tooltip))
            : _ node list
            :> raw_node list);
        Js._false)
