# cross-tools

LoongArch64 cross-compile toolchain, supports both x86_64(amd64) and aarch64(arm64) architectures.

## Supported targets

| Version      | Target                             | Kernel      | Binutils   | GCC        | Libc(glibc) | Libc(musl) |
|--------------|------------------------------------|-------------|------------|------------|-------------|------------|
| baseline     | loongarch64-unknown-linux-gnu      | 6.6.101     | 2.41       | 12.3.0     | 2.38        |            |
| stable       | loongarch64-unknown-linux-gnu      | 6.6.101     | 2.41       | 14.3.0     | 2.38        |            |
| stable       | loongarch64-unknown-linux-musl     | 6.6.101     | 2.41       | 14.3.0     |             | 1.2.5      |
| mainline     | loongarch64-unknown-linux-gnu      | 6.12.41     | 2.41       | 14.3.0     | 2.41        |            |
| mainline     | loongarch64-unknown-linux-musl     | 6.12.41     | 2.41       | 14.3.0     |             | 1.2.5      |
| latest       | loongarch64-unknown-linux-gnu      | 6.16        | 2.46       | 16.1.0     | 2.43        |            |
| latest       | loongarch64-unknown-linux-musl     | 6.16        | 2.46       | 16.1.0     |             | 1.2.6      |

### Note

1. `baseline` is based on the version specified in GB/T 25656.

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
