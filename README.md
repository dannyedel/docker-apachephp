# Simple Apache/PHP container

run with

```
docker run -it --rm -p 80:80 -v $(pwd):/var/www/html:ro dannyedel/apachephp
```

serves your current working directory until CTRL-C'd.
