[![Deploy Status](https://api.netlify.com/api/v1/badges/00e3aae8-6038-4963-a3da-7a50b5702617/deploy-status)](https://app.netlify.com/sites/strappazzon/deploys)

## Developing

1. Install [node.js](https://nodejs.org)
    - With [NVM](https://github.com/nvm-sh/nvm): `nvm install node`
    - Manually
2. Install [Ruby](https://www.ruby-lang.org)
    - With [rbenv](https://github.com/rbenv/rbenv): `rbenv install`
    - With [RVM](https://rvm.io): `rvm install "ruby-$(cat .ruby-version)"`
    - Manually
3. Install [Bundler](https://bundler.io)
    - `gem install bundler`
4. Install the required dependencies
    - `bundle install`
5. Install [netlify-cli](https://cli.netlify.com)
    - `npm install netlify-cli -g`
6. Serve the website locally
    - `netlify dev` (**recommended**)
    - `bundle exec jekyll serve --force_polling --livereload`

## Credits

### Fonts

- [Acens](https://www.dafont.com/acens.font)
- [DejaVu Sans Mono](https://www.fontsquirrel.com/fonts/dejavu-sans-mono)
- [Magda Clean Mono](https://www.myfonts.com/fonts/fontfont/ff-magda-clean-mono)
- [Ubuntu Monospace](https://design.ubuntu.com/font/)

### Part of this website uses code and assets from

- [Bootstrap](https://github.com/twbs/bootstrap)
- [Person of Interest Web UI](https://github.com/Phreshhh/poi-web-ui)
