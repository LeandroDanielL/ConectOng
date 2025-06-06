Finalidade do projeto:
Percebendo que muitas ONGs passam por momentos difíceis e não conseguem chegar no público adequado ou demonstrar o seu trabalho, pensamos em fazer o Conect ONG, que é um aplicativo para ajudar as ONGs a terem mais visibilidade com quem se interessa em causas sociais na região de Belo Horizonte. Para poder ajudar as ONGs a terem mais engajamento, podendo falar e postar com mais facilidade os seus projetos, poder conversar com quem tem interesse em contribuir com a ONG e ate mesmo oferecer produtos atraves de uma lojinha.

Quais os frameworks utilizados no projeto: 
O Conect ONG foi desenvolvido utilizando o Flutter e utiliza o Firebase como banco de dados. 
Utilizado também o plugin Android Studio para compilar a aplicação para a execução.

Estrutura do projeto: 
Dentro da pasta lib temos: 
Main - é a classe principal responsável pela inicialização do banco de dados e posteriormente a aplicação;
snackbar - é uma barra de notificação para mostrar mensagens ao usuário; 
Login - é uma classe responsável para o registro e autenticação do usuário;
Feed - é a nossa tela principal após o login, fornece acesso a mais funções do sistema;
Menu - responsável para a organização das funcionalidades que não aparecem no Feed;
Filtro - filtra posts pela sua categoria;
Loja - Contém as funcionalidades da loja como adicionar, remover itens do carrinho e finalizar compras;

Mock:
Pasta post - são os posts que estão no feed;
Pasta perfis - que se referem aos perfis das ONGs presentes no feed.

O que é preciso pra executar o projeto localmente: 
E preciso baixar o Flutter (link para download: https://docs.flutter.dev/get-started/install? ) para poder rodar aplicação.
Precisa também do Firebase (link para download: https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=ios ) para poder acessar o banco de dados.
O Android Studio não é um item obrigatório. A execução do projeto e possível via browser, porém, caso queira emular um dispositivo ou gerar um apk para dispositivos Android será necessário a utilização do plugin (link para download: https://developer.android.com/studio? ).  

Funcionalidade das classes do projeto:
Main - é a classe principal responsável pela inicialização do banco de dados e posteriormente a aplicação;
Snackbar - é uma barra de notificação para mostrar ao usuário um respectivo erro no login por exemplo ou até mesmo a confirmação de algo que deu certo; 
Login - e a parte para o usuário poder criar ou fazer o login de sua conta no nosso app usando o Firebase;
Feed - é nossa tela principal onde tem os posts, o filtro e o menu. feed apresenta a funcionalidade de abrir um post ou o perfil de uma ONG em si. O perfil das ONGs está com ids para se identificar com facilidade.
Menu - e um menu onde a pessoa pode acessar seu perfil, a loja entre diversas coisas e ainda no menu o usuário vera seu nome de usuário escrito e também seu Email que o mesmo fez no login;
Filtro - o usuário terá um filtro que puxa os ids dos posts para mostrar ao usuário quando o usuário escolhe algo no filtro o filtro irá puxar somente os ids dos posts que estão relacionados a classe que o usuário clicou;
Loja - é um sistema de loja simples com carrinho e adicionar itens ao carrinho.
