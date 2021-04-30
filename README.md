# Sencha cmd image

This is a tool image for the Sencha cmd, based on official openjdk:8-jre image. `compass` is also included as part of sencha build process.

See https://www.sencha.com/products/sencha-cmd/

# Docker hub

See https://hub.docker.com/r/miketallroth/senchacmd/

# Usage

one time framework download / setup
```
docker run -v ${PWD}:/code --workdir /code miketallroth/senchacmd:ext7.3 generate app -ext Framework ./framework
```

generate app - one time per app
```
docker run -v ${PWD}:/code --workdir /code miketallroth/senchacmd:ext7.3 -sdk /code/framework/ext generate app MyApp ./myapp
```

bypass problem with discontinued phantomjs
```
cd myapp
vi local.properties
    skip.slice=true
```

app build - from app directory
```
docker run -v ${PWD}:/code --workdir /code miketallroth/senchacmd:ext7.3 app build
```

app watch - from app directory
```
docker run -p 1841:1841 -v ${PWD}:/code --workdir /code miketallroth/senchacmd:ext7.3 app watch
```
