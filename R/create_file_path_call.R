#' @title Create File Path Call
#'
#' @description The function returns \code{\link[base]{file.path}} function
#'   wrapping passed file path string.
#'
#' @details The function is a key element of the \code{\link{formatPathAddIn}}
#'   and produces \code{\link[base]{file.path}} call.
#'
#' @param path_string Path string.
#' @param path_sep Path separator, defults to \code{.Platform$file.sep}.
#' @param here A logical, defaults to \code{FALSE} whether to use the function here
#' @param normalize A logical, defaults to \code{TRUE} whether to wrap in
#'   \code{\link[base]{normalizePath}}.
#' @param mustWork As per \code{mustWork} in \code{\link[base]{normalizePath}}
#'
#' @return A \code{\link[base]{file.path}} call.
#'
#' @export
#'
#' @examples
#' create_file_path_call(tempdir())
#'
create_file_path_call <-
    function(path_string,
             path_sep = .Platform$file.sep,
             here     = FALSE,
             mustWork = TRUE,
             normalize = TRUE) {
        # Break path and keep non-missing elements
        split_pth <-
            unlist(strsplit(x = path_string, split = path_sep))
        split_pth <- split_pth[split_pth != ""]

        # Construct basic file path call
        if (here && !! requireNamespace("here", quietly = TRUE)) {
           call_file_path <- call("here")
        } else {
            call_file_path <- call("file.path")
        }
        # given absolute paths should stay absolute for unix
        if (grepl("^/", path_string) && .Platform$OS.type != "windows") {
            split_pth <- append(x = split_pth,
                                values = path_sep,
                                after = 0)
        }
        call_file_path[2:(length(split_pth) + 1)] <- split_pth

        # If need to normalize wrap in normalize call
        if (all(normalize, mustWork)) {
            call_file_path <-
                call("normalizePath", call_file_path, mustWork = TRUE)
        } else if (normalize) {
            call_file_path <- call("normalizePath", call_file_path)
        }

        return(call_file_path)
    }

