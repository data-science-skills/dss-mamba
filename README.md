# dss-mamba

## Hugo setup

The dss website is built on a hugo / quarto framework using the bigspring hugo
template as a base.

This image needs to have several things installed for it to run properly:

- quarto
- hugo
- go
- nodejs

##

The website uses the hugo bigspring theme

https://docs.gethugothemes.com/bigspring/installation/

## To run the image locally

1. make sure you have docker installed and running

It might work better depending on what system you are on to run docker this way
ensuring that it's building in a linux amd64 simulated envt. it needs to run
this way to work properly in github actions.

Below will create a tagged version called "hugo". You can call your tag
whatever you wish!

`docker buildx build --platform linux/amd64 . -t hugo`

Then run it like this:

`docker run -it hugo`
