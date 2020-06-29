# STEAM LOGIN
Serious Sam 3's server binaries can only be downloaded if you have a steam account. The Steam account you use doesn't need to own the game. I'd suggest using a separate account since these credentials are passed to the docker container in cleartext.

Steam guard is a bit of a paint 

# DEFAULT PORTS
- 27016: Enumeration port, configuratble with GAME_PORT
- 27015/tcp: Admin port, always GAME_PORT -1

# Environment Variables
- STEAM_USER
- STEAM_PASS
- STEAM_GUARD: Your Steam Guard code
- GAME_PORT: The port the game will run on
