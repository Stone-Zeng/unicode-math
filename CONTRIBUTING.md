# Guidelines for issues and pull requests

## Issues

Thanks for taking the time to report an issue!
Any apologies that I take longer, sometimes *way longer*, than I should to address them.

There are two important key points for submitting an issue:

* When submitting an issue, please include a *complete* minimal example.
* When loading maths fonts, please do so by *filename* only.
* If you are using a proprietary/unusual font, please try a maths font in TeX Live to see
  if it exhibits the same behaviour; it's obviously much harder for me to test with fonts
  I don't yet have or can't access.

For example, this is a good minimal example:

    \documentclass{article}
    \usepackage{unicode-math}
    \setmathfont{texgyrepagella-math.otf}
    \begin{document}
    \[
      x^2 + y^2 = z^2
    \]
    \end{document}

This is an example of a *bad* example:

    \usepackage{unicode-math}
    \setmathfont{TeX Gyre Pagella Math}

    % later:
    \[
      x^2 + y^2 = z^2
    \]

## Branches and Pull Requests

There are two main branches in this repository: `master` and `working`.
Development happens on the `working` branch; once a release is sent to CTAN,
the `master` branch is rebased to bring it up to date.

The `working` branch should be considered only semi-public; it may have broken
code and/or use force-pushing to rewrite history on occasions.

If you wish to make a contribution, please start from the `master` branch.

If you are changing documentation only (i.e., no code changes), you can add
`[ci skip]` to the commit message and the test suite won't be run to check that
the changes haven't broken anything.

