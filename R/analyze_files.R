#' Analyze your filesystem.
#'
#' @param path a path to analyse in your filesystem.
#'
#' @return A tibble
#' @export
#'
#'
#' @examples
#' analyze.files() %>% filter(!grepl("Rproj", path))
analyze.files <- function(path = getwd(), all.files = TRUE, ...){
  bind_rows(
    tibble(path = list.dirs(path = path)) %>% mutate(type = "dir"),
    tibble(path = list.files(path = path, recursive = TRUE, full.names = TRUE, all.files = all.files, ...)) %>%
      mutate(type = "file")
  ) %>%
    mutate(
      name = basename(path),
      dir = dirname(path),
      ext = tools::file_ext(path)
    )  %>%
    {bind_cols(., file.info(.$path, extra_cols = TRUE))} %>%
    mutate(
      keywords = stringr::str_replace_all(path,  ":/|/|//|_|-|_|\\.[A-z]*|\\\\", " ") %>%
        tolower() %>% {stringr::str_squish(.)}
      #keywords = unlist(strsplit(path, ":/|/|//|_"))
    )
}

# name, dir getrennt?
# pkg tm to cluster strings
# also: find similiar files


