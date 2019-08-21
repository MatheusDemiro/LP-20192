vehicle = {"model": "CB 300 R", "color": "Red", "nwheels": 5}

'''
    Metodo que retorna o numero de rodas.

    @param vehicle
    @type dictionary
'''
def getWheels(vehicle):
    return vehicle["nwheels"]

print(getWheels(vehicle))
