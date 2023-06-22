FROM alpine:latest

RUN apk update && apk add --update \
  zsh \
  zsh-vcs \
  npm \
  tmux \
  stow \
  bash \
  yarn \
  git \
  python3 \
  cargo \
  neovim \
  ripgrep \
  zoxide \
  alpine-sdk

RUN addgroup -S todd \
  && adduser -S todd -G todd --shell /bin/sh

ENV LV_BRANCH=release-1.3/neovim-0.9
ENV LV_PATH='https://raw.githubusercontent.com/lunarvim/lunarvim/${LV_BRANCH}/utils/installer/install.sh'
ENV HOME=/home/todd
ENV XDG_DATA_HOME=${XDG_DATA_HOME:-/home/todd/.local/share}

RUN su -c "bash <(curl -s ${LV_PATH})" todd 
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

COPY --chown=todd:todd ./entrypoint.sh /etc

WORKDIR /home/todd
CMD /etc/entrypoint.sh

