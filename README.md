# docker-spotify-to-tidal-cron

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/jwigley/docker-spotify-to-tidal-cron/Master?label=build%20%28master%29)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/jwigley/spotify-to-tidal-cron/latest)
[![Docker Pulls](https://img.shields.io/docker/pulls/jwigley/spotify-to-tidal-cron.svg)](https://hub.docker.com/r/jwigley/spotify-to-tidal-cron/)

Dockerised [spotify-to-tidal](https://github.com/timrae/spotify_to_tidal) playlist converter
script with cron setup to run it once a day.

## Docker repository

[jwigley/spotify-to-tidal-cron](https://hub.docker.com/r/jwigley/spotify-to-tidal-cron)

## Run

Run with a config directory mounted which will be used to store persistent config/session data.
A sample `config.yml` file will be created (if no existing one is found). Fill in your details
as per the [spotify-to-tidal setup](https://github.com/timrae/spotify_to_tidal#setup) and run
the container again.

When a valid config file is found, the script will execute immediately. If running for the
first time it will prompt you for some inputs. Once complete, it will then follow the configured
cron schedule.

```bash
docker run \
  -d \
  -v $PWD/config:/config \
  -e "TZ=UTC" \
  --name "spotify-to-tidal-cron" \
  jwigley/spotify-to-tidal-cron
```

Be sure to set `TZ` to ensure the schedule runs in your timezone.

## Changing cron schedule

The default cron job (scheduled to run the script once a day at 0:00) can be overriden by
mounting your cron job to `/etc/crontabs/root`.

```
bash
-v $PWD/override-cron:/etc/crontabs/root
```

## Credits

[timrae](https://github.com/timrae)'s [spotify-to-tidal](https://github.com/timrae/spotify_to_tidal)
is where the real magic happens. This is just a containerised version of that script.
