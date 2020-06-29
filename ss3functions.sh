function require_steamcmd() {
  #Download and extract steamcmd
  [[ -d "${HOME}/steam/downloads" ]] || \
    mkdir "${HOME}/steam/downloads"
  [[ -f "${HOME}/steam/downloads/steamcmd_linux.tar.gz" ]] || \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -P "${HOME}/steam/downloads"
  [[ -f "${HOME}/steam/steamcmd.sh" ]] || (
    cd "${HOME}/steam"
    tar -xvzf downloads/steamcmd_linux.tar.gz
  )
  (
    cd "${HOME}/steam"
    echo "Running steamcmd"
    ./steamcmd.sh +exit
  )
}

function require_ss3() {
  #Download SS3 from SteamCMD
  cd "${HOME}/steam"
  cmd="./steamcmd.sh \
      +login ${STEAM_USER} ${STEAM_PASS} \ "
  cmd+="+set_steam_guard_code ${STEAM_GUARD} \ "
  cmd+="+force_install_dir ${HOME}/ss3server \
      +app_update 41080 \
      +exit"
  exec $cmd
}

function launch() {
  if [ ! -f "${HOME}/ss3server/Bin/SamHD_DedicatedServer.exe" ]; then
    echo "Server/binary directory does not exist";
    exit 1;
  fi

  cd "${HOME}/ss3server/Bin"
  ./SamHD_DedicatedServer.exe > $0-cmd.log
}
