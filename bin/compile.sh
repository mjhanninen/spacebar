#!/bin/bash

if [[ ! -d ./out ]]
then
    cat <<EOF >&2
Error: Output directory ./out missing.
EOF
    exit 1
fi

asciidoctor --backend html5         \
            --doctype book          \
            --section-numbers       \
            --destination-dir ./out \
            ./luonnokset/index.adoc
