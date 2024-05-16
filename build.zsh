jupyter-book clean .
jupyter-book build .
if [ "$(git rev-parse --abbrev-ref HEAD)" = "main" ]; then
  echo "Publishing to main branch"
  ghp-import -n -p -f _build/html
fi