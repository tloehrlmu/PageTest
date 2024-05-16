jupyter-book clean .
jupyter-book build .
if [ "$(git rev-parse --abbrev-ref HEAD)" = "main" ]; then
  echo "Publishing from main branch"
  ghp-import -n -p -f _build/html
else
  echo "Not Publishing changes. Only allowed from main branch!!!!"
fi