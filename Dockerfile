FROM python:3-alpine

RUN apk add git --no-cache && \
  git clone https://github.com/jwigley/spotify_to_tidal

WORKDIR /spotify_to_tidal

RUN python3 -m pip install -r requirements.txt

ADD entrypoint.sh .
ADD spotify-to-tidal.sh /usr/bin/spotify-to-tidal

# copy crontabs for root user
COPY default-cron /etc/crontabs/root

ENTRYPOINT [ "./entrypoint.sh" ]

# start crond with log level 8 in foreground, output to stderr
CMD ["crond", "-f", "-d", "8"]
