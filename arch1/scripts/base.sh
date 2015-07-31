#!/usr/bin/env bash

# 時刻合わせ
cp /usr/share/zoneinfo/Japan /etc/localtime

yum groupinstall -y "Development Tools"

yum install -y git zsh mlocate ncurses-devel lua lua-devel openssl-devel pcre-devel
 
# Install Vim-7.4 with lua.
cd /usr/local/src

if [ ! -e vim-7.4.tar.bz2 ]; then
  wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
  tar jxvf vim-7.4.tar.bz2
 
  cd vim74

  ./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-luainterp=dynamic \
    --enable-gpm \
    --enable-cscope \
    --enable-fontset

  make && make install
fi

# Install Jq (JSON parser).
wget http://stedolan.github.io/jq/download/linux64/jq /usr/local/bin/
chmod +x jq

# Configure git
git config --global color.ui true

# Update mlocate databse.
updatedb
