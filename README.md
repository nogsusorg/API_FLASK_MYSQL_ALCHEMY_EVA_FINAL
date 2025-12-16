# **API FLASK MYSQL ALCHEMY EVA FINAL**
-----

Este proyecto permite crear un API Restful usando Python. Se han utilizado las librerías Flask, SQLAchemy, PyMySQL para la creación de las rutas, el acceso y la generación del API Key. También se ha utilizado Gunicorn para habilitar el servidor web python en un hosting compartido.


Para publicar la aplicación, se ha elegido un hosting compartido en Dreamhost, de esta forma, las instrucciones de publicación son de utilidad únicamente en hostings similares a Dreamhost.


##
## **Obtención de proyecto:**

Obtenga el proyecto clonando directamente este repositorio mediante la siguiente instrucción:
```
git clone <repository-url>
```
## **Instalación de entorno virtual y dependencias**

Se sugiere utilizar el **IDE PyCharm** para revisar y editar el proyecto. Usando esta herramienta puede crear un nuevo proyecto de CVS agregando la dirección del repositorio para la obtención de los archivos. A continuación, defina un nuevo entorno virtual para su proyecto y ejecute el archivo **requirements.txt** para obtener las librerías de dependencia con la siguiente instrucción:
```
pip install -r requirements.txt
```
## **Publicación en hosting compartido Dreamhost**
Para poder habilitar el proyecto compartido en un hosting compartido de Dreamhost, primero debes acceder a la administración de sitios, definir un subdominio o dominio donde alojar el proyecto, gererar una base de datos y habilitar el acceso mediante ssh.\
Sobre la generación de la base de datos, puedes generar las tablas y registros recuperando los datos desde el script **db\_backup.sql** presente en el directorio raíz del proyecto.\
\
Para la habilitación del servidor Python, siga los pasos enumerados a continuación:

- Inicia sesión en tu servidor a través de SSH.
- Confirma que Python esté instalado y activo corriendo el comando: **which python3** . Esto debería devolver la ruta de la versión personalizada de Python 3 **(/usr/bin/python3)**. Esta ruta será utilizada más adelante.
- Instala la librería virtualenv y actualiza pip con el siguiente comando:
```
pip install virtualenv --upgrade pip
```
- Navega al directorio del sitio, donde crearás el nuevo entorno virtual:
```
cd ~/example.com
```
- Actualiza tu .bash\_profile
```
. ~/.bash\_profile
```
- Crea el entorno virtual usando la versión personalizada de Python. El siguiente comando crea un entorno virtual llamado venv y utiliza la banderilla -p para especificar la ruta completa a la versión de Python3 que acabas de instalar:
```
virtualenv -p /usr/bin/python3 venv
```
- Para usar tu virtualenv, primero debes activarlo corriendo el comando source. Ejecuta lo siguiente en el directorio donde instalaste el virtualenv.
```
source venv/bin/activate
```
- Modifica la línea 84 de la librería app.py para que quede de la siguiente forma
```
app.run(port=8002) o app.run(debug=True, port=8002)
```
- Para levantar el servidor Gunicorn debes ejecutar la siguiente instrucción:
```
GUNICORN\_CMD\_ARGS="--bind=example.com:8002" gunicorn myapp:app --log-level=debug --timeout=120 --workers=1
```
- Abre un navegador y accede mediante el protocolo http: http://example.com:8002

**¡¡Disfruta!!**


> [!NOTE]
> Es posible ver el proyecto publicado en la siguiente dirección:
> [http://flask.nogsus.org:8085](http://flask.nogsus.org:8085/)
> Este repositorio estará disponible hasta el 31/01/2026, posterior a esta fecha, puede encontrar el proyecto en la cuenta de Github:
> [Nogsus-CL](https://github.com/Nogsus-CL)
> En la cuenta señalada, puedes encontrar más ejemplos y desarrollos útiles
>
