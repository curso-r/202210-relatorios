library(tidyverse)
library(dados)
library(quarto)
library(janitor)


arquivo_qmd <- "praticas/aula_2/parametros/exemplo-params.qmd"
base_arquivo_output <- "praticas/aula_2/parametros/"

# equivalente a apertar o botão render
quarto_render(arquivo_qmd)

# Alterar um parâmetro e renderizar!!
quarto_render(
  arquivo_qmd,
  execute_params = list(filme = "Divertidamente")
)


# alterar nome do arquivo
quarto_render(
  arquivo_qmd,
  execute_params = list(filme = "Divertidamente"),
  output_file = paste0(base_arquivo_output, "divertidamente.html")# ,
  # output_format = "revealjs"
)




# exemplo com purrr

# 1, 2 ,3 

sqrt(1)
sqrt(2)
sqrt(3)

# vetor que quero repetir, funcao que eu quero que seja aplicada!
map(1:3, sqrt)



# os parâmetros possíveis!!!
nome_filmes <- pixar_filmes |> 
  drop_na(filme) |> 
  pull(filme)


map(
  nome_filmes,
  ~ quarto_render(
    arquivo_qmd,
    execute_params = list(filme = .x),
    output_file = paste0(base_arquivo_output, make_clean_names(.x) , ".html"),
    quiet = TRUE
  )
)


# TODO: mistério pq os graficos estao destacando o label errado?

# rmarkdown::render(params = )
