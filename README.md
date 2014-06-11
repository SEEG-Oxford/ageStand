ageStand
========

**ageStand** is an R package containing functions to convert malaria parasite rate estimates between age ranges. At present this package has only one exported function ```R convertPrevalence``` which uses the modified Pull and Grab model introduced in Smith *et al.* (2007) to convert prevalence estimates for *Plasmodium falciparum* and *P. vivax*.

### Installing ageStand

To install ageStand you can use the ```R install_github``` function in the [```devtools```](http://cran.r-project.org/web/packages/devtools/index.html) package, like this:

```R
# install devtools if you haven't already
install.packages('devtools')

# load the package
library(devtools)

# install ageStand from GitHub
install_github('ageStand', 'SEEG-Oxford')

# and load it
library(ageStand)
```

### Using ageStand

The package currently contains one function, ```R convertPrevalence```, which simplifies conversion of prevalence estimates between age bounds. The following code converts a *P. falciparum* prevalence estimate for the 2-10 age range to an all-ages prevalence estimate.

```R
convertPrevalence(prevalence = 0.1,
                  age_min_in = 2,
                  age_max_in = 9,
                  age_min_out = 0,
                  age_max_out = 85)
```

This functions can also be vecotrised and applied to *P. vivax*. For full details see the helpfile for this function by typing ```R ?convertPrevalence``` (after installing and loading the package) in R.

### Getting in touch

Please feel free to file bugs and issues you've had with the package using the GitHub issue tracker to right of this page.

If you'd like to improve the package please feel free to fork the repo and send us a pull request so that we can add it to this package.

### Reference
[Smith, D. L. *et al.* Standardizing estimates of the Plasmodium falciparum parasite rate. *Malaria Journal* 6, 131 (2007).](http://www.malariajournal.com/content/6/1/131)