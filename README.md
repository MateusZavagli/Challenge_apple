# Challenge_apple
Challenge da etapa 5 

Este código consiste na gamplay de uma Academia Mágica. 
O sistema começa solicitando o nome do usuário e após a entrada do nome, aparece a opção de selecionar um idioma: 1. para português e 2. para inglês. Ao selecionar um idioma, a gameplay começa com um menu com quatro opções/ abas: 1 - Aprender Feitiços, 2 - Combinar Elementos, 3 - Livro de Feitiços e 0 - para encerrar a gameplay.
Na opção Aprender Feitiços, o usuário tem acesso a sua mana e experiência, que pode ser adquirida a partir de um dado que será jogado e obterá um número aleatório de 1 a 10. Ganhando XP e mana, o usuário pode acessar a lista de Feitiços Disponíveis, cada feitiço terá um custo de XP e de Mana. 
Na opção Combinar Elementos, o usuário poderá juntar dois elementos, sendo eles Fogo, Gelo, Luz, Sombra e Ar.
Na opção Livro de Feitiços, o usuário vê quais feitiços ele adquriu na aba Aprender Feitiços. 
Tanto no Menu, quanto nas abas, o usuário tem a opção 0. No menu, a opção 0 irá encerrar a gameplay e nas abas, a opção 0 apenas retorna ao Menu.

Quanto ao código:
temos a utilização de um enum com cases, para caso o usuário selecione o idioma português (pt) ou inglês (en), e também foi criada uma função T para identificar o idioma selecionado e com isso, alguns prints serão flexíveis ao idioma selecionado com o formato: print(T("")). 
Utilização de classe para identificar quais variáveis terão dentro da classe Jogador. E utilização do init() e self. para não chamar o parâmetro mas sim o valor presente naquela variável, definido no input do usuário.
Na parte de aprender feitiços, se o usuário não tiver xp e/ou mana suficiente, ele diz que não é possível aprender devido a falta de xp e/ou mana. Se o usuário tiver mana e xp, ele aprende o feitiço e ele é adcicionado com append numa lista com os feitiços, que irá servir demonstrar os feitiços aprendidos no livro de feitiços.
Na parte de Combinar Elementos, se a combinação de elementos for com os mesmos elementos, a combinação falha, assim como se a combinação informada pelo usuário não tiver configurada no código. Se a combinação tiver configurada, como Fogo e Ar, a combinação é um sucesso e usuário cria um feitiço e este mesmo, também é adicionado na lista de feitiços para ser visualizada no livro de feitiços.
