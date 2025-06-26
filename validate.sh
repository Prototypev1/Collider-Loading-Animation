#!/bin/bash
set -e # exit on first error

###############################################################################
# VERIFICATION FUNCTION FOR FLUTTER APP/PACKAGES
###############################################################################
verifyFlutter () {
  cd $1
  echo "Checking `pwd`"

  flutter --version
  flutter clean
  flutter pub get
  flutter packages pub run build_runner build --delete-conflicting-outputs
  dart format --set-exit-if-changed .
  flutter pub run dart_code_metrics:metrics analyze . --fatal-style --fatal-performance --fatal-warnings
  flutter pub run dart_code_metrics:metrics check-unused-files . --fatal-unused --exclude="{/**.g.dart,/**.template.dart,.dart_tool/**}"
  flutter pub run dart_code_metrics:metrics check-unused-l10n . --fatal-unused
  flutter pub run dart_code_metrics:metrics check-unused-code . --fatal-unused
  flutter analyze --no-pub .

  ###############################################################################
  # CODE COVERAGE
  ###############################################################################
  dart pub global activate very_good_cli
  very_good test --no-optimization --coverage --test-randomize-ordering-seed random

#   lcov --remove coverage/lcov.info 'lib/*/*.g.dart' 'lib/*/job_page_inner_demo_ui.dart' -o coverage/lcov.info
#   genhtml -o coverage coverage/lcov.info

  cd -
}

###############################################################################
# INVOKE VERIFICATION FUNCTIONS
###############################################################################
verifyFlutter "."