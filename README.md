# Apiary Branching

The Apiary service is awesome, but [lacks support for git branches][apiary-branches]. Heres a simple solution for maintaining simultaneous versions of your blueprint.

## Requirements

* [Aglio Blueprint Renderer][aglio]
* [Apiary CLI Client][apiary-client]
* [Snowcrash Blueprint Checker][snowcrash]

## Usage
The included `Makefile` automates common tasks such as:

Render the blueprint and serve locally (go to http://localhost:3000/ in your browser):
```shell
make
```

Run the [Snowcrash][snowcrash] blueprint syntax checker:
```shell
make check
```

Publish the current branch on your development server:
```shell
make deploy
```

Publish your blueprint to Apiary.io:
```shell
make publish
```
Note: You will need to set the `APIARY_API_KEY` environment variable with your Apiary token, which you can obtain [here][apiary-token].

[aglio]: https://github.com/danielgtaylor/aglio
[nodejs]: http://nodejs.org/
[apiary]: http://apiary.io/
[apiary-client]: https://github.com/apiaryio/apiary-client
[snowcrash]: https://github.com/apiaryio/snowcrash
[apiary-branches]: http://support.apiary.io/forums/120125-general/suggestions/2980709-support-versioned-documentation-through-git-branch
[apiary-token]: https://login.apiary.io/tokens
