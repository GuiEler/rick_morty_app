import 'translations.dart';

class PtBr implements Translations {
  @override
  String get statusAlive => 'Vivo';
  @override
  String get statusDead => 'Morto';
  @override
  String get statusUnknown => 'Desconhecido';
  @override
  String get genderMale => 'Masculino';
  @override
  String get genderFemale => 'Feminino';
  @override
  String get genderless => 'Sem gênero';
  @override
  String get genderUnknown => 'Desconhecido';
  @override
  String get aboutCharacter => 'SOBRE O PERSONAGEM';
  @override
  String get locationLabel => 'Localização: ';
  @override
  String get statusLabel => 'Status: ';
  @override
  String get speciesLabel => 'Espécie: ';
  @override
  String get genderLabel => 'Gênero: ';
  @override
  String get originLabel => 'Origem: ';
  @override
  String get episodesList => 'LISTA DE EPISÓDIOS';
  @override
  String get charactersTitle => 'Personagens';
  @override
  String get appTitle => 'Rick and Morty';
  @override
  String get noMoreCharacters => 'Não há mais personagens para carregar.';
  @override
  String get charactersEmpty => 'Nenhum personagem encontrado.';
  @override
  String get tryAgain => 'Tentar novamente';
  @override
  String get apiError => 'Erro de comunicação com o servidor.';
  @override
  String get invalidCredentialsError => 'Credenciais inválidas.';
  @override
  String get notFoundError => 'Recurso não encontrado.';
  @override
  String get noConnectionError => 'Sem conexão com a internet.';
  @override
  String get unauthorizedError => 'Acesso não autorizado.';
  @override
  String get unexpectedError => 'Erro inesperado.';
  @override
  String get requestTimeOut => 'Tempo de requisição excedido.';
  @override
  String get attemptsExceededError => 'Número de tentativas excedido.';
  @override
  String get goBackToHome => 'Voltar para a home';
  @override
  String get ocurredAnError => 'Ocorreu um erro';
  @override
  String get navigationErrorMsg =>
      'Ocorreu um erro ao tentar navegar para a página solicitada. Por favor, tente novamente mais tarde.';
}
