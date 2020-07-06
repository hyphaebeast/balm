# Bayesian analysis and multilevel modeling container (balm)

> a `balm` to keep you calm when trying to do reproducible Bayesian analysis in R in the cloud.

This is a Docker image containing all the necessary package. This autobuilds and updates the image whenever this repo receives a new commit.

## Usage

If you need to add a new R package to the environment, either:
1. Create a new image using this as a base image:
    ```dockerfile
    FROM clearspandex/balm
    ```  
2. Fork this repository and edit the `Dockerfile`

add the package name to the [install2.r](
https://github.com/hyphaebeast/tidy-r/blob/master/Dockerfile#L42) command in the Dockerfile (don't forget the line continuation backslash).


```dockerfile
    ...

RUN install2.r --skipinstalled --ncpus 2 --error \
     --deps TRUE \
     tidyverse \
     shiny \
     rstan \
     brms \
     rstanarm \
     loo \
     bayesplot \
     shinystan \
     projpred \
     tidybayes \
     mgcv
➕  [new-package-name]

     ...
```
