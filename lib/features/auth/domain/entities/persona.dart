class Persona {
    int idPersona;
    String nombre;
    String apellidoPaterno;
    String apellidoMaterno;
    String sexo;
    String telefono;
    String correoElectronico;
    String contrasena;
    bool estatus;

    Persona({
        required this.idPersona,
        required this.nombre,
        required this.apellidoPaterno,
        required this.apellidoMaterno,
        required this.sexo,
        required this.telefono,
        required this.correoElectronico,
        required this.contrasena,
        required this.estatus,
    });

    void getDatos() {
        print("Nombre: $nombre $apellidoPaterno $apellidoMaterno");
    }

    bool login(String correo, String password) {
        return true;
    }
}