#!/bin/bash

## Configure Localization.


# Set system languages (in order - the first will be the default system language)
defaults write NSGlobalDomain AppleLanguages -array "de-DE" "en-US" "pt-BR" "es-ES"

# Set the avialable dictionaries
defaults write NSGlobalDomain NSLinguisticDataAssetsRequested -array en "en_US" "en_GB" "en_DE" de "de_DE" pt "pt_BR" es "es_DE"

# Set locale
defaults write NSGlobalDomain AppleLocale -string "de_DE@currency=EUR"

# Set metric system
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius";
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Berlin" > /dev/null
