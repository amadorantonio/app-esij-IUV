# APLICACIÓN MÓVIL PARA IOS Y ANDROID DE GESTIÓN DE ACTIVIDADES ACADÉMICAS PARA LOS ALUMNOS DE LA ESCUELA DE ESTUDIOS E INVESTIGACIÓN JUDICIAL DEL PODER JUDICIAL DEL ESTADO DE GUANAJUATO

## Descripción General

Este proyecto consiste en el modelado y estructura base de una aplicación móvil multiplataforma orientada a la gestión de actividades académicas para los usuarios de la Escuela de Estudios e Investigación Judicial del Poder Judicial del Estado de Guanajuato.

La solución está pensada para dispositivos Android e iOS, permitiendo centralizar procesos académicos como consulta de actividades, inscripciones, seguimiento, notificaciones y constancias.

---

## Objetivo del Repositorio

El presente repositorio tiene como finalidad implementar en código el diagrama de clases previamente diseñado durante la etapa de análisis y diseño de sistemas, utilizando el lenguaje Dart dentro del ecosistema Flutter.

---

## Arquitectura y Metodología Aplicada

Para la organización del proyecto se consideraron las siguientes prácticas y enfoques de desarrollo:

- **Arquitectura basada en funcionalidades (Feature Based Architecture)** para la división modular del sistema.
- **Clean Architecture** para la separación de responsabilidades en capas.
- **Programación Orientada a Objetos (POO)** para el modelado de entidades, atributos, relaciones y comportamientos del sistema.

---

## Implementación del Diagrama de Clases

Se desarrollaron las clases principales del sistema respetando la estructura del modelo UML original, incluyendo:

- Herencia entre clases (ejemplo: Persona → Alumno / Docente / Empleado).
- Asociaciones entre entidades.
- Multiplicidad entre clases (uno a uno, uno a muchos y muchos a muchos).
- Uso de clases puente, como el módulo de Inscripción.

---

## Consideraciones Importantes

Los métodos implementados dentro de cada clase representan las responsabilidades funcionales definidas en el análisis del sistema; sin embargo, en esta etapa su propósito es demostrativo y estructural, por lo que no contienen lógica operativa real ni conexión a bases de datos, APIs o servicios externos.

---

## Tecnologías Utilizadas

- Flutter
- Dart
- Visual Studio Code
- Git / GitHub

---

## Estado del Proyecto

Proyecto académico en fase de modelado e implementación estructural de clases.

---

## Requerimientos para abrir y ejecutar el proyecto

Para visualizar y ejecutar el proyecto es necesario contar con el entorno de desarrollo Flutter correctamente instalado y configurado en el equipo. Se recomienda disponer de las siguientes herramientas:

- Flutter SDK  
- Dart SDK  
- Visual Studio Code o Android Studio  
- Navegador web actualizado (Google Chrome, Microsoft Edge o similar)  
- Git (opcional, para clonar el repositorio)

No es indispensable contar con un emulador Android o dispositivo físico, ya que Flutter permite ejecutar el proyecto directamente en navegador web.

Para iniciar la aplicación en navegador, utilizar: flutter run -d chrome

---
