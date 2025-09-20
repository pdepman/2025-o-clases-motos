
// object sportster {
//   const marca = "Harley-Davidson"
//   const velocidadMaxima = 180
//   const indiceFacha = 100
  
//   method esFachera() = indiceFacha >= 60
// }

// object elettrica {
//   const marca = "Vespa"
//   const velocidadMaxima = 45
//   const indiceFacha = 1
  
//   method esFachera() = indiceFacha >= 60
// }

// object himalayan {
//   const marca = "Royal Enfield"
//   const velocidadMaxima = 165
//   const indiceFacha = 50
  
//   method esFachera() = indiceFacha >= 60
// }

// object d916 {
//   const marca = "Ducati"
//   const velocidadMaxima = 260
//   const indiceFacha = 80
  
//   method esFachera() = indiceFacha >= 60
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
//   const property indiceFacha
//   
//   method esFachera() = indiceFacha >= 60
// }
class Motoquero {
  const property motos
  
  method comprarMoto(moto) {
    motos.add(moto)
  }
  
  method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
} // const sportster2 = new Moto(

//   marca = "Harley-Davidson",
//   velocidadMaxima = 180,
//   indiceFacha = 100
// )
// const elettrica2 = new Moto(
//   marca = "Vespa",
//   velocidadMaxima = 45,
//   indiceFacha = 1
// )
// const himalayan2 = new Moto(
//   marca = "Royal Enfield",
//   velocidadMaxima = 165,
//   indiceFacha = 50
// )
// const d9162 = new Moto(
//   marca = "Ducati",
//   velocidadMaxima = 260,
//   indiceFacha = 80
// )
// const matias2 = new Motoquero(motos = [elettrica2, himalayan2])
// const valen2 = new Motoquero(motos = [sportster2])
// const naza2 = new Motoquero(motos = [himalayan2, d9162])
// ¡Excelente! Ahora nos gustaria introducir el concepto de Excepciones
// ¿Qué es una excepcion?
// Bla bla bla teorico
// Pongamoslo a prueba
class Motor {
  const pistones = [new Piston(), new Piston()]
  var desgaste = 0
  
  method generarMasTorque(rpm) {
    pistones.forEach({ piston => piston.moverse(rpm / 2) })
    desgaste += 1
  }
  
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
      desgaste += 10
    }
  }
}

const pi = 3.14

class Moto {
  const marca
  const velocidadMaxima
  const indiceFacha
  const radioRuedas
  const motor = new Motor()
  var property velocidadActual = 0
  
  method esFachera() = indiceFacha >= 60
  
  method acelerarHasta(velocidad) {
    // Veamos si alguno propone una excepcion aca que diga (velocidadActual + velocidad) > velocidadMaxima entonces throw
    // u otra que pida primero que haya arrancado la moto
    const constanteK = ((pi * radioRuedas) * 60) / 1000
    const rpm = velocidad / constanteK
    
    motor.generarMasTorque(rpm)
    self.velocidadActual(velocidad)
  }
  
  method arrancar() {
    motor.iniciarCombustion()
    self.velocidadActual(10)
  }
}

const sportster2 = new Moto(
  marca = "Harley-Davidson",
  velocidadMaxima = 180,
  indiceFacha = 100,
  radioRuedas = 22
)

const elettrica2 = new Moto(
  marca = "Vespa",
  velocidadMaxima = 45,
  indiceFacha = 1,
  radioRuedas = 27
)

const himalayanNaza = new Moto(
  marca = "Royal Enfield",
  velocidadMaxima = 165,
  indiceFacha = 50,
  radioRuedas = 24
)

const himalayanMatias = new Moto(
  marca = "Royal Enfield",
  velocidadMaxima = 165,
  indiceFacha = 50,
  radioRuedas = 24
)

const d9162 = new Moto(
  marca = "Ducati",
  velocidadMaxima = 260,
  indiceFacha = 80,
  radioRuedas = 21.5
)

const matias2 = new Motoquero(motos = [elettrica2, himalayanMatias])

const valen2 = new Motoquero(motos = [sportster2])

const naza2 = new Motoquero(motos = [d9162, himalayanNaza])
// Podemos preguntarles donde mas creen que podriamos agregar este tipo de excepciones
// Por ejemplo: velocidadActual <= velocidadMaxima (Velocidad maxima alcanzada) ; desgaste <= 100 (Motor roto)
// Finalmente diagrama de clases