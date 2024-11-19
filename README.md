# AceStream + Jellyfin Configuration

This project provides configuration for setting up AceStream and Jellyfin, allowing seamless usage of streams (provided by AceStream) inside Jellyfin.

## Usage

### Building the Docker Image

To start, build the Docker image:

```bash
docker image build -t acestream-server:stable .
```

### Starting Services

After building the image, start the services:

```bash
docker compose up
```

### Creating M3U Playlist

To have streams provided by AceStream, create an M3U file containing your streams. Here's an example:

```m3u
#EXTM3U
#EXTINF:-1 tvg-logo="<<LOGO_URL>>", <<CHANNEL_NAME>>
http://acestream-server:6878/ace/getstream?content_id=<<CHANNEL_CONTENT_ID>>
```

### Configuring Jellyfin

Use your .m3u file in Jellyfin by following [the official Jellyfin Live TV setup guide](https://jellyfin.org/docs/general/server/live-tv/setup-guide/).

## Notes

- Replace `<<LOGO_URL>>` with the channel's logo URL
- Replace `<<CHANNEL_NAME>>` with the actual channel name
- Replace `<<CHANNEL_CONTENT_ID>>` with the specific AceStream content ID