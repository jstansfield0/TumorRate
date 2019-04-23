#' Perform chi-squared test for equivalence of tumor rates between treatments
#' @param a A matrix object with rows corresponding to the
#'     different treatments and columns correspond to the
#'     time periods observed. In the case of incidental tumors discovered
#'     at necropsy Matrix a should contain the counts of the number of necropsies
#'     at which a tumor was found. In the case of comparing the rates of tumors
#'     diagnosed during life or which caused the death of the animal
#'     matrix A should containn the number of animals which died of a
#'     tumor or had a tumor diagnosed during the week.
#' @param b A matrix object with rows corresponding to the treatments
#'     and columns corresponding to the time periods observed.
#'     In the case of incidental tumors discovered at necropsy
#'     matrix B should contain the number of necropsies of animals
#'     which did not have a tumor diagnosed before death and which
#'     did not die of a tumor. In the case of comparing the rates of
#'     tumors diagnosed during life or which caused the death of the animal
#'     matrix B should contain the number of animals still alive without
#'     a diagnosed tumor at the beginning of the week.
#' @return The chi-squared test p-value.
#' @export
#' @importFrom stats pchisq
#' @examples
#' # Input data
#' t1 <- matrix(c(0, 0, 0,
#' 1, 0, 1,
#' 2, 0, 5,
#' 2, 1, 11,
#' 3, 1, 3,
#' 1, 0, 0), nrow = 3, ncol = 6,
#' byrow = FALSE)
#' t2 <- matrix(c(4, 7, 12,
#'                5, 5, 10,
#'                7, 8, 15,
#'                10, 12, 28,
#'                9, 8, 3,
#'                2, 3, 0), nrow = 3, ncol = 6,
#'              byrow = FALSE)
#' # Perform chi-squared test
#' TumorRate(t1, t2)

TumorRate <- function(a, b) {
  # check input
  if (class(a) != "matrix" | class(b) != "matrix") {
    stop("a and b must be matrices of equal dimensions")
  }
  if (!all.equal(dim(a), dim(b))) {
    stop("You must enter an a and b matrix of equal dimensions")
  }
  # create probability matrix
  prob_mat <- diag((colSums(a) / colSums(b)),
                   nrow = ncol(a), ncol = ncol(a))
  # multiply probability matrix with matrix b
  expected <- b %*% prob_mat
  # perform chi-squared test
  chisq <- sum((rowSums(a) - rowSums(expected))^2
               / rowSums(expected))
  pval <- stats::pchisq(chisq, df = nrow(a) - 1,
                 lower.tail = FALSE)
  return(pval)
}
