jupyter-book clean .
jupyter-book build .
if [ "$(git rev-parse --abbrev-ref HEAD)" = "main" ]; then
  echo "Publishing from main branch"
  ghp-import -n -p -f _build/html
else
  echo "Not Publishing changes. Changes are only locally visible."
  echo "If you want to publish to website, please switch to main branch and merge your changes into it."
fi