# Sencha cmd image

This is a tool image for the Sencha cmd, based on official openjdk:8-jre image. `compass` is also included as part of sencha build process.

See https://www.sencha.com/products/sencha-cmd/

# Docker hub

See https://hub.docker.com/r/miketallroth/senchacmd/

# Usage

generate app - one time per app - works as user - adds '?' directory ???
```
docker run --rm -v ${PWD}:/code -u $(id -u ${USER}):$(id -g ${USER}) miketallroth/senchacmd:7.3 -sdk /framework/ext generate app MyApp ./myapp
```

bypass problem with discontinued phantomjs - entrypoint must NOT include -sdk /framework/ext
```
cd myapp
vi local.properties
    skip.slice=true
```

app build - from app directory
```
docker run --rm -v ${PWD}:/code -u $(id -u ${USER}):$(id -g ${USER}) miketallroth/senchacmd:7.3 app build
```

app watch - from app directory - must add port map!
```
docker run --rm -p 1841:1841 -v ${PWD}:/code -u $(id -u ${USER}):$(id -g ${USER}) miketallroth/senchacmd:7.3 app watch
```





