# Food-Delivery-Web-App-BackEnd-SpringBoot

## Installation

Download the source code. You can either download it as a zip file and 
extract it or simply type the command in the terminal or bash or cmd,

`git clone`

change your directory into the project folder. And run the command,

`mvn install`

* For windows try this 
[link](https://www.mkyong.com/maven/how-to-install-maven-in-windows/) to 
install maven.
* for ubuntu you can use this 
[link](https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/) 
to install maven.

Next run the command,

`mvn spring-boot:run`

and the server will start automatically. Try to visit 
[this](http://localhost:8080/food-boot/swagger-ui.html) url to see the api 
documentation.

> NOTE
> 
> If you failed to start the server try to configure your database 
details with the project. To update database details find the file 
located in **`src\main\resources`** and find the file 
**`application.properties`**. And update followind details.
> 
> `spring.datasource.username=<your database username>`
> `spring.datasource.password=<your database user's password>`
> 
>And then you will be good to go. Make sure to start the spring app when 
you are done editing the above mention file.

If you wan't to run the war version of the spring app, locate to the 
folder `/target` which will be in your directory when you run the `mvn 
install command`, and in there you will see you .war file.

To run the war file, use the below code.

`java -jar food-delivery-web-app-0.0.1-SNAPSHOT.war`

PR's are welcome. Please submit any issue that you will face when 
developing your spring-boot application.

