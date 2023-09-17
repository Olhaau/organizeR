library(organizer)

fs <- analyze.files(path = "C:/Users/olisc/OneDrive/Documents/Bewerbungen")


fs %>% mutate(
  #keywords = stringr::str_replace_all(path,  ":/|/|//|_", " ") %>% tolower()
  keywords = strsplit(path, ":/|/|//|_")
) %>%
  {.$keywords[[2]]}

fs$path[50] %>%
  {tools::file_path_sans_ext(.)} %>%
  {strsplit(., ":/|/|_")[[1]]}
stringr::str_replace


if(FALSE){
fs <- fs %>% {bind_cols(., file.info(.$path, extra_cols = TRUE))}

fs$path[50]

fs$path %>% file.info()

x <- fs %>%
  mutate(parts = strsplit(name, "_")) %>%
  filter(ext != "") %>% select(-path)%>% print(n = 100)

for (xi in x$name) print(file.info(xi))

file.size(x$name[1])
file.info(list.files("C:/Users/olisc/Documents", recursive = TRUE, full.names = TRUE)[2])

fs::file_info()
}
