
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


//!POST CLASES
class Motoquero {
  const property motos
  
  method comprarMoto(moto) {
    motos.add(moto)
  }
  
  method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
} 

class Moto {
  const marca
  const velocidadMaxima
  var estaEncendida = false
  const motor = new Motor(constanteDeRevolucion = 40)
  var property velocidadActual = 0

  method esFachera() = self.indiceFacha() >= 600

  method indiceFacha() = velocidadMaxima * marca.length()
  
  method arrancar() {
    motor.iniciarCombustion()
    self.velocidadActual(10)
    estaEncendida = true
  }

  method acelerar(velocidad) {
    // Veamos si alguno propone una excepcion aca que diga:
    // velocidad > velocidadMaxima => throw
    // velocidad < 0 => throw
    // cambiar velocidadActual sin prender la moto => throw
    // Esto se hace despues de lo de los pistones, a ver si se avivan
    // Si usaron property, cayeron en la trap (no pueden validar)
    
    motor.exigir(velocidad)
    velocidadActual = velocidad
  }
}

// 
class Motor {
  const pistones = [new Piston(), new Piston()]
  var desgaste = 0
  const constanteDeRevolucion
  
  method exigir(velocidad) {
    pistones.forEach({ piston => piston.moverse(velocidad * constanteDeRevolucion) })
    desgaste += 1
  }
  
  method iniciarCombustion() {
    pistones.forEach({ piston => piston.moverse(1200) })
    desgaste += 5
  }

  method desgaste(){
    return desgaste
  }
}

class Piston {
  var desgaste = 0
  
  method moverse(revoluciones) {
    if (desgaste >= 100) {
      throw new Exception(message = "El piston está roto")
    } else {
      desgaste += 10 * revoluciones / 1000
    }
  }
}

const pi = 3.14

const sportster2 = new Moto(
  marca = "Harley-Davidson",
  velocidadMaxima = 180
)

const elettrica2 = new Moto(
  marca = "Vespa",
  velocidadMaxima = 45
)

const himalayanNaza = new Moto(
  marca = "Royal Enfield",
  velocidadMaxima = 165
)

const himalayanMatias = new Moto(
  marca = "Royal Enfield",
  velocidadMaxima = 165
)

const d9162 = new Moto(
  marca = "Ducati",
  velocidadMaxima = 260
)

const matias2 = new Motoquero(motos = [elettrica2, himalayanMatias])

const valen2 = new Motoquero(motos = [sportster2])

const naza2 = new Motoquero(motos = [d9162, himalayanNaza])
// Podemos preguntarles donde mas creen que podriamos agregar este tipo de excepciones
// Por ejemplo: velocidadActual <= velocidadMaxima (Velocidad maxima alcanzada) ; desgaste <= 100 (Motor roto)
// Finalmente diagrama de clases
