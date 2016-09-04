## 1.0.5/01-09-2016

* implement devise_security_extension (block multiple logins)
* change quiz questions to answer constants to 10, 15, 25
* add a custom sender prefix to mailer
* remove center text align in mail templates
* make tables responsive with basictable JS
* change reset password instructions translation
* fix image interchange for medium screens, remove unneeded scss
* implement data-interchange to load images for large and small screens
* add a link to Facebook page
* optimize robots.txt for SEO

## 1.0.4/14-08-2016

 * override Devise mailer templates to have Umed HTML title and fonts
 * load plans only for home#index page
 * add `About` page
 * add `Credits` page
 * update Rails to the latest `4.2.7` version
 * eager load quiz belongs_to associations in index action
 * expand button on small and hide for big screens
 * remove CustomDeviseMailer and set up devise mailer via `devise.rb` settings
 * modify and apply mailer template CSS class
 * fix canvas hide/show effects on large screens
 * change reset password instructions translation
 * add `radius` css class to buttons
 * add a new home page image adapted for large screens
 * modify cleanup_quizzes task (extract to a separate method, remove and keep 25 last only)
 * implement SEO features (modify robots.txt, add meta tags, key words)

## 1.0.3/30-07-2016

### CSSfy user mailer HTML templates

 * add roadie-rails gem
 * include roadie-rails module into user_mailer
 * create mailer layout
 * create user_mailer.scss
 * add user_mailer.scss to precompile in assets.rb initializer
 * extract layout common HTML from email templates
 * modify email translations

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
* add canvas feature to the navbar:
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
