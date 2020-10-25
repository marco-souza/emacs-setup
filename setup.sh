#! /bin/bash
if [[ ! -e ~/.emacs.d/ ]]; then
  echo Installing spacemacs...
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

echo Copying spacemacs configs...
DEST=$HOME/.spacemacs
if [[ -e ./spacemacs ]]; then
  cat ./spacemacs > $DEST
else
  curl https://raw.githubusercontent.com/marco-souza/emacs-setup/main/spacemacs > $DEST
fi

echo "Your emacs is ready to go :)"
