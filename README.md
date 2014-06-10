ageStand
========

**ageStand** is an R package containing functions to convert malaria parasite rate estimates between age ranges. At present this package has only one exported function ```convertPrevalence``` which uses the modified Pull and Grab model introduced in Smith *et al.* (2007) to convert prevalence estimates for *Plasmodium falciparum* and *P. vivax*.

### installing ageStand

To install ageStand you can use the ```install_github``` function in the [```devtools```](http://cran.r-project.org/web/packages/devtools/index.html) package, like this:

```{r}
# install devtools if you haven't already
install.packages('devtools')

# load the package
library(devtools)

# install ageStand from GitHub
install_github('ageStand', 'SEEG-Oxford')

# and load it
library(ageStand)
```

### Getting in touch

Please feel free to file bugs and issues you've had with the package using the GitHub issue tracker to right of this page.

If you'd like to improve the package please feel free to fork the repo and send us a pull request so that we can add it to this package.

### Reference
[Smith, D. L. *et al.* Standardizing estimates of the Plasmodium falciparum parasite rate. *Malaria Journal* 6, 131 (2007).](http://www.malariajournal.com/content/6/1/131)