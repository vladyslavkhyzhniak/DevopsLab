# Używamy obrazu JDK 17
FROM openjdk:17-alpine

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy pliki i foldery potrzebne do budowy projektu
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle settings.gradle ./
COPY src ./src

# Nadajemy prawa do wykonywania gradlew
RUN chmod +x gradlew

# Budujemy aplikację
RUN ./gradlew clean build --no-daemon

# Domyślna komenda uruchamiająca aplikację
CMD ["java", "-jar", "build/libs/demo-0.0.1-SNAPSHOT.jar"]
