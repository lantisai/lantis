#!/usr/bin/env sh

export $(cat .env | xargs)
dart tool/env.dart
