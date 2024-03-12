#!/bin/bash

cd ../
bundle exec jekyll build
rsync -avz ./_site/ w3:www-root