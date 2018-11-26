### eslint-changed-files

Get files that have changed between your merge and your master branch. This is _not_ dependent on pre-commit or pre-push hooks, so you can actually get work done effectively. It also takes into account the files that exist in `.eslintignore` (to avoid annoying warning messages).

Use this to your lint script like the following:
  `"lint": "eslint $(./findChangedFiles.sh)"`