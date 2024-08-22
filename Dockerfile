FROM ocaml/opam as build

# Install system dependencies
RUN sudo apt-get install --assume-yes --no-install-recommends libev-dev libssl-dev pkg-config

WORKDIR /app

ENV OPAMYES = 1 \
    OPAMJOBS = 4

RUN opam init -y

RUN opam update && opam install --yes dune dream tyxml dream-htmx

COPY . .

# Install dependencies
RUN opam install . --deps-only

USER root

# Build project
RUN opam exec -- dune build

CMD ["dune", "exec", "personal_site"]