/*
Abstract Keyword
 a palavra-chave abstrata ainda é usada para definir classes abstratas que
  combinam métodos implementados e não implementados. Classes abstratas podem
   ser estendidas ou implementadas, mas não podem ser instanciadas. Eles são
   ideais para cenários onde uma classe requer apenas uma implementação parcial
   e concreta de toda a sua interface. Lembre-se de que classes abstratas não
    podem ser fundamentadas em sua biblioteca ou em uma biblioteca externa.
     Freqüentemente, incluem métodos abstratos que carecem de implementação.


     Combine Both
Uma abordagem interessante é combinar as palavras-chave abstract e interface
para definir uma interface abstrata. Este tipo de classe pode ser implementado
apenas (não estendido) e inclui membros abstratos, como métodos ou propriedades,
sem implementação. Isso o torna particularmente adequado para a criação de
interfaces de contrato. A aplicação mais contundente do modificador de interface
é definir uma interface pura. Ao combinar a interface e os modificadores abstratos,
você obtém uma classe de interface abstrata da qual outras bibliotecas podem implementar,
mas não herdar. Como uma classe abstrata, uma interface pura pode conter membros abstratos.
* */


abstract class MyInterface {
  void myMethod();
}
abstract interface class MyInterface2 {
  void myMethod();
}


/*
Os mixins servem como mecanismo de reutilização de código, oferecendo mais flexibilidade
 que a herança tradicional. Eles permitem adicionar funcionalidades a uma classe
  sem a necessidade de herança, uma vantagem significativa no modelo de herança única do Dart.

Principais conceitos de mixins no Dart

1. Criação de Mixin: Mixins são criados usando a palavra-chave mixin,
 semelhante à criação de classe, mas especificamente para integração em outras classes.

2. Utilização de Mixins with with: A palavra-chave with facilita a adição horizontal
 dos recursos de um mixin a uma classe, contrastando

3. Restrição de uso do mixin com on: A palavra-chave on define as classes nas quais
 um mixin pode ser integrado, permitindo aplicação controlada e prevenção de uso indevido.

4. Implementação de interface: Mixins podem implementar interfaces
 (lembre-se, no Dart, cada classe é uma interface implícita), garantindo que os
  requisitos de interface sejam atendidos.4
* */