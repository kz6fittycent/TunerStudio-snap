[![tunerstudio](https://snapcraft.io/tunerstudio/badge.svg)](https://snapcraft.io/tunerstudio)[![🧪 Snap Builds](https://github.com/kz6fittycent/TunerStudio-snap/actions/workflows/test-snap-can-build.yml/badge.svg)](https://github.com/kz6fittycent/TunerStudio-snap/actions/workflows/test-snap-can-build.yml)[![📣 Call for Testing](https://github.com/kz6fittycent/TunerStudio-snap/actions/workflows/call-for-testing.yml/badge.svg)](https://github.com/kz6fittycent/TunerStudio-snap/actions/workflows/call-for-testing.yml)


# TunerStudio-snap

A snap for TunerStudio

## About
  TunerStudio MS, the most most advanced and refined MegaSquirt Tuning software available.
  The registered and Lite! editions are the same installer.

  After installing, run the following commands:
  
  `sudo snap connect tunerstudio:raw-usb`
  
  `sudo snap connect tunerstudio:removable-media`
  
  `sudo snap connect tunerstudio:bluez`
  
  `sudo snap connect tunerstudio:bluetooth-control`
  
  
  This is NOT an officially supported snap from TunerStudio. It is basically an automated
  installer for the software on 64-bit Linux systems running snapd. 
  
### Install

`sudo snap install tunerstudio`

### Running the snap

Click on the `tunerstudio` icon in your app menu or from your terminal, type: `tunerstudio`

### Release process

New TunerStudio releases are picked up automatically. Once a day, the
[📣 Call for Testing](.github/workflows/call-for-testing.yml) workflow checks
the EFI Analytics download page. When there's a newer stable release than the
one in `latest/candidate`, or the packaging on `main` changes, it builds the
snap, uploads it to `latest/candidate` and opens a **Call for testing** issue
with screenshots from a clean VM.

To try a candidate build:

`sudo snap refresh tunerstudio --channel latest/candidate`

Maintainers release a tested revision to stable by commenting
`/promote <revision> stable done` on its issue
([🚀 Promote to Stable](.github/workflows/promote-to-stable.yml)).
