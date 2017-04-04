%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  env.yml
).each { |path| Spring.watch(path) }

Spring.watch 'config/env.yml'