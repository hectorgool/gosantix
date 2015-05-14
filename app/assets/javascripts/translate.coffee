
'use strict'


dependencies = [
  'pascalprecht.translate'
]

app = angular.module('translate', dependencies)

app.config ($translateProvider) ->

  $translateProvider.translations 'en',
    TITLE: 'Hello'
    FOO: 'This is a paragraph.'
    BUTTON_LANG_EN: 'english'
    BUTTON_LANG_DE: 'german'
    SIGNUP: 'SignUp'

  $translateProvider.translations 'de',
    TITLE: 'Hallo'
    FOO: 'Dies ist ein Paragraph.'
    BUTTON_LANG_EN: 'englisch'
    BUTTON_LANG_DE: 'deutsch'

  $translateProvider.preferredLanguage 'en'

  return