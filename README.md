# Billet Assets

The part of the billet project to generate assets based on webpack and independent from ruby on rails.


## How to run

To add assets to your rails project, run:

```
bin/rails app:template LOCATION=https://raw.githubusercontent.com/cimon-io/billet-isolated-assets/master/.billet.rb
```

## How to integrate with existing project.

Separate command `bin/assets` or run it from the subfolder `assets` via command `yarn watch`. To build for production run `bin/assets compile` or `cd assets && yarn build`.
