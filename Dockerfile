FROM node:10-alpine

ADD https://github.com/stshow/retro/archive/gh-pages.tar.gz /Downloads/gh-pages.tar.gz

RUN tar -xzf /Downloads/gh-pages.tar.gz && \
    mv /retro-gh-pages /retro && \
    cd /retro && \
    npm i -g gulp && \
    npm i --ignore-scripts && \
    npm cache clean --force && \
    adduser --disabled-password --gecos "retro" --home /retro --no-create-home retro && \
    mkdir -p /retro/data && \
    chown -R retro:retro /retro

WORKDIR /retro
VOLUME /retro/data

USER retro

EXPOSE 4000 3030
CMD [ "npm", "run", "start" ]
