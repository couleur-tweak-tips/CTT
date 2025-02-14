import astro from 'eslint-plugin-astro'
// disables conflicting rules
import prettier from 'eslint-config-prettier'

export default [
  ...astro.configs.recommended,
  prettier,
  {
    files: ['*.astro'],
    languageOptions: {
      parser: 'astro-eslint-parser',
      parserOptions: {
        parser: '@typescript-eslint/parser',
        extraFileExtensions: ['.astro'],
      },
    },
    rules: {},
  },
]
