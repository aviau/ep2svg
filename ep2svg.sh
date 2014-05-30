#!/bin/bash

# converts evol.us Pencil mockup files to svg
# (c) 2013 Glutanimate (http://askubuntu.com/users/81372/)
# released under GNU GPL v2
# XSL source: (c) 2013 Robert Kosten (https://code.google.com/p/evoluspencil/issues/detail?id=260#c1)

XSLFILE="./ep2svg.xsl"
WORKINGDIR=$(dirname "$1")


xsltproc -o "$WORKINGDIR"/ "$XSLFILE" "$@"
