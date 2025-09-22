// Por ejemplo: velocidadActual <= velocidadMaxima (Velocidad maxima alcanzada) ; desgaste <= 100 (Motor roto)
// Finalmente diagrama de clases
// object sportster {
//   const marca = "Harley-Davidson"
//   const velocidadMaxima = 180
// method esFachera() = self.indiceFacha() >= 600
// method indiceFacha() = velocidadMaxima * self.cantidadLetrasMarca()
// method cantidadLetrasMarca() = marca.length()
// }
// object elettrica {
//   const marca = "Vespa"
//   const velocidadMaxima = 45
// method esFachera() = self.indiceFacha() >= 600
// method indiceFacha() = velocidadMaxima * self.cantidadLetrasMarca()
// method cantidadLetrasMarca() = marca.length()
// }
// object himalayan {
//   const marca = "Royal Enfield"
//   const velocidadMaxima = 165
// method esFachera() = self.indiceFacha() >= 600
// method indiceFacha() = velocidadMaxima * self.cantidadLetrasMarca()
// method cantidadLetrasMarca() = marca.length()
// }
// object d916 {
//   const marca = "Ducati"
//   const velocidadMaxima = 260
// method esFachera() = self.indiceFacha() >= 600
// method indiceFacha() = velocidadMaxima * self.cantidadLetrasMarca()
// method cantidadLetrasMarca() = marca.length()
// }
// object matias {
//   const motos = [elettrica, himalayan]
//   method comprarMoto(moto) {
//     motos.add(moto)
//   }
//   method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
// }
// object valen {
//   const motos = [sportster]
//   method comprarMoto(moto) {
//     motos.add(moto)
//   }
//   method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
// }
// object naza {
//   var property motos = [himalayan, d916]
//   method comprarMoto(moto) {
//     motos.add(moto)
//   }
//   method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
// } 
// Que quilombo!! ¿Se puede hacer mejor?
// Claro que si! Usando moldes, osea digamos clases
// class Moto {
//   const property marca
//   const property velocidadMaxima
//   
// method esFachera() = self.indiceFacha() >= 600
// method indiceFacha() = velocidadMaxima * self.cantidadLetrasMarca()
// method cantidadLetrasMarca() = marca.length()
// }
class Motoquero {
  const property motos
  const tieneCamperaCuero
  
  method comprarMoto(moto) {
    motos.add(moto)
  }
  
  method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
  
  method esCool() = self.tieneMotoFachera() && tieneCamperaCuero
} 

// const sportster = new Moto(
//   marca = "Harley-Davidson",
//   velocidadMaxima = 180,
// )
// const elettrica = new Moto(
//   marca = "Vespa",
//   velocidadMaxima = 45,
// )
// const himalayan = new Moto(
//   marca = "Royal Enfield",
//   velocidadMaxima = 165,
// )
// const d296Naza = new Moto(
//   marca = "Ducati",
//   velocidadMaxima = 260,
// ) 
// const d296Valen = new Moto(
//   marca = "Ducati",
//   velocidadMaxima = 260,
// ) 

// const matias2 = new Motoquero(motos = [elettrica], tieneCamperaCuero = true)
// const valen2 = new Motoquero(motos = [sportster, d296Valen], tieneCamperaCuero = true)
// const naza2 = new Motoquero(motos = [d296Naza, batimovil], tieneCamperaCuero = true)
// const batman = new Motoquero(motos = [batimovil], tieneCamperaCuero = false)


// ¡Excelente! Ahora nos gustaria introducir el concepto de Excepciones
// ¿Qué es una excepcion?
// Bla bla bla teorico
// Pongamoslo a prueba

class Motor {
  const pistones = [new Piston(), new Piston()]
  var desgaste = 0
  
  method iniciarCombustion() {
    pistones.forEach({ piston => piston.moverse(1200) })
    desgaste += 5
  }
}

class Piston {
  var desgaste = 0
  
  method moverse(revoluciones) {
    if (desgaste == 100) {
      throw new Exception(message = "El piston está roto")
    } else {
      desgaste += 10 * (revoluciones / 1000)
    }
  }
}

const pi = 3.14

class Moto {
  const marca
  const velocidadMaxima
  const motor = new Motor()
  var property velocidadActual = 0
  
  method esFachera() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * self.cantidadLetrasMarca()
  
  method cantidadLetrasMarca() = marca.length()
  
  method arrancar() {
    motor.iniciarCombustion()
    self.velocidadActual(10)
  }
}

const sportster2 = new Moto(
  marca = "Harley-Davidson",
  velocidadMaxima = 180
)

const elettrica2 = new Moto(
  marca = "Vespa",
  velocidadMaxima = 45
)

const himalayan2 = new Moto(
  marca = "Royal Enfield",
  velocidadMaxima = 165
)

const d916Naza = new Moto(
  marca = "Ducati",
  velocidadMaxima = 260
)
const d916Valen = new Moto(
  marca = "Ducati",
  velocidadMaxima = 260
)

object batiMovil {
  method esFachera() = true
}

const matias2 = new Motoquero(
  motos = [elettrica2],
  tieneCamperaCuero = true
)

const valen2 = new Motoquero(
  motos = [sportster2, d916Valen],
  tieneCamperaCuero = true
)

const naza2 = new Motoquero(motos = [d916Naza, batiMovil], tieneCamperaCuero = true)
const batman = new Motoquero(motos = [batiMovil], tieneCamperaCuero = false)

// Podemos preguntarles donde mas creen que podriamos agregar este tipo de excepciones
// Por ejemplo: velocidadActual <= velocidadMaxima (Velocidad maxima alcanzada) ; desgaste <= 100 (Motor roto)
// Finalmente diagrama de clases
