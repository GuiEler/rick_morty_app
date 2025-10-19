import 'translations.dart';

class PtBr implements Translations {
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
