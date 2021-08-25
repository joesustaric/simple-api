## Simple API
A simple web API built with Ruby 3 and Sinatra Framework.
Running in Heroku.

[![<joesustaric>](https://circleci.com/gh/joesustaric/simple-api.svg?style=svg)](https://app.circleci.com/pipelines/github/yjoesustaric/simple-api?branch=main)

## API

`/`

Returns `Hello World`.

`/healthcheck`

Returns `200` if the API service is healthy.

Example JSON response.
```json
{
    "status": "unhealthy"
}
```

`/metadata`

Returns `200` if the API service is healthy.
Returns `503` if service is unhealthy.

Example JSON response.
```json
{
    "myapplication":[
        {
            "version": "1.3.0",
            "description": "simple api",
            "lastcommitsha": "c4c1f203401d9491e07d6c5ab771e5d0eed6dc36"
        }
    ]
}
```

## Development

This repository has a `.tools-version` file. You can set up [asdf](http://asdf-vm.com/guide/getting-started.html#_1-install-dependencies) to manage the versions of dependencies listed in that file. Currently it is only Ruby 3.0.0. Once you install `asdf` you will need to install the Ruby 3.0.0 version.

If you have your own version manager or ruby 3.0.0 alredy installed then you can skip this step.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To run the tests and the code linter, run:
```
bundle exec rake
```

To run the app locally after all the dependencies are installed the easiest way is by:
```
APP_ENV=development exe/simple-api
```

The default site and port is `http://127.0.0.1:4567` but you can override the port number by specifying a `PORT` eg `PORT=8080 APP_ENV=development exe/simple-api`.

## Deployment
This `simple-api` will be auto deployed to Heroku on every main green build via the CircleCI [test and deploy pipeline](https://circleci.com/gh/joesustaric/simple-api).
You may need to sign into CircleCi with your GitHub account to see the build.

It is packaged up in a Docker container and uses the [Heroku Container Registry](https://devcenter.heroku.com/articles/container-registry-and-runtime) method of deploying.
The production site is `https://joes-simple-api.herokuapp.com/`.

## Monitoring
If you have access to the Heroku Application, you can simply install the Heroku CLI via [this guide](https://devcenter.heroku.com/articles/heroku-cli).

Then to inspect the running application logs run:
```
heroku logs --tail -a joes-simple-api
```

## Extensions
- Add in ["rack/protection"](http://sinatrarb.com/rack-protection/) for protection from typical web attacks.
- Add in [dependabot](https://dependabot.com/) for code vulnrability scanning.
- Container scanning.
- Use a different API key with restricted permissions to deploy to Heroku.
- Adding a job that tests the latest Ruby version compatabiliity.

## Contributing
PR's Welcome.

## License
[MIT](LICENSE)
