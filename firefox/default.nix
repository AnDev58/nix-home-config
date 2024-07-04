{pkgs, config, inputs, ...}: 
{
  programs.firefox = {
    enable = true;
    profiles.andev = {
      isDefault = true;
      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

        "NixOS Wiki" = {
          urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];
          iconUpdateURL = "https://wiki.nixos.org/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@nw" ];
        };

        "Yandex" = {
          urls = [{
            template = "https://ya.ru/search";
            params = [
              { name = "text"; value = "{searchTerms}"; }
            ];
          }];
          
          iconUpdateURL = "https://yandex.ru/favicon.ico";
          definedAliases = [ "@ya" ];
        };
      };
      search.default = "Yandex";
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [ ublock-origin bitwarden ]; 
    };
  };
}
