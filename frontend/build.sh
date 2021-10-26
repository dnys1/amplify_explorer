#!/bin/sh

cd /app
dart pub global activate webdev
export PATH="$PATH":"$HOME/.pub-cache/bin"
dart pub get
webdev build