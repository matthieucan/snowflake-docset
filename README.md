# Snowflake docset

This repository contains a script to build a docset for
[Snowflake](https://www.snowflake.com). The docset can be added to
[Zeal](https://zealdocs.org/) and [Dash](https://kapeli.com/dash).

## License

Code in this repository is licensed under the [WTFPL](./LICENSE).

The Snowflake documentation in the docset is copyrighted by
[Snowflake](https://www.snowflake.com/), All Rights Reserved.

## Installation

### Feed URL

The easiest way to install this docset is by adding a Feed URL. In Zeal,
navigate to Tools > Docsets > Add feed, and paste the following URL:

```shell
https://github.com/matthieucan/snowflake-docset/releases/latest/download/Snowflake.xml
```

### Download docset

Retrieve the latest version of the docset:

```shell
https://github.com/matthieucan/snowflake-docset/releases/latest/download/Snowflake.docset.tgz
```

Uncompress it, and copy it to the right location, which depends on your
Zeal/Dash installation. For example if you have installed Zeal from the
Debian/Ubuntu archive:

```shell
~/.local/share/Zeal/Zeal/docsets
```

### Manual build

You can also build a docset manually. Clone this repository, and run

```shell
./build-docset.sh
```

This will create `Snowflake.docset.tgz`, which you can install following the
instructions in the previous section.

## Repository maintenance

Every 1st day of the month, a Github workflow will push a new commit and a new
git tag. Then, another workflow will build a release out of this tag.

This allows minimum maintenance of the repository, while still benefitting from
up-to-date documentation.

To manually trigger a release, simply push a new tag:

```shell
./push-tag.sh
```
