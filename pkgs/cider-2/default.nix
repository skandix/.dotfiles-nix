{
  appimageTools,
  lib,
  requireFile,
  makeWrapper,
}:

appimageTools.wrapType2 rec {
  pname = "cider-2";
  version = "2.6.1";

  src = requireFile {
    name = "Cider-linux-appimage-x64.AppImage";
    url = "https://cidercollective.itch.io/cider";
    sha256 = "6ee1ee9d4b45419d7860d1e7831dc7c2a9b94689f013a0bf483876c6b4d65062";
  };

  nativeBuildInputs = [ makeWrapper ];

  extraInstallCommands =
    let
      contents = appimageTools.extract {
        inherit version src;
        # HACK: this looks for a ${pname}.desktop, where `cider-2.desktop` doesn't exist
        pname = "cider";
      };
    in
    ''
      wrapProgram $out/bin/${pname} \
         --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
         --add-flags "--no-sandbox --disable-gpu-sandbox" # Cider 2 does not start up properly without these from my preliminary testing

      install -m 444 -D ${contents}/cider.desktop $out/share/applications/${pname}.desktop
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace-warn 'Exec=AppRun --no-sandbox' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share
    '';

  meta = {
    description = "Powerful music player that allows you listen to your favorite tracks with style";
    homepage = "https://cider.sh";
    license = lib.licenses.unfree;
    mainProgram = "cider-2";
    maintainers = with lib.maintainers; [ itsvic-dev ];
    platforms = [ "x86_64-linux" ];
  };
}

