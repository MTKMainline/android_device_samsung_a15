#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):83886080:27ed2d79ea3d4c5208639705410687a7baadb686; then
  applypatch \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):67108864:33d74e7b11b82eff67bf3240a2d3a7bcff8013a9 \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):83886080:27ed2d79ea3d4c5208639705410687a7baadb686 && \
      (log -t install_recovery "Installing new recovery image: succeeded" && setprop vendor.ota.recovery.status 200) || \
      (log -t install_recovery "Installing new recovery image: failed" && setprop vendor.ota.recovery.status 454)
else
  log -t install_recovery "Recovery image already installed" && setprop vendor.ota.recovery.status 200
fi

# the tree owner is lyntaxqq. known as meeo11 or lyntax_