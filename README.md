# Estudo Dirigido de SQL

### Descrição

<p>Estudo dirigido de SQL (em PostgreSQL) de <b>Fundamentos de Bancos de Dados (FBD)</b> do Curso de Ciência da Computação da UFC. </p>

### Perguntas

a) Recupere o identificador, o nome e a data de nascimento dos usuários. <br>
b) Recupere título, edição e editora (publisher ) dos livros cujo título contenha a palavra chave "Data-
base". <br>
c) Selecione o título do livro, seu código de exemplar e a data de aquisição para todos os exemplares
adquiridos a partir de 01/01/2022. <br>
d) Recupere título e subtítulo completo, no formato "title: subtitle", de todos os livros ordenados
alfabeticamente pelo título. <br>
e) Selecione o título, edição e quantidade de exemplares dos livros da categoria Banco de Dados <br>
f) Recupere o nome, username e quantidade de exemplares emprestados pelos usuários que possuam
mais exemplares emprestados. Dica: você pode identificar os exemplares emprestados apenas
olhando para as tuplas da tabela library_reservations com status 4 (emprestado), 5 (atrasado) ou
6 (esperando devolução). Na saída, renomeie a coluna com a quantidade para borrowed_exemplars. <br>
g) Recupere o id dos exemplares distintos que estão ou já foram reservados no passado, já foram
devolvidos e não foram aprovados pelo usuário Ayrton. <br>
h) Recupere o título dos livros da categoria Banco de Dados e título dos livros com mais de um
exemplar. <br>
i) Recupere o título e nome da categoria de livros que pertençam a categorias cujos livros nunca foram
emprestados. <br>
j) Selecione o título do livro, o número de autores e o nome dos usuários que já emprestaram livros
escritos por mais de um autor. <br>
