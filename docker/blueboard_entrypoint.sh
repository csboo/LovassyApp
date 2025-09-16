#!/bin/sh

set -e

help() {
    cat <<EOF
This script is a control utility for the dockerized build of Blueboard

Usage: $(basename "$0") [OPTIONS] [COMMAND]

Commands:
  migrate  run database migrations [aliases: m]
  seed     seed the provided table in the database [aliases: s]
  build    build Blueboard [aliases: b]
  publish  publish Blueboard [aliases: p]
  clean    Clean build outputs of Blueboard [aliases: c]
  run      run Blueboard [aliases: r]

Options:
  -h, --help  Show this help message and exit
EOF
}

migrate() {
  echo "Running 'dotnet tool restore'"
  dotnet tool restore
  echo "Running migrations against '${ConnectionStrings__DefaultConnection}' in '${ASPNETCORE_ENVIRONMENT}' mode"
  dotnet ef database update
}

seed() {
  case "$1" in
    users | u)
      dotnet run -- seed:users
      ;;
    *)
      echo "please provide seed type ('users', 'grades', ...)"
      exit 1
      ;;
  esac
}

run() {
  case "$1" in
    release | r)
      dotnet run -c Release
      ;;
    debug | d)
      dotnet run -c Debug
      ;;
    *)
      echo "please provide the configuration to run for('debug' or 'release')"
      exit 1
      ;;
  esac
}

build() {
  case "$1" in
    release | r)
      dotnet build -c Release
      echo "Release build complete"
      ;;
    debug | d)
      dotnet build -c Debug
      echo "Debug build complete"
      ;;
    *)
      echo "please provide the configuration to run for('debug' or 'release')"
      exit 1
      ;;
  esac
}

clean() {
  case "$1" in
    all | a)
      dotnet clean -c Debug
      dotnet clean -c Release
      echo "cleaning debug and release complete"
      ;;
    release | r)
      dotnet clean -c Release
      echo "cleaning release complete"
      ;;
    debug | d)
      dotnet clean -c Debug
      echo "cleaning debug complete"
      ;;
    *)
      echo "please provide the configuration to clean ('debug', 'release' or 'all')"
      exit 1
      ;;
  esac
}

# HELP MESSAGE
case "$*" in
  *--help* | *-h*)
    help
    exit 0
    ;;
esac

if [ -z "$1" ]; then
  if [ -f "/app/publish/Blueboard.dll" ]; then
    exec dotnet /app/publish/Blueboard.dll
  else
    dotnet publish -c Release -o /app/publish
    exec "$0"
  fi
fi

case "$1" in
  migrate | m)
    migrate
    ;;
  seed | s)
    shift
    seed "$@"
    ;;
  build | b)
    shift
    build "$@"
    ;;
  publish | p)
    dotnet publish -o /app/publish
    ;;
  run | r)
    shift
    run "$@"
    ;;
  clean | c)
    shift
    clean "$@"
    ;;
  *)
    echo "unknown command: '$1'"
    echo
    help
    exit 1
    ;;
esac
