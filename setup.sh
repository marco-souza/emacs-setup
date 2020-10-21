#! /bin/bash
if [[ ! -e ~/.emacs.d/ ]]; then
  echo Installing spacemacs...
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

echo Copying spacemacs configs...
if [[ -e ./spacemacs ]]; then
  cat ./spacemacs > $HOME/.spacemacs
else
  cat ./spacemacs > $HOME/.spacemacs
  curl https://raw.githubusercontent.com/marco-souza/emacs-setup/main/init.toml > $HOME/.SpaceVim.d/init.toml
fi

echo "Your emacs is ready to go :)"
