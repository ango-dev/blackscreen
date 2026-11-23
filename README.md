# blackscreen

A self-hosted, pure black (`#000`) page for OLED displays. On an OLED panel, black
pixels are switched off completely. The controls and the mouse cursor hide after
3 seconds without input, so nothing stays lit.

It is one static `index.html` (inline CSS and JS, no dependencies, no build step)
served by nginx in Docker.

## Run

```bash
docker compose up -d --build
```

Then open <http://localhost:8080>. The container is named `blackscreen` and
restarts automatically unless you stop it.

The icon is served at `/favicon.ico` (for example
<http://localhost:8080/favicon.ico>), for dashboards that need an icon URL.

Stop it with:

```bash
docker compose down
```

### Change the port

Edit the left side of the port mapping in `docker-compose.yml`. For example, to use
port 3000:

```yaml
    ports:
      - "3000:80"
```

Then run `docker compose up -d --build` again.

## Controls

| Action | How |
| --- | --- |
| Enter fullscreen | **Enter fullscreen** button, double-click, or `F` |
| Exit fullscreen | `Esc`, `F`, double-click, or the **Exit** button (appears when you move the mouse) |
| Open on all screens | **Open on all screens** button (see limits below) |
| Download a black PNG | Pick a size (480p to 8K, phone 1080 × 1920, or custom up to 16384 px per side) and click **Download PNG** |

With **Open on all screens**, exiting in any window closes all of them.

## Known limits

- **Open on all screens** uses the Window Management API, which only Chrome and Edge
  support. It also only works on `localhost` or over HTTPS. Over plain
  `http://<lan-ip>:8080` the browser blocks it.
- The first time, the browser asks for the window-management permission. With three
  or more screens you also need to allow pop-ups for the site.
- iPhone Safari has no fullscreen API for web pages, so the fullscreen button does
  nothing there.

## License

MIT. See [LICENSE](LICENSE).
