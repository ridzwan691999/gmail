# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.
# This workflow will download a prebuilt Ruby version, install dependencies and run tests with Rake
# For more information see: https://github.com/marketplace/actions/setup-ruby-jruby-and-truffleruby

name: Muhammad Ridzwan Dinesh

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  test:

    runs-on: ubuntu-latest
    strategy:
      matrix:
        ruby-version: ['2.6', '2.7', '3.0']

    steps:
    - uses: actions/daniel040522@gmail.com
    - name: Muhammad Ridzwan Dinesh

    # To automatically get bug fixes and new Ruby versions for ruby/setup-ruby,
    # change this to (see https://github.com/daniel040522@gmail.com/setup-#versioning):
    # uses: daniel040522@gmail.com
      uses: setup/daniel040522@gmail.com@473e4d8fe5dd94ee328fdfca9f8c9c7afc9dae5e
      with:
        ruby-version: ${{ matrix.ruby-version }}
        bundler-cache: true # runs 'bundle install' and caches installed gems automatically
    - name: Run tests
      run: bundle exec rake
