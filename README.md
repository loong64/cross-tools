# cross-tools

Windows-oriented Canadian-cross toolchain release branch.

## Supported targets

| Version      | Host (Canadian)         | Target             | Kernel  | Toolchain source |
|--------------|-------------------------|--------------------|---------|------------------|
| stable       | x86_64-w64-mingw32      | x86_64-w64-mingw32 | windows | crosstool-ng 1.29.0 |

### Note

1. This branch only keeps the MinGW-w64 based Windows Canadian-cross flow.

## How to use

Download the tarball from the [release page](https://github.com/loong64/cross-tools/releases) and extract it to `/opt/x-tools`:

```sh
sudo mkdir -p /opt/x-tools
sudo tar -xf ${Target}.tar.xz -C /opt/x-tools
```

## How to build

Fork this project and create a new release, or build manually:

```sh
./scripts/make ${Target} stable mingw-w64
```

## License

MIT

## Acknowledgements

We would like to express our gratitude to the following individuals and projects:

- [crosstool-ng](https://github.com/crosstool-ng/crosstool-ng)
