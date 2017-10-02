# distantreading

[![Build Status](https://travis-ci.org/kellyi/distantreading.svg?branch=master)](https://travis-ci.org/kellyi/distantreading)

Trying out Haskell by writing some [digital humanities text analysis tools](http://dh101.humanities.ucla.edu/?page_id=48).

## Requirements

- [Haskell Stack](https://docs.haskellstack.org/en/stable/README/)

## Setup

Clone the repo, then run:

```bash
stack build
stack install
```

This will create `distantreading` and `distantreading-server` executables.

## Usage

### Command line tool

```bash
Usage: distantreading --target TARGET [-s|--sentence]
  Generate statistics about a text file

Available options:
  --target TARGET          Target file
  -s,--sentence            Get sentence stats instead of word stats
  -h,--help                Show this help text
```

### Server

To start the app as a REST service, run:

```bash
distantreading-server
```

This will start the service on port 4444.
