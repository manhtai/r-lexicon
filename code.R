library(stringr)

#==================================================
# Tách lớp định nghĩa
#==================================================

procul <- readLines("procul.txt")
procul <- str_c(procul,collapse="\n")

pat0 <- "<em>[[:space:]]*<strong>([[:alnum:]|[:space:]]+)</strong>[[:space:]]*</em>[[:space:]]*[(]([[:alnum:]|[:space:]]+)[)]"
ext0 <- str_extract_all(procul, pat0)
lex0 <- str_replace_all(ext0[[1]], pat0, "- [x] \\2: \\1")
procul2 <- str_replace_all(procul, pat0,"")

pat1 <- "<strong>[[:space:]]*<em>([[:alnum:]|[:space:]]+)</em>[[:space:]]*</strong>[[:space:]]*[(]([[:alnum:]|[:space:]]+)[)]"
ext1 <- str_extract_all(procul2, pat1)
lex1 <- str_replace_all(ext1[[1]], pat1, "- [x] \\2: \\1")
procul2 <- str_replace_all(procul2, pat1,"")

pat2 <- "[()]([[:alnum:]|[:space:]]+)[)]"
ext2 <- str_extract_all(procul2, pat2)
lex2 <- str_replace_all(ext2[[1]], pat2, "- [ ] \\1")

lex <- mapply(function(x) str_c(x,collapse="\n"),c(lex0,lex1,lex2))
writeLines(lex, "lex.md")

#==================================================
# Các khái niệm (có nhiều cái trùng, sửa sau)
#==================================================

lis <- readLines("list.txt")
pat <- "([[:alnum:]|[:space:]]+),"
lis <- str_extract_all(lis, pat)
lis <- str_replace_all(lis[[1]], "^[[:space:]]+", "")
lis <- str_replace_all(lis, pat, "- [ ] \\1")
writeLines(lis, "lis.md")
