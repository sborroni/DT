% Please edit documentation in R/format.R
\name{formatCurrency}
\alias{formatCurrency}
\alias{formatDate}
\alias{formatPercentage}
\alias{formatRound}
\alias{formatStyle}
\title{Format table columns}
\usage{
formatCurrency(table, columns, currency = "$", interval = 3, mark = ",")

formatPercentage(table, columns, digits = 0)

formatRound(table, columns, digits = 2)

formatDate(table, columns, method = "toDateString")

formatStyle(table, columns, fontWeight = NULL, color = NULL, backgroundColor = NULL, 
    background = NULL, ...)
}
\arguments{
\item{table}{a table object created from \code{\link{datatable}()}}

\item{columns}{the indices of the columns to be formatted (can be character,
numeric, logical, or a formula of the form \code{~ V1 + V2}, which is
equivalent to \code{c('V1', 'V2')})}

\item{currency}{the currency symbol}

\item{interval}{put a marker after how many digits of the numbers}

\item{mark}{the marker after every \code{interval} decimals in the numbers}

\item{digits}{the number of decimal places to round to}

\item{method}{the method(s) to convert a date to string in JavaScript; see
\code{DT:::DateMethods} for a list of possible methods, and
\url{http://mzl.la/1xGe99W} for a full reference}

\item{fontWeight}{the font weight, e.g. \code{'bold'} and \code{'normal'}}

\item{color}{the font color, e.g. \code{'red'} and \code{'#ee00aa'}}

\item{backgroundColor}{the background color of table cells}

\item{background}{the background of table cells}

\item{...}{other CSS properties, e.g. \code{'border'}, \code{'font-size'},
\code{'text-align'}, and so on; if you want to condition CSS styles on the
cell values, you may use the helper functions such as
\code{\link{styleInterval}()}; note the actual CSS property names are
dash-separated, but you can use camelCase names in this function (otherwise
you will have to use backticks to quote the names, e.g. \code{`font-size` =
'12px'}), and this function will automatically convert camelCase names to
dash-separated names (e.g. \code{'fontWeight'} will be converted to
\code{'font-weight'} internally)}
}
\description{
Format numeric columns in a table as currency (\code{formatCurrency()}) or
percentages (\code{formatPercentage()}), or round numbers to a specified
number of decimal places (\code{formatRound()}). The function
\code{formatStyle()} applies CSS styles to table cells by column.
}
\examples{
library(DT)
m = cbind(matrix(rnorm(120, 1e5, 1e6), 40), runif(40), rnorm(40, 100))
colnames(m) = head(LETTERS, ncol(m))
m

# format the columns A and C as currency, and D as percentages
datatable(m) \%>\% formatCurrency(c('A', 'C')) \%>\% formatPercentage('D', 2)

# the first two columns are Euro currency, and round column E to 3 decimal places
datatable(m) \%>\% formatCurrency(1:2, '\\U20AC') \%>\% formatRound('E', 3)

# apply CSS styles to columns
datatable(iris) \%>\%
  formatStyle('Sepal.Length', fontWeight = styleInterval(5, c('bold', 'weight'))) \%>\%
  formatStyle('Sepal.Width',
    color = styleInterval(3.4, c('red', 'white')),
    backgroundColor = styleInterval(3.4, c('yellow', 'gray'))
  )
}
\references{
See \url{http://rstudio.github.io/DT/functions.html} for detailed
  documentation and examples.
}
