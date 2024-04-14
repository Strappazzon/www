# Contribution Guidelines

By participating, you agree to abide by the [Code of Conduct](https://github.com/Strappazzon/.github/blob/-/CODE_OF_CONDUCT.md).  
When submitting changes to this repository, you agree that the content you contribute may be provided under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## I Have a Question

Before you ask a question, search for existing [Discussions](https://github.com/Strappazzon/www/discussions/categories/questions) that might help you.  
In case you have found a suitable discussion and still need clarification, you can write your question in that discussion. It is also advisable to search the internet for answers first.

If you then still need to ask a question and need clarification you can [create a discussion](https://github.com/Strappazzon/www/discussions/new?category=questions).

## Issue Reporting and Feature Requests

> [!IMPORTANT]
> If you found a security issue, **DO NOT** report it in the issue tracker or elsewhere in public.  
> See: [Security Policy](https://github.com/Strappazzon/.github/blob/-/SECURITY.md).

- Take a look at the [issues](https://github.com/Strappazzon/www/issues) first to make sure your issue/feature hasn't been reported/requested before.  
  If so, engage in the already existing discussion.
- Check whether your issue/feature is already fixed/implemented.
- Issues in languages other than English will be closed and ignored.
- If you are familiar with the languages used in this repo, you are always welcome to fix/implement an issue/feature yourself.
- Add one issue at a time. Do not put multiple issues into one thread.
- When reporting a bug please describe the steps which reproduce the problem.
- All issues must be properly formatted with Markdown.  
  If you don't know what that is, read [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) before submitting an issue.

### DO NOT post "+1" comments

If you don't have any additional info/context to add but would like to indicate that you're affected by the issue, upvote the original issue.  
See: [Add Reactions](https://github.blog/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/)

## Getting Started

Before you can start contributing, you'll need to set up your environment first.

### Dependencies

This website is built with [Jekyll](https://jekyllrb.com/) so you will need [Ruby](https://www.ruby-lang.org) installed.  
I recommend you install it using [rbenv](https://github.com/rbenv/rbenv), [asdf](https://github.com/asdf-vm/asdf), [frum](https://github.com/TaKO8Ki/frum) or other packaging system, before attempting to install the dependencies.

[Node](https://nodejs.org/en) is also required to run [Stylelint](https://stylelint.io/).  
I recommend you install it using [nvm](https://github.com/nvm-sh/nvm) or [asdf](https://github.com/asdf-vm/asdf).

Clone the repo and run `bin/bootstrap` to install the required dependencies.

```sh
git clone https://github.com/Strappazzon/www.git
cd www/
bin/bootstrap
```

### Local Previews

To view your changes locally use the following command:

```sh
bundle exec jekyll serve --force_polling --livereload
```

Then navigate to <http://localhost:4000> in your web browser.

Press <kbd>CTRL</kbd>+<kbd>C</kbd> to stop the web server.

## Code style and Conventions

### Liquid

Website components and some pages are written in the Jekyll [Liquid](https://shopify.github.io/liquid/basics/variations/#jekyll) templating language.

#### Syntax

- Indent using tabs, except when aligning parameters inside tags (see [Tags](#tags)).
- Use "double quotation marks" except when a filter or expression is inside an HTML attribute.

<!-- markdownlint-disable MD010 -->

```liquid
{% comment %} bad {% endcomment %}
<head>
	<meta property="og:url" content='{{ site.url }}{{ page.url | replace: "index.html",""}}'>
</head>

{% comment %} good {% endcomment %}
<head>
	<meta property="og:url" content="{{ site.url }}{{ page.url | replace: 'index.html',''}}">
</head>
```

<!-- markdownlint-enable MD010 -->

#### Comments

Indent multiline comments.

<!-- markdownlint-disable MD010 -->

```liquid
{% comment %}
bad
  this comment block is not indented correctly.
{% endcomment %}

{% comment %}
	good
	this comment block is indented correctly.
{% endcomment %}

{% comment %} No need to indent brief comments. {% endcomment %}
```

<!-- markdownlint-enable MD010 -->

#### Filters

- Do not wrap filters.
- Put a space before the filter value.

<!-- markdownlint-disable MD010 -->

```liquid
{% comment %} Bad {% endcomment %}
{{ object.prop
  | downcase
  | prepend:"value"
}}

{% comment %} Good {% endcomment %}
{{ object.prop | downcase | prepend: "value" }}
```

<!-- markdownlint-enable MD010 -->

#### Tags

- Indent `{% include %}` tag parameters.
- Align equal signs using spaces and put a space before the parameter value.
- Don't separate parameters with commas.
- Put the last delimiter on a new line.

<!-- markdownlint-disable MD010 -->

```liquid
{% comment %} bad {% endcomment %}
{% include component.html
  title = 'Example',
  description = 'This is an example.',
  value = 513 %}

{% comment %} good {% endcomment %}
{% include component.html
	title       = "Example"
	description = "This is an example."
	value       = 513
%}
```

<!-- markdownlint-enable MD010 -->

- When an `{% include %}` tag has only one parameter:
  - write it in one line.
  - don't put a space between the equal sign.

<!-- markdownlint-disable MD010 -->

```liquid
{% comment %} bad {% endcomment %}
{% include component.html
	param = "example"
%}

{% comment %} good {% endcomment %}
{% include component.html param="example" %}
```

<!-- markdownlint-enable MD010 -->

- Indent tokens inside `{% case %}` tags.

<!-- markdownlint-disable MD010 -->

```liquid
{% comment %} bad {% endcomment %}
{% case object.prop %}
{% when "2J7202" %}
	<span>Bad Code.</span>
{% else %}
	<span>...</span>
{% endcase %}

{% comment %} good {% endcomment %}
{% case object.prop %}
	{% when "2J6211" %}
		<span>Super.</span>
	{% else %}
		<span>...</span>
{% endcase %}
```

<!-- markdownlint-enable MD010 -->

### Markdown

Documentation is written in [GitHub Flavored Markdown](https://docs.github.com/en/get-started/writing-on-github).  
Some website pages are written in [GitHub Flavored Markdown](https://docs.github.com/en/get-started/writing-on-github) and rendered by [kramdown](https://kramdown.gettalong.org/).

In both cases, [markdownlint](https://github.com/DavidAnson/markdownlint) is used to enforce style rules for Markdown files.

### Ruby

Website plugins are written in Ruby. [Rubocop](https://docs.rubocop.org/) is used to enforce code style rules for Ruby files.  
To fix any problems that can be fixed automatically, you can use a Rubocop plugin for your IDE or run `bin/ruby_fmt` from a terminal.

#### Methods

- Don't use `p` or `puts` to print things. Use `Jekyll.logger` instead.

```rb
# bad
p 'Example.'

# good
Jekyll.logger.info 'Example.'
```

#### Modules

- Define a plugin inside a `Jekyll` module.

```rb
module Jekyll
  class CustomPlugin
    # ...
  end
end
```

### SCSS

[Stylelint](https://stylelint.io/) is used to enforce code style rules for SCSS files.  
To fix any problems that can be fixed automatically, you can use a Stylelint plugin for your IDE or run `bin/scss_fmt` from a terminal.

#### Format

Rules that are not covered by Stylelint.

- Put a leading zero for fractional numbers less than 1.
- Limit the length of a line to 160 characters.
  - Except dollar variables (*e.g.* list of font families).
  - Except unicode range in `@font-face` at-rules.
- Don't use trailing zeroes in numbers.
- Use single quotes.
- Use one selector per line in multi-selector rulesets.
- Include a single space before the opening brace of a ruleset.
- Use one level of indentation for each declaration.
- Include a single space after the colon of a declaration.
- Include a semi-colon at the end of the last declaration in a declaration block.
- Include a space after each comma in comma-separated property or function values.
- Place `@extend` statements on the first line of a declaration block.
- Place `@include` statements after any `@extend` statements.
- Place the closing brace of a ruleset in the same column as the first character of the ruleset.

#### Imports

- Don't include the file extension when importing stylesheets.

## Submitting Changes

- Make changes on a separate branch, not on the master branch, then send your changes as a [Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).
- When submitting changes, you confirm that your code is licensed under the terms of the [MIT License](https://opensource.org/licenses/MIT).
- Please test your code before you submit changes. Untested code will **not** be merged!
- Make sure your Pull Request is up-to-date with the rest of the codebase.

## Git Commit Messages

- Use the present tense ("Add feature" not "Added feature").
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...").
- Wrap all lines at 70 columns (except for long URLs).
- Writing a detailed description is not mandatory.
- Reference issues and Pull Requests after the description, if any.  
  Use `Closes:` or `Fixes:`.

### Sample Complete Commit Message

```plaintext
explain the commit in one line

The body of the commit message should explain things in more detail.
Please word-wrap to keep columns to 70 characters or less.

Fixes: https://github.com/Strappazzon/www/issues/513
```

## Branching

`dev` and `test` is where all changes that are not ready for production yet go.

From dev and test, there are multiple branches related to what is being developed inside each branch.

A branch name must be short and descriptive, all lowercase. For branches with multiple words use hyphens.

## Repository Structure

This is a brief description on how the repository files and folders are structured and what each one contains.  
It only contains the most relevant files and folders as some of them are self-explanatory.

For more information on the SCSS file structure, see [The 7-1 Pattern](https://sass-guidelin.es/#the-7-1-pattern).

```sh
.
├── _components            # Website components such like header or cards
├── _data                  # Website data in YAML format
├── _plugins               # Jekyll plugins written in Ruby
├── _sass                  # SCSS Stylesheets ...
│   ├── abstracts          # ... with functions, mixins, variables and so on
│   ├── base               # ... with global styles
│   ├── components         # ... for website components
│   ├── layout             # ... for layout elements (buttons, header, ...)
│   ├── pages              # ... for Jekyll templates
│   └── themes
│       ├── _syntax.scss   # ... for Rouge syntax highlighter
│       └── _terminal.scss # ... for Terminal component themes
├── _templates             # Jekyll templates for web pages like homepage or blog posts
├── .cloudflare            # Cloudflare configuration files
├── .github
│   └── labeler.yml        # "actions/labeler" configuration
├── .well-known            # RFC 8615 URIs
├── bin                    # Scripts
├── static                 # Website static files
│   └── psd                # PSD files of images, these are not published
├── _config.yml            # Jekyll configuration
├── .nvmrc                 # Version of Node.js Node Version Manager should use
├── feed.xml               # Atom feed
├── frontmatter.json       # VS Code eliostruyf.vscode-front-matter configiguration
└── SUPPORT.md             # Support resources
```
