/*
*
* PLATFORMS CHANNEL
* 
* # tipos de métodos para comunicação:
*
* 1 - Method Channel
*   asincrono metodos de invocaçao
*   usecase -> Fetching the current battery level or accessing device information
* 2 - EventChannel
*   Data streams, quando precisamor ouvir continuamente os dados
*   usecase -> ficar ouvindos os sensores ou o GPS, e suas mudanças na localidade
* 3 - BasicMessageChannel
*  Assim como o method channel ele envia e recebe, porem suporta   varios tipos de
* seerializacao e codecs, assim como json, binary ou formatos definidados de estrutras de dados
*
* Resumindo:
* Claro, aqui está um resumo sobre cada um:

1. **MethodChannel:** É uma forma de comunicação entre o Flutter e as
* plataformas nativas (como Android e iOS) que permite a chamada de
*  métodos em ambas as direções. Por exemplo, o Flutter pode chamar
*  métodos nativos para executar funcionalidades específicas e vice-versa.

2. **BasicMessageChannel:** Permite a troca de mensagens simples (como strings ou mapas)
* entre o Flutter e as plataformas nativas. É útil para comunicação de
*  baixo nível e assíncrona entre os dois ambientes.

3. **EventChannel:** Facilita a transmissão de eventos de uma plataforma
* nativa para o Flutter. Isso é útil quando a plataforma nativa precisa
* notificar o Flutter sobre eventos assíncronos, como alterações de estado
*  do sistema ou eventos de hardware.
*
*
* */