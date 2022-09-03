name: update-flake-lock

  # Controls when the workflow will run
  on:
  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

  jobs:
  lockfile:
  runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

- name: Install Nix
uses: cachix/install-nix-action@v17

- name: Update flake.lock
uses: DeterminateSystems/update-flake-lock@vX
