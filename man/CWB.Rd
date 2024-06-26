% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CWB.R
\name{CWB}
\alias{CWB}
\title{Crop Water Balance Accounting}
\usage{
CWB(
  Rain,
  ET0,
  AWC,
  Drz,
  Kc = NULL,
  Irrig = NULL,
  MAD = NULL,
  InitialD = 0,
  start.date
)
}
\arguments{
\item{Rain}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} with daily rainfall totals in
millimetres.}

\item{ET0}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} with daily reference
evapotranspiration in millimetres.}

\item{AWC}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} with the available water
capacity of the soil, that is: the amount of water between field capacity
and permanent wilting point in millimetre of water per metres of soil, must
be greater than or equal to 0.}

\item{Drz}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} defining the root zone depth
in metres.}

\item{Kc}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} defining the crop coefficient.
If \code{NULL} its values are assumed to be 1.}

\item{Irrig}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} with  net irrigation amount
infiltrated into the soil for the current day in millimetres.}

\item{MAD}{A \code{vector}, 1-column \code{matrix} or \code{data.frame} defining the management
allowed depletion.  Varies between 0 and 1.}

\item{InitialD}{Single number defining in millimetres, the initial soil water deficit.  It
is used to start the water balance accounting.  Default value is 0, which
assumes the root zone is at the field capacity.}

\item{start.date}{Date at which the accounting should start. Formats:
\dQuote{YYYY-MM-DD}, \dQuote{YYYY/MM/DD}.}
}
\value{
A \code{data.frame} of water balance accounting, including the soil water deficit.
}
\description{
Calculates several parameters of the crop water balance.  It also suggests
when to irrigate.
}
\examples{
Tavg <- DataForCWB[,2]
Tmax <- DataForCWB[,3]
Tmin <- DataForCWB[,4]
Rn <- DataForCWB[,6]
WS <- DataForCWB[,7]
RH <- DataForCWB[,8]
G <- DataForCWB[,9]
ET0 <- ET0_PM(Tavg, Tmax, Tmin, Rn, RH, WS, G, Alt = 700)
Rain <- DataForCWB[,10]
Drz <- DataForCWB[,11]
AWC <- DataForCWB[,12]
MAD <- DataForCWB[,13]
Kc <- DataForCWB[,14]
Irrig <- DataForCWB[,15]
CWB(Rain = Rain, ET0 = ET0, AWC = AWC, Drz = Drz,
    Kc = Kc, Irrig = Irrig, MAD = MAD, start.date = "2023-11-23")
}
