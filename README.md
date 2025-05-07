# cross-tools

LoongArch64 cross-compile toolchain, supports both x86_64(amd64) and aarch64(arm64) architectures.

## Supported targets

| Version      | Target                             | Kernel      | Binutils   | GCC        | Libc(glibc) | Libc(musl) |
|--------------|------------------------------------|-------------|------------|------------|-------------|------------|
| legacy       | loongarch64-unknown-linux-gnu      | 6.6.74      | 2.41       | 12.4.0     | 2.36        |            |
| legacy       | loongarch64-unknown-linux-musl     | 6.6.74      | 2.41       | 13.3.0     |             | 1.2.5      |
| stable       | loongarch64-unknown-linux-gnu      | 6.10.14     | 2.43.1     | 14.2.0     | 2.38        |            |
| stable       | loongarch64-unknown-linux-musl     | 6.10.14     | 2.43.1     | 14.2.0     |             | 1.2.5      |
| mainline     | loongarch64-unknown-linux-gnu      | 6.12.11     | 2.43.1     | 14.2.0     | 2.38        |            |
| mainline     | loongarch64-unknown-linux-musl     | 6.12.11     | 2.43.1     | 14.2.0     |             | 1.2.5      |
| latest       | loongarch64-unknown-linux-gnu      | 6.13        | 2.43.1     | 14.2.0     | 2.41        |            |
| latest       | loongarch64-unknown-linux-musl     | 6.13        | 2.43.1     | 14.2.0     |             | 1.2.5      |


## How to use

Download the tarball from the [release page](https://github.com/loong64/cross-tools/releases) and extract it to `/opt/x-tools`:

```sh
sudo mkdir -p /opt/x-tools
sudo tar -xf ${Target}.tar.xz -C /opt/x-tools
```

## How to build

Fork this project and create a new release, or build manually:

```sh
./scripts/make ${Target}
```

## License

MIT

## Acknowledgements

We would like to express our gratitude to the following individuals and projects:

- [crosstool-ng](https://github.com/crosstool-ng/crosstool-ng)
- [musl-cross](https://github.com/musl-cross/musl-cross)