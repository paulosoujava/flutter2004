import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifeCycleWidget extends StatefulWidget {
  const LifeCycleWidget({super.key});

  /*
   Ativado na criação do StatefulWidget.  Este método é responsável pela
   criação do objeto de estado.

   */
  @override
  LifeCycleState createState() => LifeCycleState();
}

class LifeCycleState extends State<LifeCycleWidget> {

  int _count = 0;


  LifeCycleState() {
    print('LifeCycleState constructor');
  }

  /*
   É chamado quando o objeto de estado é integrado à árvore do widget,
    principalmente para configuração inicial de dados com base no contexto
     ou no próprio widget
   */
  @override
  void initState() {
    print('LifeCycleState initState $mounted');
    super.initState();
  }

  /*
  *  acionado logo após initState e sempre que
  *  há uma mudança nas dependências do widget.
  *   É benéfico para widgets que dependem de widgets herdados.

  * */

  @override
  void didChangeDependencies() {
    print('LifeCycleState didChangeDependencies $mounted');
    super.didChangeDependencies();
  }
/*
Executado quando há alteração na configuração do widget,
auxiliando na resposta a alterações nas propriedades do widget.

* */
  @override
  void didUpdateWidget(LifeCycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('LifeCycleState didUpdateWidget mounted: $mounted');
  }

  /*
  *  Este método é responsável por fazer a UI do widget.
  *
  * Ele é chamado após initState, didChangeDependencies e sempre que houver
  * necessidade de atualizar a UI devido a mudanças de estado.
*/
  @override
  Widget build(BuildContext context) {
    print('LifeCycleState build $mounted');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Counter: $_count'),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }


  /*
  * Embora não seja um método de ciclo de vida no sentido tradicional,
  * setState é uma função vital que inicia a reconstrução do widget quando seu estado muda.
*/
  void _incrementCounter() {
    setState(() {
      _count++;
      print('Set state, new counter value: $_count');
    });
  }

  /*
  * Este método é chamado quando o widget é removido da árvore, podendo ser
  * reinserido posteriormente.

*/
  @override
  void deactivate() {
    super.deactivate();
    print('LifeCycleState deactivate $mounted');
  }

  /*
  Invocado quando o widget é removido permanentemente da árvore;
   este método é usado para liberação de recursos.

  * */

  @override
  void dispose() {
    super.dispose();
    print('LifeCycleState dispose $mounted');
  }


  /*
  * Ativado durante hot reloads, remontar permite que o widget se adapte às
  *   alterações de código.
  * */
  @override
  void reassemble() {
    super.reassemble();
    print('LifeCycleState reassemble $mounted');
  }
}
