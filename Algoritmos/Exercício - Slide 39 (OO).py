class Vehicle:
    def __init__(self, model, color, nwheels):
        self._model = model
        self._color = color
        self._nwheels = nwheels

    def getNWheels(self):
        return self._nwheels

vehicle = Vehicle("UNO", "BLACK", 5)
print(vehicle.getNWheels())
