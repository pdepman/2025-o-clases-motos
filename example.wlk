object sportster {
  const property marca = "Harley-Davidson"
  const property velocidadMaxima = 180
  const property indiceFacha = 100
  
  method esFachera() = indiceFacha >= 60
}

object elettrica {
  const property marca = "Vespa"
  const property velocidadMaxima = 45
  const property indiceFacha = 1
  
  method esFachera() = indiceFacha >= 60
}

object himalayan {
  const property marca = "Royal Enfield"
  const property velocidadMaxima = 165
  const property indiceFacha = 50
  
  method esFachera() = indiceFacha >= 60
}

object d916 {
  const property marca = "Ducati"
  const property velocidadMaxima = 260
  const property indiceFacha = 80
  
  method esFachera() = indiceFacha >= 60
}

object matias {
  var property motos = [elettrica, himalayan]
  
  method comprarMoto(moto) {
    motos.add(moto)
  }
  
  method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
}

object valen {
  var property motos = [sportster]
  
  method comprarMoto(moto) {
    motos.add(moto)
  }
  
  method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
}

object naza {
  var property motos = [himalayan, d916]
  
  method comprarMoto(moto) {
    motos.add(moto)
  }
  
  method tieneMotoFachera() = motos.any({ moto => moto.esFachera() })
} // Que quilombo!! ¿Se puede hacer mejor?

// Claro que si! Usando moldes, osea digamos clases
// class Moto {
//   const property marca
//   const property velocidadMaxima
//   const property indiceFacha
//   
//   method esFachera() = indiceFacha >= 60
// }
class Motoquero {
  var property motos
  
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
  const tanqueNafta
  var desgaste = 0
  
  method iniciarCombustion() {
    tanqueNafta.gastarCombustible()
    desgaste += 5
  }
}

class TanqueNafta {
  var combustible = 100
  
  method gastarCombustible() = if (combustible < 10) {
    throw new Exception(message = "No hay suficiente combustible")
  } else {
    combustible -= 10
  }
}

class Moto {
  const property marca
  const property velocidadMaxima
  const property indiceFacha
  const property motor
  var property velocidadActual = 0
  
  method esFachera() = indiceFacha >= 60
  
  method arrancar() {
    motor.iniciarCombustion()
    velocidadActual = 10
  }
}

const sportster2 = new Moto(
  marca = "Harley-Davidson",
  velocidadMaxima = 180,
  indiceFacha = 100,
  motor = new Motor(tanqueNafta = new TanqueNafta())
)

const elettrica2 = new Moto(
  marca = "Vespa",
  velocidadMaxima = 45,
  indiceFacha = 1,
  motor = new Motor(tanqueNafta = new TanqueNafta())
)

const himalayan2 = new Moto(
  marca = "Royal Enfield",
  velocidadMaxima = 165,
  indiceFacha = 50,
  motor = new Motor(tanqueNafta = new TanqueNafta())
)

const d9162 = new Moto(
  marca = "Ducati",
  velocidadMaxima = 260,
  indiceFacha = 80,
  motor = new Motor(tanqueNafta = new TanqueNafta())
)

const matias2 = new Motoquero(motos = [elettrica2, himalayan2])

const valen2 = new Motoquero(motos = [sportster2])

const naza2 = new Motoquero(motos = [himalayan2, d9162]) // Ojo que naza y matias usan la misma moto

// Podemos preguntarles donde mas creen que podriamos agregar este tipo de excepciones
// Por ejemplo: velocidadActual <= velocidadMaxima (Velocidad maxima alcanzada) ; desgaste <= 100 (Motor roto)

// Finalmente diagrama de clases