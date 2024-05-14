/*
*
* KEYS no FLUTTER
*
* Uma chave no Flutter é um identificador distinto para widgets, elementos e um SemanticsNodes.
*  Ele desempenha um papel crucial no gerenciamento do ciclo de vida do widget da estrutura.
*  Quando um widget é reconstruído, sua chave determina se o novo widget deve ser usado para
*  atualizar um elemento existente na árvore de widgets.
* Isso significa que se a chave do novo widget corresponder à chave do widget atual associado
*  a um elemento, o Flutter atualizará esse elemento com o novo widget.
*  Caso contrário, criará um novo elemento para o novo widget.


*Este mecanismo é vital para manter o estado e a identidade dos widgets,
*  especialmente em listas dinâmicas ou interfaces complexas onde a estrutura da
*  árvore de widgets muda frequentemente.
*  Usando chaves, os desenvolvedores podem garantir que a estrutura rastreie e atualize
*  os widgets com precisão, levando a um comportamento de UI mais previsível e eficiente.

 diferentes tipos de chaves no Flutter e quando usá-las.

Chave única

* =======  UniqueKey  =======
Esta chave é usada quando um widget precisa de uma identidade única
* sempre que é construído, garantindo que seja sempre considerado distinto.
* Por exemplo, em uma lista dinâmica onde você deseja que cada item mantenha sua identidade
*  durante as atualizações, você usaria o  UniqueKey.
* Um exemplo prático é um aplicativo de chat onde cada mensagem é única e precisa
*  ser identificável individualmente mesmo após atualizações.

Construtor ListView(

itemBuilder: (contexto BuildContext, índice interno)

return ListTile(chave: UniqueKey(), título: Text('Mensagem $index')).

** ----------------------------------
* * =======  ValueKey  =======
* * ----------------------------------
Quando um widget precisa ser identificado por um valor específico, ValueKey é a escolha certa.
* É perfeito para casos em que um valor único, como um ID,
*Exemplo um  o aplicativo de lista de tarefas.
*  Cada item de tarefa pode ter widgets exclusivos.
* Por exemplo, no ID, o uso do ValueKey ajuda o Flutter a identificar e gerenciar esses itens de maneira eficaz.

ListView.builder(

itemBuilder: (contexto BuildContext, índice interno) {

return ListTile(

chave: ValueKey (todoItems [índice] id),

título: Texto (todoItems [índice].título),

* ----------------------------------
* * =======  ObjectKey  =======
* ----------------------------------
Semelhante ao ValueKey, usa a identidade de um objeto inteiro.
* Esta chave é adequada para estruturas de dados complexas onde a identidade do widget
* está ligada à identidade do objeto.
*  Por exemplo, em um aplicativo de comércio eletrônico,
* cada produto em uma lista pode ser identificado exclusivamente usando ObjectKey,
* permitindo que o Flutter gerencie corretamente widgets que representam produtos diferentes.

Construtor ListView(

itemBuilder: (contexto BuildContext, índice int) return ListTile (

chave: ObjectKey(produtos [índice])

título: Texto (nome dos produtos[índice])


* ----------------------------------
* * =======  GlobalKey  =======
* ----------------------------------
 Esta é uma chave globalmente exclusiva usada em todo o aplicativo.
 É comumente empregado para acessar widgets de diferentes partes do aplicativo,
 como gerenciar estados de formulário.
  Um caso de uso prático é um widget de formulário onde você deseja acessar seu
  estado de uma parte diferente do aplicativo para executar ações como validação ou envio de dados.

final GlobalKey FormState> formKey = GlobalKey<FormState>();
Form(
  key: formKey,
  child: TextFormField(),
 );

 Em outro lugar do aplicativo

if (formKey.currentState.validate()) {
// Processa dados
}


* ----------------------------------
* * =======  PageStorageKey  =======
* ----------------------------------
Esta chave salva o estado de um widget quando ele não está visível, especificamente em listas roláveis.
Por exemplo, em um aplicativo de notícias com uma longa lista de artigos,
você pode usar PageStorageKey para manter a posição de rolagem,
garantindo que quando um usuário retornar à lista após ler um artigo, ele retorne à posição salva.

ListView.builder(
    key: PageStorageKey<String>('lista de notícias'),
    itemBuilder: (contexto BuildContext, índice int) { return ListTile(title: Text('Article $index'));
  }
);

Escolher o tipo certo de chave no Flutter é essencial para o gerenciamento eficaz de widgets,
 especialmente em interfaces dinâmicas e complexas.

Usando chaves em testes
As chaves também podem ser altamente benéficas em testes de widgets. Por exemplo, você pode usar ValueKey ou Key para
encontre um widget específico. Aqui está um exemplo:

void main() {
    testWidgets(
        'Example Widget Test',
        (WidgetTester tester) async {
            await tester.pumpWidget(
                const MaterialApp(
                    home: Column (
                                children: [
                                    Text ('Flutter',
                                ,key: Key('specific_widget'),
                                  Text('Flutter'),
                                ],
                              ),
                            ),
                          );

 const specificWidgetKey = Key('specific_widget');
 expect(find.byKey(specificWidgetKey), findsOneWidget);
        },
    );
}

* */