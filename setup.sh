#! /bin/bash
if [[ -e ~/.emacs.d/ ]]; then
  read -p "Cleanup previous config? - (N/y): " shouldCleanup
  if [[ $shouldCleanup = "y" ]]; then
    echo "- Cleaning up..."
    rm -rf ~/.emacs.d ~/.spacemacs
  fi
fi
if [[ ! -e ~/.emacs.d/ ]]; then
  echo "- Installing spacemacs..."
  git clone -q https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

echo "- Copying spacemacs configs..."
spacemacs_file=spacemacs
user_config_file=settings.org
src_cmd=""
if [[ -e ./$spacemacs_file ]] && [[ -e ./$user_config_file ]]; then
    echo "- Loading local config..."
    src_cmd='cat ./'
else
    echo "- Loading remote config..."
    src_cmd='curl https://raw.githubusercontent.com/marco-souza/emacs-setup/main/'
fi

eval "$src_cmd$spacemacs_file > $HOME/.$spacemacs_file"
eval "$src_cmd$user_config_file > $HOME/.emacs.d/$user_config_file"


# Check if its already configured
init_file=$HOME/.emacs.d/init.el
if ! grep -Fxq "$user_config_file" $init_file; then
    # code does not found
    echo "- Setup init.el settings..."
    echo -e "\n;; Setup user settings.org\n(require 'org)\n(org-babel-load-file (\n\texpand-file-name \"settings.org\" \n\tuser-emacs-directory))" >> $init_file
fi

echo -e "\nYour spaceemacs is ready to go :)"
