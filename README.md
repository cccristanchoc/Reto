### Reto
```sh
$ cd dillinger
$ npm install -d
$ node app
```

### Aplicacion Spring con Gradle
●  En la carpeta *Reto_Spring* se encuentra el Proyecto realizado en Spring Boot. 
Se genera el artefacto con: ```./gradlew clean build```, este se crea en la ruta ```build/libs/``` como un archivo ```*.jar```.
Para ejecutar el artefacto usar el comando:  ```java -jar build/libs/*.jar```, este arranca un servidor expuesto en el puerto ```8080```
```sh
$ localhost:8080
{"id":1,"content":"Hello, Spring!"}
```
● En el archivo ```build.gradle``` se adiciono el complemento ```org.springframework.boot:spring-boot-starter-actuator``` el cual es un ```Health_Check``` que se ejecuta en la ruta:
```sh
$ localhost:8080/actuator/health
{"status":"UP"}
```

### Docker
Dentro de la misma carpeta *Reto_Spring* se creo un archivo ```Dockerfile```
en donde se usa ```OpenJDK``` como *imagen base*, se expone el puerto del servidor ```8080```, se *crea* un directorio donde posteriormente se *copiara* el artefacto y se pasara el comando para su posterior ejecucion.
```sh
FROM openjdk:8-jdk-alpine
EXPOSE 8080
RUN mkdir -p /app/
ADD build/libs/*.jar /app/reto.jar
ENTRYPOINT ["java", "-jar", "/app/reto.jar"]
```

### Terraform
En la carpeta Terraform se encuentra todos los archivos para la creacion de la infraestructura, en el archivo vars.tf se definen todos las variables usadas por los modulos: ```/Net``` e ```/Inst``` 
_Se deben configurar las variables de entorno_ ```AWS_ACCESS_KEY_ID``` y ```AWS_SECRET_ACCESS_KEY``` _para que terraform pueda conectarse a los servicios de AWS_. 

##### /Net
Contiene la creacion de VPC, Subnets(2 publicas y 2 privadas), Internet Gateway, NAT Gateway, Route tables, Target Group, Load Balancer, Repositorio de ECR, Security Groups y demas configuraciones.

##### /Inst
Contiene la creacion de 2 instancias de EC2 y el attachment de esas instancias con el target group creado en el modulo /Net.
_Para acceder a las instancias se configuro una key llamada_ ```retocccc``` _esta por seguridad debe ser creada desde la misma cuenta donde se vaya a realizar el despliegue de la infraestructura_. 

Para desplegar la infraestructura se debe inicialmente ejecutar el comando:

* ``` terraform init ```

Luego ``` terraform plan ``` para visualizar los recursos que se van a crear en AWS, y luego ``` terraform apply ``` para proceder con el despliegue de la infraestructura.
 
* ```Se uso la version v0.11.11 de Terraform ```

### Ansible
En la carpeta Ansible esta el ```playbook```, el archivo de Hosts y los roles para aprovicionar las instancias de EC2 con ```Docker```
_Para acceder a las instancias y realizar su aprovisionamiento es necesaria la key creada en_ ```AWS EC2``` _asociada a las instancias, y esta se agrega al archivo_ ```public```_en el parametro_ ```ansible_ssh_private_key_file```.

El comando para su ejecucion es: ```ansible-playbook -i public playbook.yml``` 

## Circle CI
Agregar una config para CircleCI
● CircleCI debera compilar la aplicacion, dockerizarla y enviar el artefacto
al ECR que debe haber creado con Terraform
● Circle CI debera actualizar la aplicacion en ECS (Si decidio uitlizar ECS)
● Circle CI debera ejecutar un playbook para correr/detener/arrancar la
aplicacion de Docker en EC2 (si decidio utilizar EC2 en vez de ECS)