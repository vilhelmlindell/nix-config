{
  services.xremap = {
    userName = "vilhelm";
    config = {
      keymap = [
        {
          name = "main remaps";
          remap = {
            CapsLock = {
              held = "leftctrl";
              alone = "esc";
              alone_timeout_millis = "150";
            };
          };
        }
      ];
    };
  };
}
