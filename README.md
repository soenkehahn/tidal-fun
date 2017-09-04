## setup

- apt install supercollider sc3-plugins
- `scide`
  - type `include("SuperDirt")`, hit Shift+Enter
  - exit `scide`

## start tidal server:

- `sclang tidal-start.sc`

To make the tidal server available through the network, do:
`socat - udp4-listen:57129,reuseaddr,fork | socat - udp4-sendto:127.0.0.1:57120`

(It seems to ignore messages that don't come from localhost.)

## run tidal-fun

- `stack build`
- `stack exec tidal-fun`
