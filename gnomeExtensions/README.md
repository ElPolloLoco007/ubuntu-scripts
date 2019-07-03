# Install GNOME Shell Extensions Script

A simple shell script that can automagically download, install, and enable all the [GNOME Shell Extensions](https://extensions.gnome.org/) on-the-fly!

### Why?

The [GNOME Shell Extensions website](https://extensions.gnome.org/) is a massive catalog of extensions for the GNOME desktop.

Installing multiple extensions manually by-hand from the site can quickly get tiresome, this script automates the process.

This script can be used for, say, automatically installing a bunch of extensions on a few computers (or on a new install).

# Usage

## Step 1: Check dependencies

This script needs `curl, wget, jq, unzip, gnome-shell-extension-tool` (for API requests, JSON processing, downloading, installing, and enabling/disabling extensions).

You probably already have them installed, if not, do:

For Ubuntu: `$ sudo apt install -y curl wget jq unzip`

For Fedora: `$ sudo dnf install -y curl wget jq unzip`

## Step 2: Download script

You can always get the latest version of this script using a single-command:


`rm -f ./install-gnome-extensions.sh; wget -N -q "https://raw.githubusercontent.com/cyfrost/install-gnome-extensions/master/install-gnome-extensions.sh" -O ./install-gnome-extensions.sh && chmod +x install-gnome-extensions.sh && ./install-gnome-extensions.sh`

## Step 3: Choose the extensions you want to install

For all the extensions you want to install, just simply copy all their website links into a text file and save it.

Now, simply run the script like this:

`$ ./install-gnome-extensions.sh --enable --file <filename>`

### Here's an example:

Open a text editor and copy paste the below links:

```
https://extensions.gnome.org/extension/6/applications-menu/
https://extensions.gnome.org/extension/307/dash-to-dock/
https://extensions.gnome.org/extension/8/places-status-indicator/
```
save it as "links.txt" and close the editor.

Now, simply run the script like this:

`$ ./install-gnome-extensions.sh --enable --file links.txt`

All the extensions (URLs) specified in the links.txt will now be appropriately installed and enabled.

#### (Alternative Method using Extension IDs)

Each extension found on the site (https://extensions.gnome.org/) has a unique number called its Extension ID and is visible in its URL.

This script works using those IDs to download and install them.

For example, the popular [User Themes](https://extensions.gnome.org/extension/19/user-themes/) extension has the ID 19 as visible in its URL: https://extensions.gnome.org/extension/19/user-themes/.

Similarly, you can find and write down all the IDs of the extensions you want to install. This has to happen only once and those IDs can be reused anytime (in a script for example).

Now, run the following command to download and install them:

`$ ./install-gnome-extensions.sh <extension_id1> <extension_id2> .....`

For Example:

`$ ./install-gnome-extensions.sh --enable 8 750 1156` 

This example will install extensions with IDs [8](https://extensions.gnome.org/extension/8/places-status-indicator/), [750](https://extensions.gnome.org/extension/750/openweather/), [1156](https://extensions.gnome.org/extension/1156/gsnow/) and enable them.

For help and options, run:

`$ ./install-gnome-extensions.sh --help`

## Manually enabling/disabling extensions using GNOME Tweak Tool

By default, the script only downloads and installs extensions but does not enable them unless you've specified the `--enable` flag (Recommended) before running the script.

For viewing, enabling, and disabling installed extensions, use the GNOME Tweak Tool app.

For Ubuntu: `$ sudo apt install -y gnome-tweak-tool && gnome-tweaks`

For Fedora: `$ sudo dnf install -y gnome-tweak-tool && gnome-tweaks`

Find and enable extensions from GNOME Tweak Tool app > "Extensions" page.


## Notes

1. As long as you have a GNOME desktop installed on the machine, you can use this script anytime and anywhere, even from KDE, XFCE etc (no graphical front-end required at all). The only hard requirements this script has is, a terminal environment and GNOME desktop installed.

2. No session reload necessary: This script internally makes use of the well-made `gnome-shell-extension-tool` binary to enable/disable extensions on-the-fly.

### TODO

1. Maybe add flags to remove/delete extensions on user's choice.
2. Maybe consult the distro's package manager (APT, DNF) if an extension the user is trying to install is already provided/available in the repos.
3. Provide a script function to check if an extension is correctly installed and enabled (this can help in deciding what extensions to update/overwrite/ignore).
5. Add cli options to list info (name, id, url etc) of installed extensions (partially added with [51e3e9d](https://github.com/cyfrost/install-gnome-extensions/commit/51e3e9da4b9a208a01fd4f95440a0577290e3fbe)).
6. Add support to install extensions system-wide. currently extensions can only be installed for user specific.
7. Add support to update all installed extensions to latest available versions (tricky: system-wide? user-specific? from repos?)

## Contributing

Please [Create an Issue](https://github.com/cyfrost/install-gnome-extensions/issues) for any suggestions, bug report you may have with this script. Or, better yet, [Send a Pull Request](https://github.com/cyfrost/install-gnome-extensions/pulls) if you have the fixes ready.

## License

[MIT](https://github.com/cyfrost/install-gnome-extensions/blob/master/LICENSE)
