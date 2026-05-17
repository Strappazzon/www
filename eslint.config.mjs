import { defineConfig, globalIgnores } from 'eslint/config';

import js from '@eslint/js';
import globals from 'globals';
import stylistic from '@stylistic/eslint-plugin';

export default defineConfig([
  {
    files: [
      'static/js/**/*.js'
    ],
    ignores: [
      '**/vendor?(s)/**'
    ],
    plugins: {
      '@stylistic': stylistic,
      js
    },
    extends: [
      'js/recommended',
      '@stylistic/recommended'
    ],
    rules: {
      // See: https://eslint.org/docs/v10.x/rules
      'array-callback-return': [
        'error'
      ],
      'default-case-last': [
        'error'
      ],
      'eqeqeq': [
        'error',
        'smart'
      ],
      'no-alert': [
        'error'
      ],
      'no-await-in-loop': [
        'warn'
      ],
      'no-constructor-return': [
        'warn'
      ],
      'no-duplicate-imports': [
        'error'
      ],
      'no-eq-null': [
        'error'
      ],
      'no-inline-comments': [
        'error'
      ],
      'no-inner-declarations': [
        'warn'
      ],
      'no-multi-assign': [
        'error'
      ],
      'no-multi-str': [
        'error'
      ],
      'no-nested-ternary': [
        'error'
      ],
      'no-template-curly-in-string': [
        'error'
      ],
      'no-unmodified-loop-condition': [
        'warn'
      ],
      'no-var': [
        'error'
      ],
      'unicode-bom': [
        'error',
        'never'
      ],

      // See: https://eslint.style/rules
      '@stylistic/array-bracket-newline': [
        'error',
        'consistent'
      ],
      '@stylistic/array-bracket-spacing': [
        'error',
        'always', {
          'singleValue': false
        }
      ],
      '@stylistic/array-element-newline': [
        'error',
        'consistent'
      ],
      '@stylistic/arrow-parens': [
        'error',
        'as-needed'
      ],
      '@stylistic/comma-dangle': [
        'error',
        'never'
      ],
      '@stylistic/dot-location': [
        'error',
        'property'
      ],
      '@stylistic/eol-last': [
        'error',
        'always'
      ],
      '@stylistic/function-call-argument-newline': [
        'error',
        'consistent'
      ],
      '@stylistic/function-call-spacing': [
        'error',
        'never'
      ],
      '@stylistic/function-paren-newline': [
        'error',
        'multiline-arguments'
      ],
      '@stylistic/implicit-arrow-linebreak': [
        'error',
        'beside'
      ],
      '@stylistic/key-spacing': [
        'error',
        {
          'singleLine': {
            'beforeColon': false,
            'afterColon': true,
          },
          'multiLine': {
            'beforeColon': true,
            'afterColon': true,
            'align': 'colon'
          }
        }
      ],
      '@stylistic/line-comment-position': [
        'error',
        {
          'position': 'above'
        }
      ],
      '@stylistic/linebreak-style': [
        'error',
        'unix'
      ],
      '@stylistic/lines-around-comment': [
        'error',
        {
          'beforeBlockComment': true,
          'afterBlockComment': false,
          'beforeLineComment': true,
          'afterLineComment': false,
          'allowBlockStart': true
        }
      ],
      '@stylistic/exp-list-style': [
        'error',
        {
          'overrides': {
            '{}': {
              'singleLine': {
                'spacing': 'always'
              }
            }
          }
        }
      ],
      '@stylistic/max-len': [
        'error',
        {
          'code': 160,
          ignoreComments: true,
          ignoreTrailingComments: true,
          ignoreUrls: true
        }
      ],
      '@stylistic/member-delimiter-style': [
        'error',
        {
          'multiline': {
            'delimiter': 'comma',
            'requireLast': false
          },
          'singleline': {
            'delimiter': 'comma',
            'requireLast': false
          },
          'multilineDetection': 'brackets'
        }
      ],
      '@stylistic/multiline-comment-style': [
        'error',
        'separate-lines',
        {
          'checkJSDoc': false
        }
      ],
      '@stylistic/multiline-ternary': [
        'error',
        'always-multiline'
      ],
      '@stylistic/no-confusing-arrow': [
        'error',
        {
          'allowParens': true,
          'onlyOneSimpleParam': false
        }
      ],
      '@stylistic/no-extra-parens': [
        'error',
        'functions'
      ],
      '@stylistic/no-extra-semi': [
        'error'
      ],
      '@stylistic/no-mixed-operators': [
        'error',
        {
          'allowSamePrecedence': false
        }
      ],
      '@stylistic/no-multi-spaces': [
        'error',
        {
          'exceptions': {
            'VariableDeclarator': true
          }
        }
      ],
      '@stylistic/nonblock-statement-body-position': [
        'error',
        'beside'
      ],
      '@stylistic/object-curly-spacing': [
        'error',
        'always',
        {
          'emptyObjects': 'never'
        }
      ],
      '@stylistic/object-property-newline': [
        'error',
        {
          'allowAllPropertiesOnSameLine': false
        }
      ],
      '@stylistic/one-var-declaration-per-line': [
        'error',
        'always'
      ],
      '@stylistic/operator-linebreak': [
        'error',
        'before'
      ],
      '@stylistic/padded-blocks': [
        'error',
        'never'
      ],
      '@stylistic/quote-props': [
        'error',
        'as-needed',
        {
          'keywords': true
        }
      ],
      '@stylistic/quotes': [
        'error',
        'single'
      ],
      '@stylistic/semi': [
        'error',
        'always'
      ],
      '@stylistic/semi-style': [
        'error',
        'last'
      ],
      '@stylistic/space-before-function-paren': [
        'error',
        'never'
      ],
      '@stylistic/space-unary-ops': [
        'error',
        {
          'words': true,
          'nonwords': false
        }
      ],
      '@stylistic/spaced-comment': [
        'error',
        'always'
      ],
      '@stylistic/switch-colon-spacing': [
        'error',
        {
          'before': false,
          'after': true
        }
      ],
      '@stylistic/template-tag-spacing': [
        'error',
        'always'
      ],
      '@stylistic/wrap-regex': [
        'error'
      ],
      '@stylistic/yield-star-spacing': [
        'error',
        'before'
      ]
    },
    languageOptions: {
      sourceType: 'script',
      globals: globals.browser
    }
  }
]);
