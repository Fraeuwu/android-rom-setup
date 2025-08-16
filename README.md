---

# Android ROM Setup Script

Este repositorio contiene un script para preparar rápidamente un entorno de compilación de ROMs Android en **Ubuntu 25.04 minimal**.

## Instalación rápida

Clona el repositorio y ejecuta el script:

```bash
git clone https://github.com/Fraeuwu/android-rom-setup.git
cd android-rom-setup
chmod +x setup_rom_env.sh
./setup_rom_env.sh
```

## ¿Qué hace el script?

* Instala dependencias necesarias para compilar ROMs (`git`, `zsh`, `nano`, `ccache`, etc.).
* Configura **git** globalmente con tu nombre de usuario y correo electrónico.
* Deja listo el autocompletado inteligente para `repo` y `git`.
* Optimiza la compilación usando `ccache`.

## Autor

Creado por **Faris (Fraeuwu)**.

---
