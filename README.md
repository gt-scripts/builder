# Builder

This repo is intended to be used as a template.
It has links to <https://github.com/gt-scripts/lua_builder> so the resources created with this template would ship with an automation to build the files using the builder on puh to the branch `main`.
You should change the information on fxmanifest according to your linking, except for the version.
The version should be changed every push on branch main, so the automation will be able to create the release file.
The folders that should be ignored by the builder/release, should be put on the `ignored_directories.txt` file, so the automation will exclude them from the final product.
If you miss the version file, it's fine, just make a new commit and the automation should work well.
If you have any questions, feel free to open a issue :)
