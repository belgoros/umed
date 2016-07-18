## 1.0.2/18-07-2016

#### Fix navigation links for non-admin users

* Fix navigation_spec examples
* add new examples to test navigation links

## 1.0.1/18-07-2016

#### Fix scroll issues on iOS in Safari and update home page image

* modify CSS
* make registrations page form CSS larger
* change the home page image and CSS

## 1.0.0/16-07-2016

#### Implement canvas and replace Quiz steps drop-down lists with radio buttons

* Replace Quiz steps drop-down lists with radio buttons
  - modify/add CSS classes
  - replace `f.association` with `f.collection_radio_buttons`
  - modify features/subscriptions_spec after replacing drop-downs lists
  - add Quiz module to support/helpers to create a Quiz
* add canvas feauture to the navbar:
  - move messages and yield sections to the navbar partial (needed to make it works)
  - add CSS classes used by canvas feature
* move footer partial to `home#index`
* add new CSS for chart correct and failed answers labels
* modify profile translation
* modify home#index text:
  - add `how-it-works-panel` class
  - add `mons-text` css
  - add new `umed.jpg` image
  - add a link to start a Quiz

Serguei Cambour
