# PHP-Codestyle-Swissknife-Docker

This is a docker image that contains the following tools:
- [PHPStan](https://phpstan.org/)
- [PHP-CS-Fixer](https://cs.symfony.com/) / [EasyCodingStandard](https://github.com/easy-coding-standard/easy-coding-standard)
- [PHP Mess Detector](https://phpmd.org/)
- [Rector](https://getrector.com/)

## Usage

```bash
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) marcusmu/php-codestyle-swissknife-docker:latest php-cs-fixer ...
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) marcusmu/php-codestyle-swissknife-docker:latest ecs ...
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) marcusmu/php-codestyle-swissknife-docker:latest phpstan ...
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) marcusmu/php-codestyle-swissknife-docker:latest phpmd ...
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) marcusmu/php-codestyle-swissknife-docker:latest rector ...
```

## Adapted from
 - https://github.com/aragon999/phpstan-shopware-docker/
 - https://github.com/shyim/php-cs-fixer-docker
