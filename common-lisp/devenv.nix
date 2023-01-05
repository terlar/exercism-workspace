{pkgs, ...}: {
  packages = [
    pkgs.sbcl
    pkgs.lispPackages.quicklisp
  ];

  scripts.quicklisp-run-tests.exec = ''
    test_name="''${1%.lisp}"
    quicklisp run -- --load "$1" --eval "($test_name:run-tests)" --quit
  '';

  scripts.quicklisp-init.exec = ''
    if [[ ! -d $HOME/quicklisp ]]; then
      ${pkgs.expect}/bin/expect -c 'spawn quicklisp init --quicklisp-dir "$env(HOME)/quicklisp"; expect "continue." {send "\r"}'

      sbcl --non-interactive --no-sysinit --no-userinit \
        --load $HOME/quicklisp/setup.lisp \
        --eval '(ql-util:without-prompting (ql:add-to-init-file))' \
        --quit
    fi
  '';

  enterShell = ''
    quicklisp-init
  '';
}
