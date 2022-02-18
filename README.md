# maven-docker-dependencies

Tiny docker image with Maven build automation tool.

## Description

Simply docker maven setup downloading necessary build dependencies.
Can server for a demonstration purposes or a simple project setup.

Loads JAR packages (*.jar files) with [Maven](https://maven.apache.org/)

Dependencies are defined in [Project Object Model file](./pom.xml) , [docs](https://maven.apache.org/pom.html)

For more details refer to [Maven Dependency Management](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html)

For demonstration purposes `software.amazon.awssdk sts` dependency is defined.

## Usage

Docker image can be used to embed distribution packages in any necessary project.
Installed dependencies are available inside `/app/target/jars` folder.
Use this is in multi-stage build to get the dependencies.


## Configuration

To add a new dependency follow steps:  

- find a dependency in `https://search.maven.org/search`
- determine required dependency coordinates:
  - groupId
  - artifactId
  - version
- add `<dependency></dependency>` entry in `pom.xml` file
- Build new container image.

## Usage

To be used in multi-stage build process.

Example:

- Build docker image

```
# Building distribution pkg
docker build -t project-libs .
```

- Use in multi-stage docker build

```
FROM project-libs:latest as project-lib-dist

FROM ubuntu

COPY --from=project-lib-dist /app/target/jars /destination/path
```

