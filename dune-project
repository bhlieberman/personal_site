(lang dune 3.16)

(name personal_site)

(generate_opam_files true)

(source
 (github bhlieberman/personal_site))

(authors "Ben Lieberman")

(maintainers "Ben Lieberman")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name personal_site)
 (synopsis "Personal webpage")
 (description "Website offering information on its author's professional and personal background.")
 (depends ocaml dune tyxml dream dream-htmx)
 (tags
  (topics "personal website")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
