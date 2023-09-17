#!/bin/bash

if ! command -v mkdocs >/dev/null 2>&1; then
  echo "It doesn't seem like MkDocs Material is installed."
  echo
  echo "To install it, see https://squidfunk.github.io/mkdocs-material/getting-started/#latest, or use your distribution's package manager."
  echo
  echo "Press any key to exit..."
  read -n 1 -s
  exit 1
fi

echo "If there's any errors, make sure MkDocs Material is installed correctly, see the MkDocs Material documentation."
echo "To close the server, exit this window."
echo
mkdocs serve
