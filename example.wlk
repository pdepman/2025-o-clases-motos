object sportsterObj {
  const marca = "Harley-Davidson"
  const velocidadMaxima = 180
  
  method esFachera() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * marca.length()
}

object elettricaMatiObj {
  const marca = "Vespa"
  const velocidadMaxima = 45
  
  method esFachera() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * marca.length()
}

object elettricaNazaObj {
  const marca = "Vespa"
  const velocidadMaxima = 45
  
  method esFachera() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * marca.length()
}

object himalayanObj {
  const marca = "Royal Enfield"
  const velocidadMaxima = 165
  
  method esFachera() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * marca.length()
}

object d296Obj {
  const marca = "Ducati"
  const velocidadMaxima = 260
  
  method esFachera() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * marca.length()
}

object matiasObj {
  const vehiculos = [elettricaMatiObj]
  const tieneCamperaCuero = true
  
  method tieneVehiculoFachero() = vehiculos.any(
    { vehiculo => vehiculo.esFachero() }
  )
  
  method esCool() = tieneCamperaCuero && self.tieneVehiculoFachero()
}

object valenObj {
  const vehiculos = [sportsterObj, d296Obj]
  const tieneCamperaCuero = true
  
  method tieneVehiculoFachero() = vehiculos.any(
    { vehiculo => vehiculo.esFachero() }
  )
  
  method esCool() = tieneCamperaCuero && self.tieneVehiculoFachero()
}

object nazaObj {
  const vehiculos =[elettricaNazaObj, batiMovil, d296]
  const tieneCamperaCuero = true
  
  method tieneVehiculoFachero() = vehiculos.any(
    { vehiculo => vehiculo.esFachero() }
  )
  
  method esCool() = tieneCamperaCuero && self.tieneVehiculoFachero()
} 

// ¡¡Que quilombo!! ¿Se puede hacer mejor?

// ¡Claro que si! Usando moldes, osea digamos, clases

class Piston {
  var desgaste = 0
  
  method moverse(revoluciones) {
    if (desgaste >= 100) {
      throw new DomainException(message = "Piston desgastado no puede moverse.")
    }
    desgaste += (10 * revoluciones) / 1000
  }
}

class Motor {
  const pistones
  var desgaste = 0
  
  method iniciarCombustion() {
    pistones.forEach({ piston => piston.moverse(1200) })
    desgaste += 5
  }
}

class Moto {
  const marca
  const velocidadMaxima
  const motor = new Motor(pistones = [new Piston(), new Piston()])
  var velocidadActual = 0
  
  method esFachero() = self.indiceFacha() >= 600
  
  method indiceFacha() = velocidadMaxima * marca.length()
  
  method arrancar() {
    motor.iniciarCombustion()
    velocidadActual = 10
  }
}

const sportster = new Moto(marca = "Harley-Davidson", velocidadMaxima = 180)

const elettricaNaza = new Moto(marca = "Vespa", velocidadMaxima = 45)

const elettricaMati = new Moto(marca = "Vespa", velocidadMaxima = 45)

const himalayan = new Moto(marca = "Royal Enfield", velocidadMaxima = 165)

const d296 = new Moto(marca = "Ducati", velocidadMaxima = 260)

object batiMovil {
  method esFachero() = true
}

class Motoquero {
  const vehiculos
  const tieneCamperaCuero
  
  method tieneVehiculoFachero() = vehiculos.any(
    { vehiculo => vehiculo.esFachero() }
  )
  
  method esCool() = tieneCamperaCuero && self.tieneVehiculoFachero()
}

const matias = new Motoquero(
  vehiculos = [elettricaMati],
  tieneCamperaCuero = true
)

const valen = new Motoquero(
  vehiculos = [sportster, d296],
  tieneCamperaCuero = true
)

const naza = new Motoquero(
  vehiculos = [elettricaNaza, batiMovil, d296],
  tieneCamperaCuero = true
)

const batman = new Motoquero(
  vehiculos = [d296, batiMovil],
  tieneCamperaCuero = false
)